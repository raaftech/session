#!/bin/bash

# Version 0.9.1, released 11-01-2012.
#
# Copyright © 2010, 2011, 2012 Rubin Simons
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


# Function declarations have the following form:
#
# # foo(<parm1> [<parm2>])                      # Required and optional parameters
# # Glibs the flub                              # (Side-)effects, e.g., "Sets variable flurb"
# #
# # Do a foo                                    # Description of foo's behavior
# #
# foo() {
#     reportDebugFuncEntry "$*" "<var1> <var2>" # Names of environment variables read, separated by spaces
# }
#

# Terminal escape sequences to set text colors
# Use "echo" with the "-e" option to ensure that escape sequences get interpreted.
color_red="\x1b[31m"      #color_red="$(tput setaf 1)"
color_green="\x1b[32m"    #color_green="$(tput setaf 2)"
color_yellow="\x1b[33m"   #color_yellow="$(tput setaf 3)"
color_blue="\x1b[34m"     #color_blue="$(tput setaf 4)"
color_end="\x1b[0m"       #color_end="$(tput sgr0)"

# Space-separated lists of keywords for known modes, os, virtualization, credential, service, execute and access methods.
# The keywords must of course not contain spaces.
known_types="host guest service group"
known_modes="serial parallel stateful"
known_osmts="embedded-like unix-like windows-like aix5 aix6 aix7 arch2kx debian4 debian5 debian6 dfbsd2 esx4 esxi4 esxi5 fbsd7 fbsd8 fedora12 fedora13 fedora14 fedora15 fedora16 hpux1123 hpux1131 macosx3 macosx4 macosx5 macosx6 macosx7 nbsd4 nbsd5 obsd4 obsd5 osuse11 rhel4 rhel5 rhel6 sles9 sles10 sles11 sol10 sol11 ubuntu8 ubuntu10 ubuntu11 win2k3 win2k8 win7 win8 winxp"
known_vrmts="none hpvm kvm xen vbox vmw vmf pvm esx"
known_crmts="none ssh win"
known_svmts="none scripted"
known_exmts="none ssh smb"
known_acmts="none ssh tel rdp http"

# Locations of configuration files and default permissions
syscfd="/etc/session"
syscff="$syscfd/cfg/session.conf"
usrcfd="$HOME/.session"
usrcff="$usrcfd/cfg/session.conf"

# Set default permission mask and make sure directories exist.
umask 077
mkdir -p  "$usrcfd" "$usrcfd/cfg" "$usrcfd/log" "$usrcfd/sys" "$usrcfd/tmp" "$usrcfd/tpl"
chmod 700 "$usrcfd" "$usrcfd/cfg" "$usrcfd/log" "$usrcfd/sys" "$usrcfd/tmp" "$usrcfd/tpl"

# Default session execution mode
# Don't change this here, use --mode.
defaultmode="serial"
mode="$defaultmode"

# Local hostname, short form, lowercase
hostname="$(hostname 2>/dev/null)"
hostname="${hostname%%.*}"
hostname="$(echo "$hostname" | tr A-Z a-z)"
[ "$hostname" ] || { reportError "Could not determine host name" ; exit 1 ; }

# Platform detection
uname="$(uname | tr A-Z a-z)"
if [[ "$uname" =~ "linux" ]]; then
    platform="linux"
elif [[ "$uname" =~ "darwin" ]]; then
    platform="macosx"
elif [[ "$uname" =~ "mingw" ]]; then
    platform="windows"
elif [[ "$uname" =~ "cygwin" ]]; then
    platform="windows"
else
    platform="unknown"
fi

# assertPlatformIsWindows()
#
# Exit with bug message if platform is not Windows.
#
assertPlatformIsWindows() {
    [ "$platform" = "windows" ] || { reportBug "Windows-only function called on non-Windows platform" ; exit 1 ; }
}

# Platform specific options.conf default settings
if [ "$platform" = "linux" ]; then
    terminal="gnome"
    desktop="rdesktop"
    browser="gnome"
    smbtell="winexe"
    sshtell="ssh"
    smbsend="smbclient"
    sshsend="scp"
    privesc="sudo -u root"
elif [ "$platform" = "macosx" ]; then
    terminal="apple"
    desktop="amsrdc"
    browser="macos"
    smbtell="winexe"
    sshtell="ssh"
    smbsend="smbclient"
    sshsend="scp"
    privesc="sudo -u root"
elif [ "$platform" = "windows" ]; then
    terminal="putty"
    desktop="mstsc"
    browser="windows"
    smbtell="psexec"
    sshtell="plink"
    smbsend="robocopy"
    sshsend="pscp"
    privesc="runas /user:administrator"
else
    terminal="none"
    desktop="none"
    browser="none"
    smbtell="none"
    sshtell="none"
    smbsend="none"
    sshsend="none"
    privesc="none"
fi

# Static options.conf default settings
execute=1
access=1
create=1
destroy=0
send=1
resilient=0
timeout=1501
titling=0
color=1
agent=1
privy=0
debug=0

sysopts="$syscfd/cfg/options.conf"
usropts="$usrcfd/cfg/options.conf"

# Write settings to options.conf if it does not exist yet.
if [ ! -e "$usropts" -a ! -e "$sysopts" ]; then
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
    " | sed 's/^[[:space:]]*//' > "$usropts"
elif [ ! -e "$usropts" -a -e "$sysopts" ]; then
    cp "$sysopts" "$usropts"
fi

# Source global options.conf, if existing.
if [ -e "$sysopts" ]; then
    . "$sysopts"
fi

# Source local options.conf, if existing (which may override global options).
if [ -e "$usropts" ]; then
    . "$usropts"
fi

# Create backslashed user variable
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
    # Weirdness.
    userDblBacksl="unknown"
fi

### Construct current config from global and local session.conf. ###
config="$usrcfd/tmp/session.conf.active"
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

# Set logfile location.
logfile="$usrcfd/log/session.log"

# report(<message_text>...)
# Prints.
#
# Print <message_text>s with standard framing text.
#
report() { echo "Session: $*." ; }
reportInfo()    { report "Info: $*" ; }
reportWarning() { report "Warning: $*" >&2 ; }
reportError()   { report "Error: ${FUNCNAME[1]}(): $*" >&2 ; }
reportBug()     { report "Bug: ${FUNCNAME[1]}(): $*" >&2 ; }
reportDebug() {
    [ ! "$debug" -o  "$debug" = 0 ] && return
    report "Debug: ${FUNCNAME[1]}(): $*" >&2
}

# reportDebugFuncEntry(<function_name> <argument_name_vector> <environment_variable_name_vector> <additional_message>)
# Prints.
# Writes to log file.
#
# Report a debugging message containing:
#     the argument string supplied to that function
#     selected environment variable names separated by spaces
#     and an additional message.
# E.g.,
#     foo() { bar=BARVAL baz=BAZVAL reportDebugFuncEntry "$*" "bar baz" "have a nice day" ; }
#     foo FOO1 FOO2
#     => Session: Debug: Entering foo(FOO1 FOO2) with environment bar=BARVAL baz=BAZVAL ; have a nice day.
#
reportDebugFuncEntry() {
    [ ! "$debug" -o  "$debug" = 0 ] && return

    local funcname="${FUNCNAME[1]}"
    local args="$1"
    local varname
    local varval
    local envstr=""
    local msg

    local IFS=" "
    for varname in $2 ; do
       varval="$(eval echo \$$varname)"
       envstr="${envstr:+$envstr, }${varname}=${varval}"
    done

    msg="Entering $funcname($args)${envstr:+ with environment $envstr${3:+; }}$3"
    report "Debug: $msg" >&2
    [ ! "$logfile" ] || echo "$msg" >> "$logfile"

    return
}

#
# isLoopback(<domain_name_or_address>)
# Returns 0 if address is loopback domain name or address; non-zero otherwise.
#
isLoopback() {
    reportDebugFuncEntry "$*"

    # Handles only IPv4 at present
    [[ "$1" =~ ^localhost\. ]] || [[ "$1" =~ ^127\. ]]
}

# isLocal(<name>)
#
# Return 0 if name matches non-null short local hostname, 1 otherwise.
#
isLocal() {
    reportDebugFuncEntry "$*"

    [ "$hostname" ] || return 1
    [[ "$1" =~ "$hostname" ]]
}

# toWindowsPath(<path>)
# Prints.
#
# Convert path from *nix-style to Windows-style.
#
# Inspired by Cygwin's cygpath.
#
toWindowsPath() {
    reportDebugFuncEntry "$*"

    local input="$1"
    local output
    local path
    local file

    if [ ! "$input" ]; then
        reportError "No input given"
        return 1
    fi

    if [[ "$input" =~ : ]]; then
        # Windows path was passed (ie. contains colon). Only forward slashes.
        reportDebug "Detected colon, only forwarding slashes"
        output="$(echo "$input" | sed 's|\\|/|g')"
    elif [ -d "$input" ]; then
        # Path exists locally and is a directory, enter, read out and forward slashes.
        reportDebug "Path exists locally and is a directory. Entering, read out and forwarding slashes"
        output="$(cd "$input" ; cmd.exe /c cd | sed 's|\\|/|g')"
    elif [ -f "$input" -o "$(dirname "$input")" != "/" ]; then
        # Path exists locally and is a file, enter parent, read out and forward slashes.
        reportDebug "Path exists locally and is a file. Entering, read out and forwarding slashes"
        path="$(cd "$(dirname "$input")" ; cmd.exe /c cd | sed 's|\\|/|g')"
        file="$(basename "$input")"
        output="$path/$file"
    else
        # File does not exist locally, and contains no colon. Prepend C: and forward slashes.
        reportDebug "File does not exist locally and contains no colon. Prepending C: and forwarding slashes"
        output="$(echo "C:$input" | sed 's|\\|/|g' )"
    fi

    reportDebug "Incoming: $input"
    reportDebug "Outgoing: $output"
    echo "$output"
    return 0
}

# toolFinder()
# Writes $usrcfd/cfg/tools.required and $usrcfd/cfg/tools.found.
#
# Detect required and optional tools.
#
toolFinder() {
    reportDebugFuncEntry "$*" "usrcfd color"

    local tools_terminal
    local tools_desktop
    local tools_browser
    local tools_access_result
    local tooltypes
    local tooltype
    local values
    local tool

    # Make sure color is off if requested.
    if [ "$color" = 0 ]; then unset color; fi

    # First write out tools.required.
    if [ "$platform" = "linux" -o "$platform" = "macosx" ]; then
        echo "tools_session='awk,cut,grep,host,lsof,nmap,sed,tr,ps'" > "$usrcfd/cfg/tools.required"
        echo "tools_execute='ssh,winexe'" >> "$usrcfd/cfg/tools.required"
        echo "tools_agent='ssh-agent,ssh-add'" >> "$usrcfd/cfg/tools.required"
        echo "tools_send='cp,scp,smbclient'" >> "$usrcfd/cfg/tools.required"
    elif [ "$platform" = "windows" ]; then
        echo "tools_session='awk,cut,grep,nmap,nslookup,sed,tr,tasklist'" > "$usrcfd/cfg/tools.required"
        echo "tools_execute='plink,psexec'" >> "$usrcfd/cfg/tools.required"
        echo "tools_agent='pageant'" >> "$usrcfd/cfg/tools.required"
        echo "tools_send='pscp,robocopy'" >> "$usrcfd/cfg/tools.required"
    else
        echo "# unidentified platform specified: $platform" > "$usrcfd/cfg/tools.required"
        echo "# toolFinder says you need to define tools_ variables!" >> "$usrcfd/cfg/tools.required"
    fi
    if [ "$terminal" = "putty" ]; then
        tools_terminal="putty"
    elif [ "$terminal" = "apple" ]; then
        PATH="${PATH}:/Applications/Utilities/Terminal.app/Contents/MacOS"
        tools_terminal="osascript,Terminal"
    elif [ "$terminal" = "gnome" ]; then
        tools_terminal="gnome-terminal,pgrep,xdotool"
    elif [ "$terminal" = "screen" ]; then
        tools_terminal="screen"
    fi

    if [ "$desktop" = "mstsc" ]; then
        tools_desktop="cryptrdp5,mstsc"
    elif [ "$desktop" = "amsrdc" ]; then
        PATH="${PATH}:/Applications/Remote Desktop Connection.app/Contents/MacOS"
        tools_desktop="Remote Desktop Connection"
    elif [ "$desktop" = "rdesktop" ]; then
        tools_desktop="rdesktop"
    fi

    if [ "$browser" = "windows" ]; then
        tools_browser="explorer"
    elif [ "$browser" = "apple" ]; then
        tools_browser="open"
    elif [ "$browser" = "gnome" ]; then
        tools_browser="open"
    fi
    
    for tools_access_type in tools_terminal tools_desktop tools_browser; do
        if [ "${!tools_access_type}" ]; then
            tools_access_result="${!tools_access_type},$tools_access_result"
        fi
    done
    echo "tools_access='$tools_access_result'" | sed "s|,'$|'|" >> "$usrcfd/cfg/tools.required"

    # Clean up old tools.found first.
    rm -f "$usrcfd/cfg/tools.found"

    # Read tooltypes from generated tools.required.
    tooltypes="$(cat "$usrcfd/cfg/tools.required" | cut -d "=" -f 1)"

    # Loop over all tooltypes and for each tooltype over its values.
    for tooltype in $tooltypes ; do
        values="$(cat "$usrcfd/cfg/tools.required" | grep $tooltype | cut -d '=' -f 2 | sed "s|'||g")"

        echo -n "$(echo "$tooltype" | cut -d "_" -f 2): "
        echo -n "${tooltype}_found='" >> "$usrcfd/cfg/tools.found"

        local IFS=","
        for tool in $values ; do
            if [ ! "$color" ]; then
                unset color_red color_green color_yellow color_blue color_end
            fi

            if [ "$(basename "$(which $tool 2>/dev/null)")" ]; then
                echo -ne "${color_green}${tool}${color_end} "
                echo -n "$tool," >> "$usrcfd/cfg/tools.found"
            else
                echo -ne "(${color_red}${tool}${color_end}) "
            fi
        done
        echo ""
        echo "'" >> "$usrcfd/cfg/tools.found"
    done
    sed -i "" -e "s|,'$|'|" "$usrcfd/cfg/tools.found" 2>/dev/null

    echo ""

    # Remove trailing spaces from tools.found.
    cat "$usrcfd/cfg/tools.found" | sed "s| '|'|g" > "$usrcfd/tmp/tools.found"
    mv "$usrcfd/tmp/tools.found" "$usrcfd/cfg/tools.found"
}

if [ -e "$usrcfd/cfg/tools.required" -a -e "$usrcfd/cfg/tools.found" ]; then
    . "$usrcfd/cfg/tools.required"
    . "$usrcfd/cfg/tools.found"
else
    reportInfo "Detecting which executables are available"
    toolFinder
    . "$usrcfd/cfg/tools.required"
    . "$usrcfd/cfg/tools.found"
fi

# Check if at least mandatory tools are available.
if [ "$tools_session" != "$tools_session_found" ]; then
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
if [ "$debug" != 0 ]; then debug="true" ; else unset debug; fi

# Set private key option when private key found.
if [ "$platform" = "linux" -o "$platform" = "macosx" ]; then
    # Look for OpenSSH style public/private keypair.
    if [ -e "$HOME/.ssh/id_dsa" ]; then
        sshkey="$HOME/.ssh/id_dsa"
        sshpub="$HOME/.ssh/id_dsa.pub"
        sshopts="-i $sshkey"
    elif [ -e "$HOME/.ssh/id_rsa" ]; then
        sshkey="$HOME/.ssh/id_rsa"
        sshpub="$HOME/.ssh/id_rsa.pub"
        sshopts="-i $sshkey"
    fi

    # Load private key into ssh-agent if agent handling is enabled.
    if [ "$sshkey" -a "$agent" ]; then
        sshagentfile="$usrcfd/tmp/session.ssh-agent.out"
        sshagentproc="$(ps x | grep ssh-agent | grep -v grep)"
        if [ "$SSH_AUTH_SOCK" ]; then
            reportDebug "Reusing previously set environment variables for running ssh-agent"
            echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK; export SSH_AUTH_SOCK;"  > "$sshagentfile"
            echo "SSH_AGENT_PID=$SSH_AGENT_PID; export SSH_AGENT_PID;" >> "$sshagentfile"
            source "$sshagentfile"
            unset sshopts
        elif [ "$sshagentproc" ]; then
            reportDebug "Environment values not set but agent is running, inspecting agent"
            reportDebug "I'm using lsof to do this and $privy to elevate privileges"
            sshagentlsof="$($privy lsof /tmp/ssh-*/agent.* 2> /dev/null | grep ssh-agent | tail -n1)"
            SSH_AUTH_SOCK="$(echo "$sshagentlsof" | awk '{print $9}')"
            SSH_AGENT_PID="$(echo "$sshagentlsof" | awk '{print $2}')"
            echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK; export SSH_AUTH_SOCK;"  > "$sshagentfile"
            echo "SSH_AGENT_PID=$SSH_AGENT_PID; export SSH_AGENT_PID;" >> "$sshagentfile"
            source "$sshagentfile"
            unset sshopts
        elif [ ! "$sshagentproc" ]; then
            reportInfo "You have a private key; starting new ssh-agent"
            ssh-agent | grep -v "^echo " > "$sshagentfile"
            chmod 600 "$sshagentfile"
            source "$sshagentfile"
            unset sshopts
            ssh-add
        else
            reportError "Unexpected exit"
            exit 1
        fi
    fi

    # Disable strict host and reverse mapping checks if not already set.
    if [ -e "$HOME/.ssh/config" ]; then
        if [[ ! "$(cat "$HOME/.ssh/config")" =~ "StrictHostKeyChecking" ]]; then
            echo "StrictHostKeyChecking no" >> "$HOME/.ssh/config"
        fi
        if [[ ! "$(cat "$HOME/.ssh/config")" =~ "GSSAPIAuthentication" ]]; then
            echo "GSSAPIAuthentication no" >> "$HOME/.ssh/config"
        fi
    else
        mkdir -p "$HOME/.ssh"
        echo "GSSAPIAuthentication no"   > "$HOME/.ssh/config"
        echo "StrictHostKeyChecking no" >> "$HOME/.ssh/config"
    fi

elif [ "$platform" = "windows" ]; then
    # Look for PuTTY style public/private keypair.
    if [ -e "$HOME/.ssh/id_dsa.ppk" ]; then
        sshkey="$(toWindowsPath "$HOME/.ssh/id_dsa.ppk")"
        sshpub="$(toWindowsPath "$HOME/.ssh/id_dsa.pub")"
        sshopts="-i \"$sshkey\""
    elif [ -e "$HOME/.ssh/id_rsa.ppk" ]; then
        sshkey="$(toWindowsPath "$HOME/.ssh/id_rsa.ppk")"
        sshpub="$(toWindowsPath "$HOME/.ssh/id_rsa.pub")"
        sshopts="-i \"$sshkey\""
    fi

    # Load private key into pageant if agent handling is enabled.
    if [ "$sshkey" -a "$agent" ]; then
        running="$(tasklist | grep -i pageant | grep -v grep)"
        if [ ! "$running" ]; then
            reportInfo "You have a private key; loading into ssh-agent"
            start pageant "$sshkey" 2>/dev/null &
            sleep 10
        fi
    fi
fi

# handleQuotedRegExpBehaviour()
#
# Check quoted regexp behaviour and take appropriate action.
handleQuotedRegExpBehaviour() {
    reportDebugFuncEntry "$*"

    # http://dougbarton.us/Bash/Bash-FAQ.html, see E15
    # http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-010, regarding quoted regexp matching
    # http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-039, regarding compat31 shopt

    local major="${BASH_VERSINFO[0]}"
    local minor="${BASH_VERSINFO[1]}"
    local patch="${BASH_VERSINFO[2]}"

    if [ "$major" -lt 3 ]; then # Major is lower than 3
        reportError "Bash major version lower than 3, exiting"
        exit 1
    elif [ "$major" = 3 ]; then # Major is 3
        if [ "$minor" -lt 2 ]; then # Version 3.0 and 3.1 will work
            reportDebug "Bash version is old but will work with quoted regexp matching"
        elif [ "$minor" -eq 2 ]; then  # Handle 3.2 idiosyncracies
            if [ 0 -le "$patch" -a "$patch" -le 9 ]; then # Version 3.2.0 to 3.2.9 is broken
                reportError "Bash version has known unfixed issues with quoted regexp matching"
                exit 1
            elif [ "$patch" -lt 39 ]; then # Version 3.2.10 to 3.2.38 might work
                reportDebug "Bash version is old but may work with quoted regexp matching"
            else # Version 3.2.39 and higher has compat31
                reportDebug "Setting shell option compat31 to handle quoted rexexp matching"
                shopt -s compat31
            fi
        elif [ "$minor" -gt 2 ]; then # Currently non-existing version of bash 3.3 or higher but not 4
            reportDebug "Setting shell option compat31 to handle quoted rexexp matching"
            shopt -s compat31
        fi
    else # 4 and higher.
        reportDebug "Setting shell option compat31 to handle quoted rexexp matching"
        shopt -s compat31
    fi
}
handleQuotedRegExpBehaviour


# sshSendKey(<username>)
#
# Send local public key to another machine.
#
sshSendKey() {
    reportDebugFuncEntry "$*" "sshpub addr"

    local source="$sshpub"
    local target="/tmp/pubkey"
    local user="$1"
    local retval
    local commandlist

    [ "$addr" ] || { reportError "\$addr is empty; aborting" ; return 1 ; }
    [ "$sshpub" ] || { reportError "\$sshpub is empty; aborting" ; return 1 ; }

    reportInfo "Attempting to send public key $sshpub"

    viaScript "$(${sshsend}SendCommandWriter "$addr" "$user" "$source" "$target")"
    retval="$?"
    if [ "$retval" != 0 ]; then
        reportError "Failed to send $sshpub with return code: $retval"
        return 1
    fi

    reportInfo "Key sent successfully; will now attempt to install it"

    # Keep commandlist as one line, plink will go crazy if you do not.
    commandlist='[ "$HOME" ] || exit 1 ; mkdir -p $HOME/.ssh ; touch $HOME/.ssh/authorized_keys ; cat $HOME/.ssh/authorized_keys /tmp/pubkey | sort | uniq > /tmp/authorized_keys ; mv /tmp/authorized_keys $HOME/.ssh/authorized_keys ; rm /tmp/pubkey ; chmod 755 $HOME ; chmod 755 $HOME/.ssh ; chmod 600 $HOME/.ssh/authorized_keys'
    viaScript "$(${sshtell}TellCommandWriter "$addr" "$user" "$commandlist")"
    retval="$?"
    if [ "$retval" != 0 ]; then
        reportError "Installation attempt failed with return code: $retval"
        return 1
    fi

    reportInfo "Key installed"
    return 0
}

# winStoreCreds(<type> <name>)
#
# Store credentials for services that talk smb or rdp.
#
winStoreCreds() {
    reportDebugFuncEntry "$*"

    local store_type="$1"
    local store_name="$2"
    local store_pass1="unset1"
    local store_pass2="unset2"

    while [ "$store_pass1" != "$store_pass2" ]; do
        echo -n "Please supply password for $store_type $store_name: "
        stty -echo
        read store_pass1
        stty echo
        echo ""

        echo -n "Retype password for confirmation: "
        stty -echo
        read store_pass2
        stty echo
        echo ""

        if [ "$store_pass1" != "$store_pass2" ]; then
            reportError "Passwords do not match"
            return 1
        fi
    done

    mkdir -p "$usrcfd/sys/$name"
    if [ "$user" = "$admin" ]; then
        echo "$store_pass2" > "$usrcfd/sys/$name/user.pwd"
        echo "$store_pass2" > "$usrcfd/sys/$name/admin.pwd"
    else
        echo "$store_pass2" > "$usrcfd/sys/$name/$store_type.pwd"
    fi

    return 0
}

# osglobals(<osmt>)
# Sets osstop osreboot oslisten.
#
# Set generic global variables for commands that interact
# with the given operating system.
#
osGlobals() {
    reportDebugFuncEntry "$*"

    # Defaults
    osstop="/sbin/shutdown -h now"
    osreboot="reboot"
    oslisten="netstat -na|grep \"LISTEN\"|grep -w -e \"0\.0\.0\.0:$port\" -e \":::$port\" -e \"$addr:$port\" "

    # Override defaults given above for certain osses.
    case "$1" in
      aix5|aix6|aix7|hpux1123|hpux1131)
        osstop="/sbin/shutdown -hy 0"
        ;;
      dfbsd2|fbsd7|fbsd8)
        osstop="/sbin/shutdown -p now"
        ;;
      nbsd4|nbsd5|obsd4|obsd5)
        osstop="/sbin/shutdown -h -p now"
        ;;
      sol10|sol11)
        osstop="/usr/sbin/poweroff"
        ;;
      windows-like|win2k3|win2k8|winxp|win7|win8)
        osstop="shutdown -s -t 01"
        oslisten="netstat -na|findstr \"LISTEN\"|findstr \"\<0\.0\.0\.0:$port\> \<$addr:$port\>\" "
        ;;
    esac
}

# capsFirst(<arg>...)
# Prints.
#
# Echo all args with first one capitalized if it starts with a letter.
#
capsFirst() {
    reportDebugFuncEntry "$*"

    local input="$*"
    local upr

    case "$input" in
      a*) upr=A ;;  b*) upr=B  ;; c*) upr=C ;; d*) upr=D ;;
      e*) upr=E ;;  f*) upr=F  ;; g*) upr=G ;; h*) upr=H ;;
      i*) upr=I ;;  j*) upr=J  ;; k*) upr=K ;; l*) upr=L ;;
      m*) upr=M ;;  n*) upr=N  ;; o*) upr=O ;; p*) upr=P ;;
      q*) upr=Q ;;  r*) upr=R  ;; s*) upr=S ;; t*) upr=T ;;
      u*) upr=U ;;  v*) upr=V  ;; w*) upr=W ;; x*) upr=X ;;
      y*) upr=Y ;;  z*) upr=Z  ;;
       *) echo "$input" ; return ; ;;
    esac
    echo "${upr}${input#?}"
}

# rndGen(<count> <split_char>)
# Prints.
#
# Print <count> random 2-digit hex numerals separated by <split_char>.
#
rndGen() {
    reportDebugFuncEntry "$*"

    local count=1
    local split
    local part
    local length

    if [ "$1" ]; then
        count="$1"
    fi
    if [ "$2" ]; then
        split="$2"
    fi

    while [ "$count" -gt 0 ]; do
        part="$(printf '%02X' $RANDOM | cut -c2-3)"
        length=${#part}

        if [ "$length" -lt 2 ]; then
            part="$part$part"
        fi

        echo -n "$part"

        if [ "$count" != 1 ]; then
            echo -n "$split"
        fi

        let count-=1
    done

    echo ""
}

# macGen(<type>)
# Sets macaddr.
# Writes $usrcfd/sys/$name/generated.mac.
#
# Generate a MAC address for adapter of the give type.
#
macGen() {
    reportDebugFuncEntry "$*"

    local vendor_vmw="00:50:56"
    local vendor_xen="00:16:3E"
    local vendor_kvm="54:52:00"

    local first
    local newfirst
    local genmac
    local venmac
    local indec
    local check

    case "$1" in
      global)
        genmac="$(rndGen 6 :)"
        first="$(echo "$genmac" | cut -d : -f 1)"
        indec="$(printf "%d" 0x$first)"
        check="$(( $indec % 2 ))"
        if [ "$check" != 0 ]; then
            newfirst="$(printf "%x" $(( $indec + 1)))"
            genmac="$(echo "$genmac" | sed "s|^$first|$newfirst|")"
        fi
        macaddr="$genmac"
        ;;
      vmw|vmf|esx)
        venmac="$vendor_vmw"
        genmac="$(rndGen 3 :)"
        macaddr="$venmac:$genmac"
        ;;
      xen)
        venmac="$vendor_xen"
        genmac="$(rndGen 3 :)"
        macaddr="$venmac:$genmac"
        ;;
      kvm)
        venmac="$vendor_kvm"
        genmac="$(rndGen 3 :)"
        macaddr="$venmac:$genmac"
        ;;
      *)
        reportError "No macGen method specified; expected any of global|vmw|vmf|esx|xen|kvm"
        return 1
        ;;
    esac

    mkdir -p "$usrcfd/sys/$name"
    echo "$macaddr" > "$usrcfd/sys/$name/generated.mac"

    return 0
}

# printPortState(<address> <port>)
# Prints.
#
# Print the state ("open"/"closed"/"none") of a given port and address
# with as little response time as possible.
#
printPortState() {
    reportDebugFuncEntry "$*" "timeout"

    local addr
    local port
    local command
    local match

    if [ "$1" ]; then
        addr="$1"
    else
        addr="none"
    fi
    if [ "$2" ]; then
        port="$2"
    else
        port="none"
    fi

    if [ "$addr" = "none" -o "$port" = "none" ]; then
        echo none
        return
    fi

    if isLoopback "$addr" || isLocal "$name" ; then
        echo open
        return
    fi

    if [ "$resilient" ]; then
        command="nmap -n -T1 -PN -sT -p $port $addr"
        match=" open "
    else
        if [ "$scantype" = "connect" ]; then
            command="nmap -n -T5 --host-timeout $timeout -PN -sT -p $port $addr"
            match=" open "
        else
            command="nmap -n -T5 --host-timeout $timeout -PN -p $port $addr"
            match=" open "
        fi
    fi

    if $privy $command 2>/dev/null | grep -q "$match" >/dev/null ; then
        echo open
    else
        echo closed
    fi
}

# printState()
# Prints.
#
# Print a long or short version of the state of a given machine, service or group thereof.
#
printState() {
    reportDebugFuncEntry "$*" "state acstate exstate vmstate svstate svrunning svlistening host type osmt acmt exmt svmt vrmt addr port user admin members"

    local name="$1"
    local returnFormat="$2"
    local sysopts
    local usropts

    if [ ! "$returnFormat" ]; then
        returnFormat="short"
    fi

    case "$returnFormat" in
      long)
        echo "# main config:"
        echo "type='$type'"
        echo "name='$name'"

        if [ "$type" = "host" -o "$type" = "guest" ]; then
            echo "osmt='$osmt'"
        elif [ "$type" = "service" ]; then
            echo "svmt='$svmt'"
            echo "port='$port'"
        fi

        if [ "$type" != "group" ]; then
            echo "acmt='$acmt'"
            echo "exmt='$exmt'"
            echo "user='$user'"
            echo "admin='$admin'"
            echo "addr='$addr'"
            echo "vrmt='$vrmt'"
            echo "host='$host'"
        fi
        echo ""

        sysopts="$syscfd/sys/$name/options.conf"
        usropts="$usrcfd/sys/$name/options.conf"

        if [ -e "$usropts" ]; then
            echo "# extra options (set locally):"
            cat "$usropts" | sed '/^$/d' | grep -v "^#"
            echo ""
        elif [ -e "$sysopts" -a ! -e "$usropts" ]; then
            echo "# extra options (set globally):"
            cat "$sysopts" | sed '/^$/d' | grep -v "^#"
            echo ""
        fi

        sysopts="$syscfd/sys/$host/options.conf"
        usropts="$usrcfd/sys/$host/options.conf"

        if [ -e "$usropts" ]; then
            echo "# inherited options (from host, set locally):"
            cat "$usropts" | sed '/^$/d' | grep -v "^#"
            echo ""
        elif [ -e "$sysopts" -a ! -e "$usropts" ]; then
            echo "# inherited options (from host, set globally):"
            cat "$sysopts" | sed '/^$/d' | grep -v "^#"
            echo ""
        fi

        if [ "$type" = "host" -o "$type" = "guest" ]; then
            echo "# inherited os options:"
            echo "osstop='$osstop'"
            echo "osreboot='$osreboot'"
            echo "oslisten='$oslisten'"
            echo ""
        fi

        if [ "$type" != "group" ]; then
            echo "# current state:"
            echo "acstate='$acstate'"
            echo "exstate='$exstate'"
            if [ "$type" = "service" ]; then
                echo "svrunning='$svrunning'"
                echo "svlistening='$svlistening'"
                echo "svstate='$svstate'"
            fi
            if [ "$type" = "guest" ]; then
                echo "vmstate='$vmstate'"
            fi
            echo "state='$state'"
            echo ""
        fi

        echo "# relations:"
        if [ "$type" != "group" ]; then
            echo -n "groups="
            local groups="$(unset debug ; verbose=1 ; listHelper group | grep "$name" | cut -d " " -f 2 | cut -d "(" -f 1 | tr '\n' ',' | sed  "s|,$||")"
            if [ "$groups" ]; then echo "'$groups'"; else echo "'none'"; fi
        fi

        if [ "$type" = "host" -o "$type" = "guest" ]; then
            echo -n "services="
            local services="$(unset debug ; verbose=1 ; listHelper service | grep "$name" | cut -d " " -f 2 | cut -d "(" -f 1 | tr '\n' ',' | sed  "s|,$||")"
            if [ "$services" ]; then echo "'$services'"; else echo "'none'"; fi
        fi

        if [ "$type" = "host" -a "$vrmt" != "none" ]; then
            echo -n "guests="
            local guests="$(unset debug ; verbose=1 ; listHelper guest | grep "$name" | cut -d " " -f 2 | cut -d "(" -f 1 | tr '\n' ',' | sed  "s|,$||")"
            if [ "$guests" ]; then echo "'$guests'"; else echo "'none'"; fi
        fi

        if [ "$type" = "group" ]; then
            echo -n "members="
            local members="$(tokenReader printVals "$name" "members")"
            if [ "$members" ]; then echo "'$members'"; else echo "'none'"; fi
        fi
        ;;
      short)
        if [ ! "$color" ]; then
            unset color_red color_green color_yellow color_blue color_end
        fi
        case "$state" in
          on|booting|created|destroyed|restarting|starting|stopping)
            echo -e "$name: ${color_green}${state}${color_end}"
            return 0
            ;;
          off)
            echo -e "$name: ${color_blue}${state}${color_end}"
            return 4
            ;;
          busy)
            echo -e "$name: ${color_yellow}${state}${color_end}"
            return 2
            ;;
          *)
            echo -e "$name: ${color_red}${state}${color_end}"
            return 1
        esac
        ;;
    esac
}

# addConf(<entry>)
#
# Add an <entry> to session.conf.
#
addConf() {
    reportDebugFuncEntry "$*" "type name"

    local entryFound
    local addConfEntry

    entry="$*"
    addConfEntry="$entry"
    type="${entry%%[[:space:]]*}"

    # Check for name collision
    entryFound="$(grep -v '^#' "$usrcff" | grep " $name(")"
    if [ "$entryFound" ]; then
        reportError "An entry with name $name is already present in $usrcff"
        return 1
    fi

    # Check for addr collision, excluding services.
    if [ "$type" = "host" -o "$type" = "guest" ]; then
        entryFound="$(grep -v '^#' "$usrcff" | grep -v '^service' | grep -v '^group' | grep "$addr")"
        if [ "$entryFound" ]; then
            reportError "An entry with addr $addr is already present in $usrcff"
            return 1
        fi
    fi

    # Add new entry.
    echo "$addConfEntry" >> "$usrcff"
    reportInfo "Successfully added entry $*"
    return 0
}

# delConf(<name>)
#
# Remove the named configuration entry from session.conf.
#
delConf() {
    reportDebugFuncEntry "$*" "usrcff"

    local name="$1"
    local entryFound="$(entryReader "$name" "$usrcff")"
    local deletion

    if [ ! "$entryFound" ]; then
        reportError "No entry with name $name is present in $usrcff"
        return 1
    fi

    # Delete the entry.
    deletion="$(echo "$entryFound" | sed 's|\\|\\\\|g')"
    cat "$usrcff" | sed -e "/$deletion/d" > "$usrcfd/tmp/session.conf.tmp"
    mv -f "$usrcfd/tmp/session.conf.tmp" "$usrcff"
    reportInfo "Removed $entryFound"
    return 0
}

# checkNameOrAddress(<nameOrAddress>)
#
# Check the syntax of a given host name or IP address.
# Return if it's OK; exit with error message if it's not OK.
#
checkNameOrAddress() {
    reportDebugFuncEntry "$*"

    local input="$1"
    local maxLength
    local length
    local seq

    if [ "${input//[[:digit:].]/}" ]; then
        # It's not a numeral (possibly with some dots)
        # Treat it as an (attempted) host name

        if [ "${input//[[:word:]-.]/}" ]; then
            reportError "Name '$input' contains invalid characters"
            return 1
        fi

        maxLength=64
        length=${#input}
        if [ "$length" -gt "$maxLength" ]; then
            if [ "$name" = "$input" ]; then
                reportError "Name '$input' is too long: it is $length characters long but the maximum is $maxLength"
            elif [ "$addr" = "$input" ]; then
                reportError "Address '$input' is too long: it is $length characters long but the maximum is $maxLength"
            else
                reportError "String '$input' is too long: it is $length characters long but the maximum is $maxLength"
            fi
            return 1
        fi

        return 0
    fi

    # It's a numeral, possibly with some dots
    # Treat it as an (attempted) IP address

    local IFS="." ; set -- $input
    if [ "$#" != 4 ]; then
        reportError "Invalid IP address '$input' specified for '$name'"
        return 1
    fi
    for seq do
        case "$seq" in
          ""|*[!0-9]*)
            reportError "Invalid IP address '$input' specified for '$name'"
            return 1
            ;;
        esac
        if [ "$seq" -gt 255 ]; then
            reportError "Invalid IP address '$input' specified for '$name'"
            return 1
        fi
    done

    return 0
}

# listHelper(<name>)
#
# name => check for existence (return name if true)
# name --verbose => check for existence (return entry if true)
# Can list all sorts of session related entities.
#
listHelper() {
    reportDebugFuncEntry "$*"

    name="$1"

    case "$name" in
      group|groups|guest|guests|host|hosts|service|services|all)
        match="$(echo "$name" | sed 's|s$||')"
        if [ "$verbose" ]; then
            if [ "$name" = "all" ]; then
                grep -ve "^$" -ve "^#" "$config"
            else
                grep "^$match" "$config" | sed '/^$/d'
            fi
        else
            if  [ "$name" = "all" ]; then
                grep -ve "^$" -ve "^#" "$config" | cut -d '(' -f 1 | awk '{print $2}'
            else
                grep "^$match" "$config" | sed "s|^$match ||g" | cut -d '(' -f 1
            fi
        fi
        ;;
      mode|modes)
        if [ "$default" ]; then
            echo "$defaultmode"
        else
        for item in $known_modes ; do
            echo "$item" $(if [ "$item" = "$defaultmode" ]; then echo '(default)' ; fi)
        done
        fi
        ;;
      osmt)
        for item in $known_osmts ; do
            echo "$item"
        done
        ;;
      acmt)
        for item in $known_acmts ; do
            echo "$item"
        done
        ;;
      exmt)
        for item in $known_exmts ; do
            echo "$item"
        done
        ;;
      svmt)
        for item in $known_svmts ; do
            echo "$item"
        done
        ;;
      vrmt)
        for item in $known_vrmts ; do
            echo "$item"
        done
        ;;
      crmt)
        for item in $known_crmts ; do
            echo "$item"
        done
        ;;
      *)
        if [ "$verbose" ]; then
            entryReader "$name" "$config"
        else
            tokenReader printVals "$name" "name"
        fi
        ;;
    esac
}

# discoveryHelper()
#
# Discover hosts on a network and addConf them.
#
discoveryHelper() {
    reportDebugFuncEntry "$*" "name userDblBacksl"

    local range="$1"

    local addr
    local type
    local name
    local osmt
    local acmt
    local exmt
    local user
    local admin
    local file

    if [ ! "$range" ]; then
        reportError "I was called without range being set"
        return 1
    fi

    if [ "$platform" = "linux" -o "$platform" = "macosx" ]; then
        file="$usrcfd/tmp/session.discover.out"
    elif [ "$platform" = "windows" ]; then
        file="$(toWindowsPath "$usrcfd/tmp/session.discover.out")"
    fi

    $privy nmap -n -T5 -PE -oG "$file" -sP $range >/dev/null 2>&1 </dev/null
    reportDebug "Called nmap as: $privy nmap -n -T5 -PE -oG \"$file\" -sP $range"
    for addr in $($privy cat "$usrcfd/tmp/session.discover.out" | grep Up | cut -d " " -f 2 | sed -e 's/^[[:space:]]*//') ; do
        type="host"

        if [ "$platform" = "linux" -o "$platform" = "macosx" ]; then
            name="$(host $addr 2>/dev/null | grep "domain name pointer" | cut -d " " -f 5  | cut -d "." -f 1 | head -n 1 | sed -e 's/^[[:space:]]*//' | tr A-Z a-z)"
            reportDebug "Got name from DNS for $addr: $name"
        elif [ "$platform" = "windows" ]; then
            name="$(nslookup $addr 2>/dev/null | grep Name | cut -d ":" -f 2 | cut -d "." -f 1 | sed -e 's/^[[:space:]]*//' | tr A-Z a-z)"
            reportDebug "Got name from DNS for $addr: $name"
        fi

        if [ ! "$name" ]; then
            name="unknown$(echo "$addr" | awk 'BEGIN {FS="."}{print "-" $3 "-" $4}')"
            reportDebug "Got no name from DNS for $addr, created name: $name"
        fi

        osmt="embedded-like"
        acmt="none"
        exmt="none"
        user="unknown"
        admin="unknown"
        if [ "$(printPortState "$addr" 22)" = "open" ]; then
            osmt="unix-like"
            acmt="ssh"
            exmt="ssh"
            user="$userDblBacksl"
            admin="root"
        elif [ "$(printPortState "$addr" 23)" = "open" ]; then
            osmt="embedded-like"
            acmt="tel"
            exmt="none"
            user="unknown"
            admin="unknown"
        elif [ "$(printPortState "$addr" 445)" = "open" ]; then
            osmt="windows-like"
            acmt="rdp"
            exmt="smb"
            user="$userDblBacksl"
            admin="administrator"
        elif [ "$(printPortState "$addr" 443)" = "open" ]; then
            osmt="embedded-like"
            acmt="http"
            exmt="none"
            user="$userDblBacksl"
            admin="root"
        elif [ "$(printPortState "$addr" 80)" = "open" ]; then
            osmt="embedded-like"
            acmt="http"
            exmt="none"
            user="$userDblBacksl"
            admin="root"
        fi
        addConf "$type $name($osmt,$acmt,$exmt,$user,$admin,$addr,none)"
    done

    if [ "$debug" ]; then
        reportDebug "Not removing $usrcfd/tmp/session.discover.out"
    else
        $privy rm "$usrcfd/tmp/session.discover.out"
    fi

    return 0
}

# cutParentheses(<input>)
# Prints.
#
# Return the part of <input> between parentheses.
#
cutParentheses() {
    reportDebugFuncEntry "$*"

    local input="$*"
    local mangle="$input"; mangle="${mangle#*\(}"; mangle="${mangle%%\)*}"
    local output="$mangle"
    echo "$output"
}

# entryReader(<name> <file>)
# Prints.
#
# Print the (last) entry for <name> in <file>.
#
entryReader() {
    reportDebugFuncEntry "$*"

    local name="$1"
    local file="$2"
    local entry=$(grep -e "^[[:space:]]*[[:alnum:]]\+[[:space:]]\+$name(" "$file" | sed -e "s/^[[:space:]]*//;s/[[:space:]]*$//" | tail -n 1)

    if [ "$entry" ]; then
        echo "$entry"
    elif [ "$platform" != "windows" ]; then
        reportDebug "Entry returned empty, see if file was opened and retry when closed + available"
        local fileOpen="$(lsof "$file")"
        while [ "$fileOpen" ]; do
            fileOpen="$(lsof "$file")"
            reportInfo "Waiting to open $file"
        done

        entry=$(grep -e "^[[:space:]]*[[:alnum:]]\+[[:space:]]\+$name(" "$file" | sed -e "s/^[[:space:]]*//;s/[[:space:]]*$//" | tail -n 1)

        if  [ "$entry" ]; then
            echo "$entry"
         else
             reportError "Entry with name $name not found in $file"
             return 1
        fi
     else
         reportError "Entry with name $name not found in $file"
         return 1
    fi
}

# arrayGet(<array> <index>)
#
# Print the element with <index> in <array>.
#
# ARRAYS
# Associative arrays are obtained by concatenating an array name with an index name.
# This forms a variable name which is used to store the value.
# In order to ensure uniqueness it is mandated that the array name not contain an underscore character.
#
arrayGet() {
    reportDebugFuncEntry "$*"

    local array_index="${1}_$2"

    echo "${!array_index}"
}

# tokenReader(<function> <name> <keys>)
# Sets members.
# Prints.
#
# Look up the values for the given comma-separated <keys>
# in either the given <entry> if the <name> matches, otherwise in the <config> file under that <name>
# and either print out the values separated by spaces (if <function> is "printVals"), or
# set global variables named like the keys to the looked-up values (if <function> is "setVars").
#
tokenReader() {
    reportDebugFuncEntry "$*" "config entry"

    [ "$3" ] || { reportError "Not enough arguments passed" ; return 1 ; }

    local function="$1"
    local name="$2"
    local keys="$3"

    local enttype
    local key
    declare -a values
    declare -i indx
    local varname
    local position
    local value
    local output

    # Reuse a previously set entry if it is about the same entry.
    case "$entry" in
      *" ${name}("*)
        reportDebug "Using previously set entry for $name"
        ;;
      *)
        reportDebug "Reading entry for $name"
        entry="$(entryReader "$name" "$config")"
        ;;
    esac

    # Syntax indices for tokenReader()
    declare -r syntax_host_type=1
    declare -r syntax_host_name=2
    declare -r syntax_host_osmt=3
    declare -r syntax_host_acmt=4
    declare -r syntax_host_exmt=5
    declare -r syntax_host_user=6
    declare -r syntax_host_admin=7
    declare -r syntax_host_addr=8
    declare -r syntax_host_vrmt=9
    declare -r syntax_guest_type=1
    declare -r syntax_guest_name=2
    declare -r syntax_guest_osmt=3
    declare -r syntax_guest_acmt=4
    declare -r syntax_guest_exmt=5
    declare -r syntax_guest_user=6
    declare -r syntax_guest_admin=7
    declare -r syntax_guest_addr=8
    declare -r syntax_guest_host=9
    declare -r syntax_service_type=1
    declare -r syntax_service_name=2
    declare -r syntax_service_svmt=3
    declare -r syntax_service_acmt=4
    declare -r syntax_service_exmt=5
    declare -r syntax_service_user=6
    declare -r syntax_service_addr=7
    declare -r syntax_service_port=8
    declare -r syntax_service_host=9
    declare -r syntax_group_type=1
    declare -r syntax_group_name=2
    declare -r syntax_group_members=3

    # Check if the neccessary parameters are set.
    [ "$function" ] || { reportDebug "Function not specified"    ; return 1 ; }
    [ "$name" ]     || { reportDebug "Name not passed"           ; return 1 ; }
    [ "$keys" ]     || { reportDebug "Keys not passed for $name" ; return 1 ; }
    [ "$entry" ]    || { reportDebug "Entry not set for $name"   ; return 1 ; }

    # Read type from entry
    enttype="${entry%%[[:space:]]*}"
    members="$enttype,$name,$(cutParentheses "$entry")"

    let indx=0
    local IFS=","
    for key in $keys ; do
        # Try to read the positional index number from defined syntax.
        varname="syntax_${enttype}_${key}"
        position="${!varname}"

        reportDebug "Looking up $key for $name at position $position"
        if [ "$key" != "members" ]; then
            # Not looking for group members, use position.
            value="$(echo "$members" | cut -d ',' -f "$position")"
        else
            # Looking for members, which is a csv list in itself.
            value="$(cutParentheses "$entry")"
        fi

        (( "$position" )) || { reportError "Position $position for $varname unset" ; return 1 ; }

        if [ "$function" = "printVals" ]; then
            values[indx]="$value"
            let indx+=1
        elif [ "$function" = "setVars" ]; then
            export "$key"="$value"
        else
            reportBug "Invalid function passed: $function"
            return 1
        fi
    done

    if [ "$function" = "printVals" ]; then
        local IFS=" "
        output="${values[*]}"
        reportDebug "Output: $output"
        echo "$output"
    fi

    return 0
}

# tokenValidator(<keys>)
# Checks if tokens contain valid values.
#
tokenValidator() {
    reportDebugFuncEntry "$*" 

    local keys="$1"
    local varname
    local value
    local list

    # Check if the neccessary parameters are set.
    [ "$keys" ]     || { reportDebug "Keys not passed" ; return 1 ; }

    local IFS=","
    for key in $keys ; do
        varname="known_${key}s"
        value="${!key}"
        list="${!varname}"

        if [ -z "$value" ]; then
            reportError "Empty value for $key"
            return 1
        fi

        case "$key" in
          name|host)
            if [ "$key" = "name" -a "$value" = "none" ]; then
                reportError "You cannot use none as a name"
                return 1
            fi
            ;;
          addr)
            reportDebug "Verifying $key for $name with value $value"
            if [ "$value" != "none" ]; then
                checkNameOrAddress "$value" || return 1
            fi
            ;;
          user|admin)
            reportDebug "Verifying $key for $name with value $value"
            ;;
          type|mode|osmt|acmt|exmt|svmt|vrmt)
            reportDebug "Verifying $key for $name with value $value"
            if [[ ! "$list" =~ "$value" ]]; then
                reportError "Unknown $key method $value specified for $name"
                return 1
            fi
            ;;
          port)
            reportDebug "Verifying $key for $name with value $value"
            ;;
          members)
            reportDebug "Verifying $key for $name with value $value"
            ;;
          *)
            reportError "Unknown key $key passed"
            return 1
        esac
    done
}

# parseParameters(<parameters>)
# Sets variables.
#
# Parse command-line parameters <parameters> for options.
#
# For each command-line option "--foo" or "--foo=bar" set variable
# foo ether to "1" or, respectively, to "bar".
#
# Optionally supports a $mandatories and a $optionals list, which allows
# validity and scope checking.
#
# Example: mandatories="foo bar" ; optionals="baz" ; parseParameters "$@"
# (As shown in the example, $@ must be enclosed in double quotation marks.)
#
# Warning: arguments starting with '--' will be interpreted as options,
# so do not send to this function non-option arguments which could
# start with '--'
#
# Option values may be arbitrary strings.
# Option names may not contain spaces.
#
parseParameters() {
    reportDebugFuncEntry "$*" "mandatories optionals silence"

    declare -a variables
    declare -a values
    declare -i indx
    declare -i numVariables
    local found
    local mandatoriesMissing
    local optionalsOmitted
    local illegalsPresent
    local parameter
    local variable
    local mandatory
    local optional
    local value

    # First omit any non-option parameters
    while [ "$1" ]; do
        case "$1" in
          --*)
            # Found the first well formed option.
            break
            ;;
          *)
            # Not a well formed option.  Next!
            reportWarning "Unrecognized parameter $1"
            shift
            ;;
        esac
    done

    # From options extract variables;
    # i.e., strings between initial "--" and either first "=" or eol
    let indx=0
    local IFS=" "
    for parameter in "$@" ; do
        parameterWithoutHyphens="${parameter#--}"
        if [ "$parameterWithoutHyphens" = "$parameter" ]; then
            # Not a well-formed option
            reportWarning "Unrecognized parameter $parameter"
            continue
        fi
        case "$parameterWithoutHyphens" in
          *=*)
            variable="${parameterWithoutHyphens%%=*}"
            value="${parameterWithoutHyphens#$variable=}"
            ;;
          *)
            variable="$parameterWithoutHyphens"
            value=1  # Default value
            ;;
        esac
        variables[indx]="$variable"
        values[indx]="$value"
        let indx+=1
    done
    let numVariables=indx
    reportDebug "Variables=${variables[*]}, Values=${values[*]}"

    # Check that mandatories are present
    mandatoriesMissing=""
    for mandatory in $mandatories ; do
        found=""  # (False)
        for variable in "${variables[@]}" ; do
            if [ "$variable" = "$mandatory" ]; then
                found="y"
                break
            fi
        done
        [ "$found" ] || mandatoriesMissing="${mandatoriesMissing:+$mandatoriesMissing }--$mandatory"
    done

    if [ ! "$silence" ]; then
        optionalsOmitted=""
        # Check that optionals are present
        for optional in $optionals ; do
            found=""  # (False)
            for variable in "${variables[@]}" ; do
                if [ "$variable" = "$optional" ]; then
                    found="y"
                    break
                fi
            done
            [ "$found" ] || optionalsOmitted="${optionalsOmitted:+$optionalsOmitted }--$optional"
        done
    fi

    # Set variables (if legal)
    if [ "$mandatories" -o "$optionals" ]; then
        acceptAllVariables=""  # (False)
        legalVariables=" $mandatories $optionals " # With initial, intermediate and final space!
    else
        # No mandatories or optionals specified
        # Accept any variable (extremely unsafe)
        acceptAllVariables="y"
    fi
    let indx=0
    while [[ indx -lt numVariables ]]; do
        variable="${variables[indx]}"
        if [ "$acceptAllVariables" ] || [[ "$legalVariables" =~ " $variable " ]]; then
            value="${values[indx]}"
            reportDebug "Setting variable $variable to value $value"
            export "$variable"="$value"
        else
            illegalsPresent="${illegalsPresent:+$illegalsPresent }--$variable"
        fi
        let indx+=1
    done

    if [ "$illegalsPresent" ]; then
        reportError "Illegal parameter(s): $illegalsPresent"
    fi

    if [ "$mandatoriesMissing" ]; then
        reportError "Mandatory parameter(s) missing: $mandatoriesMissing"
    fi

    if [ ! "$silence" ] && [ "$optionalsOmitted" ]; then
        reportInfo "Optional parameter(s) omitted: $optionalsOmitted"
    fi

    if [ "$illegalsPresent" ] || [ "$mandatoriesMissing" ]; then
        exit 1
    fi

    # Unset extra parameters to this function
    unset mandatories
    unset optionals
    unset silence
}

# parseEntry(<name>)
# Sets name entry type.
#
# Call appropriate parse*(<name>).
#
parseEntry() {
    reportDebugFuncEntry "$*" "config"

    name="$1" ; [ "$name" ] || { reportError "No name passed" ; return 1 ; }

    entry="$(entryReader "$name" "$config")"
    type="${entry%%[[:space:]]*}"
    tokenValidator type || return 1

    parse$(capsFirst "$type") "$name"

    return $?
}

# parseGroup(<name>)
# Sets name members.
#
# Read group entry <name> from <config>.
#
parseGroup() {
    reportDebugFuncEntry "$*"

    local opts

    name="$1" ; [ "$name" ] || { reportError "No name passed" ; return 1 ; }

    # Source group extra options from global settings.
    opts="$syscfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then
        . "$opts"
    fi

    # Source group extra options from local settings (might override global options).
    opts="$usrcfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then
        . "$opts"
    fi

    tokenReader setVars "$name" "members" || return 1

    return 0
}

# parseHost(<name>)
# Sets name osmt acmt exmt user admin addr vrmt upwd apwd.
#
# Read host entry <name> from <config>.
#
parseHost() {
    reportDebugFuncEntry "$*"

    local opts

    name="$1" ; [ "$name" ] || { reportError "No name passed" ; return 1 ; }

    # Read all key values and set them.
    tokenReader setVars "$name" "osmt,acmt,exmt,user,admin,addr,vrmt" || return 1
    port="none" ; host="none" ; svmt="none"

    # Validate all key values.
    tokenValidator "type,name,osmt,acmt,exmt,user,admin,addr,vrmt,port,host,svmt" || return 1

    # If an entry is about the local system, rewrite $privesc and $privy with correct admin user.
    if isLoopback "$addr" || isLocal "$name" ; then
        reportDebug "Rewriting privesc to $privesc"
        privesc="$(echo "$privesc" | sed -e "s|root|$admin|g" -e "s|administrator|$admin|g")"
        [ "$privy" ] && privy="$privesc"
    fi

    # Initialize os specific globals.
    osGlobals "$osmt" || return 1

    # Check for global password files and set variables.
    if [ -e "$syscfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$syscfd/sys/$name/user.pwd")"
    fi
    if [ -e "$syscfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$syscfd/sys/$name/admin.pwd")"
    fi

    # Check for local password files and set variables (might override global options).
    if [ -e "$usrcfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$name/user.pwd")"
    fi
    if [ -e "$usrcfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$name/admin.pwd")"
    fi

    # Source host extra options from global settings.
    opts="$syscfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then
        . "$opts"
    fi

    # Source host extra options from local settings (might override global options).
    opts="$usrcfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then
        . "$opts"
    fi

    return 0
}

# parseGuest(<name>)
# Sets name osmt acmt exmt user admin addr port host vrmt upwd apwd.
#
# Read guest entry <name> from <config>.
#
parseGuest() {
    reportDebugFuncEntry "$*"

    local opts

    name="$1" ; [ "$name" ] || { reportError "No name passed" ; return 1 ; }

    # Read all key values and set them.
    tokenReader setVars "$name" "osmt,acmt,exmt,user,admin,addr,host" || return 1
    tokenReader setVars "$host" "vrmt" || return 1
    port="none" ; svmt="none"

    # Validate all key values.
    tokenValidator "type,name,osmt,acmt,exmt,user,admin,addr,host,vrmt,port,svmt" || return 1

    # If an entry is about the local system, rewrite $privesc and $privy with correct admin user.
    if isLoopback "$addr" || isLocal "$name" ; then
        reportDebug "Rewriting privesc to $privesc"
        privesc="$(echo "$privesc" | sed -e "s|root|$admin|g" -e "s|administrator|$admin|g")"
        [ "$privy" ] && privy="$privesc"
    fi

    # Initialize os specific globals
    osGlobals "$osmt" || return 1

    # Check for global password files and set variables.
    if [ -e "$syscfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$syscfd/sys/$name/user.pwd")"
    fi
    if [ -e "$syscfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$syscfd/sys/$name/admin.pwd")"
    fi

    # Check for local password files and set variables (might override global options).
    if [ -e "$usrcfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$name/user.pwd")"
    fi
    if [ -e "$usrcfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$name/admin.pwd")"
    fi

    # Source both parent host and guest extra options from global settings.
    opts="$syscfd/sys/$host/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi
    opts="$syscfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi

    # Source both parent host and guest extra options from local settings.
    opts="$usrcfd/sys/$host/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi
    opts="$usrcfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi

    return 0
}

# parseService(<name>)
# Sets name osmt acmt exmt user admin addr port host vrmt upwd apwd.
#
# Read service entry <name> from <config>.
#
parseService() {
    reportDebugFuncEntry "$*"

    local opts
    local value
    local htype

    name="$1" ; [ "$name" ] || { reportError "No name passed" ; return 1 ; }

    # Read all key values and set them.
    tokenReader setVars "$name" "svmt,acmt,exmt,user,addr,port,host" || return 1
    osmt="none" ; admin="none" ; vrmt="none"

    # Inherit parent host values. The vrmt value is only inherited if parent type is host.
    htype="$(tokenReader printVals "$host" type)"
    for key in osmt vrmt acmt exmt user admin addr; do
        value="${!key}"
        if [ "$htype" = "host" -a "$key" = "vrmt" ]; then
            tokenReader setVars "$host" "$key" || return 1
        elif [ "$value" = "none" -a "$key" != "vrmt" ]; then
            tokenReader setVars "$host" "$key" || return 1
        fi
    done

    # Validate all key values.
    tokenValidator "type,name,svmt,acmt,exmt,user,addr,port,host,osmt,admin,vrmt" || return 1

    # If an entry is about the local system, rewrite $privesc and $privy with correct service user.
    if isLoopback "$addr" || isLocal "$name" ; then
        reportDebug "Rewriting privesc to $privesc"
        privesc="$(echo "$privesc" | sed -e "s|root|$user|g" -e "s|administrator|$user|g")"
        [ "$privy" ] && privy="$privesc"
    fi

    # Check for global password files and set variables.
    if [ -e "$syscfd/sys/$host/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$syscfd/sys/$host/user.pwd")"
    fi
    if [ -e "$syscfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$syscfd/sys/$name/user.pwd")"
    fi
    if [ -e "$syscfd/sys/$host/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$syscfd/sys/$host/admin.pwd")"
    fi
    if [ -e "$syscfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$syscfd/sys/$name/admin.pwd")"
    fi

    # Check for local password files and set variables (might override global options).
    if [ -e "$usrcfd/sys/$host/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$host/user.pwd")"
    fi
    if [ -e "$usrcfd/sys/$name/user.pwd" ]; then
        upwd="$(tr -d '\r' < "$usrcfd/sys/$name/user.pwd")"
    fi
    if [ -e "$usrcfd/sys/$host/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$host/admin.pwd")"
    fi
    if [ -e "$usrcfd/sys/$name/admin.pwd" ]; then
        apwd="$(tr -d '\r' < "$usrcfd/sys/$name/admin.pwd")"
    fi

    # Source both parent host and service extra options from global settings.
    opts="$syscfd/sys/$host/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi
    opts="$syscfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi

    # Source both parent host and service extra options from local settings.
    opts="$usrcfd/sys/$host/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi
    opts="$usrcfd/sys/$name/options.conf"
    if [ -e "$opts" ]; then . "$opts" ; fi

    return 0
}

# checkState()
#
# Check the state of a host, guest or service.
# Also, initialize state variables and variables in options.conf.
#
checkState() {
    reportDebugFuncEntry "$*" "type acmt exmt"

    acstate="unset"
    exstate="unset"
    svstate="unset"
    vmstate="unset"
    state="unset"

    # Determine if we're sane.
    if [ ! "$type" ]; then
        reportError "Variable type not set"
        return 1
    elif [ "$type" = "group" ]; then
        reportError "Passed invalid type $type"
        return 1
    fi

    # Invoke state handlers to set acstate and exstate.
    ${acmt}AccessHandler state
    if [ "$acmt" = "$exmt" ]; then
        exstate="$acstate"
    else
        ${exmt}ExecHandler state
    fi

    if [ "$type" = "host" ]; then
        if [ "$acstate" = "active" -a "$exstate" = "active" ]; then
            state="on"
        elif [ "$acstate" = "active" -a "$exstate" = "none" ]; then
            state="on"
        elif [ "$acstate" = "none" -a "$exstate" = "active" ]; then
            state="on"
        elif [ "$acstate" = "inactive" -a "$exstate" = "inactive" ]; then
            state="unreachable"
        elif [ "$acstate" = "inactive" -a "$exstate" = "none" ]; then
            state="unreachable"
        elif [ "$acstate" = "none" -a "$exstate" = "inactive" ]; then
            state="unreachable"
        elif [ "$acstate" = "none" -a "$exstate" = "none" ]; then
            state="unreachable"
        else
            state="busy"
        fi

    elif [ "$type" = "guest" ]; then
        if [ "$acstate" = "active" -a "$exstate" = "active" ]; then
            state="on"
        elif [ "$acstate" = "active" -a "$exstate" = "none" ]; then
            state="on"
        elif [ "$acstate" = "none" -a "$exstate" = "active" ]; then
            state="on"
        else
            local parentstate="$(parseEntry "$host" ; checkState ; echo "$state")"
            if [ "$parentstate" = "on" ]; then
                ${vrmt}VirtHandler state
                if [ "$vmstate" = "active" ]; then
                    state="busy"
                elif [ "$vmstate" = "inactive" ] ;then
                    state="off"
                else
                    state="$vmstate"
                fi
            else
                state="$parentstate"
            fi
        fi

    elif [ "$type" = "service" ]; then
        ${svmt}ServiceHandler state
        if [ "$svstate" = "active" ]; then
            state="on"
        elif [ "$svrunning" = "active" -a "$port" = "none" ]; then
            state="on"
        elif [ "$svrunning" = "inactive" -a "$port" = "none" ]; then
            state="off"
        elif [ "$svrunning" = "active" -a "$svlistening" = "active" ]; then
            state="on"
        elif [ "$svrunning" = "inactive" -a "$svlistening" = "inactive" ]; then
            state="off"
        elif [ "$svstate" = "unknown" ]; then
            state="unknown"
        else
            state="busy"
        fi
    fi
}

# startEntity()
#
# Start a system by means of the appropriate VirtHandler.
#
startEntity() {
    reportDebugFuncEntry "$*" "execute type"

    if [ "$execute" != "true" ]; then
        reportError "Required execute functions disabled; set to 1 in $usropts or $sysopts or make sure your have the required executables; executables required: $tools_execute; executables detected: $tools_execute_found"
        return 1
    fi

    if [ "$type" = "host" ]; then
        noneVirtHandler start
    elif [ "$type" = "guest" ]; then
        ${vrmt}VirtHandler start
    elif [ "$type" = "service" ]; then
        ${svmt}ServiceHandler start
    else
        reportError "Unknown type $type passed"
        return 1
    fi

    return 0
}

# stopEntity()
#
# Stop a system by means of the appropriate VirtHandler.
#
stopEntity() {
    reportDebugFuncEntry "$*" "execute type"

    if [ "$execute" != "true" ]; then
        reportError "Required execute functions disabled; set execute to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_execute; executables detected: $tools_execute_found"
        return 1
    fi

    if [ "$type" = "host" ]; then
        noneVirtHandler stop
    elif [ "$type" = "guest" ]; then
        ${vrmt}VirtHandler stop
    elif [ "$type" = "service" ]; then
        ${svmt}ServiceHandler stop
    else
        reportError "Unknown type $type passed"
        return 1
    fi

    return 0
}

# restartEntity()
#
# Restart a system by means of the appropriate VirtHandler
#
restartEntity() {
    reportDebugFuncEntry "$*" "execute type"

    if [ "$execute" != "true" ]; then
        reportError "Required execute functions disabled; set execute to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_execute; executables detected: $tools_execute_found"
        return 1
    fi

    if [ "$type" = "host" ]; then
        noneVirtHandler restart
    elif [ "$type" = "guest" ]; then
        ${vrmt}VirtHandler restart
    elif [ "$type" = "service" ]; then
        ${svmt}ServiceHandler restart
    else
        reportError "Unknown type $type passed"
        return 1
    fi

    return 0
}

# createEntity()
#
# Create a system by means of the appropriate VirtHandler.
#
createEntity() {
    reportDebugFuncEntry "$*" "execute send type"

    if [ "$execute" != "true" ]; then
        reportError "Required execute functions disabled; set execute to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_execute; executables detected: $tools_execute_found"
        return 1
    fi

    if [ "$send" != "true" ]; then
        reportError "Required send functions disabled; set send to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_send; executables detected: $tools_send_found"
        return 1
    fi

    if [ "$type" = "host" ]; then
        noneVirtHandler create
    elif [ "$type" = "guest" ]; then
        ${vrmt}VirtHandler create
    else
        reportError "Unknown type $type passed"
        return 1
    fi

    return 0
}

# destroyEntity()
#
# Destroy a system by means of the appropriate VirtHandler.
#
destroyEntity() {
    reportDebugFuncEntry "$*" "execute destroy type"

    if [ "$execute" != "true" ]; then
        reportError "Required execute functions disabled; set execute to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_execute; executables detected: $tools_execute_found"
        return 1
    fi

    if [ "$destroy" != "true" ]; then
        reportError "Required destroy functions disabled; set destroy to 1 in $usropts or in $sysopts to enable"
        return 1
    fi

    if [ "$type" = "host" ]; then
        noneVirtHandler destroy
    elif [ "$type" = "guest" ]; then
        ${vrmt}VirtHandler destroy
    else
        reportError "Unknown type $type passed"
        return 1
    fi

    return 0
}

# accessEntity()
# Sets xsasuser xsasupwd.
#
# Access a system by means of the appropriate AccessHandler.
#
accessEntity() {
    reportDebugFuncEntry "$*" "acmt access xsastype user upwd admin apwd"

    if [ "$access" != "true" ]; then
        reportError "Required access functions disabled; set access to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_access; executables detected: $tools_access_found"
        return 1
    fi

    if [ "$xsastype" = "service" -o "$xsastype" = "user" ]; then
        xsasuser="$user"
        xsasupwd="$upwd"
    elif [ "$xsastype" = "admin" ]; then
        xsasuser="$admin"
        xsasapwd="$apwd"
    fi

    if [ "$type" ]; then
        ${acmt}AccessHandler access
        return $?
    else
        reportError "Unknown type $type passed"
        return 1
    fi
}

# runAs()
#
# Send a command to a system by means of the appropriate ExecHandler.
#
runAs() {
    reportDebugFuncEntry "$*" "execute exmt runastype"

    if [ "$execute" != "true" ]; then
        reportError "Required execute functions disabled; set execute to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_execute; executables detected: $tools_execute_found"
        return 1
    fi

    if [ "$type" ]; then
        ${exmt}ExecHandler "runas${runastype}"
        return $?
    else
        reportError "Unknown type $type passed"
        return 1
    fi
}

# sendAs()
#
# Send a file or directory to a system by means of the appropriate ExecHandler.
#
sendAs() {
    reportDebugFuncEntry "$*" "send exmt sendastype"

    if [ "$send" != "true" ]; then
        reportError "Required send functions disabled; set send to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_send; executables detected: $tools_send_found"
        return 1
    fi

    if [ "$type" ]; then
        ${exmt}ExecHandler "sendas${sendastype}"
        return $?
    else
        reportError "Unknown type $type passed"
        return 1
    fi
}

# credAs()
#
# FIXME: Write desription here
#
credAs() {
    reportDebugFuncEntry "$*" "execute type exmt acmt addr"

    local list
    local crmt
    local retval

    if [ "$execute" != "true" ]; then
        reportError "Required execute functions disabled; set execute to 1 in $usropts or in $sysopts or make sure your have the required executables; executables required: $tools_execute; executables detected: $tools_execute_found"
        return 1
    fi

    if [ "$exmt" = "none" -a "$type" = "service" ]; then
        exmt="$(parseEntry "$host" ; echo "$exmt")"
        reportInfo "Inherited execute method ($exmt) from parent $host"
    fi

    if [ "$acmt" = "none" -a "$type" = "service" ]; then
        acmt="$(parseEntry "$host" ; echo "$acmt")"
        reportInfo "Inherited access method ($acmt) from parent $host"
    fi

    if [ "$addr" = "none" -a "$type" = "service" ]; then
        addr="$(parseEntry "$host" ; echo "$addr")"
        reportInfo "Inherited address ($addr) from parent $host"
    fi

    if [ "$exmt" = "none" -a "$acmt" = "none" ]; then
        reportError "Both execute method and access method are \"none\"; cannot send or store credentials without one of these"
        return 1
    elif [ "$exmt" = "ssh" -a "$acmt" = "rdp" ]; then
        list="ssh win"
    elif [ "$exmt" = "smb" -a "$acmt" = "ssh" ]; then
        list="ssh win"
    elif [ "$exmt" = "ssh" -o "$acmt" = "ssh" ]; then
        list="ssh"
    elif [ "$exmt" = "smb" -o "$acmt" = "rdp" ]; then
        list="win"
    fi

    retval=0
    for crmt in $list ; do
        ${crmt}CredHandler "as${type}"
        [ "$?" = 0 ] || retval=1
    done

    return $retval
}

# noneVirtHandler()
# Sets state vmstate.
#
# Handle non-vm-host related commands.
#
noneVirtHandler() {
    reportDebugFuncEntry "$*" "state destroy"

    case "$1" in
      state)
        vmstate="none"
        ;;
      start)
        reportError "Not implemented: I don't know how to start a physical system"
        return 1
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) >/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) >/dev/null
            state="restarting"
        fi
        ;;
      create)
        reportError "Not implemented: I don't know how to create a physical system"
        return 1
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            reportError "Not implemented: I don't know how to destroy a physical system"
            return 1
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# kvmVirtHandler()
# Sets state vmstate.
#
# Handle KVM virtual machine related commands.
#
kvmVirtHandler() {
    reportDebugFuncEntry "$*" "name host state vrmt memsize destroy"

    local result
    local template
    local answer
    declare -i memsizeInKiB=memsize*1024

    case "$1" in
      state)
        result="$(command="virsh domstate \"$name\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin)"
        case "$result" in
          *running*)
            vmstate="active"
            ;;
          *"shut off"*)
            vmstate="inactive"
            ;;
          *)
            vmstate="non-existing"
            ;;
        esac
        ;;
      start)
        if [ "$state" = "off" ]; then
            (command="virsh start \"$name\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="booting"
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="restarting"
        fi
        ;;
      create)
        # Check for global template, override with local if exists.
        if [ -e "$syscfd/tpl/$vrmt.stf" ]; then
            template="$syscfd/tpl/$vrmt.stf"
        fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            template="$usrcfd/tpl/$vrmt.stf"
        fi

        # Create virtual machine configuration.
        if [ -e "$template" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen "$vrmt"
            cat "$template" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsizeInKiB|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > "$usrcfd/sys/$name/$name.xml"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.xml" "$usrcfd/tmp/session.create.$name"
            (source="$usrcfd/tmp/session.create.$name/$name.xml" target="$vmdata/qemu" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler sendasadmin) 2>/dev/null
            rm -f "$usrcfd/tmp/session.create.$name/$name.xml"
            rmdir "$usrcfd/tmp/session.create.$name"
            (command="\"$vmhome/qemu-img\" create -f qcow2 \"$vmdata/images/$name.img\" ${dsksize}G" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            (command="\"$vmhome/virsh\" define \"$vmdata/qemu/$name.xml\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="created"
        else
            reportError "Config template for $vrmt style guest not found: need either $usrcfd/tpl/$vrmt.stf or $syscfd/tpl/$vrmt.stf"
            return 1
        fi
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            if [ "$state" = "off" ]; then
                echo -n "You are about to delete and destroy $name. Are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    (command="\"$vmhome/virsh\" undefine \"$name\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
                    (command="rm -f \"$vmdata/qemu/$name.xml\" \"$vmdata/qemu/$name.log*\" \"$vmdata/images/$name.img\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
                    state="destroyed"
                else
                    state="saved"
                fi
            fi
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# hpvmVirtHandler()
# Sets state vmstate.
#
# Handle HPVM virtual machine related commands.
#
hpvmVirtHandler() {
    reportDebugFuncEntry "$*" "name host state destroy"

    local result

    case "$1" in
      state)
        result="$(command="/opt/hpvm/bin/hpvmstatus -P \"$name\" | grep \"^$name\" | awk '{print \$4}'" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin)"
        case "$result" in
          *On*)
            vmstate="active"
            ;;
          *Off*)
            vmstate="inactive"
            ;;
          *)
            vmstate="non-existing"
            ;;
        esac
        ;;
      start)
        if [ "$state" = "off" ]; then
            (command="/opt/hpvm/bin/hpvmstart -P \"$name\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="booting"
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="restarting"
        fi
        ;;
      create)
        reportError "Haven't implemented $1 yet"
        return 1
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            reportError "Haven't implemented $1 yet"
            return 1
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# xenVirtHandler()
# Sets state vmstate.
#
# Handle XEN virtual machine related commands.
#
xenVirtHandler() {
    reportDebugFuncEntry "$*" "name host state destroy"

    local result

    case "$1" in
      state)
        # FIXME: Parse the fifth (state) column to determine the state
        result="$(command="xm list \"$name\" | grep \"^$name\" | awk '{print \$1}'" ; parseEntry "$host" ; checkState ;${exmt}ExecHandler runasadmin)"
        if [ "$result" ]; then
            vmstate="active"
        else
            vmstate="non-existing"
        fi
        ;;
      start)
        if [ "$state" = "off" ]; then
            (command="xm create \"$name\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="booting"
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="restarting"
        fi
        ;;
      create)
        reportError "Haven't implemented $1 yet"
        return 1
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            reportError "Haven't implemented $1 yet"
            return 1
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# vboxVirtHandler()
# Sets state vmstate.
#
# Handle VirtualBox virtual machine related commands.
#
vboxVirtHandler() {
    reportDebugFuncEntry "$*" "name host state destroy"

    local result

    case "$1" in
      state)
        result="$(command="\"$vmhome/VboxManage\" list runningvms" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser)"
        case "$result" in
          *"$name"*)
            vmstate="active"
            ;;
          *)
            (command="\"$vmhome/VboxManage\" showvminfo \"$name\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser) 2>/dev/null
            if [ "$?" = 0 ]; then
                vmstate="inactive"
            else
                vmstate="non-existing"
            fi
            ;;
        esac
        ;;
      start)
        if [ "$state" = "off" ]; then
            (command="\"$vmhome/VboxManage\" startvm \"$name\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser) 2>/dev/null
            state="booting"
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="restarting"
        fi
        ;;
      create)
        reportError "Haven't implemented $1 yet"
        return 1
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            reportError "Haven't implemented $1 yet"
            return 1
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# vmwVirtHandler()
# Sets state vmstate.
#
# Handle VMware Workstation virtual machine related commands.
#
vmwVirtHandler() {
    reportDebugFuncEntry "$*" "host name state vrmt memsize destroy"

    local result
    local template
    local answer

    case "$1" in
      state)
        result="$(command="\"$vmhome/vmrun\" list" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser)"
        case "$result" in
          *"$name"*)
            vmstate="active"
            ;;
          *)
            result="$(command="\"$vmhome/vmrun\" listSnapshots \"$vmdata/$name/$name.vmx\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser)"
            case "$result" in
              *"Error: Cannot open VM"*)
                vmstate="non-existing"
                ;;
              *)
                vmstate="inactive"
                ;;
            esac
            ;;
        esac
        ;;
      start)
        if [ "$state" = "off" ]; then
            result=$(command="\"$vmhome/vmrun\" start \"$vmdata/$name/$name.vmx\" nogui" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser)
            case "$result" in
              *"Error: The file is already in use"*)
                reportError "Failed to start $name because it is in-use. Try closing $name in your gui"
                state="aborted"
                ;;
              *)
                state="booting"
                ;;
            esac
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="restarting"
        fi
        ;;
      create)
        # Check for global template, override with local if exists.
        if [ -e "$syscfd/tpl/$vrmt.stf" ]; then
            template="$syscfd/tpl/$vrmt.stf"
        fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            template="$usrcfd/tpl/$vrmt.stf"
        fi

        # Create virtual machine configuration
        if [ -e "$template" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen "$vrmt"
            cat "$template" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > "$usrcfd/sys/$name/$name.vmx"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.vmx" "$usrcfd/tmp/session.create.$name"
            (source="$usrcfd/tmp/session.create.$name" target="$vmdata/$name" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler sendasuser) 2>/dev/null
            rm -f "$usrcfd/tmp/session.create.$name/$name.vmx"
            rmdir "$usrcfd/tmp/session.create.$name"
            (command="\"$vmhome/vmware-vdiskmanager\" -c -s ${dsksize}GB -a ide -t 0 \"$vmdata/$name/$name.vmdk\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser) 2>/dev/null
            state="created"
        else
            reportError "Config template for $vrmt style guest not found: need either $usrcfd/tpl/$vrmt.stf or $syscfd/tpl/$vrmt.stf"
            return 1
        fi
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            if [ "$state" = "off" ]; then
                echo -n "You are about to delete and destroy $name. Are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    (command="\"$vmhome/vmrun\" deleteVM \"$vmdata/$name/$name.vmx\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser) 2>/dev/null
                    state="destroyed"
                else
                    state="saved"
                fi
            fi
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# vmfVirtHandler()
# Sets state vmstate.
#
# Handle VMware Fusion virtual machine related commands.
#
vmfVirtHandler() {
    reportDebugFuncEntry "$*" "name host state vrmt memsize destroy"

    local result
    local template
    local answer

    case "$1" in
      state)
        result="$(command="\"$vmhome/vmrun\" list" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser)"
        case "$result" in
          *"$name"*)
            vmstate="active"
            ;;
          *)
            result="$(command="\"$vmhome/vmrun\" listSnapshots \"$vmdata/$name.vmwarevm/$name.vmx\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser)"
            case "$result" in
              *"Error: Cannot open VM"*)
                vmstate="inactive"
                ;;
              *)
                vmstate="non-existing"
                ;;
            esac
            ;;
        esac
        ;;
      start)
        if [ "$state" = "off" ]; then
            (command="\"$vmhome/vmrun\" start \"$vmdata/$name.vmwarevm/$name.vmx\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser) 2>/dev/null
            state="booting"
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="restarting"
        fi
        ;;
      create)
        # Check for global template, override with local if exists.
        if [ -e "$syscfd/tpl/$vrmt.stf" ]; then
            template="$syscfd/tpl/$vrmt.stf"
        fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            template="$usrcfd/tpl/$vrmt.stf"
        fi

        # Create virtual machine configuration
        if [ -e "$template" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen "$vrmt"
            cat "$template" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > "$usrcfd/sys/$name/$name.vmx"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.vmx" "$usrcfd/tmp/session.create.$name"
            (source="$usrcfd/tmp/session.create.$name" target="$vmdata/$name" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler sendasuser) 2>/dev/null
            rm -f "$usrcfd/tmp/session.create.$name/$name.vmx"
            rmdir "$usrcfd/tmp/session.create.$name"
            (command="\"$vmhome/vmware-vdiskmanager\" -c -s ${dsksize}GB -a ide -t 0 \"$vmdata/$name.vmwarevm/$name.vmdk\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser) 2>/dev/null
            state="created"
        else
            reportError "Config template for $vrmt style guest not found: need either $usrcfd/tpl/$vrmt.stf or $syscfd/tpl/$vrmt.stf"
            return 1
        fi
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            if [ "$state" = "off" ]; then
                echo -n "You are about to delete and destroy $name. Are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    (command="\"$vmhome/vmrun\" deleteVM \"$vmdata/$name.vmwarevm/$name.vmx\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasuser) 2>/dev/null
                    state="destroyed"
                else
                    state="saved"
                fi
            fi
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# esxVirtHandler()
# Sets state vmstate.
#
# Handle VMware ESX(i) virtual machine related commands.
#
esxVirtHandler() {
    reportDebugFuncEntry "$*" "name host state vrmt memsize destroy"

    local result
    local template
    local answer

    case "$1" in
      state)
        result="$(command='vim-cmd vmsvc/power.getstate $(vim-cmd vmsvc/getallvms | grep '"$name"' | cut -f 1) | grep Powered' ; parseEntry "$host" ; checkState ;  ${exmt}ExecHandler runasadmin)"
        case "$result" in
          *"Powered on"*)
            vmstate="active"
            ;;
          *"Powered off"*)
            vmstate="inactive"
            ;;
          *)
            vmstate="non-existing"
            ;;
        esac
        ;;
      start)
        if [ "$state" = "off" ]; then
            (command='vim-cmd vmsvc/power.on $(vim-cmd vmsvc/getallvms | grep '"$name"' | cut -f 1)' ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="booting"
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$osstop" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="stopping"
        fi
        ;;
      restart)
        if [ "$state" = "on" ]; then
            (command="$osreboot" ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="restarting"
        fi
        ;;
      create)
        # Check for global template, override with local if exists.
        if [ -e "$syscfd/tpl/$vrmt.stf" ]; then
            template="$syscfd/tpl/$vrmt.stf"
        fi
        if [ -e "$usrcfd/tpl/$vrmt.stf" ]; then
            template="$usrcfd/tpl/$vrmt.stf"
        fi

        # Create virtual machine configuration
        if [ -e "$template" ]; then
            mkdir -p "$usrcfd/sys/$name"
            macGen "$vrmt"
            cat "$template" \
                | sed "s|GUEST_NAME|$name|g" \
                | sed "s|GUEST_DESC|$desc|g" \
                | sed "s|GUEST_OS|$guestos|g" \
                | sed "s|GUEST_NUMVCPU|$numvcpu|g" \
                | sed "s|GUEST_MEMSIZE|$memsize|g" \
                | sed "s|GUEST_MACADDR|$macaddr|g" \
                > "$usrcfd/sys/$name/$name.vmx"
            mkdir "$usrcfd/tmp/session.create.$name"
            cp "$usrcfd/sys/$name/$name.vmx" "$usrcfd/tmp/session.create.$name"
            (source="$usrcfd/tmp/session.create.$name" target="$vmdata/$name" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler sendasadmin) 2>/dev/null
            rm -f "$usrcfd/tmp/session.create.$name/$name.vmx"
            rmdir "$usrcfd/tmp/session.create.$name"
            (command="/sbin/vmkfstools -c ${dsksize}G \"$vmdata/$name/$name.vmdk\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            (command="vim-cmd solo/registervm \"$vmdata/$name/$name.vmx\"" ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
            state="created"
        else
            reportError "Config template for $vrmt style guest not found: need either $usrcfd/tpl/$vrmt.stf or $syscfd/tpl/$vrmt.stf"
            return 1
        fi
        ;;
      destroy)
        if [ "$destroy" = "true" ]; then
            if [ "$state" = "off" ]; then
                echo -n "You are about to delete and destroy $name. Are you sure? (y|n): "
                read answer
                if [ "$answer" = "y" -o "$answer" = "Y" ]; then
                    (command='vim-cmd vmsvc/destroy $(vim-cmd vmsvc/getallvms | grep '"$name"' | cut -f 1)' ; parseEntry "$host" ; checkState ; ${exmt}ExecHandler runasadmin) 2>/dev/null
                    state="destroyed"
                else
                    state="saved"
                fi
            fi
        else
            reportError "Destroy is disabled"
            return 1
        fi
        ;;
    esac

    return 0
}

# noneServiceHandler() - Handle services that are of type none.
noneServiceHandler() {
    reportDebugFuncEntry "$*"

    case "$1" in
      state)
        svstate="none"
        ;;
      start|stop|restart)
        reportError "No service method defined for this service"
        return 1
        ;;
    esac

    return 0
}

# scriptedServiceHandler()
# Sets svstate svrunning svlistening.
#
# Handle regular services with svstatus, svstart and svstop.
#
scriptedServiceHandler() {
    reportDebugFuncEntry "$*" "name addr port state svstatus oslisten"

    local result
    local retval

    osGlobals
    if [ ! "$svstatus" -a ! "$oslisten" ]; then
        reportError "Neither svstatus nor oslisten is set for $name"
        return 1
    fi

    case "$1" in
      state)
        # Set initial svstate.
        svstate="unset"
        svrunning="unset"
        svlistening="unset"

        result="$(printPortState "$addr" "$port")"
        if [ "$result" = "open" ]; then
            reportDebug "Service is listening on $addr:$port"
            svstate="active"
        else
            reportDebug "Service is not directly reachable, determine svrunning by sending svstatus command to $host"
            result="$(command="$svstatus" ; ${exmt}ExecHandler runasservice)"
            retval="$?" # from ExecHandler command
            if [ "$retval" != 0 ]; then
                reportDebug "Got return $retval from ${exmt}ExecHandler (on $name)"
                svstate="unknown"
                svrunning="unknown"
            fi
            if [ ! "$result" ]; then
                reportDebug "Service got no result from svstatus command, svrunning is inactive: $result"
                svstate="inactive"
                svrunning="inactive"
            elif [ "$result" ]; then
                reportDebug "Service got result from svstatus command, svrunning is active"
                svstate="active"
                svrunning="active"
            fi

            # And svlistening, if we have addr and port.
            if [ "$addr" != "none" -a "$port" != "none" ]; then
                reportDebug "Service is not directly reachable, determine svlistening by sending oslisten command to $host"
                result="$(command="$oslisten" ; ${exmt}ExecHandler runasservice)"
                retval="$?" # from ExecHandler command
                if [ "$retval" != 0 ]; then
                    reportDebug "Got return $retval from ${exmt}ExecHandler (on $name)"
                    svstate="unknown"
                    svlistening="unknown"
                fi
                if [ ! "$result" ]; then
                    reportDebug "Service got no result from oslisten command, svlistening is inactive"
                    svstate="inactive"
                    svlistening="inactive"
                elif [ "$result" ]; then
                    reportDebug "Service got result from oslisten command, svlistening is active"
                    svstate="active"
                    svlistening="active"
                fi
            fi
        fi
        ;;
      start)
        if [ "$state" = "off" ]; then
            (command="$svstart" ; ${exmt}ExecHandler runasservice) 2>/dev/null
            state="starting"
        else
            reportInfo "State of service on $name was not off but $state"
        fi
        ;;
      stop)
        if [ "$state" = "on" ]; then
            (command="$svstop" ; ${exmt}ExecHandler runasservice) 2>/dev/null
            state="stopping"
        else
            reportInfo "State of service on $name was not on but $state"
        fi
        ;;
      restart)
        scriptedServiceHandler state
        scriptedServiceHandler stop
        scriptedServiceHandler state
        scriptedServiceHandler start
        ;;
    esac

    return 0
}

# waitForDialog(<triggerProcess> <dialogProcess>)
#
# Waits for a dialog to close.
#
waitForDialog() {
    reportDebugFuncEntry "$*"

    local triggerProcess="$1"
    local dialogProcess="$2"
    local promptActive
    local detected

    if [ "$platform" = "linux" -o "$platform" = "macosx" ]; then
        local pslist="ps ax"
    elif [ "$platform" = "windows" ]; then
        local pslist="tasklist"
    else
        reportError "Unknown platform specified: $platform"
        return 1
    fi

    [ "$triggerProcess" ] || { reportError "No trigger process specified" ; return 1 ; }

    if [ "$dialogProcess" ]; then
        detected="$($pslist | grep "$triggerProcess" | grep -v grep)"
        if [ "$detected" ]; then
            reportDebug "Detected $triggerProcess"
            sleep 1
            promptActive="$($pslist | grep "$dialogProcess" | grep -v grep)"
            while [ "$promptActive" ]; do
                promptActive="$($pslist | grep "$dialogProcess" | grep -v grep)"
                reportDebug "Waiting for $dialogProcess to close"
                sleep 1
            done
        fi
    else
        reportDebug "No dialog process specified to wait for, simply waiting for 10 seconds"
        sleep 10
    fi
}

# puttyTerminalHandler()
#
# Handle PuTTY terminal parameterization.
#
puttyTerminalHandler() {
    reportDebugFuncEntry "$*" "name addr sshopts xsasuser"

    local protocol="$1"
    local command

    assertPlatformIsWindows

    if [ "$protocol" = "ssh" ]; then
        command="putty $sshopts $xsasuser@$addr"
    elif [ "$protocol" = "tel" ]; then
        command="putty -telnet $addr"
    else
        reportError "Invalid protocol type passed: $protocol; valid types are: tel ssh"
        return 1
    fi

    if [ "$titling" ]; then
        printf %s "\
        @echo off
        reg delete \"HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%%20Settings\" /v \"WinTitle\" /f > nul 2>&1
        reg add \"HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%%20Settings\" /t REG_SZ /v \"WinTitle\" /d \"$(capsFirst "$name")\" > nul 2>&1
        start /b $command
        echo wscript.sleep 1000 > \"%TEMP%\\wait.vbs\"
        wscript.exe \"%TEMP%\\wait.vbs\"
        del \"%TEMP%\\wait.vbs\"
        reg delete \"HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%%20Settings\" /v \"WinTitle\" /f > nul 2>&1
        reg add \"HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\Default%%20Settings\" /t REG_SZ /v \"WinTitle\" > nul 2>&1
        " | sed 's/^[[:space:]]*//' > "$usrcfd/tmp/session.putty.$name.bat"
    else
        printf %s "\
        @echo off
        start /b $command
        " | sed 's/^[[:space:]]*//' > "$usrcfd/tmp/session.putty.$name.bat"
    fi

    cmd.exe /c \""$(toWindowsPath "$usrcfd/tmp/session.putty.$name.bat")"\"
    rm "$usrcfd/tmp/session.putty.$name.bat"

    return 0
}

# appleTerminalHandler()
#
# Handle Apple Terminal parameterization.
#
appleTerminalHandler() {
    reportDebugFuncEntry "$*" "name addr sshopts xsasuser"

    local protocol="$1"
    local command
    local title="$(capsFirst "$name")"

    if [ "$protocol" = "ssh" ]; then
        command="ssh $sshopts -Y $xsasuser@$addr"
    elif [ "$protocol" = "tel" ]; then
        command="telnet $addr"
    else
        reportError "Invalid protocol type passed: $protocol; valid types are: tel ssh"
        return 1
    fi

    # Handle tab creation and run connection command.
    echo "activate application \"Terminal\"" > "$usrcfd/tmp/session.access.$name.scpt"
    echo "tell application \"Terminal\"" >> "$usrcfd/tmp/session.access.$name.scpt"
    echo "tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down" >> "$usrcfd/tmp/session.access.$name.scpt"
    echo "do script \"$command\" in last tab of front window" >> "$usrcfd/tmp/session.access.$name.scpt"
    echo "end tell" >> "$usrcfd/tmp/session.access.$name.scpt"
    osascript "$usrcfd/tmp/session.access.$name.scpt"
    rm "$usrcfd/tmp/session.access.$name.scpt"

    # If Keychain is running, check to see if a prompt has started, wait for it to close.
    waitForDialog "securityd" "SecurityAgent"

    # Set title (only if sshkey is set and agent enabled, due to non-interactivity requirement).
    if [ "$titling" -a "$sshkey" -a "$agent" ]; then
        echo 'activate application "Terminal"' > "$usrcfd/tmp/session.title.$name.scpt"
        echo 'tell application "System Events" to tell process "Terminal" to keystroke "PS1=\"[\\u@\\h \\W]\\$ \" ; PROMPT_COMMAND="' >> "$usrcfd/tmp/session.title.$name.scpt"
        echo "tell application \"System Events\" to tell process \"Terminal\" to keystroke quoted form of \"echo -ne \\\"\\\\033]0;$title\\\\007\\\"\"" >> "$usrcfd/tmp/session.title.$name.scpt"
        echo 'tell application "System Events" to tell process "Terminal" to keystroke return' >> "$usrcfd/tmp/session.title.$name.scpt"
        osascript "$usrcfd/tmp/session.title.$name.scpt"
        rm "$usrcfd/tmp/session.title.$name.scpt"
    fi

    # Return to first tab.
    osascript -e 'tell application "System Events"' -e 'keystroke "}" using command down' -e 'end tell'
}

# gnomeTerminalHandler()
#
# Handle Gnome Terminal parameterization.
#
gnomeTerminalHandler() {
    reportDebugFuncEntry "$*" "name addr sshopts xsasuser"

    local protocol="$1"
    local title="$(capsFirst "$name")"
    local windowId
    local keyringDetected
    local keyringPromptActive
    local command


    if [ "$protocol" = "ssh" ]; then
        command="ssh $sshopts -Y $xsasuser@$addr"
    elif [ "$protocol" = "tel" ]; then
        command="telnet $addr"
    else
        reportError "Invalid protocol type passed: $protocol; valid types are: tel ssh"
        return 1
    fi

    pgrep -u "$userDblBacksl" gnome-terminal | grep -qv "$$"
    if [ "$?" = 0 ]; then
        # Handle tab creation and run connection command.
        windowId="$(xdotool search --class "gnome-terminal" | tail -1)"
        xdotool windowfocus "$windowId" 2>/dev/null
        xdotool key ctrl+shift+t
        sleep 0.2
        xdotool type --clearmodifiers --delay=10 "$command"
        xdotool key Return

        # If gnome-keyring-daemon is running, check to see if a prompt has started, wait for it to close.
        waitForDialog "gnome-keyring-daemon" "gnome-keyring-prompt"

        # Set title (only if sshkey is set and agent enabled, due to non-interactivity requirement).
        if [ "$titling" -a "$sshkey" -a "$agent" ]; then
            xdotool type --clearmodifiers --delay=10 "PS1=\"[\\u@\\h \\W]\\$ \" ; PROMPT_COMMAND='echo -ne \"\\033]0;\"$title\"\\007\"'"
            xdotool key Return
        fi

        # Return to first tab.
        xdotool key ctrl+Next
    else
        gnome-terminal --command="$command" &
    fi

    return 0
}

# screenTerminalHandler() - Handles screen terminal parameterization.
screenTerminalHandler() {
    reportDebugFuncEntry "$*" "name addr sshopts xsasuser userDblBacksl TERM"

    local protocol="$1"
    local keyringDetected
    local keyringPromptActive
    local command

    if [ "$protocol" = "ssh" ]; then
        command="ssh $sshopts -Y $xsasuser@$addr"
    elif [ "$protocol" = "tel" ]; then
        command="telnet $addr"
    else
        reportError "Invalid protocol type passed: $protocol; valid types are: tel ssh"
        return 1
    fi

    local sesuser="$userDblBacksl"
    local seshost="$(hostname -s)"
    local sesname="session.$seshost.$sesuser"
    local sesruns="$(screen -ls | grep "$sesname")"

    if [ ! "$sesruns" ]; then
        reportDebug "Setting up initial screen in background"
        screen -dmS "$sesname" -t "$seshost" &
        sleep 1
        reportDebug "Creating window for $seshost (window 0)"
        screen -r -S "$sesname" -X hardstatus alwayslastline
        screen -r -S "$sesname" -X hardstatus string '%n:%t%-=%d/%m/%Y %c%{-}'
    fi

    if [ "$TERM" = "screen" ]; then
        reportDebug "Creating window for $name from within screen"
        # Warning: command has to be unquoted.
        screen -r -X screen -t "$name" $command
    else
        reportDebug "Creating window for $name from outside of screen"
        # Warning: command has to be unquoted.
        screen -r -S "$sesname" -X screen -t "$name" $command
    fi

    if [ "$platform" = "linux" ]; then 
        # If gnome-keyring-daemon is running, check to see if a prompt has started, wait for it to close.
        waitForDialog "gnome-keyring-daemon" "gnome-keyring-prompt"
    elif [ "$platform" = "macosx" ]; then
        # If Keychain is running, check to see if a prompt has started, wait for it to close.
        waitForDialog "securityd" "SecurityAgent"
    elif [ "$platform" = "windows" ]; then
        reportDebug "No need to wait for dialog on Windows"
    else
        reportError "Unknown platform specified: $platform"
        return 1
    fi
}

# windowsBrowserHandler() - Handles Windows default browser parameterization.
windowsBrowserHandler() {
    reportDebugFuncEntry "$*"

    local url="$1"
    explorer "$url" &
}

# appleBrowserHandler() - Handles Apple default browser parameterization.
macosBrowserHandler() {
    reportDebugFuncEntry "$*"

    local url="$1"
    open "$url" &
}

# gnomeBrowserHandler() - Handles Gnome default browser parameterization.
gnomeBrowserHandler() {
    reportDebugFuncEntry "$*"

    local url="$1"
    open "$url" &
}

# rdpFileWriter()
# Sets rdpfile.
#
rdpFileWriter() {
    rdpfile="$usrcfd/sys/$name/$name.rdp"
    reportDebugFuncEntry "$*" "addr xsasuser name" "writing $rdpfile"

    mkdir -p "$usrcfd/sys/$name"
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
        if [ "$xsastype" = "user" -a "$xsasupwd" ]; then
            local rdphash="$(cryptrdp5 "$xsasupwd")"
            echo password 51:b:$rdphash >> "$rdpfile"
        elif [ "$xsastype" = "admin" -a "$xsasapwd" ]; then
            local rdphash="$(cryptrdp5 "$xsasapwd")"
            echo password 51:b:$rdphash >> "$rdpfile"
        fi
    fi
    chmod 600 "$rdpfile"
}

mstscDesktopHandler() {
    reportDebugFuncEntry "$*"

    rdpFileWriter
    mstsc "$(toWindowsPath "$rdpfile")" 2>/dev/null &
}
# amsrdcDesktopHandler() - Handles Apple MSRDC parameterization.
amsrdcDesktopHandler() {
    reportDebugFuncEntry "$*"

    rdpFileWriter
    /Applications/Remote\ Desktop\ Connection.app/Contents/MacOS/Remote\ Desktop\ Connection "$rdpfile" 2>/dev/null &
}

# rdesktopDesktopHandler() - Handles rdesktop parameterization.
rdesktopDesktopHandler() {
    reportDebugFuncEntry "$*"

    rdpFileWriter
    if [ "$titling" ]; then local title="-T $(capsFirst "$name")"; fi
    echo "$xsasupwd" | rdesktop -0 -g 1024x768 -b -B $title -u "$xsasuser" -p - -N -a 16 -z -x l -r disk:home="$HOME" "$addr" 2>/dev/null &
}

# noneAccessHandler(state|access)
#
# Either determine the state of, or access system without any known access method.
#
noneAccessHandler() {
    reportDebugFuncEntry "$*"

    case "$1" in
      state)
        acstate="none"
        ;;
      access)
        reportError "No access method defined for this system"
        return 1
        ;;
    esac

    return 0
}

# httpAccessHandler(state|access)
# Sets acstate.
#
# Either determine the state of, or access system using the http protocol and the default web browser.
#
httpAccessHandler() {
    reportDebugFuncEntry "$*" "name addr type acstate"

    local result
    local proto
    local port

    proto="https"
    result="$(printPortState "$addr" 443)"
    if [ "$type" = "host" -o "$type" = "guest" ]; then
        if [ "$result" = "closed" ]; then
            port=80
            proto="http"
            result="$(printPortState "$addr" "$port")"
        fi
    elif [ "$type" = "service" ]; then
        proto="http"
        result="$(printPortState "$addr" "$port")"
    fi

    case "$1" in
      state)
        if [ "$result" = "open" ]; then
            acstate="active"
        elif [ "$result" = "closed" ]; then
            acstate="inactive"
        else
            acstate="$result"
        fi
        ;;
      access)
        if [ "$acstate" = "active" ]; then
            ${browser}BrowserHandler "$proto://$addr:$port"
        else
            reportError "Failed to access $name on $addr over $acmt (acstate=$acstate)"
            return 1
        fi
        ;;
    esac

    return 0
}

# telAccessHandler(state|access)
# Sets acstate.
#
# Either determine the state of, or access system using the telnet protocol and the terminal handler specified in options.conf.
#
telAccessHandler() {
    reportDebugFuncEntry "$*" "name addr acstate terminal"

    local result
    local port=23

    case "$1" in
      state)
        result="$(printPortState "$addr" "$port")"
        if [ "$result" = "open" ]; then
            acstate="active"
        elif [ "$result" = "closed" ]; then
            acstate="inactive"
        else
            acstate="$result"
        fi
        ;;
      access)
        if [ "$acstate" = "active" ]; then
            ${terminal}TerminalHandler tel
        else
            reportError "Failed to access $name on $addr over $acmt (acstate=$acstate)"
            return 1
        fi
        ;;
    esac

    return 0
}

# sshAccessHandler(state|access)
# Sets acstate.
#
# Either determine the state of, or access system using the ssh protocol and the terminal handler specified in options.conf.
#
sshAccessHandler() {
    reportDebugFuncEntry "$*" "name addr acstate terminal"

    local result
    local port=22

    case "$1" in
      state)
        result="$(printPortState "$addr" "$port")"
        if [ "$result" = "open" ]; then
            acstate="active"
        elif [ "$result" = "closed" ]; then
            acstate="inactive"
        else
            acstate="$result"
        fi
        ;;
      access)
        if [ "$acstate" = "active" ]; then
            ${terminal}TerminalHandler ssh
        else
            reportError "Failed to access $name on $addr over $acmt (acstate=$acstate)"
            return 1
        fi
        ;;
    esac

    return 0
}

# rdpAccessHandler(state|access)
# Sets acstate.
#
# Either determine the state of, or access system using the rdp protocol and the desktop handler specified in options.conf.
#
rdpAccessHandler() {
    reportDebugFuncEntry "$*" "name addr acstate desktop"

    local result
    local port=3389

    case "$1" in
      state)
        result="$(printPortState "$addr" "$port")"
        if [ "$result" = "open" ]; then
            acstate="active"
        elif [ "$result" = "closed" ]; then
            acstate="inactive"
        else
            acstate="$result"
        fi
        ;;
      access)
        if [ "$acstate" = "active" ] && { ! isLoopback "$addr" || ! isLocal "$name" ; } ; then
            ${desktop}DesktopHandler
        else
            reportError "Failed to access $name on $addr over $acmt (acstate=$acstate)"
            return 1
        fi
        ;;
    esac

    return 0
}

# viaScript(<command>)
#
# Handle execution of <command> via a platform's native scripting method.
#
viaScript() {
    reportDebugFuncEntry "$*"

    local command="$*"
    local retval

    if [ "$platform" = "linux" -o "$platform" = "macosx" ]; then
        echo "#!/bin/sh" > "$usrcfd/tmp/session.tell.$name.sh"
        echo "$command" >> "$usrcfd/tmp/session.tell.$name.sh"
        sh "$usrcfd/tmp/session.tell.$name.sh"
        retval="$?"
        if [ "$debug" ]; then
            reportDebug "Not removing $usrcfd/tmp/session.tell.$name.sh"
        else
            rm "$usrcfd/tmp/session.tell.$name.sh"
        fi
    elif [ "$platform" = "windows" ]; then
        echo "@echo off" > "$usrcfd/tmp/session.tell.$name.bat"
        echo "$command" >> "$usrcfd/tmp/session.tell.$name.bat"
        sed  -i -e 's/$/\r/' "$usrcfd/tmp/session.tell.$name.bat"
        cmd.exe /c \""$(toWindowsPath "$usrcfd/tmp/session.tell.$name.bat")"\"
        retval="$?"
        if [ "$debug" ]; then
            reportDebug "Not removing $usrcfd/tmp/session.tell.$name.bat"
        else
            rm "$usrcfd/tmp/session.tell.$name.bat"
        fi
    else
        reportError "Unknown platform specified: $platform"
        return 1
    fi

    return $retval
}

# localTellCommandWriter(<command>)
#
# Print <command> for immediate local execution.
#
localTellCommandWriter() {
    reportDebugFuncEntry "$*"

    local command="$*"

    echo "$command"
}

# psexecTellCommandWriter(<addr> <user> <pass> <command>)
#
# Print <command> for execution over smb using psexec.
#
psexecTellCommandWriter() {
    reportDebugFuncEntry "$*"

    local addr="$1"
    local user="$2"
    local pass="$3"
    local command="$4"

    # Older version of psexec?
    if [ "$user" ]; then user="-u \"$user\"" ; fi
    if [ "$pass" ]; then pass="-p \"$pass\"" ; fi
    echo "psexec \\\\$addr -h $user $pass cmd.exe /c \"$command\" 2>nul"
}

# winexeTellCommandWriter(<addr> <user> <pass> <command>)
#
# Print <command> for execution over smb using winexe.
#
winexeTellCommandWriter() {
    reportDebugFuncEntry "$*"

    local addr="$1"
    local user="$2"
    local pass="$3"
    local command="$4"

    if [ "$pass" ]; then pass="%$pass" ; fi
    echo "winexe --debug-stderr -U '${user}${pass}' //$addr 'cmd.exe /c \"$command\"' 2>/dev/null"
}

# plinkTellCommandWriter(<addr> <user> <command>)
#
# Print <command> for execution over ssh using plink.
#
plinkTellCommandWriter() {
    reportDebugFuncEntry "$*"

    local addr="$1"
    local user="$2"
    local command="$(echo "$3" | sed 's|"|\\"|g')"

    echo "plink -batch -x $sshopts -l \"$user\" $addr \"$command\""
}

# sshTellCommandWriter(<host> <user> <command>)
#
# Print <command> for execution using ssh on <host> as <user>.
#
sshTellCommandWriter() {
    reportDebugFuncEntry "$*"

    local host="$1"
    local user="$2"
    local command="$3"

    echo "ssh $sshopts -l '$user' '$host' '$command'"
}

# localSendCommandWriter(<source> <target>)
#
# Print a command for sending data using the appropriate local copy command.
#
localSendCommandWriter() {
    reportDebugFuncEntry "$*"

    local source
    local target

    if [ "$platform" = "linux" -o "$platform" = "macosx" ]; then
        source="$1"
        target="$2"
        echo "cp -Rpd \"$source\" \"$target\" >/dev/null 2>&1 </dev/null"
    elif [ "$platform" = "windows" ]; then
        source="$(toWindowsPath "$1")"
        target="$(toWindowsPath "$2")"
        echo "robocopy /e \"$source\" \"$target\" >nul 2>&1"
    else
        reportError "Unknown platform specified: $platform"
        return 1
    fi

    return 0
}

# robocopySendCommandWriter(<addr> <user> <pass> <source> <target>)
#
# Print a command for sending data using robocopy remotely.
#
robocopySendCommandWriter() {
    reportDebugFuncEntry "$*"

    local addr="$1"
    local user="$2"
    local pass="$3"
    local source="$(toWindowsPath "$4")"
    local target="$(toWindowsPath "$5")"
    local driveLetter

    driveLetter="$(echo "$target" | cut -d ':' -f 1)"
    reportDebug "Extracted drive letter $driveLetter from $target"

    target="$(echo "$target" | sed "s|$driveLetter:|//${addr}/${driveLetter}\$|g" | sed 's|/|\\|g')"
    reportDebug  "Target is now $target"

    if [ "$pass" ]; then pass="\"$pass\"" ; fi
    printf %s "
    net use \\\\$addr\\$driveLetter\$ /user:\"${user}\" ${pass} 2>nul
    robocopy /e \"$source\" \"$target\" >nul 2>&1
    net use \\\\$addr\\$driveLetter\$ /delete >nul 2>&1
    " | sed 's/^[[:space:]]*//'
}

# smbclientSendCommandWriter(<addr> <user> <pass> <source> <target>)
#
# Print a command for sending data using smbclient remotely.
#
smbclientSendCommandWriter() {
    reportDebugFuncEntry "$*"

    local addr="$1"
    local user="$2"
    local pass="$3"
    local source="$4"
    local target="$(toWindowsPath "$5")"
    local share
    local smbcommand

    share="$(echo "$target" | sed "s|:|$|" | cut -d/ -f 1 | sed 's|"||g')"
    target="$(echo "$target" | sed 's|/|\\\\|g' | cut -d: -f2 | sed 's|"||g')"
    smbcommand="mkdir \"$target\";cd \"$target\";lcd \"$source\";prompt off;recurse on;mput *;quit"

    if [ "$pass" ]; then pass="%$pass" ; fi
    echo "smbclient //$addr/$share -U \"${user}${pass}\" -c '$smbcommand' 2>/dev/null"
}

# pscpSendCommandWriter(<addr> <uopts> <source> <target>)
#
# Print a command for sending data using pscp remotely.
#
pscpSendCommandWriter() {
    reportDebugFuncEntry "$*"

    local addr="$1"
    local uopts="$2"
    local source="$(toWindowsPath "$3")"
    local target="$4"

    echo "pscp $sshopts -scp -p -q -r -l \"$uopts\" \"$source\" $addr:\"$target\""
}

# scpSendCommandWriter(<addr> <uopts> <source> <target>)
#
# Print a command for sending data using scp remotely.
#
scpSendCommandWriter() {
    reportDebugFuncEntry "$*"

    local addr="$1"
    local uopts="$2"
    local source="$3"
    local target="$4"
    local sshuser

    sshuser="$(echo "$uopts" | sed 's|\ |\\ |g'| sed 's|\\|\\\\|g')"
    echo  "scp -q $sshopts -r \"$source\" $sshuser@$addr:\"$target\""
}

# noneExecHandler()
#
# Handle execute commands for systems without any known execute method.
#
noneExecHandler() {
    reportDebugFuncEntry "$*"

    case "$1" in
      state)
        exstate="none"
        ;;
      runasuser|runasadmin|runasservice|sendasuser|sendasadmin|sendasservice)
        reportError "No execute method defined for this system"
        return 1
        ;;
    esac

    return 0
}

# smbExecHandler(<mode>)
#
# Handle executing commands on a remote system using the smb/cifs protocol.
#
smbExecHandler() {
    reportDebugFuncEntry "$*"

    local result
    local port=445

    case "$1" in
      state)
        result="$(printPortState "$addr" "$port")"
        if [ "$result" = "open" ]; then
            exstate="active"
        elif [ "$result" = "closed" ]; then
            exstate="inactive"
        else
            exstate="$result"
        fi
        ;;
      runasuser)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to execute user-level command locally (on $name)"
            viaScript "$(localTellCommandWriter "$command")"
            return $?
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to execute user-level command remotely (on $name)"
            viaScript "$(${smbtell}TellCommandWriter "$addr" "$user" "$upwd" "$command")"
            return $?
        else
            reportError "Failed to execute user-level command (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      runasadmin)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to execute admin-level command locally (on $name)"
            viaScript "$(localTellCommandWriter "$privesc $command")"
            return $?
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to execute admin-level command remotely (on $name)"
            viaScript "$(${smbtell}TellCommandWriter "$addr" "$admin" "$apwd" "$command")"
            return $?
        else
            reportError "Failed to execute admin-level command (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      runasservice)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" = "service" ]; } ; then
            reportDebug "Attempting to execute service-level command locally (on $host)"
            viaScript "$(localTellCommandWriter "$privesc $command")"
            return $?
        elif [ "$exstate" = "active" -a "$type" = "service" ]; then
            reportDebug "Attempting to execute service-level command remotely (on $host)"
            tokenReader setVars "$host" "addr" || return 1
            viaScript "$(${smbtell}TellCommandWriter "$addr" "$user" "$upwd" "$command")"
            return $?
        else
            reportError "Failed to execute service-level command (on $host) (exstate=$exstate)"
            return 1
        fi
        ;;
      sendasuser)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to send data locally at user-level (on $name)"
            viaScript "$(localSendCommandWriter "$source" "$target")"
            return $?
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to send data remotely at user-level (on $name)"
            viaScript "$(${smbsend}SendCommandWriter "$addr" "$user" "$upwd" "$source" "$target")"
            return $?
        else
            reportError "Failed to send data at user-level (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      sendasadmin)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to send data locally at admin-level (on $name)"
            reportError "Sending of local files with elevated privileges not implemented yet"
            return 1
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to send data remotely at admin-level (on $name)"
            viaScript "$(${smbsend}SendCommandWriter "$addr" "$admin" "$apwd" "$source" "$target")"
            return $?
        else
            reportError "Failed to send data at admin-level (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      sendasservice)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" = "service" ]; } ; then
            reportDebug "Attempting to send data locally at service-level (on $host)"
            reportError "Sending of local files with changed privileges not implemented yet"
            return 1
        elif [ "$exstate" = "active" -a "$type" = "service" ]; then
            reportDebug "Attempting to send data remotely at service-level (on $host)"
            tokenReader setVars "$host" "addr" || return 1
            viaScript "$(${smbsend}SendCommandWriter "$addr" "$user" "$upwd" "$source" "$target")"
            return $?
        else
            reportError "Failed to send data at service-level (on $host) (exstate=$exstate)"
            return 1
        fi
        ;;
    esac

    if [ "$platform" = "linux" ]; then 
        # If gnome-keyring-daemon is running, check to see if a prompt has started, wait for it to close.
        waitForDialog "gnome-keyring-daemon" "gnome-keyring-prompt"
    elif [ "$platform" = "macosx" ]; then
        # If Keychain is running, check to see if a prompt has started, wait for it to close.
        waitForDialog "securityd" "SecurityAgent"
    elif [ "$platform" = "windows" ]; then
        reportDebug "No need to wait for dialog on Windows"
    else
        reportError "Unknown platform specified: $platform"
        return 1
    fi

    return 0
}

# sshExecHandler(<mode>)
# Sets exstate.
#
# Handle executing commands using the ssh protocol.
#
sshExecHandler() {
    reportDebugFuncEntry "$*" "addr name type host exstate user admin command"

    local result
    local port=22

    case "$1" in
      state)
        result="$(printPortState "$addr" "$port")"
        if [ "$result" = "open" ]; then
            exstate="active"
        elif [ "$result" = "closed" ]; then
            exstate="inactive"
        else
            exstate="$result"
        fi
        ;;
      runasuser)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to execute user-level command locally (on $name)"
            viaScript "$(localTellCommandWriter "$command")"
            return $?
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to execute user-level command remotely (on $name)"
            viaScript "$(${sshtell}TellCommandWriter "$addr" "$user" "$command")"
            return $?
        else
            reportError "Failed to execute user-level command (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      runasadmin)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to execute admin-level command locally (on $name)"
            viaScript "$(localTellCommandWriter "$privesc $command")"
            return $?
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to execute admin-level command remotely (on $name)"
            viaScript "$(${sshtell}TellCommandWriter "$addr" "$admin" "$command")"
            return $?
        else
            reportError "Failed to execute admin-level command (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      runasservice)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" = "service" ]; } ; then
            reportDebug "Attempting to execute service-level command locally (on $host)"
            viaScript "$(localTellCommandWriter "$privesc $command")"
            return $?
        elif [ "$exstate" = "active" -a "$type" = "service" ]; then
            reportDebug "Attempting to execute service-level command remotely (on $host)"
            tokenReader setVars "$host" "addr" || return 1
            viaScript "$(${sshtell}TellCommandWriter "$addr" "$user" "$command")"
            return $?
        else
            reportError "Failed to execute service-level command (on $host) (exstate=$exstate)"
            return 1
        fi
        ;;
      sendasuser)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to send data locally at user-level (on $name)"
            viaScript "$(localSendCommandWriter "$source" "$target")"
            return $?
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to send data remotely at user-level (on $name)"
            viaScript "$(${sshsend}SendCommandWriter "$addr" "$user" "$source" "$target")"
            return $?
        else
            reportError "Failed to send data at user-level (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      sendasadmin)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" != "service" ]; } ; then
            reportDebug "Attempting to send data locally at admin-level (on $name)"
            reportError "Sending of local files with elevated privileges not implemented yet"
            return 1
        elif [ "$exstate" = "active" -a "$type" != "service" ]; then
            reportDebug "Attempting to send data remotely at admin-level (on $name)"
            viaScript "$(${sshsend}SendCommandWriter "$addr" "$admin" "$source" "$target")"
            return $?
        else
            reportError "Failed to send data at admin-level (on $name) (exstate=$exstate)"
            return 1
        fi
        ;;
      sendasservice)
        if isLoopback "$addr" || { isLocal "$name" && [ "$type" = "service" ]; } ; then
            reportDebug "Attempting to send data locally at service-level (on $host)"
            reportError "Sending of local files with changed privileges not implemented yet"
            return 1
        elif [ "$exstate" = "active" -a "$type" = "service" ]; then
            reportDebug "Attempting to send data remotely at service-level (on $host)"
            tokenReader setVars "$host" "addr" || return 1
            viaScript "$(${sshsend}SendCommandWriter "$addr" "$user" "$source" "$target")"
            return $?
        else
            reportError "Failed to send data at service-level (on $host) (exstate=$exstate)"
            return 1
        fi
        ;;
    esac

    if [ "$platform" = "linux" ]; then 
        # If gnome-keyring-daemon is running, check to see if a prompt has started, wait for it to close.
        waitForDialog "gnome-keyring-daemon" "gnome-keyring-prompt"
    elif [ "$platform" = "macosx" ]; then
        # If Keychain is running, check to see if a prompt has started, wait for it to close.
        waitForDialog "securityd" "SecurityAgent"
    elif [ "$platform" = "windows" ]; then
        reportDebug "No need to wait for dialog on Windows"
    else
        reportError "Unknown platform specified: $platform"
        return 1
    fi

    return 0
}

# sshCredHandler(<mode>)
#
# Handle calling sshSendKey with correct username.
#
sshCredHandler() {
    reportDebugFuncEntry "$*"

    case "$1" in
      ashost|asguest)
        if [ "$user" != "none" ]; then
            reportInfo "Sending ssh key for defined user ($user) to $name"
            sshSendKey "$user"
        fi
        if [ "$admin" != "none" -a "$admin" != "$user" ]; then
            reportInfo "Sending ssh key for defined admin ($admin) to $name"
            sshSendKey "$admin"
        fi
        ;;
      asservice)
        if [ "$user" != "none" ]; then
            reportInfo "Sending ssh key for defined service user ($user) to $host"
            sshSendKey "$user"
        fi
        ;;
    esac
}

# winCredHandler(<mode>)
#
# Handle calling winStoreCreds with correct username.
#
winCredHandler() {
    reportDebugFuncEntry "$*"

    case "$1" in
      ashost|asguest)
        if [ "$user" != "none" ]; then
            reportInfo "Storing credentials for defined user ($user) on $name"
            winStoreCreds user "$user"
        fi
        if [ "$admin" != "none" -a "$admin" != "$user" ]; then
            reportInfo "Storing credentials for defined admin ($admin) on $name"
            winStoreCreds admin "$admin"
        fi
        ;;
      asservice)
        if [ "$user" != "none" ]; then
            reportInfo "Storing credentials for defined service user ($user) on $host"
            winStoreCreds user "$user"
        fi
        ;;
    esac
}


# doFunction(<function>)
#
# Call <function>
#
doFunction() {
    local function="$1"
    local retval
    shift
    local IFS=" "
    $function "$@" || { retval="$?" ; reportDebug "Function $function returned status $retval" ; return $retval ; }
    return 0
}

# dynamicHandler(<name>)
#
# Checks if a given name is dynamic, creates a group object if so. Passes along if not.
#
dynamicHandler() {
    reportDebugFuncEntry "$*"

    local entity="$1"
    local dynamicGroups="all,host,hosts,guest,guests,service,services,group,groups"

    if [[ "$dynamicGroups" =~ "$entity" ]]; then
        reportDebug "Dynamic group: $entity, initializing"
        type="group"
        name="$entity"
        members=$(for item in `listHelper $name`; do echo -n "$item", ; done | sed "s|,$||g")
    else
        reportDebug "Not a dynamic group: $entity, passing to parseEntry"
        parseEntry "$entity"
    fi
}

# mapEntity(<entity> <comma_separated_list_of_functions>)
#
# Execute the members of the <comma_separated_list_of_functions> sequentially passing <entity> to each one.
#
mapEntity() {
    reportDebugFuncEntry "$*" "mode"

    local entity="$1"
    local functions="$2"
    local targetState
    local currentState
    declare -i retval

    # Set the targetState (for using stateful mode).
    if [[ "$functions" =~ "stop" ]]; then targetState="off" ; else targetState="on" ; fi
    reportDebug "Target state is: $targetState"

    # Execute all requested functions.
    local IFS=","
    for function in $functions ; do
        reportDebug "Running funcion: $function"
        doFunction "$function" "$entity"
        retval="$?"
    done

    # If mode is stateful, wait for targetState to be reached.
    if [ "$mode" = "stateful" ]; then
        reportDebug "Mode is stateful, initializing current state as: unknown"
        currentState="unknown"
        while [ "$currentState" != "$targetState" ]; do
            currentState="$(IFS=" " ; checkState ; echo "$state")"
            if [ "$currentState" != "$targetState" ]; then
                echo "$entity: waiting to go $targetState (currently $currentState)"
                sleep 1
            else
                state="$currentState"
                printState "$entity"
                retval="$?"
            fi
        done
    fi

    return "$retval"
}


# mapGroup(<members> <comma_separated_list_of_functions>)
#
# Iterate over members and pass back to mapEntryPoint.
#
mapGroup() {
    reportDebugFuncEntry "$*" "mode"

    local members="$1"
    local functions="$2"
    local targetState
    local index
    local item
    declare -i retval

    # If stop funtions are in the function list, reverse order.
    # Set the targetState (for using stateful mode), reverse order.
    if [[ "$functions" =~ "stop" ]]; then
        targetState="off"
        groupList=""
        local IFS=","
        for member in $members ; do
            groupList="$member${groupList:+,$groupList}"
        done
        reportDebug "Function list contains stop functions, reversing group list."
    else
        targetState="on"
        groupList="$members"
    fi
    reportDebug "Group list is: $groupList"
    reportDebug "Target state is: $targetState"

    # Return value is the bitwise OR of all function return values
    retval=0

    let index=1
    local IFS=","
    for item in $groupList ; do
        reportDebug "Recursing $item to mapEntryPoint"
        mapEntryPoint "$item" "$functions"
        let retval=$((retval|$?))
        let index+=1
    done

    return "$retval"
}

# mapEntryPoint(<entity> <space_separated_list_of_functions>)
#
# Execute the members of the <comma_separated_list_of_functions> sequentially passing <entity> to each one.
# If an entity is a group, pass to mapGroup, if it's a host/guest/service pass to mapEntity
#
mapEntryPoint() {
    reportDebugFuncEntry "$*"

    local entity="$1"
    local functions="$2"
    declare -i retval

    # Reading in the entry is done via dynamicHandler.
    dynamicHandler "$entity"

    if [ "$type" = "group" ]; then
        reportDebug "Received a group, passing on to mapGroup"
        mapGroup "$members" "$functions"
        retval="$?"
    else
        reportDebug "Received an entity , passing to mapEntity"
        mapEntity "$entity" "$functions"
        retval="$?"
    fi

    # Do certain access related things when mapEntryPoint loop exits.
    if [[ "$functions" =~ "accessEntity" ]]; then
        reportDebug "Function list contains access functions, calling terminal exit hooks."
        # Reconnect to the generated screen session before exiting mapEntryPoint.
        if [ "$terminal" = "screen" -a "$TERM" != "screen" ]; then
            reportDebug "Terminal exit hook for screen: resuming created screen session"
            sleep 1
            screen -r
        # Set the title of the local (first) window before exiting mapEntryPoint.
        elif [ "$terminal" = "gnome" -a "$titling" -a "$sshkey" -a "$agent" ]; then
            reportDebug "Terminal exit hook for gnome: titling local terminal screen"
            local title="$(capsFirst "$hostname")"
            sleep 1
            xdotool key alt+1
            xdotool type --clearmodifiers --delay=10 "PS1=\"[\\u@\\h \\W]\\$ \" ; PROMPT_COMMAND='echo -ne \"\\033]0;\"$title\"\\007\"'"
            xdotool key Return
        # Set the title of the local (first) window before exiting mapEntryPoint.
        elif [ "$terminal" = "apple" -a "$titling" -a "$sshkey" -a "$agent" ]; then 
            reportDebug "Terminal exit hook for apple: titling local terminal screen"
            local title="$(capsFirst "$hostname")"
            echo 'activate application "Terminal"' > "$usrcfd/tmp/session.title.$hostname.scpt"
            echo 'tell application "System Events" to tell process "Terminal" to keystroke "PS1=\"[\\u@\\h \\W]\\$ \" ; PROMPT_COMMAND="' >> "$usrcfd/tmp/session.title.$hostname.scpt"
            echo "tell application \"System Events\" to tell process \"Terminal\" to keystroke quoted form of \"echo -ne \\\"\\\\033]0;$title\\\\007\\\"\"" >> "$usrcfd/tmp/session.title.$hostname.scpt"
            echo 'tell application "System Events" to tell process "Terminal" to keystroke return' >> "$usrcfd/tmp/session.title.$hostname.scpt"
            osascript "$usrcfd/tmp/session.title.$hostname.scpt"
            rm "$usrcfd/tmp/session.title.$hostname.scpt"
        fi
    fi

    return "$retval"
}

# printUsageText()
# Prints the standard help message for session.
#
printUsageText() {
    reportDebugFuncEntry "$*"

    echo "Usage: $0 command {group, guest, host or special argument}"
    echo
    echo "Commands:"
    echo "addconf    - adds a host, guest, service or group to session.conf."
    echo "modconf    - modify an existing host, guest, service or group in session.conf."
    echo "delconf    - removes a host, guest, service or group from session.conf."
    echo "discover   - scan an ip or an ip subnet."
    echo "check      - (state, status) checks state of a host, guest, service or group."
    echo "detail     - shows all known details for an entry, pass --nocheck optionally."
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
    echo
    echo "Argument to control group execution mode (for state, start, stop, etc):"
    echo "--mode     - serial (default), stateful or parallel (experimental)."
    echo
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
    echo
    echo "Arguments for privilege specification in access, tell and send:"
    echo "--user     - run the command with user credentials (default)."
    echo "--admin    - run the command with admin credentials."
    echo "--service  - run the command with service credentials."
    echo
    echo "Arguments for create and destroy:"
    echo "--desc     - (optional) annotation (--desc=\"My description.\")."
    echo "--numvcpu  - the virtual CPU count for guest system (--numvcpu=2)."
    echo "--memsize  - the virtual memory size in MB for guest system (--memsize=512)."
    echo "--dsksize  - the disk size in GB for guest system (--dsksize=4)."
    echo "--guestos  - the operating system for guest system (--guestos=other-64)."
    echo
    echo "Arguments for send:"
    echo "--source   - the source directory on the local system to send from."
    echo "--target   - the target directory on the remote system to send to."
    echo
    echo "Argument to control debug mode (can be passed to all commands):"
    echo "--debug    - pass this to enable debug mode. no value required"
    echo
    echo "Special parameters for list:"
    echo "all        - (list and check only) show or state all."
    echo "mode       - (list) show all modes. --default for default only."
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
    echo
}

# printVersion()
# Prints the version of session.
#
printVersion() {
    reportDebugFuncEntry "$*"

    cat "$0" | grep "^# Version" | sed "s|^# ||g"
}

# Main case statement
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
        echo "vmhome='$vmhome'"  > "$opts"
        echo "vmdata='$vmdata'" >> "$opts"

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
        echo "svstatus='$svstatus'" > "$opts"
        echo "svstart='$svstart'"  >> "$opts"
        echo "svstop='$svstop'"    >> "$opts"

    elif [ "$type" = "group" ]; then
        mandatories="type members" optionals="debug mode" parseParameters "$@"

        # Write out mode if it was given on the commandline and not default, always when opts exist.
        opts="$usrcfd/sys/$name/options.conf"
        if [ "$mode" != "$defaultmode" -o -e "$opts" ]; then
            mkdir -p "$usrcfd/sys/$name"
            echo "mode='$mode'" > "$opts"
        fi

        # Make sure no double entities are in members.
        IFS=","
        for member in $members ; do
            if ! echo "$had" | grep -q "$member"; then
                uniquemembers="$uniquemembers,$member"
            fi
            had="$member,$had"
        done
        unset IFS
        members="$(echo "$uniquemembers" | sed '/^$/d' | sed -e 's|,$||' -e 's|^,||')"

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
            echo "vmhome='$vmhome'"  > "$opts"
            echo "vmdata='$vmdata'" >> "$opts"
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
            echo "svstatus='$svstatus'" > "$opts"
            echo "svstart='$svstart'"  >> "$opts"
            echo "svstop='$svstop'"    >> "$opts"
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
            echo "mode='$mode'" > "$opts"
        fi

        # Make sure no double entities are in members.
        IFS=","
        for member in $members ; do
            if ! echo "$had" | grep -q "$member"; then
                uniquemembers="$uniquemembers,$member"
            fi
            had="$member,$had"
        done
        unset IFS
        members="$(echo "$uniquemembers" | sed '/^$/d' | sed -e 's|,$||' -e 's|^,||')"

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
