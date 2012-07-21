#!/bin/bash

# RELEASE.STRING.VERSION
#
# Copyright © 2010,2011 Rubin Simons
# This file is part of Session.
#
# There are known speed issues with this script on Vista and 7,
# which are especially prevalent on 64-bit versions of these 
# platforms. These issues are related to cygwin's fork() 
# performance which you can test with: 
#
#     while true; do date; done | uniq -c
#
# For more information please visit the following threads:
# http://cygwin.com/ml/cygwin/2009-09/msg00055.html
# http://old.nabble.com/Slow-fork-issue---Win-x64-td19538601.html
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
# along with Session. If not, see <http://www.gnu.org/licenses/>. 


# Location of configuration files and default permissions.
usrcfd="$HOME/.session"
config="$usrcfd/cfg/session.conf"
umask 077
mkdir -p  "$usrcfd" "$usrcfd/cfg" "$usrcfd/log" "$usrcfd/sys" "$usrcfd/tmp" "$usrcfd/tpl"
chmod 700 "$usrcfd" "$usrcfd/cfg" "$usrcfd/log" "$usrcfd/sys" "$usrcfd/tmp" "$usrcfd/tpl"
touch "$usrcfd/cfg/session.conf"

# Default session execution mode. Don't change this here, use --mode.
mode=serial

# Default options.conf settings.
terminal=gnome
desktop=rdesktop
browser=gnome
execute=1
access=1
create=1
destroy=0
send=1
resilient=0
timeout=1501
agent=0
color=1
privy=0
debug=0

# Write settings to options.conf if it does not exist yet.
if [ ! -e "$usrcfd/cfg/options.conf" ]; then
    echo terminal=$terminal    > "$usrcfd/cfg/options.conf"
    echo desktop=$desktop     >> "$usrcfd/cfg/options.conf"
    echo browser=$browser     >> "$usrcfd/cfg/options.conf"
    echo execute=$execute     >> "$usrcfd/cfg/options.conf"
    echo access=$access       >> "$usrcfd/cfg/options.conf"
    echo create=$create       >> "$usrcfd/cfg/options.conf"
    echo destroy=$destroy     >> "$usrcfd/cfg/options.conf"
    echo send=$send           >> "$usrcfd/cfg/options.conf"
    echo resilient=$resilient >> "$usrcfd/cfg/options.conf"
    echo timeout=$timeout     >> "$usrcfd/cfg/options.conf"
    echo agent=$agent         >> "$usrcfd/cfg/options.conf"
    echo color=$color         >> "$usrcfd/cfg/options.conf"
    echo privy=$privy         >> "$usrcfd/cfg/options.conf"
    echo debug=$debug         >> "$usrcfd/cfg/options.conf"
fi

. "$usrcfd/cfg/options.conf"

# List of known os, vm, credential, service, execute and access methods.
known_osmts="none embedded-like unix-like windows-like aix5 aix6 arch2kx debian4 debian5 debian6 dfbsd2 esx4 esxi4 fbsd7 fbsd8 fedora13 fedora14 hpux1123 hpux1131 macosx6 maemo5 nbsd4 nbsd5 obsd4 osuse11 rhel4 rhel5 rhel6 sles9 sles10 sles11 sol10 ubuntu8 ubuntu10 win2k3 win2k8 win7 winxp"
known_vrmts="none hpvm kvm xen vmw vmf pvm esx"
known_crmts="none ssh win"
known_svmts="none scripted"
known_exmts="none ssh smb"
known_acmts="none ssh tel rdp http"

# toolChecker() - Handles required and optional tools detection and writing of
# results in $usrcfd/cfg/tools.required and $usrcfd/cfg/tools.found.
toolFinder(){
    if [ "$color" != 0 ]; then color="true"; fi

    # First write out tools.required
    echo "tools_session='awk cut grep host nmap sed tr ps'"                                                      > "$usrcfd/cfg/tools.required"
    echo "tools_execute='ssh winexe'"                                                                           >> "$usrcfd/cfg/tools.required"
    
    if [ "$terminal" = "putty" ]; then
        tools_terminal="putty"
    elif [ "$terminal" = "apple" ]; then
        PATH=$PATH:"/Applications/Utilities/Terminal.app/Contents/MacOS"
        tools_terminal="osascript Terminal"
    elif [ "$terminal" = "gnome" ]; then
        tools_terminal="gnome-terminal pgrep wmctrl xdotool"
    elif [ "$terminal" = "screen" ]; then
        tools_terminal="screen"
    fi
    
    if [ "$desktop" = "mstsc" ]; then
        tools_desktop="cryptrdp5 mstsc"
    elif [ "$desktop" = "amsrdc" ]; then
        PATH=$PATH:"/Applications/Remote Desktop Connection.app/Contents/MacOS"
        tools_desktop="Remote Desktop Connection"
    elif [ "$desktop" = "rdesktop" ]; then
        tools_desktop="rdesktop"
    fi
    
    if [ "$browser" = "windows" ]; then
        tools_browser="explorer"
    elif [ "$browser" = "apple" ]; then
        tools_browser="open"
    elif [ "$browser" = "gnome" ]; then
        tools_browser="gnome-open"
    fi
    tools_access_result="$(echo $tools_terminal $tools_desktop $tools_browser | sed 's/^[ \t]*//;s/[ \t]*$//')"
    echo "tools_access='$tools_access_result'"                                                                  >> "$usrcfd/cfg/tools.required"
    echo "tools_create='uuidgen'"                                                                               >> "$usrcfd/cfg/tools.required"
    echo "tools_agent='ssh-agent ssh-add'"                                                                      >> "$usrcfd/cfg/tools.required"
    echo "tools_send='cp scp smbclient'"                                                                        >> "$usrcfd/cfg/tools.required"
     
    # Clean up old tools.found first.
    rm -f "$usrcfd/cfg/tools.found"
    
    # Read tooltypes from generated tools.required.
    tooltypes=$(cat "$usrcfd/cfg/tools.required" | cut -d "=" -f 1)
    
    # Loop over all tooltypes and for each tooltype over its values.
    for tooltype in $tooltypes; do
        local values=$(cat "$usrcfd/cfg/tools.required" | grep $tooltype | cut -d '=' -f 2 | sed "s|'||g")
       
        echo -n "$(echo $tooltype | cut -d "_" -f 2): "
        echo -n "${tooltype}_found='" >> "$usrcfd/cfg/tools.found"
        
        for tool in $values; do
            if [ "$(basename "`which $tool 2> /dev/null`")" ]; then
                if [ $color = true ]; then 
                    echo -n -e "\E[32m$tool\E[0m "
                else
                    echo -n "$tool "
                fi
                echo -n "$tool " >> "$usrcfd/cfg/tools.found"
            else
                if [ $color = true ]; then 
                    echo -n -e "\E[31m$tool\E[0m "
                else
                    echo -n "($tool) "
                fi
            fi
        done
        echo ""
        echo "'" >> "$usrcfd/cfg/tools.found"
    done
    
    echo ""
    
    # Remove trailing spaces from tools.found.
    cat "$usrcfd/cfg/tools.found" | sed "s| '|'|g" > "$usrcfd/tmp/tools.found"
    mv "$usrcfd/tmp/tools.found" "$usrcfd/cfg/tools.found"
}

if [ -e "$usrcfd/cfg/tools.required" -a -e "$usrcfd/cfg/tools.found" ]; then
    . "$usrcfd/cfg/tools.required"
    . "$usrcfd/cfg/tools.found"
else
    echo "Session is detecting which executables are available. Please wait.."
    toolFinder
    . "$usrcfd/cfg/tools.required"
    . "$usrcfd/cfg/tools.found"
fi

# Check if at least mandatory tools are available.
if [ "$tools_session" != "$tools_session_found" ]; then
    echo "one of the mandatory executables required by session was not found"
    echo "executables required: $tools_session"
    echo "executables detected: $tools_session_found"
    exit 1
fi

# Enable (*) or disable (0) execute functions.
if [ "$tools_execute" = "$tools_execute_found" -a "$execute" != 0 ]; then
    execute="true"
else
    execute="false"
fi
    
# Enable (*) or disable (0) access functions.
if [ "$tools_access" = "$tools_access_found" -a "$access" != 0 ]; then
    access="true"
else
    access="false"
fi
    
# Enable (*) or disable (0) send functions.
if [ "$tools_send" = "$tools_send_found" -a "$send" != 0 ]; then
    send="true"
else
    send="false"
fi
    
# Enable (*) or disable (0) create functions.
if [ "$tools_create" = "$tools_create_found" -a "$create" != 0 ]; then
    create="true"
else
    create="false"
fi
    
# Enable (1) or disable (*) destroy functions.
if [ "$destroy" != 1 ]; then 
    destroy="false" 
elif [ "$destroy" = 1 ]; then
    destroy="true"
fi

# Enable (*) or disable (0) resilient (extremely high latency networks) mode.
if [ "$resilient" != 0 ]; then resilient="true"; fi

# Enable (*) or disable (0) color state output.
if [ "$color" != 0 ]; then color="true"; fi

# Enable (*) or disable (0) privilege escalation for various routines.
# This enables the (optional) use of sudo or runas when running commands
# like nmap on unix-likes or when running tell --admin on localhost.
if [ "$privy" != 0 ]; then privy="sudo"; else unset privy; fi

# Enable (*) or disable (0) debug logging to ~/Desktop/session.log.
# This makes all functions within session write about how they are
# called including various parameters.
if [ "$debug" != 0 ]; then debug="true"; fi
logfile="$usrcfd/log/session.log"

# Set private key option when putty style private key found.
if [ -e "$HOME/.ssh/id_dsa" ]; then
    sshkey="$HOME/.ssh/id_dsa"
    sshpub="$HOME/.ssh/id_dsa.pub"
    sshopts="-i $sshkey"
elif [ -e "$HOME/.ssh/id_rsa" ]; then
    sshkey="$HOME/.ssh/id_rsa"
    sshpub="$HOME/.ssh/id_rsa.pub"
    sshopts="-i $sshkey"
fi

# Enable (1) or disable (0) ssh agent (pageant).
if [ "$agent" != 0 ]; then agent=true; fi
if [ "$sshkey" -a "$agent" = true ]; then
    sshagentfile="$usrcfd/tmp/session.ssh-agent.out"
    sshagentproc="$(ps x | grep ssh-agent | grep -v grep)"
    if [ ! -e "$sshagentfile" -o -z "$sshagentproc" ]; then
        echo "you have a private key; loading into ssh-agent"
        ssh-agent | grep -v "^echo " > "$sshagentfile"
        chmod 600 "$sshagentfile"
        source "$sshagentfile"
        ssh-add
    else
        source "$sshagentfile"
    fi
fi

# sshSendKey() - Looks for local public key and sends it to the host or guest 
# if found.
sshSendKey(){
    if [ "$debug" = true ]; then echo sshSendKey: calling sshSendKey with: $1 >> "$logfile"; fi
    local sshuser="$(echo "$1" | sed 's|\\|\\\\|g')"

    echo "attempting to send public key to remote user $sshuser.."

    local sshexec="ssh $sshopts $sshuser@$addr"
    local sshcopy="scp -q $sshopts $sshpub $sshuser@$addr:/tmp/pubkey"
    
    if [ ! -z "$sshpub" ]; then
        echo "found public key: $sshpub, preparing to send:"
        $sshcopy
        if [ "$?" == "0" ]; then
            echo "key sent successfully. preparing remote key install:"
        else
            echo "something went wrong with sending the key"
            echo "$sshcopy returned $? "
            exit 1
        fi
        $sshexec 'mkdir -p $HOME/.ssh; touch $HOME/.ssh/authorized_keys; cat $HOME/.ssh/authorized_keys /tmp/pubkey | sort | uniq > /tmp/authorized_keys; mv /tmp/authorized_keys $HOME/.ssh/authorized_keys; rm /tmp/pubkey; chmod 755 $HOME; chmod 755 $HOME/.ssh; chmod 600 $HOME/.ssh/authorized_keys'
        if [ "$?" == "0" ]; then
            echo "key installed successfully"
        else
            echo "something went wrong with remote key installation"
            echo "$sshexec returned $? "
            exit 1
        fi
    fi
}

# winStoreCreds() - Store credentials for services that talk smb or rdp.
winStoreCreds(){
    if [ "$debug" = true ]; then echo winStoreCreds: calling winStoreCreds with: $1 >> "$logfile"; fi
    local store_type=$1
    local store_name=$2
    local store_pass1=unset1
    local store_pass2=unset2
    

    while [ "$store_pass1" != "$store_pass2" ]; do
        echo -n "please supply password for $store_type $store_name: "
        stty -echo
        read store_pass1
        stty echo
        echo ""
        
        echo -n "retype password for confirmation: "
        stty -echo
        read store_pass2
        stty echo
        echo ""
        
        if [ "$store_pass1" != "$store_pass2" ]; then
            echo "passwords do not match. please retry. "
        fi
    done
    
    mkdir -p "$usrcfd/sys/$name"
    if [ "$user" = "$admin" ]; then
        echo "$store_pass2" > "$usrcfd/sys/$name/user.pwd"
        echo "$store_pass2" > "$usrcfd/sys/$name/admin.pwd"
    else
        echo "$store_pass2" > "$usrcfd/sys/$name/$store_type.pwd"
    fi
}

# osglobals() - Sets generic global variables for commands that interact with
# a given operating system.
osGlobals(){
    if [ "$debug" = true ]; then echo osGlobals: calling osGlobals with: $osmt >> "$logfile"; fi
    
    # Global defaults, overriden by passed osmt below.
    osstop="/sbin/shutdown -h now"
    osreboot="reboot"
    oslisten="netstat -na|grep \"LISTEN\"|grep -w -e \"0\.0\.0\.0:$port\" -e \"$addr:$port\" "
    
    # Override defaults given above for certain osses.
    case $1 in
        aix5|aix6|hpux1123|hpux1131)
        osstop="/sbin/shutdown -hy 0"
        ;;
        dfbsd2|fbsd7|fbsd8)
        osstop="/sbin/shutdown -p now"
        ;;
        nbsd4|nbsd5|obsd4)
        osstop="/sbin/shutdown -h -p now"
        ;;
        sol10)
        osstop="/usr/sbin/poweroff"
        ;;
        windows-like|win2k3|win2k8|winxp|win7)
        osstop="shutdown -s -t 01"
        oslisten="netstat -na|findstr \"LISTEN\"|findstr \"\<0\.0\.0\.0:$port\> \<$addr:$port\>\" "
        ;;
        *)
    esac
}

# capsFirst() - Capitalizes initial character of argument string(s) passed.
# Accepts multiple arguments.
capsFirst(){
    if [ "$debug" = true ]; then echo capsFirst: calling capsFirst with: $@ >> "$logfile"; fi
    local input="$@"
    case $input in
        a*) upr=A ;;  b*) upr=B   ;; c*) upr=C ;; d*) upr=D ;;
        e*) upr=E ;;  f*) upr=F   ;; g*) upr=G ;; h*) upr=H ;;
        i*) upr=I ;;  j*) upr=J   ;; k*) upr=K ;; l*) upr=L ;;
        m*) upr=M ;;  n*) upr=N   ;; o*) upr=O ;; p*) upr=P ;;
        q*) upr=Q ;;  r*) upr=R   ;; s*) upr=S ;; t*) upr=T ;;
        u*) upr=U ;;  v*) upr=V   ;; w*) upr=W ;; x*) upr=X ;;
        y*) upr=Y ;;  z*) upr=Z   ;;  *) upr=${1%${1#?}} ;;
    esac
    echo ${upr}${input#?}
}

# macGen() - MAC Address generator.
macGen() {
    if [ "$debug" = true ]; then echo macGen: calling macGen with: $1 >> "$logfile"; fi
    local vendor_vmw="00:50:56"
    local vendor_xen="00:16:3E"
    local vendor_kvm="54:52:00"
    case "$1" in
        global)
        local genmac=$(dd if=/dev/urandom bs=1 count=6 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3":"$4":"$5":"$6 }')
        local first=$(echo $genmac | cut -d : -f 1)
        local indec=$(printf "%d" 0x$first)
        local check=$(( $indec % 2 ))
        if [ ! $check -eq 0 ]; then
            local newfirst=$(printf "%x" $(( $indec + 1)))
            local genmac=$(echo $genmac | sed "s|^$first|$newfirst|")
        fi
        macaddr=$genmac
        ;;
        vmw|vmf|esx)
        local venmac="$vendor_vmw"
        local genmac=$(dd if=/dev/urandom bs=1 count=3 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3 }')
        macaddr=$venmac:$genmac
        ;;
        xen)
        local venmac="$vendor_xen"
        local genmac=$(dd if=/dev/urandom bs=1 count=3 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3 }')
        macaddr=$venmac:$genmac
        ;;
        kvm)
        local venmac="$vendor_kvm"
        local genmac=$(dd if=/dev/urandom bs=1 count=3 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3 }')
        macaddr=$venmac:$genmac
        ;;
        *)
        echo "no macgen method specified. expected any of global|vmw|vmf|esx|xen|kvm"
        exit 1
    esac
    mkdir -p "$usrcfd/sys/$name"
    echo "$macaddr" > "$usrcfd/sys/$name/generated.mac"
}

# uuidGen() - UUID Generator.
uuidGen() {
    if [ "$debug" = true ]; then echo uuidGen: calling uuidGen with: $1 >> "$logfile"; fi
    uuid=$(uuidgen)
}

# portState() - Checks the state (open/closed) of a port on a given address
# with as little response time as possible.
portState(){
    if [ "$debug" = true ]; then echo portState: calling portState with: $@ >> "$logfile"; fi
    if [ ! -z "$1" ]; then local addr=none else local addr=$1; fi
    if [ ! -z "$2" ]; then local port=none else local port=$2; fi
        
    if [ "$resilient" = true ];then
        local command="nmap -n -T1 -PN -sT -p $port $addr"
        local match=" open "
    else
        if [ "$scantype" = connect ];then
            local command="nmap -n -T5 --host-timeout $timeout -PN -sT -p $port $addr"
            local match=" open "
        else
            local command="nmap -n -T5 --host-timeout $timeout -PN -p $port $addr"
            local match=" open "
        fi
    fi
    
    if [ "$addr" = none -o "$port" = none ]; then
        echo none
    elif [ "$addr" = 127.0.0.1 -o "$addr" = localhost ]; then
        echo open
    else
        $privy $command 2> /dev/null | grep -q "$match"  && echo open || echo closed
    fi
}

# returnState() - Prints a long or short version of the state of a given host
# or guest system.
returnState(){
    if [ "$debug" = true ]; then echo returnState: calling returnState with: $1 >> "$logfile"; fi
    case $1 in
        long)
        echo "# main config:"
        echo "type='$type'"
        echo "name='$name'"
        if [ "$type" = host -o "$type" = guest ]; then
            echo "osmt='$osmt'"
        elif [ "$type" = service ]; then
            echo "svmt='$svmt'"
            echo "port='$port'"
        fi
        echo "acmt='$acmt'"
        echo "exmt='$exmt'" 
        echo "user='$user'"
        echo "admin='$admin'"
        echo "addr='$addr'"
        echo "vrmt='$vrmt'"
        echo "host='$host'"
        echo ""
        local opts="$usrcfd/sys/$name/options.conf"
        if [ -e "$opts" ]; then
            echo "# extra options:"
            cat "$opts"
            echo ""
        fi
        local opts="$usrcfd/sys/$host/options.conf"
        if [ -e "$opts" ]; then
            echo "# inherited options:"
            cat "$opts"
            echo ""
        fi
        if [ "$type" = host -o "$type" = guest ]; then
            echo "# os global options:"
            echo "osstop='$osstop'"
            echo "osreboot='$osreboot'"
            echo "oslisten='$oslisten'"
            echo ""
        fi
        echo "# current state:"
        echo "acstate='$acstate'"
        echo "exstate='$exstate'"
        if [ "$type" = service ]; then
            echo "svrunning='$svrunning'"
            echo "svlistening='$svlistening'"
            echo "svstate='$svstate'"
        fi
        if [ "$type" = guest ]; then
            echo "vmstate='$vmstate'"
        fi
        echo "state='$state'"
        echo ""
        echo "# relations:"
        if [ "$type" != "group" ]; then
            echo -n "groups: "
            local groups=$($0 list group --verbose | grep "$name" | cut -d " " -f 2 | cut -d "(" -f 1)
            if [ "$groups" ]; then
                for group in $groups; do
                    echo -n "$group "
                done
                echo ""
            else
                echo "none "
            fi
        fi
        if [ "$type" != "service" ]; then    
            echo -n "services: "
            local services=$($0 list service --verbose | grep "$name" | cut -d " " -f 2 | cut -d "(" -f 1)
            if [ "$services" ]; then
                for service in $services; do
                    echo -n "$service "
                done
                echo ""
            else
                echo "none "
            fi
        fi
        if [ "$type" = "host" ]; then    
            echo -n "guests: "
            local guests=$($0 list guest --verbose | grep "$name" | cut -d " " -f 2 | cut -d "(" -f 1)
            if [ "$guests" ]; then
                for guest in $guests; do
                    echo -n "$guest "
                done
                echo ""
            else
                echo "none "
            fi
        fi
        ;;
        short)
        if [ "$color" = true ]; then
            if [ "$state" = on ]; then
                echo -e "$name: \E[32m$state\E[0m"
            elif [ "$state" = busy ]; then
                echo -e "$name: \E[33m$state\E[0m"
            elif [ "$state" = off ]; then
                echo -e "$name: \E[34m$state\E[0m"
            else
                echo -e "$name: \E[31m$state\E[0m"
            fi
        else
            echo "$name: $state"
        fi
        ;;
        *)
    esac
}

# addConf() - Add a configuration line to session.conf.
addConf() {
    if [ "$debug" = true ]; then echo addConf: calling addConf with: $1 >> "$logfile"; fi
    local entry=$@

    # Read out the members of the entry.
    local members=$(echo $entry | awk '{print $2}')
    local members=${members#*(} ; members=${members%%)*}
    local members=$(echo $members | sed -e "s|,| |g")

    # Call parseHost/Guest/Group to check for validity of tokens.
    parse$(capsFirst $type) $name

    # Check if the name or ip address of the given entry already exists.
    if [ "$(cat "$config" | grep -v "^#" | grep " $name(")"  ]; then
        echo entry with name $name already exists: $(cat "$config" | grep -v "^#" | grep " $name(")
        state=exists
    elif [ "$type" = "host" -o "$type" = "guest" ]; then
        if [ "$(cat "$config" | grep -v "^#" | grep -w "$addr")"  ]; then
            echo entry with addr $addr already exists: $(cat "$config" | grep -v "^#" | grep -w "$addr")
            state=exists
        fi
    fi

    # If nothing exited before us, add newentry.
    if [ ! "$state" = exists ]; then
        echo "$entry" >> "$config"
        echo "succesfully added: $entry"
    fi

    unset state
}

# delConf() - Remove a configuration line from session.conf.
delConf() {
    if [ "$debug" = true ]; then echo delConf: calling delConf with: $1 $2 >> "$logfile"; fi

    # Check if the entry exists.
    local check="$(cat "$config" | grep -v "^#" | grep " $1(")"
    if [ -z "$check" ]; then
        echo "entry with name $1 does not exist"
        exit 1
    fi

    # Nothing exited before us, escape backslashes, del oldentry.
    local deletion="$(echo "$check" | sed 's|\\|\\\\|g')"
    cat "$config" | sed -e "/$deletion/d" > "$usrcfd/tmp/session.conf.tmp"
    mv "$usrcfd/tmp/session.conf.tmp" "$config"
    echo "succesfully removed: $check"
}

# checkAddr() - Check the syntax of a given address. Handles both ip addresses
# and hostnames.
checkAddr(){
    if [ "$debug" = true ]; then echo checkAddr: calling checkAddr with: $1 >> "$logfile"; fi
    local input=$1
    
    # Check if we're dealing with an ip address
    local check=$(echo $input | sed "s|\.||g")
    expr $check + 1 > /dev/null 2>&1 < /dev/null
    if [ $? = 0 ]; then
        local err="invalid ip address specified for \"$name\": $input"
        IFS=. ; set -- $input
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
            done
        else
            echo $err
            exit 1
        fi
        unset IFS
    else
        local length=${#input}
        if [ ! $length -lt 64 ]; then
            if [ "$name" = "$input" ]; then
                local err="name \"$input\" is too long: $length characters"
            elif [ "$addr" = "$input" ]; then
                local err="addr \"$input\" is too long: $length characters"
            else
                local err="\"$input\" is too long: $length characters"
            fi
            echo $err
            exit 1
        fi;
        local valid=$(echo "$input" | sed "s|[\~\!\@\#\$\%\^\&\*\(\)\_\+\=\,\/\?\;\`\'\>\<\|\:\"\{\}\[\]\\]*||g" \
                                    | sed "s|-$||g" \
                                    | sed "s|^-||g")
        if [ "$input" !=  "$valid" ]; then
            if [ "$name" = "$input" ]; then
                local err="name \"$input\" contains invalid characters"
            elif [ "$addr" = "$input" ]; then
                local err="addr \"$input\" contains invalid characters"
            else
                local err="\"$input\" contains invalid characters"
            fi
            echo $err
            exit 1
        fi
    fi
}

# discoveryHelper() - Discover hosts on a network and attempt to addConf them.
discoveryHelper(){
    if [ "$debug" = true ]; then echo discoveryHelper: calling discoveryHelper with: $1 >> "$logfile"; fi
    if [ "$norange" ]; then
        echo "should do a deep discovery (aka verify) of an existing entry called $name"
    elif [ "$range" ]; then
        $privy nmap -n -T5 -PE -oG "$usrcfd/tmp/session.discover.out" -sP $range > /dev/null 2>&1 < /dev/null
        for addr in $(cat "$usrcfd/tmp/session.discover.out" | grep Up | cut -d " " -f 2 | sed -e 's/^[[:space:]]*//'); do 
            local type=host
            local name=$(host $addr 2> /dev/null | grep "domain name pointer" | cut -d " " -f 5  | cut -d "." -f 1 | head -n 1 | sed -e 's/^[[:space:]]*//')
            if [ ! "$name" ]; then
                local name=unknown$(echo $addr | awk 'BEGIN {FS="."}{print "-" $3 "-" $4}')
            fi
            local osmt=embedded-like
            local acmt=none
            local exmt=none
            local user=unknown
            local admin=unknown
            if [ "$(portState $addr 22)" = open ]; then
                local osmt=unix-like
                local acmt=ssh
                local exmt=ssh
                local user=$USER
                local admin=root
            elif [ "$(portState $addr 23)" = open ]; then
                local osmt=embedded-like
                local acmt=tel
                local exmt=none
                local user=unknown
                local admin=unknown
            elif [ "$(portState $addr 445)" = open ]; then
                local osmt=windows-like
                local acmt=rdp
                local exmt=smb
                local user=$USER
                local admin=administrator
            elif [ "$(portState $addr 443)" = open ]; then
                local osmt=embedded-like
                local acmt=http
                local exmt=none
                local user=$USER
                local admin=root
            elif [ "$(portState $addr 80)" = open ]; then
                local osmt=embedded-like
                local acmt=http
                local exmt=none
                local user=$USER
                local admin=root
            fi

            # call addConf with the generated entry, addConf handles existence issues.
            addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,none)"

        done
        $privy rm "$usrcfd/tmp/session.discover.out"
    else
        echo discoveryHelper called with unexpected parameter $1
        exit 1
    fi
}

# parseParameters() - Handles parsing of given parameters starting with "--".
# Optionally supports a $mandatories and a $optionals list, which allows
# validity and scope checking. The $mandatories variable stores parameters 
# that MUST be passed. The $optionals variable stores parameters which MAY 
# be passed. Not specifying $mandatories or $optionals means any parameter 
# that starts with "--" will be evaluated. You can pass just the parameter
# name, like --test, or you can specify --test=foobar. The first variant 
# sets a variable $test to 1. The second variant sets $test to "foobar".
# Example: mandatories="foo bar" ; optionals="baz" ; parseParameters $@  
parseParameters(){
    if [ "$debug" = true ]; then echo parseParameters: calling parseParameters with: $@ >> "$logfile"; fi

    local parameters="$(echo $@ \
        | sed -e 's/--/\^\^/g' \
        | sed -n 's/[^^]*//p' \
        | sed -e 's/\^\^/--/g' \
        )"
    local variables="$(echo $parameters \
        | sed -e 's/--/\^\^/g' \
        | sed -e 's/\(=[],[,A-Za-z0-9,."|+~`!@#$\*%&:;/\ {}()_-]*\)/\<\1\>/g' \
        | sed -e :a -e 's/<[^>]*>//g;/</N;//ba' \
        | sed -e 's/\^\^/ /g' \
        | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
        )"
    local values="$(echo $parameters \
        | sed -e 's/\(--[a-z]*=\)/\<\1\>/g' \
        | sed -e :a -e 's/<[^>]*>//g;/</N;//ba' \
        | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
        )"
    
    if [ "$mandatories" ]; then
        for item in $mandatories; do
            if [ ! "$(echo "$variables" | grep "$item")" ]; then
                local required="$required --$item"
            fi
        done
    fi

    if [ "$optionals" ]; then
        for item in $optionals; do
            if [ ! "$(echo "$variables" | grep "$item")" ]; then
                local optional="$optional --$item"
            fi
        done
    fi
    
    if [ "$mandatories" -a "$optionals" ]; then
        for variable in $variables; do
            local value="$(echo $parameters \
                | sed -e 's/--/\^\^/g' \
                | sed -e "s/.*\^\^$variable=\([^^]*\).*/\1/g" \
                | sed -e "s/.*\^\^$variable\([^^]*\).*/\1/g" \
                | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
                )"
            if [ -z "$value" ]; then value=1; fi
            if [ "$(echo "$optionals" | grep "$variable")" ]; then
                export "$variable=$value"
            elif [ "$(echo "$mandatories" | grep "$variable")" ]; then
                export "$variable=$value"
            else
                local illegal="$illegal --$variable "
            fi
        done
    elif [ "$mandatories" ]; then
        for variable in $variables; do
            local value="$(echo $parameters \
                | sed -e 's/--/\^\^/g' \
                | sed -e "s/.*\^\^$variable=\([^^]*\).*/\1/g" \
                | sed -e "s/.*\^\^$variable\([^^]*\).*/\1/g" \
                | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
                )"
            if [ -z "$value" ]; then value=1; fi
            if [ "$(echo "$mandatories" | grep "$variable")" ]; then
                export "$variable=$value"
            else
                local illegal="$illegal --$variable "
            fi

        done
    elif [ "$optionals" ]; then
        for variable in $variables; do
            local value="$(echo $parameters \
                | sed -e 's/--/\^\^/g' \
                | sed -e "s/.*\^\^$variable=\([^^]*\).*/\1/g" \
                | sed -e "s/.*\^\^$variable\([^^]*\).*/\1/g" \
                | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
                )"
            if [ -z "$value" ]; then value=1; fi
            if [ "$(echo "$optionals" | grep "$variable")" ]; then
                export "$variable=$value"
            else
                local illegal="$illegal --$variable "
            fi
        done
    else 
        for variable in $variables; do
            local value="$(echo $parameters \
                | sed -e 's/--/\^\^/g' \
                | sed -e "s/.*\^\^$variable=\([^^]*\).*/\1/g" \
                | sed -e "s/.*\^\^$variable\([^^]*\).*/\1/g" \
                | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
                )"
            if [ -z "$value" ]; then value=1; fi
            export "$variable=$value"
        done
    fi

    local illegal="$(echo $illegal | sed '/^$/d')"
    if [ ! -z "$illegal" ]; then
        echo "illegal parameters passed: $illegal"
    fi

    local required="$(echo $required | sed '/^$/d')"
    if [ ! -z "$required" ]; then
        echo "required parameters missing: $required"
    fi

    local optional="$(echo $optional | sed '/^$/d')"
    if [ ! -z "$optional" -a -z "$silence" ]; then
        echo "optional parameters missing: $optional"         
    fi
    
    unset silence
    unset parameters variables values
    unset mandatories optionals 
    unset variable value
    
    if [ "$illegal" -o "$required" ]; then
        exit 1
    fi
    
    unset required optional illegal 
}

# parseGroup() - Read a group entry from the configuration file and return
# a list of host entries.
parseGroup(){
    if [ "$debug" = true ]; then echo parseGroup: calling parseGroup with: $1 >> "$logfile"; fi
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseGroup()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined"
        exit 1
    fi
}

# parseHost() - Read a host entry from the configuration file and return a
# set of variables that can be used by other functions.
parseHost(){
    if [ "$debug" = true ]; then echo parseHost: calling parseHost with: $1 >> "$logfile"; fi
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseHost()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined"
        exit 1
    fi

    local count=1
    for member in $members; do
        if [ $count = 1 ]; then
            osmt=$member
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
        fi
        let count=count+1
    done;

    if [[ ! "$known_osmts" =~ "$osmt" ]]; then
        echo "unknown operating system $osmt specified for host $name"
        exit 1
    fi

    if [[ ! "$known_acmts" =~ "$acmt" ]]; then
        echo "unknown access method $acmt specified for host $name"
        exit 1
    fi

    if [[ ! "$known_exmts" =~ "$exmt" ]]; then
        echo "unknown execution method $exmt specified for host $name"
        exit 1
    fi

    if [[ ! "$known_vrmts" =~ "$vrmt" ]]; then
        echo "unknown virtualization method $vrmt specified for host $name"
        exit 1
    fi

    host=none
    svmt=none

    if [ -e "$usrcfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$name/user.pwd")"
        upwdopts="-p \"$upwd\""
    fi

    if [ -e "$usrcfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$name/admin.pwd")"
        apwdopts="-p \"$apwd\""
    fi
            
    # Check the format of the given name and address.
    checkAddr $name
    checkAddr $addr
    
    # Initialize os specific globals
    osGlobals $osmt
    
    # Source host extra options.
    opts="$usrcfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then . "$opts"; fi
}

# parseGuest() - Read a guest entry from the configuration file and return a
# set of variables that can be used by other functions.
parseGuest(){
    if [ "$debug" = true ]; then echo parseGuest: calling parseGuest with: $1 >> "$logfile"; fi
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseGuest()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined"
        exit 1
    fi

    local count=1
    for member in $members; do
        if [ $count = 1 ]; then
            osmt=$member
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
        fi
        let count=count+1
    done;

    if [[ ! "$known_osmts" =~ "$osmt" ]]; then
        echo "unknown operating system $osmt specified for guest $name"
        exit 1
    fi

    if [[ ! "$known_acmts" =~ "$acmt" ]]; then
        echo "unknown access method $acmt specified for guest $name"
        exit 1
    fi

    if [[ ! "$known_exmts" =~ "$exmt" ]]; then
        echo "unknown execution method $exmt specified for guest $name"
        exit 1
    fi

    vrmt=$(cat "$config" | grep -v "^#" | grep " $host(" | cut -d "," -f 7 | sed "s|)||g")
    if [[ ! "$known_vrmts" =~ "$vrmt" ]]; then
        echo "unknown virtualization method $vrmt specified for host $host"
        exit 1
    fi
 
    svmt=none
    
    if [ -e "$usrcfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$name/user.pwd")"
        upwdopts="-p \"$upwd\""
    fi

    if [ -e $usrcfd/sys/$name/admin.pwd ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$name/admin.pwd")"
        apwdopts="-p \"$apwd\""
    fi

    # Check the format of the given name and address.
    checkAddr $name
    checkAddr $addr
    
    # Initialize os specific globals
    osGlobals $osmt
    
    # Source both parent host and guest extra options.
    opts="$usrcfd/sys/$host/options.conf"
    if [ -e "$opts" ]; then . "$opts"; fi
    opts="$usrcfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then . "$opts"; fi
}

# parseService() - Read a service entry from the configuration file and return a
# set of variables that can be used by other functions.
parseService(){
    if [ "$debug" = true ]; then echo parseService: calling parseService with: $1 >> "$logfile"; fi
    name=$1
    if [ -z "$name" ]; then
        echo "\$name not passed to parseService()"
        exit 1
    elif [ -z "$members" ]; then
        echo "\$members not defined"
        exit 1
    fi

    local count=1
    for member in $members; do
        if [ $count = 1 ]; then
            svmt=$member
        elif [ $count = 2 ]; then
            acmt=$member
        elif [ $count = 3 ]; then
            exmt=$member
        elif [ $count = 4 ]; then
            user=$member
        elif [ $count = 5 ]; then
            addr=$member
        elif [ $count = 6 ]; then
            port=$member
        elif [ $count = 7 ]; then
            host=$member
        else
            echo "unexpected: $member"
        fi
        let count=count+1
    done;
    
    if [[ ! "$known_svmts" =~ "$svmt" ]]; then
        echo "unknown service method $svmt specified for service $name"
        exit 1
    fi
   
    if [ "$acmt" = none ]; then
        acmt=$(cat "$config" | grep -v "^#" | grep " $host(" | cut -d "," -f 2 | sed "s|)||g")
        if [[ ! "$known_acmts" =~ "$acmt" ]]; then
            echo "unknown access method $acmt specified for parent host $host"
            exit 1
        fi
    elif [[ ! "$known_acmts" =~ "$acmt" ]]; then
        echo "unknown access method $acmt specified for service $name"
        exit 1
    fi
    
    if [ "$exmt" = none ]; then
        exmt=$(cat "$config" | grep -v "^#" | grep " $host(" | cut -d "," -f 3 | sed "s|)||g")
        if [[ ! "$known_exmts" =~ "$exmt" ]]; then
            echo "unknown exectution method $exmt specified for parent host $host"
            exit 1
        fi
    elif [[ ! "$known_exmts" =~ "$exmt" ]]; then
        echo "unknown execution method $exmt specified for service $name"
        exit 1
    fi
    
    if [ "$user" = none ]; then
        user=$(cat "$config" | grep -v "^#" | grep " $host(" | cut -d "," -f 5 | sed "s|)||g")
    fi
    
    admin=none
    vrmt=none
        
    if [ -e "$usrcfd/sys/$host/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$host/user.pwd")"
        upwdopts="-p \"$upwd\""
    fi
    
    if [ -e "$usrcfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$name/user.pwd")"
        upwdopts="-p \"$upwd\""
    fi

    if [ -e "$usrcfd/sys/$host/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$host/admin.pwd")"
        apwdopts="-p \"$apwd\""
    fi
    
    if [ -e "$usrcfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$name/admin.pwd")"
        apwdopts="-p \"$apwd\""
    fi
    
    # Check the format of the given name and address.
    checkAddr $name
    checkAddr $addr

    # Source both parent host and service extra options.
    opts="$usrcfd/sys/$host/options.conf"
    if [ -e "$opts" ]; then . "$opts"; fi
    opts="$usrcfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then . "$opts"; fi
}

# parseEntry() - A wrapper function to parseHost(), parseGuest() and the
# somewhat different parseGroup() funtions. Returns everything these 
# functions return + main type (host, guest or group).
parseEntry(){
    if [ "$debug" = true ]; then echo parseEntry: calling parseEntry with: $1 >> "$logfile"; fi
    name=$1

    # All host and guest entries.
    if [ -z "$name" ]; then
        echo "no entry name passed to parseEntry()"
        exit 1
    fi

    case $name in
        all)
        type=group
        members=$(cat "$config" | grep -v -e "^#" -e "^group" | cut -d " " -f 2 | cut -d "(" -f 1 | sort -u | tr '\n' ' ' | sed 's/^[[:space:]]*//')
        ;;
        *)
        local entry=$(cat "$config" | grep -v "^#" | grep " $name(")
        local lines=$(cat "$config" | grep -v "^#" | grep -c " $name(")

        if [ -z "$entry" ]; then
            echo "$name not found in $config"
            exit 1
        fi

        if [ "$lines" != "1" ]; then
            echo "multiple entries found with the same name"
            exit 1
        fi

        # Read out the members of the entry.
        members=$(echo $entry | awk '{print $2}')
        members=${members#*(} ; members=${members%%)*}
        members=$(echo $members | sed -e "s|,| |g")

        # Read out the entry type
        type=$(echo $entry | cut -d " " -f 1 | sed 's/^[[:space:]]*//')
        ;;
    esac

    # Call the main memberparser.
    parse$(capsFirst $type) $1
}

# checkState() - Wrapper function to check a host, guest or service. This also
# results in the necessary initialization of state variables and variables in 
# options.conf. You can pass a guest, host or service type as a parameter to 
# this function.
checkState(){
    if [ "$debug" = true ]; then echo checkState: calling checkState on $name >> "$logfile"; fi
    if [ "$debug" = true -a "$resilient" = true ]; then echo checkState: running in resilient mode >> "$logfile"; fi
    
    # Set initial states.
    acstate=unset
    exstate=unset
    svstate=unset
    vmstate=unset
    state=unset
    
    # Determine if we're sane.
    if [ -z "$type" ]; then
        echo "type not set. run parseEntry() first"
        exit 1 
    elif [ "$type" = group ]; then
        echo "passed invalid type $type to checkState()"
        exit 1
    fi

    # Invoke state handlers to set acstate and exstate.
    if [ "$acmt" = "$exmt" ]; then
        ${acmt}AccessHandler state
        exstate=$acstate
    else
        ${acmt}AccessHandler state
        ${exmt}ExecHandler state
    fi
    
    # Make determinations for a host system.
    if [ "$type" = host ]; then
        if [ "$acstate" = active -a "$exstate" = active ]; then
            state=on
        elif [ "$acstate" = active -a "$exstate" = none ]; then
            state=on
        elif [ "$acstate" = none -a "$exstate" = active ]; then
            state=on
        elif [ "$acstate" = inactive -a "$exstate" = inactive ]; then
            state=unreachable
        elif [ "$acstate" = inactive -a "$exstate" = none ]; then
            state=unreachable
        elif [ "$acstate" = none -a "$exstate" = inactive ]; then
            state=unreachable
        elif [ "$acstate" = none -a "$exstate" = none ]; then
            state=unreachable
        else
            state=busy
        fi
        
    # Make determinations for a guest system.
    elif [ "$type" = guest ]; then
        if [ "$acstate" = active -a "$exstate" = active ]; then
            state=on
        elif [ "$acstate" = active -a "$exstate" = none ]; then
            state=on
        elif [ "$acstate" = none -a "$exstate" = active ]; then
            state=on
        else
            local parentstate=$(parseEntry $host ; checkState ; echo $state)
            if [ "$parentstate" = on ]; then
                ${vrmt}VirtHandler state
                if [ "$vmstate" = active ]; then
                    state=busy
                elif [ "$vmstate" = inactive ];then
                    state=off
                else
                    state=$vmstate
                fi
            else
                state=$parentstate
            fi
        fi
        
    # Make determinations for a service.
    elif [ "$type" = service ]; then
        ${svmt}ServiceHandler state
        if [ "$svstate" = active ]; then
            state=on
        elif [ "$svrunning" = active -a "$port" = none ];then
            state=on
        elif [ "$svrunning" = inactive -a "$port" = none ]; then
            state=off
        elif [ "$svrunning" = active -a "$svlistening" = active ]; then
            state=on
        elif [ "$svrunning" = inactive -a "$svlistening" = inactive ]; then
            state=off
        else
            state=busy
        fi
        
    fi
}

# startEntity() - Handle the starting of a host or guest system, independent
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
startEntity(){
    if [ "$debug" = true ]; then echo startEntity: calling startEntity with: $1 >> "$logfile"; fi
    
    if [ "$execute" != true ]; then 
        echo "required execute functions disabled"
        echo "either set execute to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_execute"
        echo "executables detected: $tools_execute_found"
        echo ""
        exit 1
    fi
    
    if [ $type = host ]; then
        noneVirtHandler start
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler start
    elif [ $type = service ]; then
        ${svmt}ServiceHandler start
    else
        echo unknown type $type passed
        exit 1
    fi
}

# stopEntity() - Handle the stopping of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
stopEntity(){
    if [ "$debug" = true ]; then echo stopEntity: calling stopEntity with: $1 >> "$logfile"; fi
    
        if [ "$execute" != true ]; then 
        echo "required execute functions disabled"
        echo "either set execute to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_execute"
        echo "executables detected: $tools_execute_found"
        echo ""
        exit 1
    fi
    
    if [ $type = host ]; then
        noneVirtHandler stop
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler stop
    elif [ $type = service ]; then
        ${svmt}ServiceHandler stop
    else
        echo unknown type $type passed
        exit 1
    fi
}

# restartEntity() - Handle the restarting of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
restartEntity(){
    if [ "$debug" = true ]; then echo restartEntity: calling restartEntity with: $1 >> "$logfile"; fi
    
    if [ "$execute" != true ]; then 
        echo "required execute functions disabled"
        echo "either set execute to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_execute"
        echo "executables detected: $tools_execute_found"
        echo ""
        exit 1
    fi
    
    if [ $type = host ]; then
        noneVirtHandler restart
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler restart
    elif [ $type = service ]; then
        ${svmt}ServiceHandler restart
    else
        echo unknown type $type passed
        exit 1
    fi
}

# createEntity() - Handle the creation of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
createEntity(){
    if [ "$debug" = true ]; then echo createEntity: calling createEntity with: $1 >> "$logfile"; fi
    
    if [ "$execute" != true ]; then 
        echo "required execute functions disabled"
        echo "either set execute to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_execute"
        echo "executables detected: $tools_execute_found"
        echo ""
        exit 1
    fi
    
    if [ "$send" != true ]; then 
        echo "required send functions disabled"
        echo "either set send to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_send"
        echo "executables detected: $tools_send_found"
        echo ""
        exit 1
    fi
    
    if [ "$create" != true ]; then 
        echo "required create functions disabled"
        echo "either set create to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_create"
        echo "executables detected: $tools_create_found"
        echo ""
        exit 1
    fi
    
    if [ $type = host ]; then
        noneVirtHandler create
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler create
    else
        echo unknown type $type passed
        exit 1
    fi
}

# destroyEntity() - Handle the destruction of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
destroyEntity(){
    
    if [ "$execute" != true ]; then 
        echo "required execute functions disabled"
        echo "either set execute to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_execute"
        echo "executables detected: $tools_execute_found"
        echo ""
        exit 1
    fi
    
    if [ "$destroy" != true ]; then 
        echo "required destroy functions disabled"
        echo "set destroy to 1 in $usrcfd/cfg/options.conf to enable"
        echo ""
        exit 1
    fi
    
    if [ "$debug" = true ]; then echo destroyEntity: calling destroyEntity with: $1 >> "$logfile"; fi
    if [ $type = host ]; then
        noneVirtHandler destroy
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler destroy
    else
        echo unknown type $type passed
        exit 1
    fi
}

# accessEntity() - Connect with an available host or guest system, independent 
# of requested access method by passing our parameters on to a specific access
# method handler function.
accessEntity(){
    if [ "$debug" = true ]; then echo accessEntity: calling accessEntity with: $1 >> "$logfile"; fi
    
    if [ "$access" != true ]; then 
        echo "required access functions disabled"
        echo "either set access to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_access"
        echo "executables detected: $tools_access_found"
        echo ""
        exit 1
    fi
    
    if [ $xsastype = service -o $xsastype = user ]; then
        xsasuser=$user
        xsasupwd=$upwd
    elif [ $xsastype = admin ]; then
        xsasuser=$admin
        xsasapwd=$apwd
    fi
    
    ${acmt}AccessHandler access
}

# runAs() - Send a command to host or guest system.
runAs(){
    if [ "$debug" = true ]; then echo runAs: calling runAs with: $1 >> "$logfile"; fi
    
    if [ "$execute" != true ]; then 
        echo "required execute functions disabled"
        echo "either set execute to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_execute"
        echo "executables detected: $tools_execute_found"
        echo ""
        exit 1
    fi
    
    ${exmt}ExecHandler runas${runastype}
}

# sendAs() - Send a file or directory to host or guest system.
sendAs(){
    if [ "$debug" = true ]; then echo sendAs: calling sendAs with: $1 >> "$logfile"; fi
    
    if [ "$send" != true ]; then 
        echo "required send functions disabled"
        echo "either set send to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_send"
        echo "executables detected: $tools_send_found"
        echo ""
        exit 1
    fi
    
    ${exmt}ExecHandler sendas${sendastype}
}

credAs(){
    if [ "$debug" = true ]; then echo credAs: calling credAs with: $1 >> "$logfile"; fi
    
    if [ "$execute" != true ]; then 
        echo "required execute functions disabled"
        echo "either set execute to 1 in $usrcfd/cfg/options.conf or"
        echo "make sure your have the required executables"
        echo "executables required: $tools_execute"
        echo "executables detected: $tools_execute_found"
        echo ""
        exit 1
    fi
    
    if [ "$exmt" = none -a "$type" = service ]; then
        exmt=$(parseEntry $host ; echo $exmt)
        echo "inherited execute method ($exmt) from parent $host"
    fi
    
    if [ "$acmt" = none -a "$type" = service ]; then
        acmt=$(parseEntry $host ; echo $acmt)
        echo "inherited access method ($acmt) from parent $host"
    fi
    
    if [ "$addr" = none -a "$type" = service ]; then
        addr=$(parseEntry $host ; echo $addr)
        echo "inherited address ($addr) from parent $host"
    fi
    
    if [ "$exmt" = none -a "$acmt" = none ]; then
        echo "both execute method and access method are \"none\""
        echo "cannot send or store credentials without one of these"
        exit 1
    elif [ "$exmt" = ssh -a "$acmt" = rdp ]; then
        local list="ssh win"
    elif [ "$exmt" = smb -a "$acmt" = ssh ]; then
        local list="ssh win"
    elif [ "$exmt" = ssh -o "$acmt" = ssh ]; then
        local list="ssh"
    elif [ "$exmt" = smb -o "$acmt" = rdp ]; then
        local list="win"
    fi

    for crmt in $list; do 
        ${crmt}CredHandler as${type}
    done
}

# noneVirtHandler() - Handle non-vm-host related commands.
noneVirtHandler(){
    if [ "$debug" = true ]; then echo noneVirtHandler: calling noneVirtHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        vmstate=none
        ;;
        start)
        echo "not implemented $1 for noneVirtHandler yet"
        echo "(i don't know how to start a physical system)"
        ;;
        stop)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osstop")
            state=stopping
        fi
        ;;
        restart)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osreboot")
            state=restarting
        fi
        ;;
        create)
        echo "not implemented $1 for noneVirtHandler yet"
        echo "(i don't know how to create a physical system)"
        ;;
        destroy)
        if [ "$destroy" = true ]; then
            echo "not implemented $1 for noneVirtHandler yet"
            echo "(i don't know how to destroy a physical system)"
        else
            echo "destroy disabled"
        fi
        ;;
        *)
    esac
}

# kvmVirtHandler() - Handle KVM virtual machine related commands.
kvmVirtHandler(){
    if [ "$debug" = true ]; then echo kvmVirtHandler: calling kvmVirtHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        local result=$($0 tell $host --admin --command="virsh domstate $name" 2>/dev/null | sed '/^$/d')
        if [ ! -z "$(echo $result | grep 'running')" ]; then
            vmstate=active
        elif [ ! -z "$(echo $result | grep 'shut off')" ]; then
            vmstate=inactive
        else
            vmstate=non-existing
        fi
        ;;
        start)
        if [ $state = off ]; then
            local result=$($0 tell $host --admin --command="virsh start $name" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osstop")
            state=stopping
        fi
        ;;
        restart)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osreboot")
            state=restarting
        fi
        ;;
        create)
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen $vrmt
            uuidGen $vrmt
            let memsize=$memsize*1024
            cat "$usrcfd/tpl/$vrmt.stf" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                | sed "s|GUEST_UUID|$uuid|g" \
                > "$usrcfd/sys/$name/$name.xml"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.xml" "$usrcfd/tmp/session.create.$name"
            local result=$($0 send $host --admin --source=\"$usrcfd/tmp/session.create.$name/$name.xml\" --target=\"$vmdata/qemu\")
            rm -f "$usrcfd/tmp/session.create.$name/$name.xml"
            rmdir "$usrcfd/tmp/session.create.$name"
            local result=$($0 tell $host --admin --command=\"$vmhome/qemu-img\" create -f qcow2 \"$vmdata/images/$name.img\" ${dsksize}G 2>/dev/null | sed '/^$/d')
            local result=$($0 tell $host --admin --command=\"$vmhome/virsh\" define \"$vmdata/qemu/$name.xml\" 2>/dev/null | sed '/^$/d')
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ "$destroy" = true ]; then
            if [ $state = off ]; then
                echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    local result=$($0 tell $host --admin --command=\"$vmhome/virsh\" undefine \"$name\" 2>/dev/null | sed '/^$/d')
                    local result=$($0 tell $host --admin --command=rm -f \"$vmdata/qemu/$name.xml\" \"$vmdata/qemu/$name.log*\" \"$vmdata/images/$name.img\" 2>/dev/null | sed '/^$/d')
                    state=destroyed
                else
                    state=saved
                fi
            fi
        else
            echo "destroy disabled"
        fi
        ;;
        *)
    esac
}

# hpvmVirtHandler() - Handle HPVM virtual machine related commands.
hpvmVirtHandler(){
    if [ "$debug" = true ]; then echo hpvmVirtHandler: calling hpvmVirtHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        local result=$($0 tell $host --admin --command="/opt/hpvm/bin/hpvmstatus -P $name" | grep ^$name | awk '{print $4}')
        if [ ! -z "$(echo $result | grep 'On')" ]; then
            vmstate=active
        elif [ ! -z "$(echo $result | grep 'Off')" ]; then
            vmstate=inactive
        else
            vmstate=non-existing
        fi
        ;;
        start)
        if [ $state = off ]; then
            local result=$($0 tell $host --admin --command="/opt/hpvm/bin/hpvmstart -P $name" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osstop")
            state=stopping
        fi
        ;;
        restart)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osreboot")
            state=restarting
        fi
        ;;
        create)
        echo "not implemented $1 for ${vrmt}VirtHandler yet"
        ;;
        destroy)
        if [ "$destroy" = true ]; then
            if [ $state = off ]; then
                echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    echo "not implemented $1 for ${vrmt}VirtHandler yet"
                    state=destroyed
                else
                    state=saved
                fi
            fi
        else
            echo "destroy disabled"
        fi
        ;;
        *)
    esac
}

# xenVirtHandler() - Handle XEN virtual machine related commands.
xenVirtHandler(){
    if [ "$debug" = true ]; then echo xenVirtHandler: calling xenVirtHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        local result=$($0 tell $host --admin --command="xm list $name" 2>/dev/null | grep ^$name | awk '{print $1}')
        if [ ! -z "$result" ]; then
            vmstate=active
        elif [ -z "$result" ]; then
            vmstate=inactive
        else
            vmstate=non-existing
        fi
        ;;
        start)
        if [ $state = off ]; then
            local result=$($0 tell $host --admin --command="xm create $name" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osstop")
            state=stopping
        fi
        ;;
        restart)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osreboot")
            state=restarting
        fi
        ;;
        create)
        echo "not implemented $1 for ${vrmt}VirtHandler yet"
        ;;
        destroy)
        if [ "$destroy" = true ]; then
            if [ $state = off ]; then
                echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    echo "not implemented $1 for ${vrmt}VirtHandler yet"
                    state=destroyed
                else
                    state=saved
                fi
            fi
        else
            echo "destroy disabled"
        fi
        ;;
        *)
    esac
}

# vmwVirtHandler() - Handle VMware Workstation virtual machine related commands.
vmwVirtHandler(){
    if [ "$debug" = true ]; then echo vmwVirtHandler: calling vmwVirtHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        local result=$($0 tell $host --command=\"$vmhome/vmrun\" list 2>/dev/null | sed '/^$/d')
        if [ ! -z "$(echo $result | grep "$name")" ]; then
            vmstate=active
        else
            local result=$($0 tell $host --command=\"$vmhome/vmrun\" listSnapshots \"$vmdata/$name/$name.vmx\" 2>/dev/null | sed '/^$/d')
            if [ -z "$(echo $result | grep 'Error: Cannot open VM')" ]; then
                vmstate=inactive
            else
                vmstate=non-existing
            fi
        fi
        ;;
        start)
        if [ $state = off ]; then
            local result=$($0 tell $host --command=\"$vmhome/vmrun\" start \"$vmdata/$name/$name.vmx\" nogui 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osstop")
            state=stopping
        fi
        ;;
        restart)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osreboot")
            state=restarting
        fi
        ;;
        create)
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen $vrmt
            cat "$usrcfd/tpl/$vrmt.stf" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > "$usrcfd/sys/$name/$name.vmx"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.vmx" "$usrcfd/tmp/session.create.$name"
            local result=$($0 send $host --source=\"$usrcfd/tmp/session.create.$name\" --target=\"$vmdata/$name\")
            rm -f "$usrcfd/tmp/session.create.$name/$name.vmx"
            rmdir "$usrcfd/tmp/session.create.$name"
            local result=$($0 tell $host --command=\"$vmhome/vmware-vdiskmanager\" -c -s ${dsksize}GB -a ide -t 0 \"$vmdata/$name/$name.vmdk\" 2>/dev/null | sed '/^$/d')
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ "$destroy" = true ]; then
            if [ $state = off ]; then
                echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    local result=$($0 tell $host --command=\"$vmhome/vmrun\" deleteVM \"$vmdata/$name/$name.vmx\" 2>/dev/null | sed '/^$/d')
                    state=destroyed
                else
                    state=saved
                fi
            fi
        else
            echo "destroy disabled"
        fi
        ;;
        *)
    esac
}

# vmfVirtHandler() - Handle VMware Fusion virtual machine related commands.
vmfVirtHandler(){
    if [ "$debug" = true ]; then echo vmfVirtHandler: calling vmfVirtHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        local result=$($0 tell $host --command=\"$vmhome/vmrun\" list 2>/dev/null | sed '/^$/d')
        if [ ! -z "$(echo $result | grep "$name")" ]; then
            vmstate=active
        else
            local result=$($0 tell $host --command=\"$vmhome/vmrun\" listSnapshots \"$vmdata/$name.vmwarevm/$name.vmx\" 2>/dev/null | sed '/^$/d')
            if [ -z "$(echo $result | grep "Error: Cannot open VM")" ]; then
                vmstate=inactive
            else
                vmstate=non-existing
            fi
        fi
        ;;
        start)
        if [ $state = off ]; then
            local result=$($0 tell $host --command=\"$vmhome/vmrun\" start \"$vmdata/$name.vmwarevm/$name.vmx\" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osstop")
            state=stopping
        fi
        ;;
        restart)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osreboot")
            state=restarting
        fi
        ;;
        create)
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen $vrmt
            cat "$usrcfd/tpl/$vrmt.stf" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > "$usrcfd/sys/$name/$name.vmx"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.vmx" "$usrcfd/tmp/session.create.$name"
            local result=$($0 send $host --source=\"$usrcfd/tmp/session.create.$name\" --target=\"$vmdata/$name.vmwarevm\")
            rm -f "$usrcfd/tmp/session.create.$name/$name.vmx"
            rmdir "$usrcfd/tmp/session.create.$name"
            local result=$($0 tell $host --command=\"$vmhome/vmware-vdiskmanager\" -c -s ${dsksize}GB -a ide -t 0 \"$vmdata/$name.vmwarevm/$name.vmdk\" 2>/dev/null | sed '/^$/d')
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ "$destroy" = true ]; then
            if [ $state = off ]; then
                echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    local result=$($0 tell $host --command=\"$vmhome/vmrun\" deleteVM \"$vmdata/$name.vmwarevm/$name.vmx\" 2>/dev/null | sed '/^$/d')
                    state=destroyed
                else
                    state=saved
                fi
            fi
        else
            echo "destroy disabled"
        fi
        ;;
        *)
    esac
}

# esxVirtHandler() - Handle VMware ESX(i) virtual machine related commands.
esxVirtHandler(){
    if [ "$debug" = true ]; then echo esxVirtHandler: calling esxVirtHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        local result=$($0 tell $host --admin --command="vim-cmd vmsvc/power.getstate \`vim-cmd vmsvc/getallvms | grep $name | cut -f 1\` | grep Powered" 2>/dev/null | sed '/^$/d')
        if [ "$result" = "Powered on" ]; then
            vmstate=active
        elif [ "$result" = "Powered off" ]; then
            vmstate=inactive
        else
            vmstate=non-existing
        fi
        ;;
        start)
        if [ $state = off ]; then
            local result=$($0 tell $host --admin --command="vim-cmd vmsvc/power.on \`vim-cmd vmsvc/getallvms | grep $name | cut -f 1\`" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osstop")
            state=stopping
        fi
        ;;
        restart)
        if [ $state = on ]; then
            local result=$($0 tell $name --admin --command="$osreboot")
            state=restarting
        fi
        ;;
        create)
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen $vrmt
            cat "$usrcfd/tpl/$vrmt.stf" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > "$usrcfd/sys/$name/$name.vmx"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.vmx" "$usrcfd/tmp/session.create.$name"
            local result=$($0 send $host --admin --source=\"$usrcfd/tmp/session.create.$name\" --target=\"$vmdata/$name\")
            rm -f "$usrcfd/tmp/session.create.$name/$name.vmx"
            rmdir "$usrcfd/tmp/session.create.$name"
            local result=$($0 tell $host --admin --command=/sbin/vmkfstools -c ${dsksize}G \"$vmdata/$name/$name.vmdk\" 2>/dev/null | sed '/^$/d')
            local result=$($0 tell $host --admin --command=vim-cmd solo/registervm \"$vmdata/$name/$name.vmx\" 2>/dev/null | sed '/^$/d')            
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ "$destroy" = true ]; then
            if [ $state = off ]; then
                echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    local result=$($0 tell $host --admin --command="vim-cmd vmsvc/destroy \`vim-cmd vmsvc/getallvms | grep $name | cut -f 1\`")
                    state=destroyed
                else
                    state=saved
                fi
            fi
        else
            echo "destroy disabled"
        fi
        ;;
        *)
    esac
}

# noneServiceHandler() - Handle services that are of type none.
noneServiceHandler(){
    if [ "$debug" = true ]; then echo noneServiceHandler: calling noneServiceHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        svstate=none
        ;;
        start|stop|restart)
        echo "no service method defined for this service"
        ;;
        *)
    esac
}

# scriptedServiceHandler() - Handle regular services with svstatus, svstart and svstop.
scriptedServiceHandler(){
    if [ "$debug" = true ]; then echo scriptedServiceHandler: calling scriptedServiceHandler with: $1 >> "$logfile"; fi
    osGlobals
    if [ -z "$svstatus" -o -z "$oslisten" ]; then
        echo "$name: svstatus or oslisten unset"
        echo "$name: svstatus: $svstatus"
        echo "$name: oslisten: $oslisten"
        exit 1
    fi
    
    case "$1" in
        state)
        # Set initial svstate.
        svstate=unset
        svrunning=unset
        svlistening=unset
        
        local result=$(portState $addr $port)
        if [ "$result" = open ]; then
            svstate=active
        else
            # Determine svrunning.
            local result="$(command="$svstatus" ; ${exmt}ExecHandler runasservice)"
            if [ "$result" ]; then
                svstate=active
                svrunning=active
            else
                svstate=inactive
                svrunning=inactive
            fi
            
            # And svlistening, if we have addr and port.
            if [ "$addr" != none -a "$port" != none ]; then
                local result="$(command="$oslisten" ; ${exmt}ExecHandler runasservice)"
                if [ "$result" ]; then
                    svstate=active
                    svlistening=active
                else
                    svstate=inactive
                    svlistening=inactive
                fi
            fi
        fi
        ;;
        start)
        if [ $state = off ]; then
            local result="$(command="$svstart" ; ${exmt}ExecHandler runasservice)"
            state=starting
        else
            echo "$name: state of service was not off but $state"
        fi
        ;;
        stop)
        if [ $state = on ]; then
            local result="$(command="$svstop" ; ${exmt}ExecHandler runasservice)"
            state=stopping
        else
            echo "$name: state of service was not on but $state"
        fi
        ;;
        restart)
        scriptedServiceHandler state
        scriptedServiceHandler stop
        scriptedServiceHandler state
        scriptedServiceHandler start
        ;;
        *)
    esac
}

# puttyTerminalHandler() - Handles PuTTY Terminal parameterization.
puttyTerminalHandler(){
    if [ "$debug" = true ]; then echo puttyTerminalHandler: calling puttyTerminalHandler with: $1 >> "$logfile"; fi
    local protocol="$1"
    
    if [ "$protocol" = ssh ]; then
        local command="putty $sshopts $xsasuser@$addr"
    elif [ "$protocol" = tel ]; then
        local command="putty -telnet $addr"
    else
        echo "invalid protocol passed to puttyTerminalHandler: $protocol"
        echo "valid types are tel or ssh"
        exit 1
    fi
    
    reg delete "HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%20Settings" /v "WinTitle" /f >/dev/null
    reg add "HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%20Settings" /t REG_SZ /v "WinTitle" /d "$(capsFirst $name)" > /dev/null
    $command &
    sleep 1
    reg delete "HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%20Settings" /v "WinTitle" /f > /dev/null
    reg add "HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%20Settings" /t REG_SZ /v "WinTitle" > /dev/null
}           

# appleTerminalHandler() - Handles Apple Terminal parameterization.
appleTerminalHandler(){
    if [ "$debug" = true ]; then echo appleTerminalHandler: calling appleTerminalHandler with: $1 >> "$logfile"; fi
    local protocol="$1"
    
    if [ "$protocol" = ssh ]; then
        local command="ssh $sshopts -Y $xsasuser@$addr"
    elif [ "$protocol" = tel ]; then
        local command="telnet $addr"
    else
        echo "invalid protocol passed to appleTerminalHandler: $protocol"
        echo "valid types are tel or ssh"
        exit 1
    fi
    
    echo "activate application \"Terminal\"" > "$usrcfd/tmp/session.access.$name.scpt"
    echo "tell application \"Terminal\"" >> "$usrcfd/tmp/session.access.$name.scpt"
    echo "tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down" >> "$usrcfd/tmp/session.access.$name.scpt"
    echo "do script \"$command\" in last tab of front window" >> /tmp/session.access.$name.scpt
    echo "end tell" >> "$usrcfd/tmp/session.access.$name.scpt"
    osascript "$usrcfd/tmp/session.access.$name.scpt"
    rm "$usrcfd/tmp/session.access.$name.scpt"
}

# gnomeTerminalHandler() - Handles Gnome Terminal parameterization.
gnomeTerminalHandler(){
    if [ "$debug" = true ]; then echo gnomeTerminalHandler: calling gnomeTerminalHandler with: $1 >> "$logfile"; fi
    local protocol="$1"
    
    if [ "$protocol" = ssh ]; then
        local command="ssh $sshopts -Y $xsasuser@$addr"
    elif [ "$protocol" = tel ]; then
        local command="telnet $addr"
    else
        echo "invalid protocol passed to gnomeTerminalHandler: $protocol"
        echo "valid types are tel or ssh"
        exit 1
    fi
    
    pgrep -u "$USER" gnome-terminal | grep -qv "$$"
    if [ "$?" == "0" ]; then
        WID=$(xdotool search --class "gnome-terminal" | tail -1)
        xdotool windowfocus $WID 2> /dev/null 
        xdotool key ctrl+shift+t
        sleep 0.2
        xdotool type "$command"
        xdotool key Return
        xdotool key alt+t
        xdotool key Return
        xdotool type "$(capsFirst $name)"
        xdotool key Return
        if [ ! -z $sshkey ] ; then
            xdotool key ctrl+Next
        fi
        wmctrl -i -a $WID
    else
        gnome-terminal --command="$command" &
    fi
}

# screenTerminalHandler() - Handles screen terminal parameterization.
screenTerminalHandler(){
    if [ "$debug" = true ]; then echo screenTerminalHandler: calling screenTerminalHandler with: $1 >> "$logfile"; fi
    local protocol="$1"
    
    if [ "$protocol" = ssh ]; then
        local command="ssh $sshopts -Y $xsasuser@$addr"
    elif [ "$protocol" = tel ]; then
        local command="telnet $addr"
    else
        echo "invalid protocol passed to screenTerminalHandler: $protocol"
        echo "valid types are tel or ssh"
        exit 1
    fi
    
    local sesuser="$(echo "$USER" | sed 's|[^\]*\\||g')"
    local seshost="$(hostname -s)"
    local sesname="session.$seshost.$sesuser"
    local sesruns=$(screen -ls | grep $sesname)
    
    if [ -z "$sesruns" ]; then
        screen -dmS "$sesname" -t "$seshost" &
        screen -r -S $sesname -X hardstatus alwayslastline
        screen -r -S $sesname -X hardstatus string '%n:%t%-=%d/%m/%Y %c%{-}'
    fi
    
    screen -r -S $sesname -X screen -t $name $command
}

# windowsBrowserHandler() - Handles Windows default browser parameterization.
windowsBrowserHandler() {
    if [ "$debug" = true ]; then echo windowsBrowserHandler: calling windowsBrowserHandler with: $1 >> "$logfile"; fi
    local url="$1"
    explorer "$url" &
}

# appleBrowserHandler() - Handles Apple default browser parameterization.
macosBrowserHandler() {
    if [ "$debug" = true ]; then echo macosBrowserHandler: calling macosBrowserHandler with: $1 >> "$logfile"; fi
    local url="$1"
    open "$url" &
}

# gnomeBrowserHandler() - Handles Gnome default browser parameterization.
gnomeBrowserHandler() {
    if [ "$debug" = true ]; then echo gnomeBrowserHandler: calling gnomeBrowserHandler with: $1 >> "$logfile"; fi
    local url="$1"
    gnome-open "$url" &
}

rdpFileWriter() {
    if [ "$debug" = true ]; then echo rdpFileWriter: writing $usrcfd/sys/$name/$name.rdp >> "$logfile"; fi
    mkdir -p "$usrcfd/sys/$name"
    rdpfile="$usrcfd/sys/$name/$name.rdp"
    echo screen mode id:i:2 > "$rdpfile"
    echo desktopwidth:i:1024 >> "$rdpfile"
    echo desktopheight:i:768 >> "$rdpfile"
    echo session bpp:i:24 >> "$rdpfile"
    echo winposstr:s:0,1,32,68,800,572 >> "$rdpfile"
    echo full address:s:$addr >> "$rdpfile"
    echo compression:i:1 >> "$rdpfile"
    echo keyboardhook:i:2 >> "$rdpfile"
    echo audiomode:i:2 >> "$rdpfile"
    echo redirectdrives:i:0 >> "$rdpfile"
    echo redirectprinters:i:0 >> "$rdpfile"
    echo redirectcomports:i:0 >> "$rdpfile"
    echo redirectsmartcards:i:1 >> "$rdpfile"
    echo displayconnectionbar:i:1 >> "$rdpfile"
    echo autoreconnection enabled:i:1 >> "$rdpfile"
    echo authentication level:i:0 >> "$rdpfile"
    echo username:s:$xsasuser >> "$rdpfile"
    echo domain:s:$name >> "$rdpfile"
    echo alternate shell:s: >> "$rdpfile"
    echo shell working directory:s: >> "$rdpfile"
    echo disable wallpaper:i:1 >> "$rdpfile"
    echo disable full window drag:i:0 >> "$rdpfile"
    echo disable menu anims:i:0 >> "$rdpfile"
    echo disable themes:i:0 >> "$rdpfile"
    echo disable cursor setting:i:0 >> "$rdpfile"
    echo bitmapcachepersistenable:i:1 >> "$rdpfile"
    if [[ "$tools_access_found" =~ "cryptrdp5" ]]; then
        if [ $xsastype = user -a ! -z "$xsasupwd" ]; then
            local rdphash=$(cryptrdp5 $xsasupwd)
            echo password 51:b:$rdphash >> "$rdpfile"
        elif [ $xsastype = admin -a ! -z "$xsasapwd" ]; then
            local rdphash=$(cryptrdp5 $xsasapwd)
            echo password 51:b:$rdphash >> "$rdpfile"
        fi
    fi
    chmod 600 "$rdpfile"
}

mstscDesktopHandler() {
    if [ "$debug" = true ]; then echo mstscDesktopHandler: calling mstscDesktopHandler with: $1 >> "$logfile"; fi
    rdpFileWriter        
    mstsc $(cygpath -m "$rdpfile") 2>/dev/null &
}
# amsrdcDesktopHandler() - Handles Apple MSRDC parameterization.
amsrdcDesktopHandler() {
    if [ "$debug" = true ]; then echo amsrdcDesktopHandler: calling amsrdcDesktopHandler with: $1 >> "$logfile"; fi
    rdpFileWriter       
    /Applications/Remote\ Desktop\ Connection.app/Contents/MacOS/Remote\ Desktop\ Connection "$rdpfile" 2>/dev/null &
}

# rdesktopDesktopHandler() - Handles rdesktop parameterization.
rdesktopDesktopHandler() {
    if [ "$debug" = true ]; then echo rdesktopDesktopHandler: calling rdesktopDesktopHandler with: $1 >> "$logfile"; fi
    rdpFileWriter
    echo "$xsasupwd" | rdesktop -0 -g 1024x768 -b -B -T "$(capsFirst $name)" -u "$xsasuser" -p - -N -a 16 -z -x l -r disk:home=$HOME $addr 2>/dev/null &
}

# noneAccessHandler() - Handles access commands for host and guest systems
# without any known access method.
noneAccessHandler(){
    if [ "$debug" = true ]; then echo noneAccessHandler: calling noneAccessHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        acstate=none
        ;;
        access)
        echo "no access method defined for this system"
        ;;
        *)
    esac
}

# httpAccessHandler() - Handles accessing host or guest systems using the
# http protocol and the default webbrowser.
httpAccessHandler(){
    if [ "$debug" = true ]; then echo httpAccessHandler: calling httpAccessHandler with: $1 >> "$logfile"; fi
    
    local result=$(portState $addr 443)
    local proto=https

    if [ "$type" = host -o "$type" = guest ]; then    
        if [ "$result" = closed ]; then
            local port=80
            local result=$(portState $addr $port)
            local proto=http
        fi
    elif [ $type = service ]; then
        local result=$(portState $addr $port)
        local proto=http
    fi

    case "$1" in
        state)
        if [ "$result" = open ]; then
            acstate=active
        elif [ "$result" = closed ]; then
            acstate=inactive
        else
            acstate=$result
        fi
        ;;
        access)
        if [ "$acstate" = active -a "$addr" != 127.0.0.1 ]; then
            ${browser}BrowserHandler $proto://$addr:$port
        else
            echo "$1 failed: type=$type proto=$proto addr=$addr port=$port acmt=$acmt acstate=$acstate"
        fi
        ;;
        *)
    esac
}

# telAccessHandler() - Handles accessing host or guest systems using the
# telnet protocol and the terminal handler specified in options.conf.
telAccessHandler(){
    if [ "$debug" = true ]; then echo telAccessHandler: calling telAccessHandler with: $1 >> "$logfile"; fi
    local port=23
    case "$1" in
        state)
        local result=$(portState $addr $port)
        if [ "$result" = open ]; then
            acstate=active
        elif [ "$result" = closed ]; then
            acstate=inactive
        else
            acstate=$result
        fi
        ;;
        access)
        if [ "$acstate" = active -a "$addr" != 127.0.0.1 ]; then
            ${terminal}TerminalHandler tel
        else
            echo "$1 failed: type=$type addr=$addr xsastype=$xsastype xsasuser=$xsasuser acmt=$acmt acstate=$acstate"
        fi
        ;;
        *)
    esac
}

# sshAccessHandler() - Handles accessing host or guest systems using the
# ssh protocol and the terminal handler specified in options.conf.
sshAccessHandler(){
    if [ "$debug" = true ]; then echo sshAccessHandler: calling sshAccessHandler with: $1 >> "$logfile"; fi
    local port=22
    case "$1" in
        state)
        local result=$(portState $addr $port)
        if [ "$result" = open ]; then
            acstate=active
        elif [ "$result" = closed ]; then
            acstate=inactive
        else
            acstate=$result
        fi
        ;;
        access)
        if [ "$acstate" = active -a "$addr" != 127.0.0.1 ]; then
            ${terminal}TerminalHandler ssh
        else
            echo "$1 failed: type=$type addr=$addr xsastype=$xsastype xsasuser=$xsasuser acmt=$acmt acstate=$acstate"
        fi
        ;;
        *)
    esac
}

# rdpAccessHandler() - Handles accessing host or guest systems using the
# rdp protocol and the desktop handler specified in options.conf.
rdpAccessHandler(){
    if [ "$debug" = true ]; then echo rdpAccessHandler: calling rdpAccessHandler with: $1 >> "$logfile"; fi
    local port=3389
    case "$1" in
        state)
        local result=$(portState $addr $port)
        if [ "$result" = open ]; then
            acstate=active
        elif [ "$result" = closed ]; then
            acstate=inactive
        else
            acstate=$result
        fi
        ;;
        access)
        if [ "$acstate" = active -a "$addr" != 127.0.0.1 ]; then
            ${desktop}DesktopHandler
        else
            echo "$1 failed: type=$type addr=$addr xsastype=$xsastype xsasuser=$xsasuser acmt=$acmt acstate=$acstate"
        fi
        ;;
        *)
    esac
}

# noneExecHandler() - Handles execute commands for host and guest systems
# without any known execute method.
noneExecHandler(){
    if [ "$debug" = true ]; then echo noneExecHandler: calling noneExecHandler with: $1 >> "$logfile"; fi
    case "$1" in
        state)
        exstate=none
        ;;
        runasuser|runasadmin|runasservice|sendasuser|sendasadmin|sendasservice)
        echo "no execute method defined for this system"
        ;;
        *)
    esac
}

# smbExecHandler() - Handles executing commands on a remote  host or guest
# system using the smb/cifs protocol and the winexe program.
smbExecHandler(){
    if [ "$debug" = true ]; then echo smbExecHandler: calling smbExecHandler with: $1 >> "$logfile"; fi
    local port=445
    case "$1" in
        state)
        local result=$(portState $addr $port)
        if [ "$result" = open ]; then
            exstate=active
        elif [ "$result" = closed ]; then
            exstate=inactive
        else
            exstate=$result
        fi
        ;;
        runasuser)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.tell.$name.sh"
            echo "$command"                                                                                     >> "$usrcfd/tmp/session.tell.$name.sh"
            sh "$usrcfd/tmp/session.tell.$name.sh"
            rm "$usrcfd/tmp/session.tell.$name.sh"
        elif [ "$exstate" = active -a "$type" != service ]; then
            if [ "$upwd" ]; then local upwd="%$upwd"; fi
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.tell.$name.sh"
            echo "winexe --debug-stderr -U '${user}${upwd}' //$addr 'cmd.exe /c $command' 2> /dev/null"         >> "$usrcfd/tmp/session.tell.$name.sh"
            sh "$usrcfd/tmp/session.tell.$name.sh"
            rm "$usrcfd/tmp/session.tell.$name.sh"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo smbExecHandler: $1: type=$type name=$name addr=$addr port=$port user=$user exmt=$exmt exstate=$exstate >> "$logfile"
            echo smbExecHandler: $1: command=$command >> "$logfile"
        fi
        ;;
        runasadmin)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            echo "elevation of local privileges using winexe not implemented yet"
        elif [ "$exstate" = active -a "$type" != service ]; then
            if [ "$apwd" ]; then local apwd="%$apwd"; fi
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.tell.$name.sh"
            echo "winexe --debug-stderr -U '${admin}${apwd}' //$addr 'cmd.exe /c $command' 2> /dev/null"        >> "$usrcfd/tmp/session.tell.$name.sh"
            sh "$usrcfd/tmp/session.tell.$name.sh"
            rm "$usrcfd/tmp/session.tell.$name.sh"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo smbExecHandler: $1: type=$type name=$name addr=$addr port=$port admin=$admin exmt=$exmt exstate=$exstate >> "$logfile"
            echo smbExecHandler: $1: command=$command >> "$logfile"
        fi
        ;;
        runasservice)
        if [ "$addr" = "127.0.0.1" -a "$type" = service ]; then
            echo "changing of local privileges using winexe not implemented yet"
        elif [ "$type" = service ]; then
            svname=$name
            svuser=$user
            svupwd=$upwd
            parseEntry $host
            smbExecHandler state
            if [ "$exstate" = active ]; then
                if [ "$svupwd" ]; then local svupwd="%$svupwd"; fi
                echo "#!/bin/sh"                                                                                 > "$usrcfd/tmp/session.tell.$svname.sh"
                echo "winexe --debug-stderr -U '${svuser}${svupwd}' //$addr 'cmd.exe /c $command' 2> /dev/null" >> "$usrcfd/tmp/session.tell.$svname.sh"
                sh "$usrcfd/tmp/session.tell.$svname.sh"
                rm "$usrcfd/tmp/session.tell.$svname.sh"
            fi
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then 
            echo smbExecHandler: $1: svname=$svname svuser=$svuser svmt=$svmt svstate=$svstate >> "$logfile"
            echo smbExecHandler: $1: command=$command >> "$logfile"
        fi
        ;;
        sendasuser)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            cp -r "$source" "$target"
        elif [ "$exstate" = active -a "$type" != service ]; then
            local share=$(echo $target | sed "s|:|$|" | cut -d/ -f 1 | sed 's|"||g')
            local source="$source"
            local target="$(echo $target | sed 's|/|\\\\|g' | cut -d: -f2 | sed 's|"||g')"
            local smbcommand="mkdir \"$target\";cd \"$target\";lcd \"$source\";prompt off;recurse on;mput *;quit"
            if [ "$upwd" ]; then local upwd="%$upwd"; fi
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.send.$name.sh"
            echo "smbclient //$addr/$share -U \"${user}${upwd}\" -c '$smbcommand'"                              >> "$usrcfd/tmp/session.send.$name.sh"
            sh "$usrcfd/tmp/session.send.$name.sh" > /dev/null 2>&1 < /dev/null
            rm "$usrcfd/tmp/session.send.$name.sh"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo smbExecHandler: $1: type=$type name=$name addr=$addr port=$port user=$user exmt=$exmt exstate=$exstate >> "$logfile"
            echo smbExecHandler: $1: share=$share source=$source target=$target >> "$logfile"
        fi
        ;;
        sendasadmin)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            echo "sending local files with elevated privileges when using smbclient not implemented yet"
        elif [ "$exstate" = active -a "$type" != service ]; then
            local share=$(echo $target | sed "s|:|$|" | cut -d/ -f 1 | sed 's|"||g')
            local source="$source"
            local target="$(echo $target | sed 's|/|\\\\|g' | cut -d: -f2 | sed 's|"||g')"
            local smbcommand="mkdir \"$target\";cd \"$target\";lcd \"$source\";prompt off;recurse on;mput *;quit"
            if [ "$apwd" ]; then local apwd="%$apwd"; fi
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.send.$name.sh"
            echo "smbclient //$addr/$share -U \"${admin}${apwd}\" -c '$smbcommand'"                             >> "$usrcfd/tmp/session.send.$name.sh"
            sh "$usrcfd/tmp/session.send.$name.sh" > /dev/null 2>&1 < /dev/null
            rm "$usrcfd/tmp/session.send.$name.sh"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo smbExecHandler: $1: type=$type name=$name addr=$addr port=$port admin=$admin exmt=$exmt exstate=$exstate >> "$logfile"
            echo smbExecHandler: $1: share=$share source=$source target=$target >> "$logfile"
        fi
        ;;
        sendasservice)
        if [ "$addr" = "127.0.0.1" -a "$type" = service ]; then
            echo "sending local files with changed privileges when using smbclient not implemented yet"
        elif [ "$type" = service ]; then
            svname=$name
            svuser=$user
            svupwd=$upwd
            parseEntry $host
            smbExecHandler state
            if [ "$exstate" = active ]; then
                local share=$(echo $target | sed "s|:|$|" | cut -d/ -f 1 | sed 's|"||g')
                local source="$source"
                local target="$(echo $target | sed 's|/|\\\\|g' | cut -d: -f2 | sed 's|"||g')"
                local smbcommand="mkdir \"$target\";cd \"$target\";lcd \"$source\";prompt off;recurse on;mput *;quit"
                if [ "$svupwd" ]; then local svupwd="%$svupwd"; fi
                echo "#!/bin/sh"                                                                                 > "$usrcfd/tmp/session.send.$svname.sh"
                echo "smbclient //$addr/$share -U \"${svuser}${svupwd}\" -c '$smbcommand'"                      >> "$usrcfd/tmp/session.send.$svname.sh"
                sh "$usrcfd/tmp/session.send.$svname.sh" > /dev/null 2>&1 < /dev/null
                rm "$usrcfd/tmp/session.send.$svname.sh"
            fi
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then 
            echo smbExecHandler: $1: svname=$svname svuser=$svuser svmt=$svmt svstate=$svstate >> "$logfile"
            echo smbExecHandler: $1: share=$share source=$source target=$target >> "$logfile"
        fi
        ;;
        *)
    esac
}

# sshExecHandler() - Handles executing commands on a remote  host or guest
# system using the ssh protocol and the ssh program.
sshExecHandler(){
    if [ "$debug" = true ]; then echo sshExecHandler: calling sshExecHandler with: $1 >> "$logfile"; fi
    local port=22
    case "$1" in
        state)
        local result=$(portState $addr $port)
        if [ "$result" = open ]; then
            exstate=active
        elif [ "$result" = closed ]; then
            exstate=inactive
        else
            exstate=$result
        fi
        ;;
        runasuser)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.tell.$name.sh"
            echo "$command"                                                                                     >> "$usrcfd/tmp/session.tell.$name.sh"
            sh "$usrcfd/tmp/session.tell.$name.sh"
            rm "$usrcfd/tmp/session.tell.$name.sh"
        elif [ "$exstate" = active -a "$type" != service ]; then
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.tell.$name.sh"
            echo "ssh $sshopts -l '$user' $addr '$command'"                                                     >> "$usrcfd/tmp/session.tell.$name.sh"
            sh "$usrcfd/tmp/session.tell.$name.sh"
            rm "$usrcfd/tmp/session.tell.$name.sh"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo sshExecHandler: $1: type=$type name=$name addr=$addr port=$port user=$user exmt=$exmt exstate=$exstate >> "$logfile"
            echo sshExecHandler: $1: command=$command >> "$logfile"
        fi
        ;;
        runasadmin)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            echo "elevation of local privileges when using ssh not implemented yet"
        elif [ "$exstate" = active -a "$type" != service ]; then
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.tell.$name.sh"
            echo "ssh $sshopts -l '$admin' $addr '$command'"                                                    >> "$usrcfd/tmp/session.tell.$name.sh"
            sh "$usrcfd/tmp/session.tell.$name.sh"
            rm "$usrcfd/tmp/session.tell.$name.sh"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo sshExecHandler: $1: type=$type name=$name addr=$addr port=$port admin=$admin exmt=$exmt exstate=$exstate >> "$logfile"
            echo sshExecHandler: $1: command=$command >> "$logfile"
        fi
        ;;
        runasservice)
        if [ "$addr" = "127.0.0.1" -a "$type" = service ]; then
            echo "changing of local privileges when using ssh not implemented yet"
        elif [ "$type" = service ]; then
            svname=$name
            svuser=$user
            parseEntry $host
            sshExecHandler state
            if [ "$exstate" = active ]; then
                echo "#!/bin/sh"                                                                                 > "$usrcfd/tmp/session.tell.$svname.sh"
                echo "ssh $sshopts -l '$svuser' $addr '$command'"                                               >> "$usrcfd/tmp/session.tell.$svname.sh"
                sh "$usrcfd/tmp/session.tell.$svname.sh"
                rm "$usrcfd/tmp/session.tell.$svname.sh"
            fi
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then 
            echo sshExecHandler: $1: svname=$svname svuser=$svuser svmt=$svmt svstate=$svstate >> "$logfile"
            echo sshExecHandler: $1: command=$command >> "$logfile"
        fi
        ;;
        sendasuser)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            echo "#!/bin/sh"                                                                                     > "$usrcfd/tmp/session.send.$name.sh"
            echo "cp -r $source $target"                                                                        >> "$usrcfd/tmp/session.send.$name.sh"
            sh "$usrcfd/tmp/session.send.$name.sh"
            rm "$usrcfd/tmp/session.send.$name.sh"
        elif [ "$exstate" = active -a "$type" != service ]; then
            local sshuser="$(echo "$user" | sed 's|\\|\\\\|g')"
            scp -q $sshopts -r "$source" $sshuser@$addr:"$target"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo sshExecHandler: $1: type=$type name=$name addr=$addr port=$port user=$user exmt=$exmt exstate=$exstate >> "$logfile"
            echo sshExecHandler: $1: source=$source target=$target >> "$logfile"
        fi
        ;;
        sendasadmin)
        if [ "$addr" = "127.0.0.1" -a "$type" != service ]; then
            echo "sending local files with elevated privileges when using scp not implemented yet"
        elif [ "$exstate" = active -a "$type" != service ]; then
            local sshuser="$(echo "$admin" | sed 's|\\|\\\\|g')"
            scp -q $sshopts -r "$source" $sshuser@$addr:"$target"
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then
            echo sshExecHandler: $1: type=$type name=$name addr=$addr port=$port admin=$admin exmt=$exmt exstate=$exstate >> "$logfile"
            echo sshExecHandler: $1: source=$source target=$target >> "$logfile"
        fi
        ;;
        sendasservice)
        if [ "$addr" = "127.0.0.1" -a "$type" = service ]; then
            echo "sending local files with changed privileges when using scp not implemented yet"
        elif [ "$type" = service ]; then
            svuser=$user
            parseEntry $host
            sshExecHandler state
            if [ "$exstate" = active ]; then
                local sshuser="$(echo "$svuser" | sed 's|\\|\\\\|g')"
                scp -q $sshopts -r "$source" $sshuser@$addr:"$target"
            fi
        else
            echo "$1 failed: type=$type addr=$addr user=$user exmt=$exmt exstate=$exstate"
        fi
        
        if [ "$debug" = true ]; then 
            echo sshExecHandler: $1: svname=$svname svuser=$svuser svmt=$svmt svstate=$svstate >> "$logfile"
            echo sshExecHandler: $1: source=$source target=$target >> "$logfile"
        fi
        ;;
        *)
    esac
}

sshCredHandler(){
    if [ "$debug" = true ]; then echo sshCredHandler: calling sshCredHandler with: $1 >> "$logfile"; fi
    case "$1" in
        ashost|asguest)
        if [ "$user" != none ]; then 
            echo "sending ssh key for defined user ($user) to $name"
            sshSendKey "$user"
        fi
        if [ "$admin" != none -a "$admin" != "$user" ]; then 
            echo "sending ssh key for defined admin ($admin) to $name"
            sshSendKey "$admin"
        fi
        ;;
        asservice)
        if [ "$user" != none ]; then
            echo "sending ssh key for defined service user ($user) to $host"
            sshSendKey "$user"
        fi
        ;;
        *)
    esac
}

winCredHandler(){
    if [ "$debug" = true ]; then echo winCredHandler: calling winCredHandler with: $1 >> "$logfile"; fi
    case "$1" in
        ashost|asguest)
        if [ "$user" != none ]; then 
            echo "storing credentials for defined user ($user) on $name"
            winStoreCreds user "$user"
        fi
        if [ "$admin" != none -a "$admin" != "$user" ]; then 
            echo "storing credentials for defined admin ($admin) on $name"
            winStoreCreds admin "$admin"
        fi
        ;;
        asservice)
        if [ "$user" != none ]; then
            echo "storing credentials for defined service user ($user) on $host"
            winStoreCreds user "$user"
        fi
        ;;
        *)
    esac
}

# mapentry(object_which_is_arg_for_functions, list_of_functions)
# executes the list of functions sequentially passing it a
# $object_which_is_arg_for_functions.
mapEntry(){
    if [ "$debug" = true ]; then echo mapEntry: calling mapEntry with: $@ >> "$logfile"; fi
    local entity=$1
    local functions=$2
    
    if [ ! "$3" ] ; then 
        local returnformat=short; 
    else
        local returnformat=long; 
    fi;
    
    # Lookup entry for given input
    parseEntry $entity
    
    # If stop funtions are in the function list, reverse order.
    if [ $type = group ]; then
        if [ "$(echo $functions | grep -i stop)" ]; then
            for entity in $members; do
                local output="$entity $output"
            done
            local flip=off
            local list=$output
            unset output
        else
            local flip=on
            local list=$members
        fi
        
        # If entity turned out to be a group, loop results
        local count=1
        for item in $list; do
            parseEntry $item
            if [ "$mode" = serial ]; then
                for function in $functions; do
                    if [ "$function" = "returnState" ] ; then
                        $function $returnformat
                    else
                        $function $item
                    fi
                done
            elif [ "$mode" = parallel ]; then
                $0 $main $item &
            elif [ "$mode" = stateful ]; then
                if [ $count -gt 1 ]; then
                    let minus=count-1
                    local previous="$(echo $list | awk "{print \$$minus}")"
                    local waitstate=unknown
                    while [ "$waitstate" != "$flip" ]; do
                        local waitstate=$(parseEntry $previous ; checkState $previous; echo $state)
                        if [ "$waitstate" != "$flip" ];then
                            echo "$name: waiting for $previous to go $flip (currently $waitstate)"
                        else
                            echo "$name: $previous is $waitstate, continuing.."
                        fi
                    done
                fi
                for function in $functions; do
                    if [ "$function" = "returnState" ] ; then
                        $function $returnformat
                    else
                        $function $item
                    fi
                done
            else
                echo "unknown mode $mode passed; valid modes are:"
                echo "serial (default), parallel, stateful"
                exit 1
            fi
            let count=count+1
        done;

    else # Else it is either a host, guest or service, proceed.
        if [ "$(echo $functions | grep -i stop)" ]; then
            flip=off
        else
            flip=on
        fi
        
        for function in $functions; do            
            if [ "$function" = "returnState" ] ; then
                $function $returnformat
            else
                $function $item
            fi
        done
        if [ "$mode" = stateful ]; then
            local waitstate=unknown
            while [ "$waitstate" != "$flip" ]; do
                local waitstate=$(parseEntry $name ; checkState $name; echo $state)
                if [ "$waitstate" != "$flip" ];then
                    echo "$name: waiting to go $flip (currently $waitstate)"
                else
                    state=$waitstate
                    returnState short
                fi
            done
        fi
    fi
    
    # Temporary hack to handle screen session connect after loop exit.
    if [[ "$functions" =~ "accessEntity" ]]; then
        if [ "$terminal" = screen ]; then
            screen -r
        fi
    fi
}

# Main case statement.
main=$1
case "$main" in
    addconf)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2
    acmt="none"
    exmt="none"
    vrmt="none"
    svmt="none"
    user="none"
    mandatories="type"
    optionals_all="name osmt acmt exmt user admin addr"
    optionals_hosts="vrmt vmhome vmdata"
    optionals_guests="host"
    optionals_services="svmt port svstatus svstart svstop"
    optionals_groups="members"
    optionals="$optionals_all $optionals_hosts $optionals_guests $optionals_services $optionals_groups"
    silence="true"
    parseParameters $@

    if [ "$type" = "host" -a "$vrmt" = "none" ]; then
        mandatories="type osmt acmt exmt user admin addr"
        optionals="vrmt"
        parseParameters $@
        addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$vrmt)"
    
    elif [ "$type" = "host" -a "$vrmt" != "none" ]; then
        mandatories="type osmt acmt exmt user admin addr vrmt vmhome vmdata"
        parseParameters $@
        addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$vrmt)"

        opts="$usrcfd/sys/$name/options.conf"
        mkdir -p "$usrcfd/sys/$name"
        echo "vmhome='$vmhome'"  > "$opts"
        echo "vmdata='$vmdata'" >> "$opts"

    elif [ "$type" = "guest" ]; then
        mandatories="type osmt acmt exmt user admin addr host"
        parseParameters $@
        addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$host)"
    
    elif [ "$type" = "service" -a "$svmt" = "none" ]; then
        mandatories="type svmt addr port host"
        optionals="acmt exmt user"
        parseParameters $@
        addConf "$type $name($svmt,$acmt,$exmt,$user,$addr,$port,$host)"
        
    elif [ "$type" = "service" -a "$svmt" != "none" ]; then
        mandatories="type svmt host svstatus svstart svstop"
        optionals="acmt exmt user addr port"
        parseParameters $@
        addConf "$type $name($svmt,$acmt,$exmt,$user,$addr,$port,$host)"

        opts="$usrcfd/sys/$name/options.conf"
        mkdir -p "$usrcfd/sys/$name"
        echo "svstatus='$svstatus'" > "$opts"
        echo "svstart='$svstart'"  >> "$opts"
        echo "svstop='$svstop'"    >> "$opts"
        
    elif [ "$type" = "group" ]; then
        mandatories="type members"
        parseParameters $@
        addConf "$type $name($members)"
    else
        echo invalid type $type specified
    fi
    ;;
    modconf)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2
    oldname=$2
    mandatories="type"
    optionals_all="name osmt acmt exmt user admin addr"
    optionals_hosts="vrmt vmhome vmdata"
    optionals_guests="host"
    optionals_services="svmt port svstatus svstart svstop"
    optionals_groups="members"
    optionals="$optionals_all $optionals_hosts $optionals_guests $optionals_services $optionals_groups"
    silence="true"
    parseParameters $3

    # Check if the entry exists.
    check=$(cat "$config" | grep -v "^#" | grep " $oldname(")
    if [ -z "$check" ]; then
        echo "entry with name $oldname does not exist"
        exit 1
    fi

    # Read out the members of the entry.
    members=$(echo $check | awk '{print $2}')
    members=${members#*(} ; members=${members%%)*}
    members=$(echo $members | sed -e "s|,| |g")

    # Set oldtype and oldvrmt so changing type and vrmt works.
    oldtype="$(echo $check | cut -d " " -f 1)"    
    
    # Call parseHost/Guest/Group/Service to check for validity of tokens.
    parse$(capsFirst $oldtype) $oldname

    # Set any passed parameters.
    parseParameters $@
    
    # If we're a host and vrmt was passed and not none, check for extra opts.
    if [ "$type" = "host" ]; then
        oldvrmt="$(echo $members | cut -d " " -f 7)"
        if [ -z "$vrmt" ]; then vrmt=$oldvrmt; fi
        if [ "$vrmt" != none ]; then
            opts="$usrcfd/sys/$name/options.conf"
            if [ -e "$opts" ]; then
                for option in vmhome vmdata; do
                    if [ ! "$(cat "$opts" | grep -v "^#" | grep "$option=")" ]; then
                        mandatory_extras="$option $mandatory_extras"
                    else
                        optional_extras="$option $optional_extras"
                    fi
                done
                . "$opts"
            else
                mkdir -p "$usrcfd/sys/$name"
                mandatory_extras="vmhome vmdata"
            fi
        fi
    fi

    # If we're a service and svmt was passed and not none, check for extra opts.
    if [ "$type" = "service" ]; then
        oldsvmt="$(echo $members | cut -d " " -f 1)"
        if [ -z "$svmt" ]; then svmt=$oldsvmt; fi
        if [ "$svmt" != none ]; then
            opts="$usrcfd/sys/$name/options.conf"
            if [ -e "$opts" ]; then             
                for option in svstatus svstart svstop; do
                    if [ ! "$(cat "$opts" | grep -v "^#" | grep "$option=")" ]; then
                        mandatory_extras="$option $mandatory_extras"
                    else
                        optional_extras="$option $optional_extras"
                    fi
                done
                . "$opts"
            else            
                mkdir -p "$usrcfd/sys/$name"
                mandatory_extras="svstatus svstart svstop"
            fi
        fi
    fi
    
    if [ "$type" = "host" ]; then
        if [ "$oldtype" = "guest" ]; then
            mandatories="type vrmt $mandatory_extras"
            optionals="name osmt acmt exmt user admin addr $optional_extras"
            parseParameters $@
        elif [ "$oldtype" = "service" ]; then
            mandatories="type osmt vrmt admin $mandatory_extras"
            optionals="name acmt exmt user addr $optional_extras"
            parseParameters $@
        elif [ "$oldtype" = "group" ]; then
            mandatories="type osmt acmt exmt user admin addr vrmt $mandatory_extras"
            optionals="name $optional_extras"
            parseParameters $@
        else
            mandatories="type $mandatory_extras"
            optionals="name osmt acmt exmt user admin addr vrmt $optional_extras"
            parseParameters $@
        fi

        if [ ! "$vrmt" = "none" ]; then
            echo "vmhome='$vmhome'"  > "$opts"
            echo "vmdata='$vmdata'" >> "$opts"
        fi

        members="$osmt $acmt $exmt $user $admin $addr $vrmt"
        parseHost $name
        
        if [ ! "$(cat "$config" | grep "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$vrmt)")" ]; then
            delConf $oldname
            addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$vrmt)"
        fi
        
        if [ ! "$name" = "$oldname" ]; then
            cat "$config" \
                | sed "s|,$oldname)|,$name)|g" \
                | sed "s|($oldname,|($name,|g" \
                | sed "s|,$oldname,|,$name,|g" \
                | sed "s|($oldname)|($name)|g" \
                > "$usrcfd/tmp/session.conf.tmp"
            mv "$usrcfd/tmp/session.conf.tmp" "$config"
            if [ -e "$usrcfd/sys/$oldname" ]; then
                if [ ! -e "$usrcfd/sys/$name" ]; then
                    mv "$usrcfd/sys/$oldname" "$usrcfd/sys/$name"
                else
                    echo "notice: a settings directory with name \"$name\" already exists"
                    echo ""
                    echo "moving /$usrcfd/sys/$name to $usrcfd/old/$name"
                    echo "please review what's in $usrcfd/old and keep it cleaned up!"
                    mkdir -p "$usrcfd/old"
                    mv "$usrcfd/sys/$name" "$usrcfd/old/$name"
                    mv "$usrcfd/sys/$oldname" "$usrcfd/sys/$name"
                fi
            fi
        fi

    elif [ "$type" = "guest" ]; then
        if [ "$oldtype" = "host" ]; then
            mandatories="type host"
            optionals="name osmt acmt exmt user admin addr"
            parseParameters $@
        elif [ "$oldtype" = "group" ]; then
            mandatories="type osmt acmt exmt user admin addr host"
            optionals="name"
            parseParameters $@
        elif [ "$oldtype" = "service" ]; then
            mandatories="type osmt admin host"
            optionals="name acmt exmt user addr"
        else
            mandatories="type"
            optionals="name osmt acmt exmt user admin addr host"
            parseParameters $@
        fi

        members="$osmt $acmt $exmt $user $admin $addr $host"
        parseGuest $name

        if [ ! "$(cat "$config" | grep "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$host)")" ]; then
            delConf $oldname
            addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$host)"
        fi
        
        if [ ! "$name" = "$oldname" ]; then
            cat "$config" \
                | sed "s|,$oldname)|,$name)|g" \
                | sed "s|($oldname,|($name,|g" \
                | sed "s|,$oldname,|,$name,|g" \
                | sed "s|($oldname)|($name)|g" \
                > "$usrcfd/tmp/session.conf.tmp"
            mv "$usrcfd/tmp/session.conf.tmp" "$config"
            if [ -e "$usrcfd/sys/$oldname" ]; then
                if [ ! -e "$usrcfd/sys/$name" ]; then
                    mv "$usrcfd/sys/$oldname" "$usrcfd/sys/$name"
                else
                    echo "notice: a settings directory with name \"$name\" already exists"
                    echo ""
                    echo "moving /$usrcfd/sys/$name to $usrcfd/old/$name"
                    echo "please review what's in $usrcfd/old and keep it cleaned up!"
                    mkdir -p "$usrcfd/old"
                    mv "$usrcfd/sys/$name" "$usrcfd/old/$name"
                    mv "$usrcfd/sys/$oldname" "$usrcfd/sys/$name"
                fi
            fi
        fi

    elif [ "$type" = "service" ]; then    
        if [ "$oldtype" = "host" ]; then
            mandatories="type svmt port host $mandatory_extras"
            optionals="name acmt exmt user addr $optional_extras"
            parseParameters $@
        elif [ "$oldtype" = "guest" ]; then
            mandatories="type svmt port $mandatory_extras"
            optionals="name acmt exmt user addr host $optional_extras"
        elif [ "$oldtype" = "group" ]; then
            mandatories="type svmt acmt exmt user addr port host $mandatory_extras"
            optionals="name $optional_extras"
            parseParameters $@
        else
            mandatories="type $mandatory_extras"
            optionals="name svmt acmt exmt user addr port host $optional_extras"
            parseParameters $@
        fi

        if [ ! "$svmt" = "none" ]; then
            echo "svstatus='$svstatus'" > "$opts"
            echo "svstart='$svstart'"  >> "$opts"
            echo "svstop='$svstop'"    >> "$opts"

        fi
        
        members="$svmt $acmt $exmt $user $addr $port $host"
        parseService $name

        if [ ! "$(cat "$config" | grep "$type $name($svmt,$acmt,$exmt,$user,$addr,$port,$host)")" ]; then
            delConf $oldname
            addConf "$type $name($svmt,$acmt,$exmt,$user,$addr,$port,$host)"
        fi
        
        if [ ! "$name" = "$oldname" ]; then
            cat "$config" \
                | sed "s|,$oldname)|,$name)|g" \
                | sed "s|($oldname,|($name,|g" \
                | sed "s|,$oldname,|,$name,|g" \
                | sed "s|($oldname)|($name)|g" \
                > "$usrcfd/tmp/session.conf.tmp"
            mv "$usrcfd/tmp/session.conf.tmp" "$config"
            if [ -e "$usrcfd/sys/$oldname" ]; then
                if [ ! -e "$usrcfd/sys/$name" ]; then
                    mv "$usrcfd/sys/$oldname" "$usrcfd/sys/$name"
                else
                    echo "notice: a settings directory with name \"$name\" already exists"
                    echo ""
                    echo "moving /$usrcfd/sys/$name to $usrcfd/old/$name"
                    echo "please review what's in $usrcfd/old and keep it cleaned up!"
                    mkdir -p "$usrcfd/old"
                    mv "$usrcfd/sys/$name" "$usrcfd/old/$name"
                    mv "$usrcfd/sys/$oldname" "$usrcfd/sys/$name"
                fi
            fi
        fi

    elif [ "$type" = "group" ]; then
        if [ "$oldtype" != "group" ]; then
            mandatories="type members"
            optionals="name"
            parseParameters $@
        else
            mandatories="type"
            optionals="name members"
            parseParameters $@
        fi

        if [ ! "$(cat "$config" | grep "$type $name($members)")" ]; then
            delConf $oldname
            addConf "$type $name($members)"
        fi
    else
        echo invalid type $type specified
    fi
    ;;
    delconf)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2

    delConf "$name"
    if [ -e "$usrcfd/sys/$name" ]; then
        echo "notice: a settings directory \"$name\" was found"
        echo ""
        echo "moving $usrcfd/sys/$name to $usrcfd/old/$name"
        echo "please review what's in $usrcfd/old and keep it cleaned up!"
        mkdir -p "$usrcfd/old"
        mv "$usrcfd/sys/$name" "$usrcfd/old/$name"
    fi 
    ;;
    discover)
    # Check if further valid input was given, set range and norange.
    if [ -z "$2" ]; then $0; exit 1; else range=$2 norange=$2; fi

    # Lookup entry for given input if it is not an IP address.
    IFS=. ; set -- $(echo "$2" | cut -d "/" -f 1)
    if [ $# -eq 4 ]; then
        for seq do
            case $seq in
                ""|*[!0-9]*)
                echo "invalid ip address specified"
                return 1;
                break
                ;;
                *)
                [ $seq -gt 255 ] && echo $err && exit 1
                ;;
            esac
        done;
        unset IFS
        # It's probably a valid IP address range, call directly.
        unset norange
        discoveryHelper range
    else
        unset IFS
        # It's anything but not a valid IP address; let mapEntry handle it.
        unset range
        mapEntry $norange "checkState discoveryHelper"
    fi
    ;;
    check|state)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi
    
    # Tell about resilient mode if enabled.
    if [ "$resilient" = true ]; then 
        echo "warning: running in resilient mode, state checks will be slow"
    fi
    
    # Optionally set execution mode
    optionals="mode"
    silence="true"
    parseParameters $@
    
    # Lookup entry for given input
    mapEntry $2 "checkState returnState"
    ;;
    detail)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Lookup entry for given input
    mapEntry $2 "checkState returnState" long
    ;;
    start)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Optionally set execution mode
    optionals="mode"
    silence="true"
    parseParameters $@
    
    # Lookup entry for given input
    mapEntry $2 "checkState startEntity returnState"
    ;;
    stop)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Optionally set execution mode
    optionals="mode"
    silence="true"
    parseParameters $@
    
    # Lookup entry for given input
    mapEntry $2 "checkState stopEntity returnState"
    ;;
    restart|reboot)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Optionally set execution mode
    optionals="mode"
    silence="true"
    parseParameters $@
    
    # Lookup entry for given input
    mapEntry $2 "checkState restartEntity returnState"
    ;;
    create)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2

    mandatories="numvcpu memsize dsksize guestos"
    optionals="desc"
    parseParameters $@

    if [ "$numvcpu" -lt 1 ]; then
        echo "not enough cpus specified: $numvcpu"
        exit 1
    elif [ "$numvcpu" -gt 4 ]; then
        echo "too many cpus specified: $numvcpu"
        exit 1
    fi

    if [ "$memsize" -lt 32 ]; then
        echo "less than 32 megabytes specified: $memsize"
        exit 1
    elif [ "$memsize" -gt 16384 ]; then
        echo "more than 16384 megabytes specified: $memsize"
        exit 1
    fi

    if [ "$dsksize" -lt 1 ]; then
        echo "less than 1 gigabytes specified: $dsksize"
        exit 1
    elif [ "$dsksize" -gt 1024 ]; then
        echo "more than 1 terabyte specified: $dsksize"
        exit 1
    fi    

    # Lookup entry for given input
    mapEntry $name "checkState createEntity returnState"
    ;;
    destroy)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2

    # Lookup entry for given input
    mapEntry $name "checkState destroyEntity returnState"
    ;;
    access)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    optionals="user admin service mode"
    silence="true"
    parseParameters $@
    if [ "$admin" ]; then
        xsastype=admin
    elif [ "$service" ]; then
        xsastype=service
    else
        xsastype=user
    fi
    
    # Lookup entry for given input
    mapEntry $2 "checkState accessEntity"
    ;;
    tell)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi
    
    name=$2
    mandatories="command"
    optionals="user admin service mode"
    silence="true"
    parseParameters $@
    if [ "$admin" ]; then
        runastype=admin
    elif [ "$service" ]; then
        runastype=service
    else
        runastype=user
    fi
    
    # Override command setting because parseParameters is too strict.
    command=$(echo $@ | sed "s|--$runastype||g" \
                     | sed "s|--mode=$mode||g" \
                     | sed -n 's/[^=]*=//p' \
                     | sed 's/^[[:space:]]*//')
    
    # Lookup entry for given input.
    mapEntry $2 "checkState runAs"
    ;;
    send)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi
    
    mandatories="source target"
    optionals="user admin service mode"
    silence="true"
    parseParameters $@
    if [ "$admin" ]; then
        sendastype=admin
    elif [ "$service" ]; then
        sendastype=service
    else
        sendastype=user
    fi
    
    # Lookup entry for given input
    mapEntry $2 "checkState sendAs"
    ;;
    key)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Lookup entry for given input
    mapEntry $2 "checkState credAs"
    ;;
    reinit)
    rm -f "$usrcfd/cfg/tools.required" "$usrcfd/cfg/tools.found"
    $0 version
    ;;
    list)
    optionals="verbose"
    silence="true"
    parseParameters $@
   
    case $2 in
        group|groups|guest|guests|host|hosts|service|services|all)
        match=$(echo "$2" | sed 's|s$||')
        if [ "$verbose" ]; then
            if [ "$2" = all ]; then
                cat "$config" | sed '/^$/d' | grep -v "^#"
            else
                grep "^$match" "$config" | sed '/^$/d'
            fi
        else
            if  [ "$2" = all ]; then
                cat "$config" | sed '/^$/d' | grep -v "^#" | cut -d '(' -f 1 | awk '{print $2}'
            else
                grep "^$match" "$config" | sed "s|^$match ||g" | cut -d '(' -f 1
            fi
        fi
        ;;
        osmt)
        for item in $known_osmts; do
            echo $item
        done
        ;;
        acmt)
        for item in $known_acmts; do
            echo $item
        done
        ;;
        exmt)
        for item in $known_exmts; do
            echo $item
        done
        ;;
        svmt)
        for item in $known_svmts; do
            echo $item
        done
        ;;
        vrmt)
        for item in $known_vrmts; do
            echo $item
        done
        ;;
        crmt)
        for item in $known_crmts; do
            echo $item
        done
        ;;
        *)
        if [ "$2" ]; then
            if [ "$verbose" ]; then
                cat "$config" | sed '/^$/d' | grep -v "^#" | grep -e "host $2(" -e "guest $2(" -e "service $2(" -e "group $2("
            else
                cat "$config" | sed '/^$/d' | grep -v "^#" | grep -e "host $2(" -e "guest $2(" -e "service $2(" -e "group $2(" | cut -d '(' -f 1 | cut -d ' ' -f 2
            fi
        else
            echo $"Usage: $0 list {group|guest|host|service|all|osmt|acmt|exmt|svmt|vrmt|crmt|<name>}" 
            exit 1
        fi
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
    echo "addconf    - adds a host, guest, service or group to session.conf."
    echo "modconf    - modify an existing host, guest, service or group in session.conf."
    echo "delconf    - removes a host, guest, service or group from session.conf."
    echo "discover   - scan an ip or an ip subnet."
    echo "check      - (state) checks the state of a host, guest, service or group."
    echo "detail     - shows all known information about a host, guest or service."
    echo "start      - attempts to start a host, guest, service or group."
    echo "stop       - attempts to stop a host, guest, service or group."
    echo "restart    - attempts to restart a host, guest, service or group."
    echo "create     - attempts to create a non-existing guest system."
    echo "destroy    - attempts to destroy an existing guest system."
    echo "access     - access a host, guest, service or group using various methods."
    echo "tell       - send a command to the host, guest, service or group."
    echo "send       - send a directory to the host, guest, service or group."
    echo "key        - send public key or store credentials for remote admin and user."
    echo "list       - list hosts, guests, services, groups, osmt, acmt, exmt or vrmt's"
    echo "reinit     - reinitializes session's required and detected tools."
    echo "version    - show session version."
    echo ""
    echo "Argument to control group execution mode (for state, start, stop, etc):"
    echo "--mode     - serial (default), stateful or parallel (experimental)."
    echo ""    
    echo "Arguments for addconf, modconf and delconf:"
    echo "--type     - the type of the added entry (host, guest, service or group)."
    echo "--osmt     - the operating system for the host or guest system"
    echo "--acmt     - the access method to be used."
    echo "--exmt     - the execute method to be used."
    echo "--addr     - the ip address for the host, guest or service."
    echo "--port     - (services only) the port on which a service listens."
    echo "--user     - the regular user account for the host, guest or service."
    echo "--admin    - the administrative account for the host or guest."
    echo "--vrmt     - (optional, hosts only) the virtualization method supported."
    echo "--vmhome   - (optional, hosts only) where the host stores its vm executables."
    echo "--vmdata   - (optional, hosts only) where the host stores its virtual machines."
    echo "--svstatus - (optional, scripted services only) status command for a service."
    echo "--svstart  - (optional, scripted services only)  start command for a service."
    echo "--svstop   - (optional, scripted services only)   stop command for a service."
    echo "--host     - (guests only) the parent host system."
    echo "--members  - (groups only) a comma-separated list of hosts and/or guests."
    echo ""
    echo "Arguments for privilege specification in access, tell and send:"
    echo "--user     - run the command with user credentials (default)."
    echo "--admin    - run the command with admin credentials."
    echo "--service  - run the command with service credentials."
    echo ""
    echo "Arguments for create and destroy:"
    echo "--desc     - (optional) annotation (--desc=\"My description.\")."
    echo "--numvcpu  - the virtual CPU count for guest system (--numvcpu=2)."
    echo "--memsize  - the virtual memory size in MB for guest system (--memsize=512)."
    echo "--dsksize  - the disk size in GB for guest system (--dsksize=4)."
    echo "--guestos  - the operating system for guest system (--guestos=other-64)."
    echo ""
    echo "Arguments for send:"
    echo "--source   - the source directory on the local system to send from."
    echo "--target   - the target directory on the remote system to send to."
    echo ""
    echo "Special parameters for list:"
    echo "all        - (list and check only) show or state all."
    echo "host       - (list) show all hosts."
    echo "guest      - (list) show all guests."
    echo "group      - (list) show all groups."
    echo "service    - (list) show all services."
    echo "acmt       - (list) show all supported access methods."
    echo "exmt       - (list) show all supported execute methods."
    echo "svmt       - (list) show all supported service methods."
    echo "vrmt       - (list) show all supported virtualization methods."
    echo "osmt       - (list) show all supported operating environments."
    echo "crmt       - (list) show all supported credential methods."
    echo ""
    exit 1
esac
