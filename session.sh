#!/bin/bash
 
# RELEASE.STRING.VERSION

# Copyright © 2009 Rubin Simons
# This file is part of Session.
#
# Session is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Session is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Session.  If not, see <http://www.gnu.org/licenses/>. 



config="/etc/session.conf"

if [ ! -e $config ]; then
    echo "$config configuration file not found, exiting."
    exit 1
fi;

tools="awk sed grep pgrep egrep ssh rdesktop xdotool wmctrl nmap gnome-terminal winexe"
for tool in $tools; do
    detect=`which $tool 2> /dev/null`
    if [ -z $detect ]; then
        echo "the $tool command was not found. the following are"
        echo "required: $tools"
        exit 1
    fi;
done;

known_osses="bsd hpux linux macosx solaris windows"
known_vrmts="none hpvm kvm xen vmw"
known_exmts="ssh pse"
known_acmts="ssh rdp"

osGlobals(){
    case $os in
        bsd)
        cmd_stop="/sbin/shutdown -h -p now"
        ;; 
        hpux)
        cmd_stop="/sbin/shutdown -hy 0"
        ;;
        linux)
        cmd_stop="poweroff"
        ;;
        macosx)
        cmd_stop="shutdown -h now"
        ;;
        solaris)
        cmd_stop="/usr/sbin/poweroff"
        ;;
        windows)
        cmd_stop="shutdown -s -t 01"
        ;;
        *)
        echo "unknown os $1 passed"
    esac    

    case $vrmt in
        none)
        store="null"
        ;; 
        hpvm)
        store="/data/HPVM"
        ;;
        kvm)
        store="/var/lib/libvirt/images"
        ;;
        xen)
        store="/data/Xen"
        ;;
        vmw)
        store='D:/Systems/Personal Computer/VMware'
        ;;
        *)
        echo "unknown virtualization method $1 passed"
    esac
}

# functionExists() - Check if a to-be-called function exists. Can be used
# when trying to call contructed function names.
functionExists(){
    type $1 2>/dev/null | grep -q 'is a function'
    if [ ! $? -eq 0 ]; then
        echo "function ${1}() is not defined yet!?"
        return 1
    fi;
}

# capsFirst() - Capitalizes initial character of argument string(s) passed.
# Accepts multiple arguments.
capsFirst(){
    input="$@"
    firstchar=${input:0:1}
    otherchar=${input:1}
    capital=`echo "$firstchar" | tr a-z A-Z`
    echo "$capital$otherchar"
}  

# portState() - Checks the state (open/closed) of a port on a given address
# with as little responsetime as possible.
portState(){
    addr=$1
    port=$2
    # Create a fast portstate script.
    echo "# created by portState() for checking $name's $acmt on port $port"       > /tmp/portstate.$name
    echo "addr=$addr"                                                              >> /tmp/portstate.$name
    echo "port=$port"                                                              >> /tmp/portstate.$name
    echo 'count=0'                                                                 >> /tmp/portstate.$name
    echo 'while [ $count -lt 1 ]; do'                                              >> /tmp/portstate.$name
    echo 'nmap -PN --host-timeout 1501 -p $port $addr 2> /dev/null | grep open &'  >> /tmp/portstate.$name
    echo 'sleep 0.1'                                                               >> /tmp/portstate.$name
    echo 'count=$(expr $count + 1)'                                                >> /tmp/portstate.$name
    echo 'done;'                                                                   >> /tmp/portstate.$name

    if [ ! -z "`sh /tmp/portstate.$name`" ]; then
        echo open
    else
        echo closed
    fi

    rm -f /tmp/portstate.$name
}

# returnState() - Prints a long or short version of the state of a given host
# or guest system.
returnState(){
    osGlobals
    case $1 in
        long)
        echo "type=$type"
        echo "name=$name"
        echo "os=$os"
        echo "acmt=$acmt"
        echo "exmt=$exmt" 
        echo "user=$user"
        echo "admin=$admin"
        echo "addr=$addr"
        echo "vrmt=$vrmt"
        echo "host=$host"
        echo "store=$store"
        echo ""
        echo "access=$access"
        echo "execute=$execute"
        echo "state=$state"
        ;;
        short)
        if [ $state = on ]; then
            echo -e "$name: \033[1m$state\033[0m"
        else
            echo "$name: $state"
        fi
        ;;
        *)
    esac
}

# parseGroup() - Read a group entry from the configuration file and return
# a list of host entries.
parseGroup(){
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseGroup()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined, probably not called via parseEntry()"
        exit 1
    fi;
}

# parseHost() - Read a host entry from the configuration file and return a
# set of variables that can be used by other functions.
parseHost(){
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseHost()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined, probably not called via parseEntry()"
        exit 1
    fi;

    os=`echo $members | cut -d ' ' -f 1`
    if [ -z "`echo $known_osses | grep -w $os`" ]; then
        echo unknown operating system $os specified for host $name in $config
        exit 1
    fi;

    acmt=`echo $members | cut -d ' ' -f 2`
    if [ -z "`echo $known_acmts | grep -w $acmt`" ]; then
        echo unknown access method $acmt specified for host $name in $config
        exit 1
    fi;

    exmt=`echo $members | cut -d ' ' -f 3`
    if [ -z "`echo $known_exmts | grep -w $exmt`" ]; then
        echo unknown execution method $exmt specified for host $name in $config
        exit 1
    fi;

    user=`echo $members | cut -d ' ' -f 4`

    admin=`echo $members | cut -d ' ' -f 5`

    addr=`echo $members | cut -d ' ' -f 6`
    err="invalid ip address specified for host $name in $config"
    IFS=. ; set -- $addr
    if [ $# -eq 4 ]; then
        for seq do
            case $seq in
                ""|*[!0-9]*)
                echo $err
                return 1;
                break
                ;;
                *)
                [ $seq -gt 255 ] && echo $err && exit 1
                ;;
            esac
        done;
    else
        echo $err
        exit 1
    fi;
    unset IFS

    host=none

    vrmt=`echo $members | cut -d ' ' -f 7`
    if [ -z "`echo $known_vrmts | grep -w $vrmt`" ]; then
        echo unknown virtualization method $vrmt specified for host $name in $config
        exit 1
    fi;
}

# parseGuest() - Read a guest entry from the configuration file and return a
# set of variables that can be used by other functions.
parseGuest(){
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseGuest()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined, probably not called via parseEntry()"
        exit 1
    fi;

    os=`echo $members | cut -d ' ' -f 1`
    if [ -z "`echo $known_osses | grep -w $os`" ]; then
        echo unknown operating system $os specified for guest $name in $config
        exit 1
    fi;

    acmt=`echo $members | cut -d ' ' -f 2`
    if [ -z "`echo $known_acmts | grep -w $acmt`" ]; then
        echo unknown access method $acmt specified for guest $name in $config
        exit 1
    fi;

    exmt=`echo $members | cut -d ' ' -f 3`
    if [ -z "`echo $known_exmts | grep -w $exmt`" ]; then
        echo unknown execution method $exmt specified for guest $name in $config
        exit 1
    fi;

    user=`echo $members | cut -d ' ' -f 4`

    admin=`echo $members | cut -d ' ' -f 5`

    addr=`echo $members | cut -d ' ' -f 6`
    err="invalid ip address specified for guest $name in $config"
    IFS=. ; set -- $addr
    if [ $# -eq 4 ]; then
        for seq do
            case $seq in
                ""|*[!0-9]*)
                echo $err
                return 1;
                break
                ;;
                *)
                [ $seq -gt 255 ] && echo $err && exit 1
                ;;
            esac
        done;
    else
        echo $err
        exit 1
    fi;
    unset IFS

    host=`echo $members | cut -d ' ' -f 7`

    vrmt=`parseEntry $host ; echo $vrmt`
    if [ -z "`echo $known_vrmts | grep -w $vrmt`" ]; then
        echo unknown virtualization method $vrmt specified for host $host in $config
        exit 1
    fi;
}

# parseEntry() - A wrapper function to parseHost(), parseGuest() and the
# somewhat different parseGroup() funtions. Returns everything these 
# functions return + main type (host, guest or group).
parseEntry(){
    name=$1

    # All host and guest entries.
    all=`cat $config | grep -v -e "^#" -e "^group" \
                     | sort \
                     | cut -d " " -f 2 \
                     | cut -d "(" -f 1`

    if [ -z "$name" ]; then
        echo "no entry name passed to parseEntry()"
        exit 1
    fi;

    case $name in
         all)
              type=group
              members=$all
         ;;
         on)
              for item in $all; do
                  parseEntry $item
                  checkSystem $item
		  if [ $state = "on" ] ; then
		      member_stack="$member_stack $item"
		  fi
              done        
              type=group
              members=$member_stack
         ;;
         *)
              entry=`grep " $name(" $config`
              lines=`grep -c " $name(" $config`
          
              if [ -z "$entry" ]; then
                  echo "$name not found in $config"
                  exit 1
              fi;
          
              if [ "$lines" != "1" ]; then
                  echo "multiple entries found with the same name"
                  exit 1
              fi;
              
              # Read out the members of the entry.
              members=`echo $entry | awk '{print $2}'`
              members=${members#*(} ; members=${members%%)*}
              members=`echo $members | sed -e "s|,| |g"`
              
              # Read out the entry type
              type=`echo $entry | cut -d " " -f 1 | sed 's/^[ \t]*//'`
         ;;
    esac

    # Call the main memberparser.
    functionExists parse`capsFirst $type`
    if [ $? -eq 0 ]; then
        parse`capsFirst $type` $1
    fi;
}

# checkSystem() - Wrapper function to check a host or guest system. This also
# results in the necessary initialization of variables read from $config.
# You can pass a guest or host as a parameter to this function.
checkSystem(){
    # Set initial states.
    state=uninitialized
    access=uninitialized
    execute=uninitialized

    # Determine if a host is (un)reachable, on or off.
    if [ -z "$type" ]; then
        echo "type not set. run parseEntry() first"
        exit 1 
    elif [ $type = group ]; then
        echo "passed invalid type $type to checkSystem()"
        exit 1
    elif [ $type = host ]; then
        state=`noneVirtHandler state`
    elif [ $type = guest ]; then
        state=`parseEntry $host ; checkSystem $host; echo $state`
        if [ $state = on ]; then
            functionExists ${vrmt}VirtHandler
            if [ $? -eq 0 ]; then
                state=`${vrmt}VirtHandler state`
            fi;
        else 
            # parent host was not "on" but maybe we can ping the vm-guest
            state=`noneVirtHandler state`
        fi;
    fi

    # If a host is off or unreachable, return directly.
    if [ $state = off -o $state = unreachable ]; then
        return 0
    # Reachable is on, but unreachable is not off.
    elif [ $state = reachable ]; then
        state=on 
    fi;

    # Check access state.
    functionExists ${acmt}AccessHandler
    if [ $? -eq 0 ]; then
        access=`${acmt}AccessHandler state`
    fi;
    
    # If the access and execute methods are not the same
    # check execute state.
    if [ $acmt != $exmt ]; then
        functionExists ${exmt}ExecHandler
        if [ $? -eq 0 ]; then
            execute=`${exmt}ExecHandler state`
        fi;
    else
        execute=$access
    fi;

    # System is live, but are acmt or exmt available?
    if [ $access = closed -o $execute = closed ]; then
        state=busy
    fi;
}

# startSystem() - Handle the starting of a host or guest system, independent
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
startSystem(){
    osGlobals
    if [ $type = host ]; then
        noneVirtHandler start
    elif [ $type = guest ]; then
        functionExists ${vrmt}VirtHandler
        if [ $? -eq 0 ]; then
            ${vrmt}VirtHandler start
        fi;
    else
        echo unknown type $type passed
        exit 1
    fi;
}

# stopSystem() - Handle the stopping of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
stopSystem(){
    osGlobals
    if [ $type = host ]; then
        noneVirtHandler stop
    elif [ $type = guest ]; then
        functionExists ${vrmt}VirtHandler
        if [ $? -eq 0 ]; then
            ${vrmt}VirtHandler stop
        fi;
    else
        echo unknown type $type passed
        exit 1
    fi;
}

# accessSystem() - Connect with an available host or guest system, independent 
# of requested access method by passing our parameters on to a specific access
# method handler function.
accessSystem(){
    osGlobals
    functionExists ${acmt}AccessHandler
    if [ $? -eq 0 ]; then
        ${acmt}AccessHandler access
    fi;
}

# runAsUser() - Send a command as specified user to host or guest system.
runAsUser(){
    osGlobals
    functionExists ${exmt}ExecHandler
    if [ $? -eq 0 ]; then
        ${exmt}ExecHandler runasuser
    fi;
}

# runAsAdmin() - Send a command as admin user to host or guest system.
runAsAdmin(){
    osGlobals
    functionExists ${exmt}ExecHandler
    if [ $? -eq 0 ]; then
        ${exmt}ExecHandler runasadmin
    fi;
}

# sendAsUser() - Send a file or directory as user to host or guest system.
sendAsUser(){
    osGlobals
    functionExists ${exmt}ExecHandler
    if [ $? -eq 0 ]; then
        ${exmt}ExecHandler sendasuser
    fi;
}

# sendAsAdmin() - Send a file or directory as admin to host or guest system.
sendAsAdmin(){
    osGlobals
    functionExists ${exmt}ExecHandler
    if [ $? -eq 0 ]; then
        ${exmt}ExecHandler sendasadmin
    fi;
}

# noneVirtHandler() - Handle non-vm-host related commands.
noneVirtHandler(){
    case "$1" in
        state)
        echo "ping -w 1 -c 1 $addr" > /tmp/hoststate
        sh /tmp/hoststate > /dev/null 2>&1 < /dev/null \
        && echo reachable || echo unreachable
        rm /tmp/hoststate
        ;;
        start)
        echo "not implemented $1 for ${vrmt}VirtHandler yet"
        ;;
        stop)
        echo "not implemented $1 for ${vrmt}VirtHandler yet"
        ;;
        *)
    esac
}

# kvmVirtHandler() - Handle KVM virtual machine related commands.
kvmVirtHandler(){
    case "$1" in
        state)
        result=`$0 command-asadmin $host "virsh domstate $name" 2>/dev/null | sed '/^$/d'`
        if [ ! -z "`echo $result | grep 'running'`" ]; then
            echo on
        elif [ ! -z "`echo $result | grep 'shut off'`" ]; then
            echo off
        else
	        echo unknown
        fi;
        ;;
        start)
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "virsh start $name" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi;
        ;;
        stop)
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi;
        ;;
        *)
    esac
}

# hpvmVirtHandler() - Handle HPVM virtual machine related commands.
hpvmVirtHandler(){
    case "$1" in
        state)
        result=`$0 command-asadmin $host "/opt/hpvm/bin/hpvmstatus -P $name" | grep ^$name | awk '{print $4}'`
        if [ ! -z "`echo $result | grep 'On'`" ]; then
            echo on
        elif [ ! -z "`echo $result | grep 'Off'`" ]; then
            echo off
        else
	        echo unknown
        fi;
        ;;
        start)
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "/opt/hpvm/bin/hpvmstart -P $name" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi;
        ;;
        stop)
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi;
        ;;
        *)
    esac
}

# xenVirtHandler() - Handle XEN virtual machine related commands.
xenVirtHandler(){
    case "$1" in
        state)
        result=`$0 command-asadmin $host "xm list $name" 2>/dev/null | grep ^$name | awk '{print $1}'`
        if [ ! -z "$result" ]; then
            echo on
        elif [ -z "$result" ]; then
            echo off
        else
	        echo unknown
        fi;
        ;;
        start)
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "xm create $name" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi;
        ;;
        stop)
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi;
        ;;
        *)
    esac
}

# vmwVirtHandler() - Handle VMware Workstation virtual machine related commands.
vmwVirtHandler(){
    case "$1" in
        state)
        result=`$0 command-asadmin $host "vmrun list" 2>/dev/null | sed '/^$/d'`
        if [ ! -z "`echo $result | grep "$name"`" ]; then
            echo on
        else
	        echo off
        fi;
        ;;
        start)
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "vmrun start \"$store/$name/$name.vmx\"" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi;
        ;;
        stop)
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi;
        ;;
        *)
    esac
}

# sshSendAdminKey() - Call sshSendKey with $admin as argument 
sshSendAdminKey(){ 
    if [ -z "$admin" ] ; then
        echo "no admin ($admin) specified."
        exit 1
    fi
    sshSendKey $admin 
}
# sshSendUserKey() - Call sshSendKey with $user as argument 
sshSendUserKey(){ 
    if [ -z "$user" ] ; then
        echo "no user ($user) specified."
        exit 1
    fi
    sshSendKey $user 
}
# sshSendKey() - Looks for local ssh key and sends it to the host or guest if found.
sshSendKey(){
    sender="$1"
    if [ -z "$sender" ]; then
        echo "no sender given as argument to sshSendKey()!"
        exit 1
    else
        echo "attempting to send public key to remote user $sender.."
    fi;
    if [ -e ~/.ssh/id_dsa.pub ]; then
        sshkey=~/.ssh/id_dsa.pub
    elif [ -e ~/.ssh/id_rsa.pub ]; then
        sshkey=~/.ssh/id_rsa.pub
    fi;
    if [ ! -z $sshkey ]; then
        echo "found public key: $sshkey, preparing to send:"
        scp -q $sshkey $sender@$addr:/tmp/pubkey
        if [ "$?" == "0" ]; then
            echo "key sent successfully. preparing remote key install:"
        else
            echo "something went wrong with sending the key."
            echo "scp returned $? ."
            exit 1
        fi;
        ssh $sender@$addr 'mkdir -p $HOME/.ssh; touch $HOME/.ssh/authorized_keys; cat $HOME/.ssh/authorized_keys /tmp/pubkey | sort | uniq > /tmp/authorized_keys; mv /tmp/authorized_keys $HOME/.ssh/authorized_keys; rm /tmp/pubkey; chmod 755 $HOME; chmod 600 $HOME/.ssh/authorized_keys'
        if [ "$?" == "0" ]; then
            echo "key installed successfully."
        else
            echo "something went wrong with remote key installation."
            echo "ssh returned $? ."
            exit 1
        fi;
    fi;
}

# sshAccessHandler() - Handles accessing host or guest systems using the
# ssh protocol and the gnome-terminal program.
sshAccessHandler(){
    port=22
    case "$1" in
        state)
        portState $addr $port
        ;;
        access)
        if [ $access = open ]; then
            pgrep -u "$USER" gnome-terminal | grep -qv "$$"
            if [ "$?" == "0" ]; then
                WID=`xdotool search --class "gnome-terminal" | head -1`
                xdotool windowfocus $WID
                xdotool key ctrl+shift+t
                sleep 0.1
                xdotool type "ssh -Y $user@$addr"
                xdotool key Return
                xdotool key alt+t
                xdotool key Return
                xdotool type "`capsFirst $name`"
                xdotool key Return
                if [ ! -z $sshkey ] ; then
                    xdotool key ctrl+Next
                fi;
                wmctrl -i -a $WID
            else
                /usr/bin/gnome-terminal --command="ssh -Y $user@$addr"
            fi
        fi;
        ;;
        *)
    esac
}

# rdpAccessHandler() - Handles accessing host or guest systems using the
# rdp protocol and the rdesktop program.
rdpAccessHandler(){
    port=3389
    case "$1" in
        state)
        portState $addr $port
        ;;
        access)
        if [ $access = open ]; then
            rdesktop -0 -g 1024x768 -b -B -T "`capsFirst $name`" -u $user -N -a 16 -z -x l -r disk:home=$HOME $addr &
        fi;
        ;;
        *)
    esac
}

# pseExecHandler() - Handles executing commands on a remote  host or guest
# system using the psexec protocol and the winexe program.
pseExecHandler(){
    port=445
    case "$1" in
        state)
        portState $addr $port
        ;;
        runasuser)
        if [ $execute = open ]; then
            winexe -U HOME/$user //$addr "$command"
        fi;
        ;;
        runasadmin)
        if [ $execute = open ]; then
            winexe -U HOME/$admin //$addr "$command"
        fi;
        ;;
        sendasuser)
        if [ $execute = open ]; then
            share=`echo $target | cut -d: -f1`
            location=`echo $target | sed -e 's|\\\\|/|g' | cut -d: -f2`
            smbcommand=`printf 'cd "%s";prompt off;recurse on;mput "%s";quit' "$location" "$source"`
            smbclient "//$addr/$share\$" -U "$user" -c "$smbcommand"
        fi;
        ;;
        sendasadmin)
        if [ $execute = open ]; then
            share=`echo $target | cut -d: -f1`
            location=`echo $target | sed -e 's|\\\\|/|g' | cut -d: -f2`
            smbcommand=`printf 'cd "%s";prompt off;recurse on;mput "%s";quit' "$location" "$source"`
            smbclient "//$addr/$share\$" -U "$user" -c "$smbcommand"
        fi;
        ;;
        *)
    esac
}

# sshExecHandler() - Handles executing commands on a remote  host or guest
# system using the ssh protocol and the ssh program.
sshExecHandler(){
    port=22
    case "$1" in
        state)
        portState $addr $port
        ;;
        runasuser)
        if [ $execute = open ]; then
            ssh $user@$addr "$command"
        fi;
        ;;
        runasadmin)
        if [ $execute = open ]; then
            ssh $admin@$addr "$command"
        fi;
        ;;
        sendasuser)
        if [ $execute = open ]; then
            scp -pqr $source $user@$addr:$target
        fi;
        ;;
        sendasadmin)
        if [ $execute = open ]; then
            scp -pqr $source $admin@$addr:$target
        fi;
        ;;
        *)
    esac
}

# mapentry(object_which_is_arg_for_functions, list_of_function_names)
#     executes the list of functions sequentially passing it
#     $object_which_is_arg_for_functions
mapEntry(){
    entry_name=$1
    function_names=$2

    # Lookup entry for given input
    parseEntry $entry_name

    if [ $type = group ]; then
        # If input turned out to be a group, loop results.
        for entry_name in $members; do
            parseEntry $entry_name
            for function_name in $function_names; do
		if [ "$function_name" = "returnState" ] ; then
			$function_name short
		else
			$function_name $entry_name
		fi
            done
        done;
    else # Else it is either a host or a guest, proceed.
        for function_name in $function_names; do
		if [ "$function_name" = "returnState" ] ; then
			$function_name short
		else
			$function_name $entry_name
		fi
        done
    fi;
}

# Main case statement.
case "$1" in 

    check|state)
        # Check if further valid input was given.
        if [ -z "$2" ]; then $0; exit 1; fi;

        # map a function onto the set
        mapEntry $2 "checkSystem returnState"
    ;;
    start)
        # Check if further valid input was given.
        if [ -z "$2" ]; then $0; exit 1; fi;

        # Lookup entry for given input
        mapEntry $2 "checkSystem startSystem returnState"
    ;;
    stop)
        # Check if further valid input was given.
        if [ -z "$2" ]; then $0; exit 1; fi;

        # Lookup entry for given input
        mapEntry $2 "checkSystem stopSystem returnState"
    ;;
    access)
        # Check if further valid input was given.
        if [ -z "$2" ]; then $0; exit 1; fi;

        # Lookup entry for given input
        mapEntry $2 "checkSystem accessSystem"
    ;;
    command)
        # Check if further valid input was given.
        if [ -z "$2" -o -z "$3" ]; then $0; exit 1; fi;

        # Construct command to pass on.
        command=`echo $@ | sed "s|command $2||g" | sed -s 's/^[ \t]*//'`

        # Lookup entry for given input
        mapEntry $2 "checkSystem runAsUser"
    ;;
    command-asadmin)
        # Check if further valid input was given.
        if [ -z "$2" -o -z "$3" ]; then $0; exit 1; fi;
    
        # Construct command to pass on.
        command=`echo $@ | sed "s|command-asadmin $2||g" | sed 's/^[ \t]*//'`

        # Lookup entry for given input
        mapEntry $2 "checkSystem runAsAdmin"
    ;;
    send)
        # Check if further valid input was given.
        if [ $# -ne 4 ]; then $0; exit 1; fi; # TODO moet dit niet -ge zijn?

        source="$3"                # TODO this one only includes 1 item
        eval "target=\${$#}"       # FA target == last script parameter
    
        # Lookup entry for given input
        mapEntry $2 "checkSystem sendAsUser"
    ;;
    send-asadmin)
        # Check if further valid input was given.
        if [ $# -ne 4 ]; then $0; exit 1; fi; # TODO moet dit niet -ge zijn?

        source="$3"                # TODO this one only includes 1 item
        eval "target=\${$#}"       # FA target == last script parameter
    
        # Lookup entry for given input
        mapEntry $2 "checkSystem sendAsAdmin"
    ;;
    key)
        # Check if further valid input was given.
        if [ -z "$2" ]; then $0; exit 1; fi;

        # Lookup entry for given input
        mapEntry $2 "checkSystem sshSendAdminKey sshSendUserKey"
    ;;
    list)
        case $2 in
            group|groups)
                grep '^group' $config | sed 's|^group ||g;s/^[ \t]*//g' \
                | cut -d "(" -f 1
            ;;
            host|hosts)
                grep '^host' $config | sed 's|^host ||g;s/^[ \t]*//' \
                | cut -d "(" -f 1
            ;;
            guest|guests)
                grep '^guest' $config | sed 's|^guest ||g;s/^[ \t]*//' \
                | cut -d "(" -f 1
            ;;
            *)
                echo $"Usage: $0 list {group|guest|host}" 
                exit 1
        esac
    ;;
    version)
    echo "RELEASE.STRING.VERSION
    RELEASE.STRING.COPYRIGHT
    RELEASE.STRING.RELDATE
    RELEASE.STRING.BUILT
    RELEASE.STRING.LICENSE" | sed 's/^[ \t]*//;s/[ \t]*$//'
    ;;
    *)
    echo $"Usage: $0 command {group, guest, host or special argument}"
    echo ""
    echo "Commands:"
    echo "check     - checks the state of a host, guest  or group."
    echo "start     - attempts to start a host, guest or group."
    echo "stop      - attempts to stop a host, guest or group."
    echo "access    - access a host, guest or group using various methods."
    echo "command   - send a command to the host, guest or group."
    echo "send      - send a file or directory to the host, guest or group."
    echo "key       - send public key to remote admin and user."
    echo "list      - list all hosts, guests or groups."
    echo "version   - show session version."
    echo ""
    echo "Special arguments:"
    echo "all       - (check only) operate on all hosts, regardless of grouping."
    echo "on        - operate on all started hosts, regardless of grouping."
    echo "host      - (list command only) show all hosts."
    echo "guest     - (list command only) show all guests."
    echo "group     - (list command only) show all groups."
    echo ""
    exit 1
esac
