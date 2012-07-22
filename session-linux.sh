#!/bin/bash
 
# RELEASE.STRING.VERSION
#
# There are known speed issues with this script on Vista and 7.
# These issues are related to cygwin's fork() performance which
# you can test with: while true; do date; done | uniq -c
# For more information please visit the following thread:
# http://cygwin.com/ml/cygwin/2009-09/msg00055.html
#
# Copyright © 2010 Rubin Simons
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


debug=0
logfile=$HOME/Desktop/session.log
config="/etc/session.conf"
usrcfd=$HOME/.session
mkdir -p $usrcfd

if [ ! -e $config ]; then
    echo "$config configuration file not found, exiting."
    exit 1
fi;

# List of required tools + checking routine.
tools="awk cut sed grep pgrep nmap gnome-terminal ssh scp rdesktop winexe xdotool wmctrl"
if [ ! -e $usrcfd/tools.found ]; then
    echo "$usrcfd/tools.found does not exist. checking for required programs."
    which $tools
    if [ ! $? = 0 ]; then
        echo "a command was not found. the following are required:"
        echo "$tools"
        exit 1
    else
        echo $tools > $usrcfd/tools.found
    fi;
fi;

# Set private key option when openssh style private key found.
if [ -e $HOME/.ssh/id_dsa ]; then
    pkkopts="-i $HOME/.ssh/id_dsa"
elif [ -e $HOME/.ssh/id_rsa ]; then
    pkkopts="-i $HOME/.ssh/id_rsa"
fi;

known_osses="windows7 macosx6 debian5 ubuntu10 rhel5 fedora13 maemo5 netbsd4 netbsd5 solaris10 hpux1131 aix6"
known_vrmts="none hpvm kvm xen vmw vmf"
known_exmts="ssh pse"
known_acmts="ssh rdp"

osGlobals(){
    if [ $debug = 1 ]; then echo calling osGlobals with: $os >> $logfile; fi
    case $os in
        windows7)
        cmd_stop="shutdown -s -t 01"
        ;;
        macosx6)
        cmd_stop="shutdown -h now"
        ;;
        debian5)
        cmd_stop="poweroff"
        ;;
        ubuntu10)
        cmd_stop="poweroff"
        ;;
        fedora13)
        cmd_stop="poweroff"
        ;;
        rhel5)
        cmd_stop="poweroff"
        ;;
        maemo5)
        cmd_stop="poweroff"
        ;;
        netbsd4)
        cmd_stop="/sbin/shutdown -h -p now"
        ;; 
        netbsd5)
        cmd_stop="/sbin/shutdown -h -p now"
        ;; 
        solaris10)
        cmd_stop="/usr/sbin/poweroff"
        ;;
        hpux1131)
        cmd_stop="/sbin/shutdown -hy 0"
        ;;
        aix6)
        cmd_stop="/sbin/shutdown -hy 0"
        ;;
        *)
        echo "unknown os $1 passed"
    esac
}

# capsFirst() - Capitalizes initial character of argument string(s) passed.
# Accepts multiple arguments.
capsFirst(){
    if [ $debug = 1 ]; then echo calling capsFirst with: $@ >> $logfile; fi
    input="$@"
    firstchar=${input:0:1}
    otherchar=${input:1}
    capital=`echo "$firstchar" | tr a-z A-Z`
    echo "$capital$otherchar"
}  

# portState() - Checks the state (open/closed) of a port on a given address
# with as little responsetime as possible.
portState(){
    if [ $debug = 1 ]; then echo calling portState with: $@ >> $logfile; fi
    addr=$1
    port=$2
    # Create a fast portstate script.
    echo "# created by portState() for checking $name's $acmt on port $port"        > /tmp/portstate.$name
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
    if [ $debug = 1 ]; then echo calling returnState with: $1 >> $logfile; fi
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
    if [ $debug = 1 ]; then echo calling parseGroup with: $1 >> $logfile; fi
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
    if [ $debug = 1 ]; then echo calling parseHost with: $1 >> $logfile; fi
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseHost()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined, probably not called via parseEntry()"
        exit 1
    fi;
    
    count=1
    for member in $members; do
        if [ $count = 1 ]; then
            os=$member
        elif [ $count = 2 ]; then
            acmt=$member
        elif [ $count = 3 ]; then
            exmt=$member
        elif [ $count = 4 ]; then
            user=$member
        elif [ $count = 5 ]; then
            admin=$member
        elif [ $count = 6 ]; then
            addr=$member
        elif [ $count = 7 ]; then
            vrmt=$member
        else
            echo "unexpected: $member"
        fi;
        let count=count+1
    done;

    if [[ ! "$known_osses" =~ $os ]]; then
        echo unknown operating system $os specified for host $name in $config
        exit 1
    fi

    if [[ ! "$known_acmts" =~ $acmt ]]; then
        echo unknown access method $acmt specified for host $name in $config
        exit 1
    fi;

    if [[ ! "$known_exmts" =~ $exmt ]]; then
        echo unknown execution method $exmt specified for host $name in $config
        exit 1
    fi;

    if [ -e $usrcfd/$name.upwd ]; then
        upwd="`tr -d '\r' < $usrcfd/$name.upwd`"
        upwdopts="-p $upwd"
    fi;

    if [ -e $usrcfd/$name.apwd ]; then
        apwd="`tr -d '\r' < $usrcfd/$name.apwd`"
        apwdopts="-p $apwd"
    fi;

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

    if [[ ! "$known_vrmts" =~ $vrmt ]]; then
        echo unknown virtualization method $vrmt specified for host $name in $config
        exit 1
    fi;

    opts=$usrcfd/$name.opts
}

# parseGuest() - Read a guest entry from the configuration file and return a
# set of variables that can be used by other functions.
parseGuest(){
    if [ $debug = 1 ]; then echo calling parseGuest with: $1 >> $logfile; fi
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseGuest()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined, probably not called via parseEntry()"
        exit 1
    fi;

    count=1
    for member in $members; do
        if [ $count = 1 ]; then
            os=$member
        elif [ $count = 2 ]; then
            acmt=$member
        elif [ $count = 3 ]; then
            exmt=$member
        elif [ $count = 4 ]; then
            user=$member
        elif [ $count = 5 ]; then
            admin=$member
        elif [ $count = 6 ]; then
            addr=$member
        elif [ $count = 7 ]; then
            host=$member
        else
            echo "unexpected: $member"
        fi;
        let count=count+1
    done;

    if [[ ! "$known_osses" =~ $os ]]; then
        echo unknown operating system $os specified for guest $name in $config
        exit 1
    fi;

    if [[ ! "$known_acmts" =~ $acmt ]]; then
        echo unknown access method $acmt specified for guest $name in $config
        exit 1
    fi;

    if [[ ! "$known_exmts" =~ $exmt ]]; then
        echo unknown execution method $exmt specified for guest $name in $config
        exit 1
    fi;

    if [ -e $usrcfd/$name.upwd ]; then
        upwd="`tr -d '\r' < $usrcfd/$name.upwd`"
        upwdopts="-p $upwd"
    fi;

    if [ -e $usrcfd/$name.apwd ]; then
        apwd="`tr -d '\r' < $usrcfd/$name.apwd`"
        apwdopts="-p $apwd"
    fi;

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

    vrmt=`cat $config | grep "host $host" | cut -d "," -f 7 | sed "s|)||g"`
    if [[ ! "$known_vrmts" =~ $vrmt ]]; then
        echo unknown virtualization method $vrmt specified for host $host in $config
        exit 1
    fi;

    opts=$usrcfd/$host.opts
}

# parseEntry() - A wrapper function to parseHost(), parseGuest() and the
# somewhat different parseGroup() funtions. Returns everything these 
# functions return + main type (host, guest or group).
parseEntry(){
    if [ $debug = 1 ]; then echo calling parseEntry with: $1 >> $logfile; fi
    name=$1

    # All host and guest entries.
    if [ -z "$name" ]; then
        echo "no entry name passed to parseEntry()"
        exit 1
    fi;

    case $name in
        all)
        type=group
        members=`echo -n \`cat $config | grep -v -e "^#" -e "^group" |cut -d " " -f 2 | cut -d "(" -f 1 | sort -u\``
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
    parse`capsFirst $type` $1
}

# checkSystem() - Wrapper function to check a host or guest system. This also
# results in the necessary initialization of variables read from $config.
# You can pass a guest or host as a parameter to this function.
checkSystem(){
    if [ $debug = 1 ]; then echo calling checkSystem with: $1 >> $logfile; fi
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
        state=`parseEntry $host ; echo $state`
        if [ $state = on ]; then
            state=`${vrmt}VirtHandler state`
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
    access=`${acmt}AccessHandler state`
    
    # If the access and execute methods are not the same
    # check execute state.
    if [ $acmt != $exmt ]; then
        execute=`${exmt}ExecHandler state`
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
    if [ $debug = 1 ]; then echo calling startSystem with: $1 >> $logfile; fi
    osGlobals
    if [ $type = host ]; then
        noneVirtHandler start
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler start
    else
        echo unknown type $type passed
        exit 1
    fi;
}

# stopSystem() - Handle the stopping of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
stopSystem(){
    if [ $debug = 1 ]; then echo calling stopSystem with: $1 >> $logfile; fi
    osGlobals
    if [ $type = host ]; then
        noneVirtHandler stop
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler stop
    else
        echo unknown type $type passed
        exit 1
    fi;
}

# accessSystem() - Connect with an available host or guest system, independent 
# of requested access method by passing our parameters on to a specific access
# method handler function.
accessSystem(){
    if [ $debug = 1 ]; then echo calling accessSystem with: $1 >> $logfile; fi
    osGlobals
    ${acmt}AccessHandler access
}

# runAsUser() - Send a command as specified user to host or guest system.
runAsUser(){
    if [ $debug = 1 ]; then echo calling runAsUser with: $1 >> $logfile; fi
    osGlobals
    ${exmt}ExecHandler runasuser
}

# runAsAdmin() - Send a command as admin user to host or guest system.
runAsAdmin(){
    if [ $debug = 1 ]; then echo calling runAsAdmin with: $1 >> $logfile; fi
    osGlobals
    ${exmt}ExecHandler runasadmin
}

# sendAsUser() - Send a file or directory as user to host or guest system.
sendAsUser(){
    if [ $debug = 1 ]; then echo calling sendAsUser with: $1 >> $logfile; fi
    osGlobals
    ${exmt}ExecHandler sendasuser
}

# sendAsAdmin() - Send a file or directory as admin to host or guest system.
sendAsAdmin(){
    if [ $debug = 1 ]; then echo calling sendAsAdmin with: $1 >> $logfile; fi
    osGlobals
    ${exmt}ExecHandler sendasadmin
}

# noneVirtHandler() - Handle non-vm-host related commands.
noneVirtHandler(){
    if [ $debug = 1 ]; then echo calling noneVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        echo "ping -W 2 -c 2 $addr" > /tmp/hoststate
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
    if [ $debug = 1 ]; then echo calling kvmVirtHandler with: $1 >> $logfile; fi
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
    if [ $debug = 1 ]; then echo calling hpvmVirtHandler with: $1 >> $logfile; fi
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
    if [ $debug = 1 ]; then echo calling xenVirtHandler with: $1 >> $logfile; fi
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
    if [ $debug = 1 ]; then echo calling vmwVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi; 
        result=`$0 command $host "$vmhome/vmrun list" 2>/dev/null | sed '/^$/d'`
        if [ ! -z "`echo $result | grep "$name"`" ]; then
            echo on
        else
            echo off
        fi;
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi; 
        if [ $state = off ]; then
            result=`$0 command $host "$vmhome/vmrun start $vmdata/$name/$name.vmx" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi;
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi; 
        if [ $state = on ]; then
            result=`$0 command $name "$cmd_stop"`
            state=halting
        fi;
        ;;
        *)
    esac
}

# vmfVirtHandler() - Handle VMware Fusion virtual machine related commands.
vmfVirtHandler(){
    if [ $debug = 1 ]; then echo calling vmfVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi; 
        result=`$0 command-asadmin $host "vmrun list" 2>/dev/null | sed '/^$/d'`
        if [ ! -z "`echo $result | grep "$name"`" ]; then
            echo on
        else
            echo off
        fi;
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi; 
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "vmrun start \"$vmdata/$name/$name.vmx\"" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi;
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi; 
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
    if [ $debug = 1 ]; then echo calling sshSendAdminKey >> $logfile; fi
    if [ -z "$admin" ] ; then
        echo "no admin ($admin) specified."
        exit 1
    fi
    sshSendKey $admin 
}
# sshSendUserKey() - Call sshSendKey with $user as argument 
sshSendUserKey(){ 
    if [ $debug = 1 ]; then echo calling sshSendUserKey >> $logfile; fi
    if [ -z "$user" ] ; then
        echo "no user ($user) specified."
        exit 1
    fi
    sshSendKey $user 
}
# sshSendKey() - Looks for local ssh key and sends it to the host or guest if found.
sshSendKey(){
    if [ $debug = 1 ]; then echo calling sshSendKey with: $1 >> $logfile; fi
    sender="$1"
    if [ -z "$sender" ]; then
        echo "no sender given as argument to sshSendKey()!"
        exit 1
    else
        echo "attempting to send public key to remote user $sender.."
    fi;
    if [ -e $HOME/.ssh/id_dsa.pub ]; then
        sshkey=$HOME/.ssh/id_dsa.pub
    elif [ -e $HOME/.ssh/id_rsa.pub ]; then
        sshkey=$HOME/.ssh/id_rsa.pub
    fi;
    if [ ! -z $sshkey ]; then
        echo "found public key: $sshkey, preparing to send:"
        scp $pkkopts -q "$sshkey" $sender@$addr:/tmp/pubkey
        if [ "$?" == "0" ]; then
            echo "key sent successfully. preparing remote key install:"
        else
            echo "something went wrong with sending the key."
            echo "scp returned $? ."
            exit 1
        fi;
        ssh $pkkopts $sender@$addr 'mkdir -p $HOME/.ssh; touch $HOME/.ssh/authorized_keys; cat $HOME/.ssh/authorized_keys /tmp/pubkey | sort | uniq > /tmp/authorized_keys; mv /tmp/authorized_keys $HOME/.ssh/authorized_keys; rm /tmp/pubkey; chmod 755 $HOME; chmod 755 $HOME/.ssh; chmod 600 $HOME/.ssh/authorized_keys'
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
    if [ $debug = 1 ]; then echo calling sshAccessHandler with: $1 >> $logfile; fi
    port=22
    case "$1" in
        state)
        portState $addr $port
        ;;
        access)
        if [ $access = open ]; then
            pgrep -u "$USER" gnome-terminal | grep -qv "$$"
            if [ "$?" == "0" ]; then
                WID=`xdotool search --class "gnome-terminal" | tail -1`
                xdotool windowfocus $WID 2> /dev/null 
                xdotool key ctrl+shift+t
                sleep 0.2
                xdotool type "ssh $pkkopts -Y $user@$addr"
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
                gnome-terminal --command="ssh $pkkopts -Y $user@$addr" &
            fi
        fi;
        ;;
        *)
    esac
}

# rdpAccessHandler() - Handles accessing host or guest systems using the
# rdp protocol and the rdesktop program.
rdpAccessHandler(){
    if [ $debug = 1 ]; then echo calling rdpAccessHandler with: $1 >> $logfile; fi
    port=3389
    case "$1" in
        state)
        portState $addr $port
        ;;
        access)
        if [ $access = open ]; then
            echo "$upwd" | rdesktop -0 -g 1024x768 -b -B -T "`capsFirst $name`" -u $user -p - -N -a 16 -z -x l -r disk:home=$HOME $addr &
        fi;
        ;;
        *)
    esac
}

# pseExecHandler() - Handles executing commands on a remote  host or guest
# system using the psexec protocol and the winexe program.
pseExecHandler(){
    if [ $debug = 1 ]; then echo calling pseExecHandler with: $1 >> $logfile; fi
    port=445
    case "$1" in
        state)
        portState $addr $port
        ;;
        runasuser)
        if [ $execute = open ]; then
            winexe -U HOME/$user%$upwd //$addr "$command"
        fi;
        ;;
        runasadmin)
        if [ $execute = open ]; then
            winexe -U HOME/$admin%$apwd //$addr "$command"
        fi;
        ;;
        sendasuser)
        if [ $execute = open ]; then
            share=`echo $target | cut -d: -f1`
            location=`echo $target | sed -e 's|\\\\|/|g' | cut -d: -f2`
            smbcommand=`printf 'cd "%s";prompt off;recurse on;mput "%s";quit' "$location" "$source"`
            smbclient "//$addr/$share" -U "$user%$upwd" -c "$smbcommand"
        fi;
        ;;
        sendasadmin)
        if [ $execute = open ]; then
            share=`echo $target | cut -d: -f1`
            location=`echo $target | sed -e 's|\\\\|/|g' | cut -d: -f2`
            smbcommand=`printf 'cd "%s";prompt off;recurse on;mput "%s";quit' "$location" "$source"`
            smbclient "//$addr/$share\$" -U "$admin%$apwd" -c "$smbcommand"
        fi;
        ;;
        *)
    esac
}

# sshExecHandler() - Handles executing commands on a remote  host or guest
# system using the ssh protocol and the plink program.
sshExecHandler(){
    if [ $debug = 1 ]; then echo calling sshExecHandler with: $1 >> $logfile; fi
    port=22
    case "$1" in
        state)
        portState $addr $port
        ;;
        runasuser)
        if [ $execute = open ]; then
            ssh $pkkopts $user@$addr "$command"
        fi;
        ;;
        runasadmin)
        if [ $execute = open ]; then
            ssh $pkkopts $admin@$addr "$command"
        fi;
        ;;
        sendasuser)
        if [ $execute = open ]; then
            scp $pkkopts -pqr "$source" $user@$addr:$target
        fi;
        ;;
        sendasadmin)
        if [ $execute = open ]; then
            scp $pkkopts -pqr "$source" $admin@$addr:$target
        fi;
        ;;
        *)
    esac
}

# mapentry(object_which_is_arg_for_functions, list_of_function_names)
# executes the list of functions sequentially passing it a
# $object_which_is_arg_for_functions.
mapEntry(){
    if [ $debug = 1 ]; then echo calling mapEntry with: $@ >> $logfile; fi
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
        if [ $# -ne 4 ]; then $0; exit 1; fi;

        source="$3"                # TODO this one only includes 1 item
        eval "target=\${$#}"       # FA target == last script parameter
    
        # Lookup entry for given input
        mapEntry $2 "checkSystem sendAsUser"
    ;;
    send-asadmin)
        # Check if further valid input was given.
        if [ $# -ne 4 ]; then $0; exit 1; fi;

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
