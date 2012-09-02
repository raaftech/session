#!/bin/bash

# Copyright © 2008-2012 RAAF Technology bv
#
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


# Determine where $SESSION_HOME is.
if [ ! "$SESSION_HOME" ]; then
    ABS="$PWD"
    ORIG_IFS="$IFS"
    IFS="/"
    for DIR in $0; do
        if [ -n "$DIR" ]; then
            if [ "$DIR" = ".." ]; then
                ABS="${ABS%/*}"
            elif [ "$DIR" != "." ]; then
                ABS="$ABS/$DIR"
            fi
        fi
    done
    unset DIR
    IFS="$ORIG_IFS"
    OFFSET="/"
    if [ -e "$(dirname "$ABS")$OFFSET" ]; then
        # Found, probably called relatively.
        cd "$(dirname "$ABS")$OFFSET"
        SESSION_HOME="$(pwd)"
        unset ABS
    elif [ -e "$(dirname "$0")$OFFSET" ]; then
        # Found, probably called absolutely.
        cd "$(dirname "$0")$OFFSET"
        SESSION_HOME="$(pwd)"
    fi
fi

# Initialize globals.
source "$SESSION_HOME/globals.sh"

# Set default permission mask and make sure directories exist.
umask 077
mkdir -p  "$usrcfd" "$usrcfd/cfg" "$usrcfd/log" "$usrcfd/sys" "$usrcfd/tmp" "$usrcfd/tpl"
chmod 700 "$usrcfd" "$usrcfd/cfg" "$usrcfd/log" "$usrcfd/sys" "$usrcfd/tmp" "$usrcfd/tpl"

# Write settings to options.conf if it does not exist yet.
if [ ! -e "$usropt" -a ! -e "$sysopt" ]; then
    printf %s "\
        terminal='$terminal'
        desktop='$desktop'
        browser='$browser'
        smbtell='$smbtell'
        sshtell='$sshtell'
        smbsend='$smbsend'
        sshsend='$sshsend'
        execute='$execute'
        access='$access'
        create='$create'
        destroy='$destroy'
        send='$send'
        resilient='$resilient'
        timeout='$timeout'
        titling='$titling'
        color='$color'
        agent='$agent'
        privy='$privy'
        debug='$debug'
    " | sed 's/^[[:space:]]*//' > "$usropt"
elif [ ! -e "$usropt" -a -e "$sysopt" ]; then
    cp "$sysopt" "$usropt"
fi

# Source global options.conf, if existing.
if [ -e "$sysopt" ]; then
    . "$sysopt"
fi

# Source local options.conf, if existing (which may override global options).
if [ -e "$usropt" ]; then
    . "$usropt"
fi

# Create backslashed user variable.
if [ "$user" ]; then
    # $user was set directly, probably in options.conf.
    userDblBacksl="${user//\\/\\\\}"
elif [ "$USER" ]; then
    # $USER was set in the environment.
    userDblBacksl="${USER//\\/\\\\}"
elif [ "$USERNAME" ]; then
    # $USERNAME was set in the environment.
    userDblBacksl="${USERNAME//\\/\\\\}"
else
    # If all else fails you get this.
    userDblBacksl="unknown"
fi

# Construct current config from global and local session.conf.
if [ -e "$syscff" ]; then
    if [ -e "$usrcff" ]; then
        sed "s|\$user|$userDblBacksl|g" "$syscff" "$usrcff" > "$config"
    else
        :> "$usrcff"
        sed "s|\$user|$userDblBacksl|g" "$syscff" > "$config"
    fi
else
    if [ -e "$usrcff" ]; then
        sed "s|\$user|$userDblBacksl|g" "$usrcff" > "$config"
    else
        :> "$usrcff"
        :> "$config"
    fi
fi

# Initialize functions.
source "$SESSION_HOME/functions.sh"

# Initialize bash quoted regexp behaviour.
if [ "$(echo "$SHELL" | grep -i "bash")" ]; then
    handleQuotedRegExpBehaviour
fi

# Read in or create tools.required and tools.found.
if [ -e "$usrcfd/cfg/tools.required" -a -e "$usrcfd/cfg/tools.found" ]; then
    . "$usrcfd/cfg/tools.required"
    . "$usrcfd/cfg/tools.found"
elif [ "$1" != "reinit" ]; then
    reportInfo "Detecting which executables are available"
    toolFinder
    . "$usrcfd/cfg/tools.required"
    . "$usrcfd/cfg/tools.found"
fi

# Check if at least mandatory tools are available.
if [ "$tools_session" != "$tools_session_found" -a "$1" != "reinit" ]; then
    reportError "One of the mandatory executables required by session was not found"
    exit 1
fi

# Enable (*) or disable (0) execute functions.
if [ "$tools_execute" = "$tools_execute_found" -a "$execute" != 0 ]; then execute="true" ; else execute="false" ; fi

# Enable (*) or disable (0) access functions.
if [ "$tools_access" = "$tools_access_found" -a "$access" != 0 ]; then access="true" ; else access="false" ; fi

# Enable (*) or disable (0) send functions.
if [ "$tools_send" = "$tools_send_found" -a "$send" != 0 ]; then send="true" ; else send="false" ; fi

# Enable (*) or disable (0) create functions.
if [ "$create" != 0 ]; then create="true" ; else create="false" ; fi

# Enable (1) or disable (*) destroy functions.
if [ "$destroy" != 1 ]; then destroy="false" ; elif [ "$destroy" = 1 ]; then destroy="true" ; fi

# Enable (*) or disable (0) resilient (extremely high latency networks) mode.
if [ "$resilient" != 0 ]; then resilient="true" ; else unset resilient ; fi

# Enable (*) or disable (0) title setting for various access functions. 
if [ "$titling" != 0 ]; then titling="true" ; else unset titling ; fi

# Enable (*) or disable (0) color state output.
if [ "$color" != 0 ]; then color="true" ; else unset color ; fi

# Enable (*) or disable (0) ssh agent (ssh-agent).
if [ "$agent" != 0 ]; then agent="true" ; else unset agent ; fi

# Enable (*) or disable (0) privilege escalation for various routines.
# This enables the (optional) use of sudo or runas when running commands
# like nmap on unix-likes or when running tell --admin on localhost.
if [ "$privy" != 0 ]; then privy="$privesc" ; else unset privy ; fi

# Enable (*) or disable (0) debug logging.
# This makes all functions within session write about how they are
# called including arguments and some environment variables.
# Notice that we check for "--debug" on cmdline too. This is cheaper
# than calling parseParameters at this level. 
if [ "$debug" != 0  ]; then debug="true" ; elif [[ "$*" =~ "--debug" ]]; then debug="true" ; else unset debug; fi

# Detect and initialize private key usage.
handleSshPrivateKeys


# Main case statement.
main="$1"
case "$main" in
  addconf)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    type="none"
    name="$2"
    osmt="none"
    acmt="none"
    exmt="none"
    user="none"
    admin="none"
    addr="none"
    vrmt="none"
    port="none"
    host="none"
    svmt="none"

    optionals_all="name osmt acmt exmt user admin addr"
    optionals_hosts="vrmt vmhome vmdata"
    optionals_guests="host"
    optionals_services="svmt port svstatus svstart svstop"
    optionals_groups="members mode"

    shift 2
    mandatories="type" optionals="debug $optionals_all $optionals_hosts $optionals_guests $optionals_services $optionals_groups" silence="true" parseParameters "$@"

    if [ "$type" = "host" -a "$vrmt" = "none" ]; then
        mandatories="type osmt acmt exmt user admin addr" optionals="debug vrmt" parseParameters "$@"
        tokenValidator "type,name,osmt,acmt,exmt,user,admin,addr,vrmt" || exit 1
        addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$vrmt)" || exit 1

    elif [ "$type" = "host" -a "$vrmt" != "none" ]; then
        mandatories="type osmt acmt exmt user admin addr vrmt vmhome vmdata" optionals="debug" parseParameters "$@"
        tokenValidator "type,name,osmt,acmt,exmt,user,admin,addr,vrmt" || exit 1
        addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$vrmt)" || exit 1

        opts="$usrcfd/sys/$name/options.conf"
        mkdir -p "$usrcfd/sys/$name"
        printf "vmhome='$vmhome'\n"  > "$opts"
        printf "vmdata='$vmdata'\n" >> "$opts"

    elif [ "$type" = "guest" ]; then
        mandatories="type osmt acmt exmt user admin addr host" optionals="debug" parseParameters "$@"
        tokenValidator "type,name,osmt,acmt,exmt,user,admin,addr,host" || exit 1
        addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$host)" || exit 1

    elif [ "$type" = "service" -a "$svmt" = "none" ]; then
        mandatories="type svmt addr port host" optionals="debug acmt exmt user" parseParameters "$@"
        tokenValidator "type,name,svmt,acmt,exmt,user,addr,port,host" || exit 1
        addConf "$type $name($svmt,$acmt,$exmt,$user,$addr,$port,$host)" || exit 1

    elif [ "$type" = "service" -a "$svmt" != "none" ]; then
        mandatories="type svmt host svstatus svstart svstop" optionals="debug acmt exmt user addr port" parseParameters "$@"
        tokenValidator "type,name,svmt,acmt,exmt,user,addr,port,host" || exit 1
        addConf "$type $name($svmt,$acmt,$exmt,$user,$addr,$port,$host)" || exit 1

        opts="$usrcfd/sys/$name/options.conf"
        mkdir -p "$usrcfd/sys/$name"
        printf "svstatus='$svstatus'\n" > "$opts"
        printf "svstart='$svstart'\n"  >> "$opts"
        printf "svstop='$svstop'\n"    >> "$opts"

    elif [ "$type" = "group" ]; then
        mandatories="type members" optionals="debug mode" parseParameters "$@"

        # Write out mode if it was given on the commandline and not default, always when opts exist.
        opts="$usrcfd/sys/$name/options.conf"
        if [ "$mode" != "$defaultmode" -o -e "$opts" ]; then
            mkdir -p "$usrcfd/sys/$name"
            printf "mode='$mode'\n" > "$opts"
        fi

        # Make sure no double entities are in members.
        ORIG_IFS="$IFS"
        IFS=","
        for member in $members ; do
            if ! printf "$had\n" | grep -q "$member"; then
                uniquemembers="$uniquemembers,$member"
            fi
            had="$member,$had"
        done
        IFS="$ORIG_IFS"
        members="$(printf "$uniquemembers\n" | sed '/^$/d' | sed -e 's|,$||' -e 's|^,||')"

        tokenValidator "type,name,members,mode" || exit 1
        addConf "$type $name($members)" || exit 1
    else
        reportError "Invalid type $type specified"
        exit 1
    fi
    exit $?
    ;;
  modconf)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    type="none"
    name="$2"
    osmt="none"
    acmt="none"
    exmt="none"
    user="none"
    admin="none"
    addr="none"
    vrmt="none"
    port="none"
    host="none"
    svmt="none"
    oldname="$name"

    optionals_all="name osmt acmt exmt user admin addr"
    optionals_hosts="vrmt vmhome vmdata"
    optionals_guests="host"
    optionals_services="svmt port svstatus svstart svstop"
    optionals_groups="members mode"

    shift 2
    mandatories="type" optionals="debug $optionals_all $optionals_hosts $optionals_guests $optionals_services $optionals_groups" silence="true" parseParameters "$@"

    # Initialize newentry, read oldentry, set entry to oldentry to speed up tokenReader.
    entry="$(entryReader "$oldname" "$usrcff")"
    oldentry="$entry"
    newentry=""

    if [ ! "$oldentry" ]; then
        reportError "Entry $oldname does not exist in $usrcff"
        exit 1
    fi

    # Set oldtype so changing type works.
    oldtype="$(tokenReader printVals "$oldname" type)"
    reportDebug "Got old type: $oldtype"

    # Call parse* to check for validity of tokens.
    reportDebug "Setting tokens according to old entry"
    if [ "$oldtype" = "host" ]; then
        tokenReader setVars "$oldname" "osmt,acmt,exmt,user,admin,addr,vrmt"
    elif [ "$oldtype" = "guest" ]; then
        tokenReader setVars "$oldname" "osmt,acmt,exmt,user,admin,addr,host"
    elif [ "$oldtype" = "service" ]; then
        tokenReader setVars "$oldname" "svmt,acmt,exmt,user,addr,port,host"
    elif [ "$oldtype" = "group" ]; then
        tokenReader setVars "$oldname" "members"
    else
        reportError "Unknown type $oldtype in entry $oldentry"
        exit 1
    fi

    # FIXME: Find a way to avoid running this twice.
    mandatories="type" optionals="debug $optionals_all $optionals_hosts $optionals_guests $optionals_services $optionals_groups" silence="true" parseParameters "$@"

    # If we're a host and vrmt was passed and not none, check for extra options.
    if [ "$type" = "host" ]; then
        # Set oldvrmt so changing vrmt works.
        oldvrmt="$(tokenReader printVals "$oldname" vrmt)"
        reportDebug "Got old vrmt: $oldvrmt"
        if [ ! "$vrmt" ]; then vrmt="$oldvrmt" ; fi

        if [ "$vrmt" != "none" ]; then
            opts="$usrcfd/sys/$name/options.conf"
            oldopts="$usrcfd/sys/$oldname/options.conf"
            # Check for old options first if name changed, source if available
            if [ "$name" != "$oldname" -a -e "$oldopts" ]; then
                reportDebug "Found old option file: $oldopts"
                for option in vmhome vmdata; do
                    if [ ! "$(cat "$oldopts" | grep -v "^#" | grep "$option=")" ]; then
                        reportDebug "Option $option not currently set, making mandatory"
                        mandatory_extras="$option $mandatory_extras"
                    else
                        reportDebug "Option $option is already set, making optional"
                        optional_extras="$option $optional_extras"
                    fi
                done
                . "$oldopts"
            # Name did not change, check for options, source if available
            elif [ -e "$opts" ]; then
                reportDebug "Found option file: $opts"
                for option in vmhome vmdata; do
                    if [ ! "$(cat "$opts" | grep -v "^#" | grep "$option=")" ]; then
                        reportDebug "Option $option not currently set, making mandatory"
                        mandatory_extras="$option $mandatory_extras"
                    else
                        reportDebug "Option $option is already set, making optional"
                        optional_extras="$option $optional_extras"
                    fi
                done
                . "$opts"
            else
                reportDebug "No option file found"
                mkdir -p "$usrcfd/sys/$name"
                mandatory_extras="vmhome vmdata"
            fi
        fi
    fi

    # If we're a service and svmt was passed and not none, check for extra options.
    if [ "$type" = "service" ]; then
        # Set oldsvmt so changing svmt works.
        oldsvmt="$(tokenReader printVals "$oldname" svmt)"
        reportDebug "Got old svmt: $oldsvmt"
        if [ ! "$svmt" ]; then svmt="$oldsvmt" ; fi

        if [ "$svmt" != "none" ]; then
            opts="$usrcfd/sys/$name/options.conf"
            oldopts="$usrcfd/sys/$oldname/options.conf"
            # Check for old options first if name changed, source if available
            if [ "$name" != "$oldname" -a -e "$oldopts" ]; then
                reportDebug "Found old option file: $oldopts"
                for option in svstatus svstart svstop; do
                    if [ ! "$(cat "$oldopts" | grep -v "^#" | grep "$option=")" ]; then
                        reportDebug "Option $option not currently set, making mandatory"
                        mandatory_extras="$option $mandatory_extras"
                    else
                        reportDebug "Option $option is already set, making optional"
                        optional_extras="$option $optional_extras"
                    fi
                done
                . "$oldopts"
            # Name did not change, check for options, source if available
            elif [ -e "$opts" ]; then
                reportDebug "Found option file: $opts"
                for option in svstatus svstart svstop; do
                    if [ ! "$(cat "$opts" | grep -v "^#" | grep "$option=")" ]; then
                        reportDebug "Option $option not currently set, making mandatory"
                        mandatory_extras="$option $mandatory_extras"
                    else
                        reportDebug "Option $option is already set, making optional"
                        optional_extras="$option $optional_extras"
                    fi
                done
                . "$opts"
            else
                reportDebug "No option file found"
                mkdir -p "$usrcfd/sys/$name"
                mandatory_extras="svstatus svstart svstop"
            fi
        fi
    fi

    # If we're a group, check for extra options.
    if [ "$type" = "group" ]; then
        opts="$usrcfd/sys/$name/options.conf"
        oldopts="$usrcfd/sys/$oldname/options.conf"

        # Check for old options first if name changed, source if available
        if [ "$name" != "$oldname" -a -e "$oldopts" ]; then
            reportDebug "Found old option file: $oldopts"
            for option in mode; do
                if [ ! "$(cat "$oldopts" | grep -v "^#" | grep "$option=")" ]; then
                    reportDebug "Option $option not currently set, making optional"
                    optional_extras="$option $optional_extras"
                else
                    reportDebug "Option $option is already set, making optional"
                    optional_extras="$option $optional_extras"
                fi
            done
            . "$oldopts"
        # Name did not change, check for options, source if available
        elif [ -e "$opts" ]; then
            reportDebug "Found option file: $opts"
            for option in mode; do
                if [ ! "$(cat "$opts" | grep -v "^#" | grep "$option=")" ]; then
                    reportDebug "Option $option not currently set, making optional"
                    optional_extras="$option $optional_extras"
                else
                    reportDebug "Option $option is already set, making optional"
                    optional_extras="$option $optional_extras"
                fi
            done
            . "$opts"
        else
            reportDebug "No option file found"
            mkdir -p "$usrcfd/sys/$name"
            optional_extras="mode"
        fi
    fi

    # If name was changed, make sure all references to this entity are updated also.
    if [ ! "$name" = "$oldname" ]; then
        reportDebug "Name changed from $oldname to $name, updating all references"
        cat "$usrcff" \
            | sed "s|,$oldname)|,$name)|g" \
            | sed "s|($oldname,|($name,|g" \
            | sed "s|,$oldname,|,$name,|g" \
            | sed "s|($oldname)|($name)|g" \
            > "$usrcfd/tmp/session.conf.tmp"
        mv "$usrcfd/tmp/session.conf.tmp" "$usrcff"
        if [ -e "$usrcfd/sys/$oldname" ]; then
            reportInfo "Moving entry specific settings in $usrcfd/sys from $oldname to $name"
            rm -f "$usrcfd/sys/$name/options.conf" "$usrcfd/sys/$name/user.pwd" "$usrcfd/sys/$name/admin.pwd" 2> /dev/null
            rmdir "$usrcfd/sys/$name" 2> /dev/null
            mv "$usrcfd/sys/$oldname" "$usrcfd/sys/$name"
        fi
    fi

    # Handle a HOST modification.
    if [ "$type" = "host" ]; then
        reportDebug "Target type: $type"
        if [ "$oldtype" = "guest" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type vrmt $mandatory_extras" optionals="debug name osmt acmt exmt user admin addr $optional_extras" parseParameters "$@"
        elif [ "$oldtype" = "service" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type osmt vrmt admin $mandatory_extras" optionals="debug name acmt exmt user addr $optional_extras" parseParameters "$@"
        elif [ "$oldtype" = "group" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type osmt acmt exmt user admin addr vrmt $mandatory_extras" optionals="debug name $optional_extras" parseParameters "$@"
        else
            reportDebug "Setting default mandatories and optionals for $type"
            mandatories="type $mandatory_extras" optionals="debug name osmt acmt exmt user admin addr vrmt $optional_extras" parseParameters "$@"
        fi

        # Write out vmhome and vmdata when vrmt is not none.
        if [ ! "$vrmt" = "none" ]; then
            reportInfo "Setting vmhome and vmdata"
            printf "vmhome='$vmhome'\n"  > "$opts"
            printf "vmdata='$vmdata'\n" >> "$opts"
        fi

        # Rewrite newentry with changes from above.
        newentry="$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$vrmt)"
        reportDebug "Old entry is: $oldentry"
        reportDebug "New entry is: $newentry"
        tokenValidator "type,name,osmt,acmt,exmt,user,admin,addr,vrmt" || exit 1

        # If validation succeeded and newentry is not equal to oldentry, add the entry.
        if [ "$?" != 0 ]; then
            reportError "Entry validation failed, not writing new entry"
            exit 1
        elif [ "$newentry" = "$oldentry" ]; then
            reportInfo "No changes in entry, not writing new entry"
            exit 0
        else
            delConf "$oldname"
            addConf "$newentry"
        fi

    # Handle a GUEST modification.
    elif [ "$type" = "guest" ]; then
        reportDebug "Target type: $type"
        if [ "$oldtype" = "host" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type host" optionals="debug name osmt acmt exmt user admin addr" parseParameters "$@"
        elif [ "$oldtype" = "group" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type osmt acmt exmt user admin addr host" optionals="debug name" parseParameters "$@"
        elif [ "$oldtype" = "service" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type osmt admin host" optionals="debug name acmt exmt user addr" parseParameters "$@"
        else
            reportDebug "Setting default mandatories and optionals for $type"
            mandatories="type" optionals="debug name osmt acmt exmt user admin addr host" parseParameters "$@"
        fi

        # Rewrite newentry with changes from above.
        newentry="$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,$host)"
        reportDebug "Old entry is: $oldentry"
        reportDebug "New entry is: $newentry"
        tokenValidator "type,name,osmt,acmt,exmt,user,admin,addr,host" || exit 1

        # If validation succeeded and newentry is not equal to oldentry, add the entry.
        if [ "$?" != 0 ]; then
            reportError "Entry validation failed, not writing new entry"
            exit 1
        elif [ "$newentry" = "$oldentry" ]; then
            reportInfo "No changes in entry, not writing new entry"
            exit 0
        else
            delConf "$oldname"
            addConf "$newentry"
        fi

    # Handle a SERVICE modification.
    elif [ "$type" = "service" ]; then
        reportDebug "Target type: $type"
        if [ "$oldtype" = "host" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type svmt port host $mandatory_extras" optionals="debug name acmt exmt user addr $optional_extras" parseParameters "$@"
        elif [ "$oldtype" = "guest" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type svmt port $mandatory_extras" optionals="debug name acmt exmt user addr host $optional_extras" parseParameters "$@"
        elif [ "$oldtype" = "group" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type svmt acmt exmt user addr port host $mandatory_extras" optionals="debug name $optional_extras" parseParameters "$@"
        else
            reportDebug "Setting default mandatories and optionals for $type"
            mandatories="type $mandatory_extras" optionals="debug name svmt acmt exmt user addr port host $optional_extras" parseParameters "$@"
        fi

        # Write out svstatus, svstart and svstop when svmt is not none.
        if [ ! "$svmt" = "none" ]; then
            reportInfo "Setting svstatus, svstart and svstop"
            printf "svstatus='$svstatus'\n" > "$opts"
            printf "svstart='$svstart'\n"  >> "$opts"
            printf "svstop='$svstop'\n"    >> "$opts"
        fi

        # Rewrite newentry with changes from above.
        newentry="$type $name($svmt,$acmt,$exmt,$user,$addr,$port,$host)"
        reportDebug "Old entry is: $oldentry"
        reportDebug "New entry is: $newentry"
        tokenValidator "type,name,svmt,acmt,exmt,user,addr,port,host" || exit 1

        # If validation succeeded and newentry is not equal to oldentry, add the entry.
        if [ "$?" != 0 ]; then
            reportError "Entry validation failed, not writing new entry"
            exit 1
        elif [ "$newentry" = "$oldentry" ]; then
            reportInfo "No changes in entry, not writing new entry"
            exit 0
        else
            delConf "$oldname"
            addConf "$newentry"
        fi

    # Handle a GROUP modification.
    elif [ "$type" = "group" ]; then
        reportDebug "Target type: $type"
        if [ "$oldtype" != "group" ]; then
            reportDebug "Rewriting mandatories and optionals to reflect a $type since old type was $oldtype"
            mandatories="type members" optionals="debug name mode" parseParameters "$@"
        else
            reportDebug "Setting default mandatories and optionals for $type"
            mandatories="type" optionals="debug name members mode" parseParameters "$@"
        fi

        # Write out mode if it was given on the commandline and not default, always when opts exist.
        opts="$usrcfd/sys/$name/options.conf"
        if [ "$mode" != "$defaultmode" -o -e "$opts" ]; then
            reportInfo "Setting mode"
            mkdir -p "$usrcfd/sys/$name"
            printf "mode='$mode'\n" > "$opts"
        fi

        # Make sure no double entities are in members.
        ORIG_IFS="$IFS"
        IFS=","
        for member in $members ; do
            if ! printf "$had\n" | grep -q "$member"; then
                uniquemembers="$uniquemembers,$member"
            fi
            had="$member,$had"
        done
        IFS="$ORIG_IFS"
        members="$(printf "$uniquemembers\n" | sed '/^$/d' | sed -e 's|,$||' -e 's|^,||')"

        # Rewrite newentry with changes from above.
        newentry="$type $name($members)"
        reportDebug "Old entry is: $oldentry"
        reportDebug "New entry is: $newentry"
        tokenValidator "type,name,members,mode" || exit 1

        # If validation succeeded and newentry is not equal to oldentry, add the entry.
        if [ "$?" != 0 ]; then
            reportError "Entry validation failed, not writing new entry"
            exit 1
        elif [ "$newentry" = "$oldentry" ]; then
            reportInfo "No changes in entry, not writing new entry"
            exit 0
        else
            delConf "$oldname"
            addConf "$newentry"
        fi
    else
        reportError "Invalid type $type specified"
        exit 1
    fi
    exit $?
    ;;
  delconf)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug" silence="true" parseParameters "$@"

    delConf "$name"
    if [ -e "$usrcfd/sys/$name" ]; then
            reportInfo "Removing entry specific settings in $usrcfd/sys"
            rm -f "$usrcfd/sys/$name/options.conf" "$usrcfd/sys/$name/user.pwd" "$usrcfd/sys/$name/admin.pwd" 2> /dev/null
            rmdir "$usrcfd/sys/$name" 2> /dev/null
        fi
    exit $?
    ;;
  discover)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    input="$2"

    shift 2
    optionals="debug" silence="true" parseParameters "$@"

    discoveryHelper "$input"
    exit $?
    ;;
  check|state|status)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    # Tell about resilient mode if enabled.
    if [ "$resilient" ]; then
        reportInfo "Warning: Running in resilient mode, state checks will be slow"
    fi

    shift 2
    optionals="debug mode" silence="true" parseParameters "$@"

    mapEntryPoint "$name" "checkState,printState"
    exit $?
    ;;
  detail)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug nostate nocheck nostatus" silence="true" parseParameters "$@"

    parseEntry "$name" || exit 1
    if [ "$type" -a "$type" != "group" ]; then
        if [ "$nostate" -o "$nocheck" -o "$nostatus" ]; then
            reportDebug "Not checking current state for $name"
        else
            checkState
        fi
    fi
    printState "$name" long
    exit $?
    ;;
  start)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug mode" silence="true" parseParameters "$@"

    mapEntryPoint "$name" "checkState,startEntity,printState"
    exit $?
    ;;
  stop)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug mode" silence="true" parseParameters "$@"

    mapEntryPoint "$name" "checkState,stopEntity,printState"
    exit $?
    ;;
  restart|reboot)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug mode" silence="true" parseParameters "$@"

    mapEntryPoint "$name" "checkState,restartEntity,printState"
    exit $?
    ;;
  create)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    mandatories="numvcpu memsize dsksize guestos" optionals="debug desc" parseParameters "$@"

    if [ "$numvcpu" -lt 1 ]; then
        reportError "Not enough cpus specified: $numvcpu"
        exit 1
    elif [ "$numvcpu" -gt 4 ]; then
        reportError "Too many cpus specified: $numvcpu"
        exit 1
    fi

    if [ "$memsize" -lt 32 ]; then
        reportError "Less than 32 megabytes specified: $memsize"
        exit 1
    elif [ "$memsize" -gt 16384 ]; then
        reportError "More than 16384 megabytes specified: $memsize"
        exit 1
    fi

    if [ "$dsksize" -lt 1 ]; then
        reportError "Less than 1 gigabytes specified: $dsksize"
        exit 1
    elif [ "$dsksize" -gt 1024 ]; then
        reportError "More than 1 terabyte specified: $dsksize"
        exit 1
    fi

    mapEntryPoint "$name" "checkState,createEntity,printState"
    exit $?
    ;;
  destroy)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug" silence="true" parseParameters "$@"

    mapEntryPoint "$name" "checkState,destroyEntity,printState"
    exit $?
    ;;
  access)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug user admin service mode" silence="true" parseParameters "$@"

    if [ "$admin" ]; then
        xsastype="admin"
    elif [ "$service" ]; then
        xsastype="service"
    else
        xsastype="user"
    fi

    mapEntryPoint "$name" "checkState,accessEntity"
    exit $?
    ;;
  tell)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    mandatories="command" optionals="debug user admin service mode" silence="true" parseParameters "$@"

    if [ "$admin" ]; then
        runastype="admin"
    elif [ "$service" ]; then
        runastype="service"
    else
        runastype="user"
    fi

    mapEntryPoint "$name" "checkState,runAs"
    exit $?
    ;;
  send)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    mandatories="source target" optionals="debug user admin service mode" silence="true" parseParameters "$@"

    if [ "$admin" ]; then
        sendastype="admin"
    elif [ "$service" ]; then
        sendastype="service"
    else
        sendastype="user"
    fi

    mapEntryPoint "$name" "checkState,sendAs"
    exit $?
    ;;
  key)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug" silence="true" parseParameters "$@"

    mapEntryPoint "$name" "checkState,credAs"
    exit $?
    ;;
  reinit)
    reportInfo "Removing tools.required and tools.found. Rerun session to redetect"
    rm -f "$usrcfd/cfg/tools.required" "$usrcfd/cfg/tools.found"
    exit $?
    ;;
  list)
    [ "$2" ] || { printUsageText ; exit 1 ; }
    name="$2"

    shift 2
    optionals="debug default verbose" silence="true" parseParameters "$@"

    listHelper "$name"
    exit $?
    ;;
  version)
    printVersion
    exit $?
    ;;
  help|--help)
    printUsageText
    exit $?
    ;;
  *)
    printUsageText
    exit 1
    ;;
esac
