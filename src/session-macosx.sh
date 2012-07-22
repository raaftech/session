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
# along with Session. If not, see <http://www.gnu.org/licenses/>. 


debug=0
logfile="$HOME/Desktop/session.log"
usrcfd="$HOME/.session"
config="$usrcfd/cfg/session.conf"

mkdir -p $usrcfd/cfg $usrcfd/sys $usrcfd/tpl
touch "$usrcfd/cfg/session.conf"

if [ ! -e "$config" ]; then
    echo "configuration file "$config" not found, exiting."
    exit 1
fi

# List of required tools + checking routine.
tools_native="awk cut grep nslookup osascript ping sed ssh scp smbclient uuidgen"
tools_extras="nmap winexe"
tools="$tools_native $tools_extras"

if [ ! -e $usrcfd/cfg/tools.found ]; then
    echo "$usrcfd/cfg/tools.found does not exist. checking for required programs."

    state="success"
    for tool in $tools; do
        echo -n " * $tool: "
        if [ "`which $tool 2> /dev/null`" ]; then
            # The tool was found, state stays "success".
            echo "success"
        else
            # The tool was NOT found, set state to "fail".
            state="fail"
            echo "$state"
        fi
    done
    echo ""

    if [ $state = fail ]; then
        echo "Some of the mandatory tools required to run this application"
        echo "are not available. You need to review the list above and"
        echo "make sure that all these tools are available on the path."
        echo ""
        exit 1
    else
        echo $tools > $usrcfd/cfg/tools.found
    fi

    unset state
fi

# Set private key option when openssh style private key found.
if [ -e $HOME/.ssh/id_dsa ]; then
    pkkopts="-i $HOME/.ssh/id_dsa"
elif [ -e $HOME/.ssh/id_rsa ]; then
    pkkopts="-i $HOME/.ssh/id_rsa"
fi

known_osses="embedded-like unix-like windows-like aix5 aix6 arch2kx debian4 debian5 esxi4 fbsd7 fbsd8 fedora12 fedora13 hpux1123 hpux1131 macosx6 maemo5 netbsd4 netbsd5 obsd4 osol11 osuse11 rhel4 rhel5 sles11 sol10 ubuntu10 win2k3 win2k8 win7 winxp"
known_vrmts="none hpvm kvm xen vmw vmf pvm esx"
known_exmts="none ssh smb"
known_acmts="none ssh tel rdp http"

# osglobals() - Sets generic global variables for commands that interact with
# a given operating system.
osGlobals(){
    if [ $debug = 1 ]; then echo calling osGlobals with: $os >> $logfile; fi
    case $os in
        win7)
        cmd_stop="shutdown -s -t 01"
        ;;
        macosx6)
        cmd_stop="shutdown -h now"
        ;;
        netbsd4)
        cmd_stop="/sbin/shutdown -h -p now"
        ;; 
        netbsd5)
        cmd_stop="/sbin/shutdown -h -p now"
        ;; 
        sol10)
        cmd_stop="/usr/sbin/poweroff"
        ;;
        hpux1131)
        cmd_stop="/sbin/shutdown -hy 0"
        ;;
        aix6)
        cmd_stop="/sbin/shutdown -hy 0"
        ;;
        *)
        cmd_stop="poweroff"
        cmd_reboot="reboot"
    esac
}

# capsFirst() - Capitalizes initial character of argument string(s) passed.
# Accepts multiple arguments.
capsFirst(){
    if [ $debug = 1 ]; then echo calling capsFirst with: $@ >> $logfile; fi
    input="$@"
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
    if [ $debug = 1 ]; then echo calling macGen with: $1 >> $logfile; fi
    vendor_vmw="00:50:56"
    vendor_xen="00:16:3E"
    vendor_kvm="54:52:00"
    case "$1" in
        global)
        genmac=$(dd if=/dev/urandom bs=1 count=6 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3":"$4":"$5":"$6 }')
        first=`echo $genmac | cut -d : -f 1`
        indec=`printf "%d" 0x$first`
        check=$(( $indec % 2 ))
        if [ ! $check -eq 0 ]; then
            newfirst=`printf "%x" $(( $indec + 1))`
            genmac=`echo $genmac | sed "s|^$first|$newfirst|"`
        fi
        macaddr=$genmac
        ;;
        vmw|vmf|esx)
        venmac="$vendor_vmw"
        genmac=$(dd if=/dev/urandom bs=1 count=3 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3 }')
        macaddr=$venmac:$genmac
        ;;
        xen)
        venmac="$vendor_xen"
        genmac=$(dd if=/dev/urandom bs=1 count=3 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3 }')
        macaddr=$venmac:$genmac
        ;;
        kvm)
        venmac="$vendor_kvm"
        genmac=$(dd if=/dev/urandom bs=1 count=3 2>/dev/null | od -tx1 | head -1 | cut -d' ' -f2- | awk '{ print $1":"$2":"$3 }')
        macaddr=$venmac:$genmac
        ;;
        *)
        echo "no macgen method specified. expected any of global|vmw|vmf|esx|xen|kvm"
        exit 1
    esac
}

# uuidGen() - UUID Generator.
uuidGen() {
    if [ $debug = 1 ]; then echo calling uuidGen with: $1 >> $logfile; fi
    uuid=$(uuidgen)
}

# portState() - Checks the state (open/closed) of a port on a given address
# with as little response time as possible.
portState(){
    if [ $debug = 1 ]; then echo calling portState with: $@ >> $logfile; fi
    addr=$1
    port=$2

    if [ ! -z "`nmap -n -PN --host-timeout 1501 -p $port $addr 2> /dev/null | grep open`" ]; then
        echo open
    else
        echo closed
    fi
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
            echo "$name: `tput setaf 2`$state`tput setaf 7`"
        elif [ $state = busy ]; then
            echo "$name: `tput setaf 3`$state`tput setaf 7`"
        elif [ $state = off ]; then
            echo "$name: `tput setaf 4`$state`tput setaf 7`"
        else
            echo "$name: `tput setaf 1`$state`tput setaf 7`"
        fi
        ;;
        *)
    esac
}

# addConf() - Add a configuration line to session.conf.
addConf() {
    if [ $debug = 1 ]; then echo calling addConf with: $1 >> $logfile; fi
    entry=$@

    # Read out the members of the entry.
    members=`echo $entry | awk '{print $2}'`
    members=${members#*(} ; members=${members%%)*}
    members=`echo $members | sed -e "s|,| |g"`

    # Call parseHost/Guest/Group to check for validity of tokens.
    parse`capsFirst $type` $name

    # Check if the name already exists regardless of type.
    if [ "`cat "$config" | grep " $name("`"  ]; then
        echo entry with name $name already exists: `cat "$config" | grep " $name("`
        exit 1
    fi

    # Check parameters for host or guest systems.
    if [ "$type" = "host" -o "$type" = "guest" ]; then
        if [ "`cat "$config" | grep -w "$addr"`"  ]; then
            echo entry with addr $addr already exists: `cat "$config" | grep -w "$addr"`
            exit 1
        fi
    fi

    # Nothing exited before us. Add newentry.
    echo "$entry" >> "$config"
    echo "succesfully added: $entry"
}

# delConf() - Remove a configuration line from session.conf.
delConf() {
    if [ $debug = 1 ]; then echo calling delConf with: $1 $2 >> $logfile; fi

    # Check if the entry exists.
    check=`cat "$config" | grep " $1("`
    if [ -z "$check" ]; then
        echo "entry with name $1 does not exist"
        exit 1
    fi

    # Nothing exited before us. Del oldentry.
    cat "$config" | sed -e "/$check/d" > /tmp/session.conf.tmp
    mv /tmp/session.conf.tmp "$config"
    echo "succesfully removed: $check"
}

# discoveryHelper() - Discover hosts on a network and attempt to addConf them.
discoveryHelper(){
    if [ $debug = 1 ]; then echo calling discoveryHelper with: $1 >> $logfile; fi
    osGlobals
    if [ "$norange" ]; then
        echo "should do a deep discovery (aka verify) of an existing entry called $name"
    elif [ "$range" ]; then
        nmap -n -T5 -PE -oG /tmp/session.discover.out -sP $range 2> /dev/null
        for addr in `cat /tmp/session.discover.out | grep Up | cut -d " " -f 2 | sed -e 's/^[ \t]*//'`; do 
            type=host
            name=$(nslookup $addr 2> /dev/null | grep name | cut -d "=" -f 2 | cut -d "." -f 1 | sed -e 's/^[ \t]*//')
            if [ ! "$name" ]; then
                name=unknown$(echo $addr | awk 'BEGIN {FS="."}{print "-" $3 "-" $4}')
            fi
            os=embedded-like
            acmt=none
            exmt=none
            user=unknown
            admin=unknown
            if [ "`portState $addr 22`" = open ]; then
                os=unix-like
                acmt=ssh
                exmt=ssh
                user=$USER
                admin=root
            elif [ "`portState $addr 23`" = open ]; then
                os=embedded-like
                acmt=tel
                exmt=none
                user=unknown
                admin=unknown
            elif [ "`portState $addr 445`" = open ]; then
                os=windows-like
                acmt=rdp
                exmt=smb
                user=$USER
                admin=administrator
            elif [ "`portState $addr 443`" = open ]; then
                os=embedded-like
                acmt=http
                exmt=none
                user=$USER
                admin=root
            elif [ "`portState $addr 80`" = open ]; then
                os=embedded-like
                acmt=http
                exmt=none
                user=$USER
                admin=root
            fi

            # call addConf with the generated entry, addConf handles existence issues.
            addConf "$type $name($os,$acmt,$exmt,$user,$admin,$addr,none)"

        done
        rm /tmp/session.discover.out
    else
        echo discoveryHelper called with unexpected parameter $1
        exit 1
    fi
}

# parseParameters() - Handles parsing of given parameters starting with "--".
# Optionally supports a $mandatory and a $optional list, which allows validity
# and scope checking. The $mandatory variable stores parameters that MUST be 
# passed. The $optional variable stores parameters which MAY be passed. Not
# specifying $mandatory or $optional means any parameter that starts with "--"
# will be evaluated. You can pass just the parameter name, like --test, or
# you can specify --test=foobar. The first variant sets a variable $test to 1.
# The second variant sets $test to "foobar". Example:
# mandatory="foo bar" ; optional="baz" ; parseParameters $@  
parseParameters(){
    if [ "$debug" = 1 ]; then echo calling parseParameters with: $@ >> $logfile; fi

    for parameter in `echo "$@"`; do 
        if [ `echo $parameter | grep "^--"` ]; then 
            parameters="$parameters $parameter "
            variables="$variables `echo $parameter | sed "s|--||g" | cut -d "=" -f 1` "  
        fi 
    done

    if [ "$mandatory" ]; then
        for item in $mandatory; do
            if [ ! "`echo "$variables" | grep "$item"`" ]; then
                required="$required --$item"
            fi
        done
    fi

    if [ "$mandatory" -a "$optional" ]; then
        for parameter in $parameters; do
            variable="`echo $parameter | sed "s|--||g" | cut -d "=" -f 1`"
            value="`echo $parameter | awk 'BEGIN {FS="="}{print $2}' | sed '/^$/d'`"
            if [ -z "$value" ]; then value=1; fi
            if [ "`echo "$optional" | grep "$variable"`" ]; then
                export $variable=$value
            elif [ "`echo "$mandatory" | grep "$variable"`" ]; then
                export $variable=$value
            else
                illegal="$illegal --$variable "
            fi
        done
    elif [ "$mandatory" ]; then
        for parameter in $parameters; do
            variable="`echo $parameter | sed "s|--||g" | cut -d "=" -f 1`"
            value="`echo $parameter | awk 'BEGIN {FS="="}{print $2}' | sed '/^$/d'`"
            if [ -z "$value" ]; then value=1; fi
            if [ "`echo "$mandatory" | grep "$variable"`" ]; then
                export $variable=$value
            else
                illegal="$illegal --$variable "
            fi

        done
    elif [ "$optional" ]; then
        for parameter in $parameters; do
            variable="`echo $parameter | sed "s|--||g" | cut -d "=" -f 1`"
            value="`echo $parameter | awk 'BEGIN {FS="="}{print $2}' | sed '/^$/d'`"
            if [ "`echo "$optional" | grep "$variable"`" ]; then
                export $variable=$value
            else
                illegal="$illegal --$variable "
            fi
        done
    else 
        for parameter in $parameters; do
            variable="`echo $parameter | sed "s|--||g" | cut -d "=" -f 1`"
            value="`echo $parameter | awk 'BEGIN {FS="="}{print $2}' | sed '/^$/d'`"
            if [ -z "$value" ]; then value=1; fi
            export $variable=$value
        done
    fi

    illegal="`echo $illegal | sed '/^$/d'`"
    if [ ! -z "$illegal" ]; then
        echo "illegal parameters passed: $illegal"
    fi

    required="`echo $required | sed '/^$/d'`"
    if [ ! -z "$required" ]; then
        echo "required parameters missing: $required"
    fi

    if [ "$illegal" -o "$required" ]; then
        exit 1
    fi
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
        echo "\$members not defined"
        exit 1
    fi
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
        echo "\$members not defined"
        exit 1
    fi

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
        fi
        let count=count+1
    done;

    if [[ ! "$known_osses" =~ $os ]]; then
        echo "unknown operating system $os specified for host $name"
        exit 1
    fi

    if [[ ! "$known_acmts" =~ $acmt ]]; then
        echo "unknown access method $acmt specified for host $name"
        exit 1
    fi

    if [[ ! "$known_exmts" =~ $exmt ]]; then
        echo "unknown execution method $exmt specified for host $name"
        exit 1
    fi

    if [ -e $usrcfd/sys/$name/user.pwd ]; then
        upwd="`tr -d '\r' < $usrcfd/sys/$name/user.pwd`"
        upwdopts="-p \"$upwd\""
    fi

    if [ -e $usrcfd/sys/$name/admin.pwd ]; then
        apwd="`tr -d '\r' < $usrcfd/sys/$name/admin.pwd`"
        apwdopts="-p \"$apwd\""
    fi

    err="invalid ip address specified for host $name"
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
    fi
    unset IFS

    host=none

    if [[ ! "$known_vrmts" =~ $vrmt ]]; then
        echo "unknown virtualization method $vrmt specified for host $name"
        exit 1
    fi

    opts=$usrcfd/sys/$name/options.conf
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
        echo "\$members not defined"
        exit 1
    fi

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
        fi
        let count=count+1
    done;

    if [[ ! "$known_osses" =~ $os ]]; then
        echo "unknown operating system $os specified for guest $name"
        exit 1
    fi

    if [[ ! "$known_acmts" =~ $acmt ]]; then
        echo "unknown access method $acmt specified for guest $name"
        exit 1
    fi

    if [[ ! "$known_exmts" =~ $exmt ]]; then
        echo "unknown execution method $exmt specified for guest $name"
        exit 1
    fi

    if [ -e $usrcfd/sys/$name/user.pwd ]; then
        upwd="`tr -d '\r' < $usrcfd/sys/$name/user.pwd`"
        upwdopts="-p \"$upwd\""
    fi

    if [ -e $usrcfd/sys/$name/admin.pwd ]; then
        apwd="`tr -d '\r' < $usrcfd/sys/$name/admin.pwd`"
        apwdopts="-p \"$apwd\""
    fi

    err="invalid ip address specified for guest $name"
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
    fi
    unset IFS

    vrmt=`cat "$config" | grep "host $host" | cut -d "," -f 7 | sed "s|)||g"`
    if [[ ! "$known_vrmts" =~ $vrmt ]]; then
        echo "unknown virtualization method $vrmt specified for host $host"
        exit 1
    fi

    opts=$usrcfd/sys/$host/options.conf
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
    fi

    case $name in
        all)
        type=group
        members=`echo -n \`cat "$config" | grep -v -e "^#" -e "^group" |cut -d " " -f 2 | cut -d "(" -f 1 | sort -u\``
        ;;
        *)
        entry=`grep " $name(" "$config"`
        lines=`grep -c " $name(" "$config"`

        if [ -z "$entry" ]; then
            echo "$name not found in "$config""
            exit 1
        fi

        if [ "$lines" != "1" ]; then
            echo "multiple entries found with the same name"
            exit 1
        fi

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
# results in the necessary initialization of variables read from "$config".
# You can pass a guest or host as a parameter to this function.
checkSystem(){
    if [ $debug = 1 ]; then echo calling checkSystem with: $1 >> $logfile; fi
    # Set initial states.
    state=uninitialized
    access=uninitialized
    execute=uninitialized

    # Determine if we're sane.
    if [ -z "$type" ]; then
        echo "type not set. run parseEntry() first"
        exit 1 
    elif [ "$type" = group ]; then
        echo "passed invalid type $type to checkSystem()"
        exit 1
    fi

    # First off, if we're not talking to localhost
    # is the system reachable or unreachable?
    if [ "$addr" = "127.0.0.1" ]; then
        state=on
    else
        state=`noneVirtHandler state`
    fi

    if [ $state = reachable ]; then
        if [ $acmt = $exmt ]; then
            access=`${acmt}AccessHandler state` 
            execute=$access
        else
            access=`${acmt}AccessHandler state` 
            execute=`${exmt}ExecHandler state`
        fi

        if [ $access = closed -o $execute = closed ]; then
            state=busy
        else
            state=on
        fi

    elif [ $state = unreachable -a $type = guest ]; then
        state=`parseEntry $host ; noneVirtHandler state`
        if [ $state = reachable ]; then
            state=`${vrmt}VirtHandler state`
        fi
    fi
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
    fi
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
    fi
}

# rebootSystem() - Handle the rebooting of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
rebootSystem(){
    if [ $debug = 1 ]; then echo calling rebootSystem with: $1 >> $logfile; fi
    osGlobals
    if [ $type = host ]; then
        noneVirtHandler reboot
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler reboot
    else
        echo unknown type $type passed
        exit 1
    fi
}

# createSystem() - Handle the creation of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
createSystem(){
    if [ $debug = 1 ]; then echo calling createSystem with: $1 >> $logfile; fi
    osGlobals
    if [ $type = host ]; then
        noneVirtHandler create
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler create
    else
        echo unknown type $type passed
        exit 1
    fi
}

# destroySystem() - Handle the destruction of a host or guest system, independent 
# of virtualization method by passing our parameters on to a specific vrmt 
# handler function.
destroySystem(){
    if [ $debug = 1 ]; then echo calling destroySystem with: $1 >> $logfile; fi
    osGlobals
    if [ $type = host ]; then
        noneVirtHandler destroy
    elif [ $type = guest ]; then
        ${vrmt}VirtHandler destroy
    else
        echo unknown type $type passed
        exit 1
    fi
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
        ping -W 2 -c 2 $addr > /dev/null 2>&1 < /dev/null && echo reachable || echo unreachable
        ;;
        start)
        echo "not implemented $1 for noneVirtHandler yet"
        echo "(i don't know how to start a physical system)"
        ;;
        stop)
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi
        ;;
        reboot)
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_reboot"`
            state=rebooting
        fi
        ;;
        create)
        echo "not implemented $1 for noneVirtHandler yet"
        echo "(i don't know how to create a physical system)"
        ;;
        destroy)
        echo "not implemented $1 for noneVirtHandler yet"
        echo "(i don't know how to destroy a physical system)"
        ;;
        *)
    esac
}

# kvmVirtHandler() - Handle KVM virtual machine related commands.
kvmVirtHandler(){
    if [ $debug = 1 ]; then echo calling kvmVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi
        result=`$0 command-asadmin $host "virsh domstate $name" 2>/dev/null | sed '/^$/d'`
        if [ ! -z "`echo $result | grep 'running'`" ]; then
            echo on
        elif [ ! -z "`echo $result | grep 'shut off'`" ]; then
            echo off
        else
            echo non-existing
        fi
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "virsh start $name" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi
        ;;
        reboot)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_reboot"`
            state=rebooting
        fi
        ;;
        create)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p $usrcfd/sys/$name
            macGen $vrmt
            uuidGen $vrmt
            let memsize=$memsize*1024
            cat $usrcfd/tpl/$vrmt.stf \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$os|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                | sed "s|GUEST_UUID|$uuid|g" \
                > $usrcfd/sys/$name/$name.xml
            mkdir /tmp/session.create.$name
            cp $usrcfd/sys/$name/$name.xml  /tmp/session.create.$name
            result=$($0 send-asadmin $host /tmp/session.create.$name/$name.xml \"$vmdata/qemu\")
            rm -f /tmp/session.create.$name/$name.xml
            rmdir /tmp/session.create.$name
            result=$($0 command-asadmin $host \"$vmhome/qemu-img\" create -f qcow2 \"$vmdata/images/$name.img\" ${dsksize}G 2>/dev/null | sed '/^$/d')
            result=$($0 command-asadmin $host \"$vmhome/virsh\" define \"$vmdata/qemu/$name.xml\" 2>/dev/null | sed '/^$/d')
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = off ]; then
            echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
            read answer
            if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                result=$($0 command-asadmin $host \"$vmhome/virsh\" undefine \"$name\" 2>/dev/null | sed '/^$/d')
                result=$($0 command-asadmin $host rm -f \"$vmdata/qemu/$name.xml\" \"$vmdata/qemu/$name.log*\" \"$vmdata/images/$name.img\" 2>/dev/null | sed '/^$/d')
                state=destroyed
            else
                state=saved
            fi
        fi
        ;;
        *)
    esac
}

# hpvmVirtHandler() - Handle HPVM virtual machine related commands.
hpvmVirtHandler(){
    if [ $debug = 1 ]; then echo calling hpvmVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi
        result=`$0 command-asadmin $host "/opt/hpvm/bin/hpvmstatus -P $name" | grep ^$name | awk '{print $4}'`
        if [ ! -z "`echo $result | grep 'On'`" ]; then
            echo on
        elif [ ! -z "`echo $result | grep 'Off'`" ]; then
            echo off
        else
            echo non-existing
        fi
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "/opt/hpvm/bin/hpvmstart -P $name" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi
        ;;
        reboot)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_reboot"`
            state=rebooting
        fi
        ;;
        create)
        if [ -e "$opts" ]; then . "$opts"; fi
        echo "not implemented $1 for ${vrmt}VirtHandler yet"
        ;;
        destroy)
        if [ -e "$opts" ]; then . "$opts"; fi
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
        ;;
        *)
    esac
}

# xenVirtHandler() - Handle XEN virtual machine related commands.
xenVirtHandler(){
    if [ $debug = 1 ]; then echo calling xenVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi
        result=`$0 command-asadmin $host "xm list $name" 2>/dev/null | grep ^$name | awk '{print $1}'`
        if [ ! -z "$result" ]; then
            echo on
        elif [ -z "$result" ]; then
            echo off
        else
            echo non-existing
        fi
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = off ]; then
            result=`$0 command-asadmin $host "xm create $name" 2>/dev/null | sed '/^$/d'`
            state=booting
        fi
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi
        ;;
        reboot)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_reboot"`
            state=rebooting
        fi
        ;;
        create)
        if [ -e "$opts" ]; then . "$opts"; fi
        echo "not implemented $1 for ${vrmt}VirtHandler yet"
        ;;
        destroy)
        if [ -e "$opts" ]; then . "$opts"; fi
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
        ;;
        *)
    esac
}

# vmwVirtHandler() - Handle VMware Workstation virtual machine related commands.
vmwVirtHandler(){
    if [ $debug = 1 ]; then echo calling vmwVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi 
        result=$($0 command $host \"$vmhome/vmrun\" list 2>/dev/null | sed '/^$/d')
        if [ ! -z "`echo $result | grep "$name"`" ]; then
            echo on
        else
            result=$($0 command $host \"$vmhome/vmrun\" listSnapshots \"$vmdata/$name/$name.vmx\" 2>/dev/null | sed '/^$/d')
            if [ -z "`echo $result | grep "Error: Cannot open VM"`" ]; then
                echo off
            else
                echo non-existing
            fi
        fi
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi 
        if [ $state = off ]; then
            result=$($0 command $host \"$vmhome/vmrun\" start \"$vmdata/$name/$name.vmx\" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi 
        if [ $state = on ]; then
            result=$($0 command-asadmin $name "$cmd_stop")
            state=halting
        fi
        ;;
        reboot)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=$($0 command-asadmin $name "$cmd_reboot")
            state=rebooting
        fi
        ;;
        create)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p $usrcfd/sys/$name
            macGen $vrmt
            cat $usrcfd/tpl/$vrmt.stf \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$os|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > $usrcfd/sys/$name/$name.vmx
            mkdir /tmp/session.create.$name
            cp $usrcfd/sys/$name/$name.vmx  /tmp/session.create.$name
            result=$($0 send $host /tmp/session.create.$name \"$vmdata/$name\")
            rm -f /tmp/session.create.$name/$name.vmx
            rmdir /tmp/session.create.$name
            result=$($0 command $host \"$vmhome/vmware-vdiskmanager\" -c -s ${dsksize}GB -a ide -t 0 \"$vmdata/$name/$name.vmdk\" 2>/dev/null | sed '/^$/d')
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = off ]; then
            echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
            read answer
            if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                result=$($0 command $host \"$vmhome/vmrun\" deleteVM \"$vmdata/$name/$name.vmx\" 2>/dev/null | sed '/^$/d')
                state=destroyed
            else
                state=saved
            fi
        fi
        ;;
        *)
    esac
}

# vmfVirtHandler() - Handle VMware Fusion virtual machine related commands.
vmfVirtHandler(){
    if [ $debug = 1 ]; then echo calling vmfVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi 
        result=$($0 command $host \"$vmhome/vmrun\" list 2>/dev/null | sed '/^$/d')
        if [ ! -z "`echo $result | grep "$name"`" ]; then
            echo on
        else
            result=$($0 command $host \"$vmhome/vmrun\" listSnapshots \"$vmdata/$name.vmwarevm/$name.vmx\" 2>/dev/null | sed '/^$/d')
            if [ -z "`echo $result | grep "Error: Cannot open VM"`" ]; then
                echo off
            else
                echo non-existing
            fi
        fi
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi 
        if [ $state = off ]; then
            result=$($0 command $host \"$vmhome/vmrun\" start \"$vmdata/$name.vmwarevm/$name.vmx\" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi 
        if [ $state = on ]; then
            result=$($0 command-asadmin $name "$cmd_stop")
            state=halting
        fi
        ;;
        reboot)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=$($0 command-asadmin $name "$cmd_reboot")
            state=rebooting
        fi
        ;;
        create)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p $usrcfd/sys/$name
            macGen $vrmt
            cat $usrcfd/tpl/$vrmt.stf \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$os|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > $usrcfd/sys/$name/$name.vmx
            mkdir /tmp/session.create.$name
            cp $usrcfd/sys/$name/$name.vmx  /tmp/session.create.$name
            result=$($0 send $host /tmp/session.create.$name \"$vmdata/$name.vmwarevm\")
            rm -f /tmp/session.create.$name/$name.vmx
            rmdir /tmp/session.create.$name
            result=$($0 command $host \"$vmhome/vmware-vdiskmanager\" -c -s ${dsksize}GB -a ide -t 0 \"$vmdata/$name.vmwarevm/$name.vmdk\" 2>/dev/null | sed '/^$/d')
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = off ]; then
            echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
            read answer
            if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                result=$($0 command $host \"$vmhome/vmrun\" deleteVM \"$vmdata/$name.vmwarevm/$name.vmx\" 2>/dev/null | sed '/^$/d')
                state=destroyed
            else
                state=saved
            fi
        fi
        ;;
        *)
    esac
}

# esxVirtHandler() - Handle VMware ESX(i) virtual machine related commands.
esxVirtHandler(){
    if [ $debug = 1 ]; then echo calling esxiVirtHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        if [ -e "$opts" ]; then . "$opts"; fi 
        result=$($0 command-asadmin $host "vim-cmd vmsvc/power.getstate \`vim-cmd vmsvc/getallvms | grep $name | cut -f 1\` | grep Powered" 2>/dev/null | sed '/^$/d')
        if [ "$result" = "Powered on" ]; then
            echo on
        elif [ "$result" = "Powered off" ]; then
            echo off
        else
            echo non-existing
        fi
        ;;
        start)
        if [ -e "$opts" ]; then . "$opts"; fi 
        if [ $state = off ]; then
            result=$($0 command-asadmin $host "vim-cmd vmsvc/power.on \`vim-cmd vmsvc/getallvms | grep $name | cut -f 1\`" 2>/dev/null | sed '/^$/d')
            state=booting
        fi
        ;;
        stop)
        if [ -e "$opts" ]; then . "$opts"; fi 
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_stop"`
            state=halting
        fi
        ;;
        reboot)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = on ]; then
            result=`$0 command-asadmin $name "$cmd_reboot"`
            state=rebooting
        fi
        ;;
        create)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            mkdir -p $usrcfd/sys/$name
            macGen $vrmt
            cat $usrcfd/tpl/$vrmt.stf \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$os|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > $usrcfd/sys/$name/$name.vmx
            mkdir /tmp/session.create.$name
            cp $usrcfd/sys/$name/$name.vmx  /tmp/session.create.$name
            result=$($0 send $host /tmp/session.create.$name \"$vmdata/$name\")
            rm -f /tmp/session.create.$name/$name.vmx
            rmdir /tmp/session.create.$name
            result=$($0 command-asadmin $host /sbin/vmkfstools -c ${dsksize}G \"$vmdata/$name/$name.vmdk\" 2>/dev/null | sed '/^$/d')
            result=$($0 command-asadmin $host vim-cmd solo/registervm \"$vmdata/$name/$name.vmx\" 2>/dev/null | sed '/^$/d')            
            state=created
        else
            echo "config template for $vrmt style guest not found"
            echo "looking for $usrcfd/tpl/$vrmt.stf"
        fi
        ;;
        destroy)
        if [ -e "$opts" ]; then . "$opts"; fi
        if [ $state = off ]; then
            echo -n "you are about to delete and destroy $name. are you sure? (y|n): "
            read answer
            if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                result=$($0 command-asadmin $host "vim-cmd vmsvc/destroy \`vim-cmd vmsvc/getallvms | grep $name | cut -f 1\`")
                state=destroyed
            else
                state=saved
            fi
        fi
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
    fi
    if [ -e $HOME/.ssh/id_dsa.pub ]; then
        sshkey=$HOME/.ssh/id_dsa.pub
    elif [ -e $HOME/.ssh/id_rsa.pub ]; then
        sshkey=$HOME/.ssh/id_rsa.pub
    fi
    if [ ! -z $sshkey ]; then
        echo "found public key: $sshkey, preparing to send:"
        scp $pkkopts -q "$sshkey" $sender@$addr:/tmp/pubkey
        if [ "$?" == "0" ]; then
            echo "key sent successfully. preparing remote key install:"
        else
            echo "something went wrong with sending the key."
            echo "scp returned $? ."
            exit 1
        fi
        ssh $pkkopts $sender@$addr 'mkdir -p $HOME/.ssh; touch $HOME/.ssh/authorized_keys; cat $HOME/.ssh/authorized_keys /tmp/pubkey | sort | uniq > /tmp/authorized_keys; mv /tmp/authorized_keys $HOME/.ssh/authorized_keys; rm /tmp/pubkey; chmod 755 $HOME; chmod 755 $HOME/.ssh; chmod 600 $HOME/.ssh/authorized_keys'
        if [ "$?" == "0" ]; then
            echo "key installed successfully."
        else
            echo "something went wrong with remote key installation."
            echo "ssh returned $? ."
            exit 1
        fi
    fi
}

# noneAccessHandler() - Handles access commands for host and guest systems
# without any known access method.
noneAccessHandler(){
    if [ $debug = 1 ]; then echo calling noneAccessHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        echo open
        ;;
        access)
        echo no access method defined for this host.
        ;;
        *)
    esac
}

# httpAccessHandler() - Handles accessing host or guest systems using the
# http protocol and the default webbrowser.
httpAccessHandler(){
    if [ $debug = 1 ]; then echo calling httpAccessHandler with: $1 >> $logfile; fi
    if [ "`portState $addr 443`" = open ]; then
        port=443
        proto=https
    elif [ "`portState $addr 80`" = open ]; then
        port=80
        proto=http
    fi

    case "$1" in
        state)
        if [ "$port" ]; then
            echo open
        else
            echo closed
        fi
        ;;
        access)
        if [ $access = open ]; then
            open $proto://$addr &
        fi
        ;;
        *)
    esac
}

# telAccessHandler() - Handles accessing host or guest systems using the
# telnet protocol and the telnet program.
telAccessHandler(){
    if [ $debug = 1 ]; then echo calling telAccessHandler with: $1 >> $logfile; fi
    port=23
    case "$1" in
        state)
        portState "$addr" "$port"
        ;;
        access)
        if [ "$access" = open ]; then
            osascript                                                                                  \
                -e 'activate application "Terminal" -- Needed to ensure keystroke goes to Terminal    '\
                -e 'tell application "System Events"                                                  '\
                -e '    tell process "Terminal" to keystroke "t" using command down -- Open new tab   '\
                -e 'end tell                                                                          '\
                -e 'tell application "Terminal"                                                       '\
                -e '    activate                                                                      '\
                -e '    do shell "telnet '"$addr"' ; exit" in last tab of front window '\
                -e 'end tell                                                                          '
        fi
        ;;
        *)
    esac
}

# sshAccessHandler() - Handles accessing host or guest systems using the
# ssh protocol and the Terminal application.
sshAccessHandler(){
    if [ $debug = 1 ]; then echo calling sshAccessHandler with: $1 >> $logfile; fi
    port=22
    case "$1" in
        state)
        portState $addr $port
        ;;
        access)
        if [ "$access" = open ]; then
            osascript                                                                                  \
                -e 'activate application "Terminal" -- Needed to ensure keystroke goes to Terminal    '\
                -e 'tell application "System Events"                                                  '\
                -e '    tell process "Terminal" to keystroke "t" using command down -- Open new tab   '\
                -e 'end tell                                                                          '\
                -e 'tell application "Terminal"                                                       '\
                -e '    activate                                                                      '\
                -e '    do shell "ssh '"$pkkopts -Y $user@$addr"' ; exit" in last tab of front window '\
                -e 'end tell                                                                          '
        fi
        ;;
        *)
    esac
}

# rdpAccessHandler() - Handles accessing host or guest systems using the
# rdp protocol and the Remote Desktop Connection program.
rdpAccessHandler(){
    if [ $debug = 1 ]; then echo calling rdpAccessHandler with: $1 >> $logfile; fi
    port=3389
    case "$1" in
        state)
        portState $addr $port
        ;;
        access)
        if [ $access = open ]; then
            mkdir -p $usrcfd/sys/$name
            rdpfile=$usrcfd/sys/$name/$name.rdp
            echo screen mode id:i:2 > $rdpfile
            echo desktopwidth:i:1024 >> $rdpfile
            echo desktopheight:i:768 >> $rdpfile
            echo session bpp:i:24 >> $rdpfile
            echo winposstr:s:0,1,32,68,800,572 >> $rdpfile
            echo full address:s:$addr >> $rdpfile
            echo compression:i:1 >> $rdpfile
            echo keyboardhook:i:2 >> $rdpfile
            echo audiomode:i:2 >> $rdpfile
            echo redirectdrives:i:0 >> $rdpfile
            echo redirectprinters:i:0 >> $rdpfile
            echo redirectcomports:i:0 >> $rdpfile
            echo redirectsmartcards:i:1 >> $rdpfile
            echo displayconnectionbar:i:1 >> $rdpfile
            echo autoreconnection enabled:i:1 >> $rdpfile
            echo authentication level:i:0 >> $rdpfile
            echo username:s:$user >> $rdpfile
            echo domain:s:$name >> $rdpfile
            echo alternate shell:s: >> $rdpfile
            echo shell working directory:s: >> $rdpfile
            echo disable wallpaper:i:1 >> $rdpfile
            echo disable full window drag:i:0 >> $rdpfile
            echo disable menu anims:i:0 >> $rdpfile
            echo disable themes:i:0 >> $rdpfile
            echo disable cursor setting:i:0 >> $rdpfile
            echo bitmapcachepersistenable:i:1 >> $rdpfile
            #if [ ! -z "$upwd" ]; then
            #    rdphash=`cryptrdp5 $upwd`
            #    echo password 51:b:$rdphash >> $rdpfile
            #fi
            chmod 600 $rdpfile

            /Applications/Remote\ Desktop\ Connection.app/Contents/MacOS/Remote\ Desktop\ Connection $rdpfile &
        fi
        ;;
        *)
    esac
}

# noneExecHandler() - Handles execute commands for host and guest systems
# without any known execute method.
noneExecHandler(){
    if [ $debug = 1 ]; then echo calling noneExecHandler with: $1 >> $logfile; fi
    case "$1" in
        state)
        echo open
        ;;
        runasuser|runasadmin|sendasuser|sendasadmin)
        echo no execute method defined for this host.
        ;;
        *)
    esac
}

# smbExecHandler() - Handles executing commands on a remote  host or guest
# system using the smb/cifs protocol and the winexe program.
smbExecHandler(){
    if [ $debug = 1 ]; then echo calling smbExecHandler with: $1 >> $logfile; fi
    port=445
    case "$1" in
        state)
        portState $addr $port
        ;;
        runasuser)
        if [ "$addr" = "127.0.0.1" ]; then
            echo "#!/bin/sh"                                         > /tmp/session.command.$name.sh
            echo "$command"                                         >> /tmp/session.command.$name.sh
            sh /tmp/session.command.$name.sh
            rm /tmp/session.command.$name.sh
        elif [ $execute = open ]; then
            echo "#!/bin/sh"                                         > /tmp/session.command.$name.sh
            echo "winexe -U HOME/$user%$upwd //$addr \"$command\""  >> /tmp/session.command.$name.sh
            sh /tmp/session.command.$name.sh
            rm /tmp/session.command.$name.sh
        fi
        ;;
        runasadmin)
        if [ "$addr" = "127.0.0.1" ]; then
            echo "elevation of local privileges using winexe not implemented yet"
        elif [ $execute = open ]; then
            echo "#!/bin/sh"                                         > /tmp/session.command.$name.sh
            echo "winexe -U HOME/$admin%$apwd //$addr \"$command\"" >> /tmp/session.command.$name.sh
            sh /tmp/session.command.$name.sh
            rm /tmp/session.command.$name.sh
        fi
        ;;
        sendasuser)
        if [ $execute = open ]; then
            share=`echo $target | sed "s|:|$|" | cut -d/ -f 1`
            source="$source"
            target="`echo $target | sed 's|/|\\\\\\\\|g' | cut -d: -f2`"
            smbcommand="mkdir \"$target\";cd \"$target\";lcd \"$source\";prompt off;recurse on;mput *;quit"
            smbclient "//$addr/$share" -U "$user%$upwd" -c "$smbcommand"
        fi
        ;;
        sendasadmin)
        if [ $execute = open ]; then
            share=`echo $target | sed "s|:|$|" | cut -d/ -f 1`
            source="$source"
            target="`echo $target | sed 's|/|\\\\\\\\|g' | cut -d: -f2`"
            smbcommand="mkdir \"$target\";cd \"$target\";lcd \"$source\";prompt off;recurse on;mput *;quit"
            smbclient "//$addr/$share" -U "$admin%$apwd" -c "$smbcommand"
        fi
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
        if [ "$addr" = "127.0.0.1" ]; then
            echo "#!/bin/sh"                                        > /tmp/session.command.$name.sh
            echo "$command"                                        >> /tmp/session.command.$name.sh            
            sh /tmp/session.command.$name.sh
            rm /tmp/session.command.$name.sh
        elif [ $execute = open ]; then
            echo "#!/bin/sh"                                        > /tmp/session.command.$name.sh
            echo "ssh $pkkopts $user@$addr '$command'"             >> /tmp/session.command.$name.sh
            sh /tmp/session.command.$name.sh
            rm /tmp/session.command.$name.sh
        fi
        ;;
        runasadmin)
        if [ $execute = open ]; then
            echo "#!/bin/sh"                                        > /tmp/session.command.$name.sh
            echo "ssh $pkkopts $admin@$addr '$command'"            >> /tmp/session.command.$name.sh
            sh /tmp/session.command.$name.sh
            rm /tmp/session.command.$name.sh
        fi
        ;;
        sendasuser)
        if [ $execute = open ]; then
            scp $pkkopts -r "$source" $user@$addr:"$target"
        fi
        ;;
        sendasadmin)
        if [ $execute = open ]; then
            scp $pkkopts -r "$source" $admin@$addr:"$target"
        fi
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
    fi
}

# Main case statement.
case "$1" in 
    addconf)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2
    mandatory="type"
    optional="name os acmt exmt user admin addr vrmt host"
    parseParameters $3

    if [ "$type" = "host" ]; then
        vrmt=none
        mandatory="type os acmt exmt user admin addr"
        optional="vrmt"
        parseParameters $@
        addConf "$type $name($os,$acmt,$exmt,$user,$admin,$addr,$vrmt)"
    elif [ "$type" = "guest" ]; then
        mandatory="type os acmt exmt user admin addr host"
        parseParameters $@
        addConf "$type $name($os,$acmt,$exmt,$user,$admin,$addr,$host)"
    elif [ "$type" = "group" ]; then
        mandatory="type members"
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
    mandatory="type"
    optional="name os acmt exmt user admin addr vrmt host"
    parseParameters $3

    # Check if the entry exists.
    check=`cat "$config" | grep " $oldname("`
    if [ -z "$check" ]; then
        echo "entry with name $oldname does not exist"
        exit 1
    fi

    # Read out the members of the entry.
    members=`echo $check | awk '{print $2}'`
    members=${members#*(} ; members=${members%%)*}
    members=`echo $members | sed -e "s|,| |g"`

    # Call parseHost/Guest/Group to check for validity of tokens.
    parse`capsFirst $type` $oldname

    if [ "$type" = "host" ]; then
        optional="name os acmt exmt user admin addr vrmt"
        parseParameters $@
        delConf $oldname
        addConf "$type $name($os,$acmt,$exmt,$user,$admin,$addr,$vrmt)"
        if [ ! "$name" = "$oldname " ]; then
            cat "$config" \
                | sed "s|,$oldname)|,$name)|g" \
                | sed "s|($oldname,|($name,|g" \
                | sed "s|,$oldname,|,$name,|g" \
                | sed "s|($oldname)|($name)|g" \
                > /tmp/session.conf.tmp
            mv /tmp/session.conf.tmp "$config"
        fi
    elif [ "$type" = "guest" ]; then
        optional="name os acmt exmt user admin addr host"
        parseParameters $@
        delConf $oldname
        addConf "$type $name($os,$acmt,$exmt,$user,$admin,$addr,$host)"
        if [ ! "$name" = "$oldname " ]; then
            cat "$config" \
                | sed "s|,$oldname)|,$name)|g" \
                | sed "s|($oldname,|($name,|g" \
                | sed "s|,$oldname,|,$name,|g" \
                | sed "s|($oldname)|($name)|g" \
                > /tmp/session.conf.tmp
            mv /tmp/session.conf.tmp "$config"
        fi
    elif [ "$type" = "group" ]; then
        optional="name members"
        parseParameters $@
        delConf $oldname
        addConf "$type $name($members)"
    else
        echo invalid type $type specified
    fi
    ;;
    delconf)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2

    delConf "$name" 
    ;;
    discover)
    # Check if further valid input was given, set range and norange.
    if [ -z "$2" ]; then $0; exit 1; else range=$2 norange=$2; fi

    # Lookup entry for given input if it is not an IP address.
    IFS=. ; set -- `echo "$2" | cut -d "/" -f 1`
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
        mapEntry $norange "checkSystem discoveryHelper"
    fi
    ;;
    check|state)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # map a function onto the set
    mapEntry $2 "checkSystem returnState"
    ;;
    start)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Lookup entry for given input
    mapEntry $2 "checkSystem startSystem returnState"
    ;;
    stop)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Lookup entry for given input
    mapEntry $2 "checkSystem stopSystem returnState"
    ;;
    reboot)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Lookup entry for given input
    mapEntry $2 "checkSystem rebootSystem returnState"
    ;;
    create)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2

    mandatory="numvcpu memsize dsksize os"
    optional="desc"
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
    mapEntry $name "checkSystem createSystem returnState"
    ;;
    destroy)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    name=$2

    # Lookup entry for given input
    mapEntry $name "checkSystem destroySystem returnState"
    ;;
    access)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Lookup entry for given input
    mapEntry $2 "checkSystem accessSystem"
    ;;
    command)
    # Check if further valid input was given.
    if [ -z "$2" -o -z "$3" ]; then $0; exit 1; fi

    # Construct command to pass on.
    command=`echo $@ | sed "s|command $2||g" | sed 's/^[ \t]*//'`

    # Lookup entry for given input
    mapEntry $2 "checkSystem runAsUser"
    ;;
    command-asadmin)
    # Check if further valid input was given.
    if [ -z "$2" -o -z "$3" ]; then $0; exit 1; fi

    # Construct command to pass on.
    command=`echo $@ | sed "s|command-asadmin $2||g" | sed 's/^[ \t]*//'`

    # Lookup entry for given input
    mapEntry $2 "checkSystem runAsAdmin"
    ;;
    send)
    source="$3"
    target="`echo $@ | sed "s|$1 $2 $3 ||g"`"
    # Lookup entry for given input
    mapEntry $2 "checkSystem sendAsUser"
    ;;
    send-asadmin)
    source="$3"
    target="`echo $@ | sed "s|$1 $2 $3 ||g"`"

    # Lookup entry for given input
    mapEntry $2 "checkSystem sendAsAdmin"
    ;;
    key)
    # Check if further valid input was given.
    if [ -z "$2" ]; then $0; exit 1; fi

    # Lookup entry for given input
    mapEntry $2 "checkSystem sshSendAdminKey sshSendUserKey"
    ;;
    list)
    case $2 in
        group|groups)
        grep '^group' "$config" | sed 's|^group ||g'
        ;;
        guest|guests)
        grep '^guest' "$config" | sed 's|^guest ||g'
        ;;
        host|hosts)
        grep  '^host' "$config" | sed 's|^host ||g'
        ;;
        all)
        cat "$config" | grep -v "^#" | sort -ru | sed '/^$/d'
        ;;
        os)
        for item in $known_osses; do
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
        vrmt)
        for item in $known_vrmts; do
            echo $item
        done
        ;;
        *)
        if [ "$2" ]; then
            cat "$config" | grep -v "^#" | grep "host $2("
            cat "$config" | grep -v "^#" | grep "guest $2("
            cat "$config" | grep -v "^#" | grep "group $2("
            exit 0                    
        else
            echo $"Usage: $0 list {group|guest|host|all|os|acmt|exmt|vrmt|<name>}" 
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
    echo "addconf   - adds a host, guest or group to session.conf."
    echo "modconf   - modifies an existing host, guest or group entry in session.conf."
    echo "delconf   - removes a host, guest or group from session.conf."
    echo "discover  - inspect an existing host, guest or group, or scan an ip subnet."
    echo "check     - a.k.a. state. checks the state of a host, guest  or group."
    echo "start     - attempts to start a host, guest or group."
    echo "stop      - attempts to stop a host, guest or group."
    echo "reboot    - attempts to reboot a host, guest or group."
    echo "create    - attempts to create a host, guest or group."
    echo "destroy   - attempts to destroy a host, guest or group."
    echo "access    - access a host, guest or group using various methods."
    echo "command   - send a command to the host, guest or group."
    echo "send      - send a directory to the host, guest or group."
    echo "key       - send public key to remote admin and user."
    echo "list      - list hosts, guests, groups, supported os, acmt, exmt or vrmt's"
    echo "version   - show session version."
    echo ""
    echo "Arguments for addconf, modconf and delconf:"
    echo "--type    - the type of the added entry (host, guest or group)."
    echo "--os      - the operating system for the host or guest system"
    echo "--acmt    - the access method to be used."
    echo "--exmt    - the execute method to be used."
    echo "--user    - the regular user account for the host or guest."
    echo "--admin   - the administrative account for the host or guest."
    echo "--vrmt    - (optional, hosts only) the virtualization method supported."
    echo "--host    - (guests only) the parent host system."
    echo "--members - (groups only) a comma-separated list of hosts and/or guests."
    echo ""
    echo "Arguments for create and destroy:"
    echo "--desc    - (optional) annotation (--desc=\"My description.\")."
    echo "--numvcpu - the virtual CPU count for guest system (--numvcpu=2)."
    echo "--memsize - the virtual memory size in MB for guest system (--memsize=512)."
    echo "--dsksize - the disk size in GB for guest system (--dsksize=4)."
    echo "--os      - the operating system for guest system (--os=centos-64)."
    echo ""
    echo "Special arguments:"
    echo "all       - (list and check only) show or state all."
    echo "host      - (list) show all hosts."
    echo "guest     - (list) show all guests."
    echo "group     - (list) show all groups."
    echo "acmt      - (list) show all supported access methods."
    echo "exmt      - (list) show all supported execute methods."
    echo "vrmt      - (list) show all supported virtualization methods."
    echo "os        - (list) show all supported operating environments."
    echo ""
    exit 1
esac
