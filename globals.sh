#!/bin/bash
#
# Copyright © 2008-2016 RAAF Technology bv
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


# Terminal escape sequences to set text colors.
color_red="\x1b[31m"      #color_red="$(tput setaf 1)"
color_green="\x1b[32m"    #color_green="$(tput setaf 2)"
color_yellow="\x1b[33m"   #color_yellow="$(tput setaf 3)"
color_blue="\x1b[34m"     #color_blue="$(tput setaf 4)"
color_end="\x1b[0m"       #color_end="$(tput sgr0)"

# Space-separated lists of keywords for known modes, os, virtualization, credential, service, execute and access methods.
known_types="host guest service group"
known_modes="serial parallel stateful"
known_osmts="embedded-like unix-like windows-like aix5 aix6 aix7 alpine3 arch coreos debian4 debian5 debian6 debian7 debian8 debian9 debian10 dfbsd2 dfbsd3 dfbsd4 dfbsd5 esxi4 esxi5 esxi6 fbsd7 fbsd8 fbsd9 fbsd10 fbsd11 fbsd12 fedora12 fedora13 fedora14 fedora15 fedora16 fedora17 fedora18 fedora19 fedora20 fedora21 fedora22 fedora23 fedora24 fedora25 fedora26 fedora27 fedora28 fedora29 fedora30 fedora31 fedora32 fedora33 gentoo hpux1111 hpux1123 hpux1131 macosx3 macosx4 macosx5 macosx6 macosx7 macosx8 macosx9 macosx10 macosx11 macos1012 macos1013 macos1014 nbsd4 nbsd5 nbsd6 nbsd7 obsd4 obsd5 obsd6 osuse11 osuse12 osuse13 osuse14 osuse15 popos18 popos19 rhel3 rhel4 rhel5 rhel6 rhel7 rhel8 sles9 sles10 sles11 sles12 sles13 sles14 sles15 sol10 sol11 trisquel7 ubuntu8 ubuntu9 ubuntu10 ubuntu11 ubuntu12 ubuntu13 ubuntu14 ubuntu15 ubuntu16 ubuntu17 ubuntu18 ubuntu19 ubuntu20 win2k win2k3 win2k8 win2k12 win2k16 winv win7 win8 win10 winxp reactos"
known_vrmts="none kvm xen vbox vmw vmf esx hpvm ldom pvm docker"
known_crmts="none ssh win"
known_svmts="none scripted"
known_exmts="none ssh smb vmn"
known_acmts="none ssh tel rdp http"

# Default session execution mode.
defaultmode="serial"
mode="$defaultmode"

# Local hostname, short form, lowercase.
hostname="$(hostname 2>/dev/null)"
hostname="${hostname%%.*}"
hostname="$(printf "$hostname\n" | tr '[:upper:]' '[:lower:]')"

# Platform detection.
uname="$(uname | tr '[:upper:]' '[:lower:]')"
release="$(uname -r | tr '[:upper:]' '[:lower:]')"
version="$(uname -v | tr '[:upper:]' '[:lower:]')"
if [[ "$uname" =~ "linux" ]]; then
    # Whoa there, might still be Microsoft's new Windows Services for
    # Linux (wsl). Checking both version (wsl1) and release (wsl2).
    if [[ "$release" =~ "icrosoft" ||  "$version" =~ "icrosoft" ]]; then
       environment="wsl"
       platform="windows"
    else
       environment="linux"
       platform="linux"
    fi
elif [[ "$uname" =~ "bsd" ]]; then
    environment="bsd"
    platform="bsd"
elif [[ "$uname" =~ "darwin" ]]; then
    environment="macosx"
    platform="macosx"
elif [[ "$uname" =~ "uwin" ]]; then
    environment="uwin"
    platform="windows"
elif [[ "$uname" =~ "msys" ]]; then
    environment="msys"
    platform="windows"
elif [[ "$uname" =~ "mingw" ]]; then
    environment="mingw"
    platform="windows"
elif [[ "$uname" =~ "cygwin" ]]; then
    environment="cygwin"
    platform="windows"
else
    environment="unknown"
    platform="unknown"
fi

# Locations of configuration files.
syscfd="/etc/session"
syscff="$syscfd/cfg/session.conf"
sysopt="$syscfd/cfg/options.env"
if [ "$environment" = "wsl" ]; then
    # wsl has no normal unix-path/win-path mechanism. make sure usrcfd is outside the lxss folder.
    usrcfd="/mnt/c/Users/$USER/.session"
else
    usrcfd="$HOME/.session"
fi
usrcff="$usrcfd/cfg/session.conf"
usropt="$usrcfd/cfg/options.env"
config="$usrcfd/tmp/session.conf.active"

# Location of log file.
logfile="$usrcfd/log/session.log"

# Set various command globals according to platform or environment.
if [ "$platform" = "linux" -o "$platform" = "bsd" -o "$platform" = "macosx" -o "$environment" = "uwin" ]; then
    nmap="nmap"
    pslist="ps ax"
elif [ "$platform" = "windows" ]; then
    cryptrdp5="cryptRDP5.exe"
    explorer="explorer.exe"
    mstsc="mstsc.exe"
    nmap="nmap.exe"
    pageant="PAGEANT.EXE"
    putty="PUTTY.EXE"
    plink="PLINK.EXE"
    pscp="PSCP.EXE"
    psexec="PsExec.exe"
    pslist="tasklist.exe"
    robocopy="Robocopy.exe"
else
    pslist="unknown"
fi

# Platform specific options.env default settings.
if [ "$platform" = "linux" ]; then
    terminal="screen"
    desktop="xfreerdp"
    browser="gnome"
    smbtell="winexe"
    sshtell="ssh"
    smbsend="smbclient"
    sshsend="scp"
    sshagent="ssh-agent"
    privesc="sudo -u root"
elif [ "$platform" = "bsd" ]; then
    terminal="screen"
    desktop="xfreerdp"
    browser="none"
    smbtell="winexe"
    sshtell="ssh"
    smbsend="smbclient"
    sshsend="scp"
    sshagent="ssh-agent"
    privesc="sudo -u root"
elif [ "$platform" = "macosx" ]; then
    terminal="apple"
    desktop="amsrdc"
    browser="macos"
    smbtell="winexe"
    sshtell="ssh"
    smbsend="smbclient"
    sshsend="scp"
    sshagent="ssh-agent"
    privesc="sudo -u root"
elif [ "$platform" = "windows" ]; then
    terminal="putty"
    desktop="mstsc"
    browser="windows"
    smbtell="psexec"
    sshtell="plink"
    smbsend="robocopy"
    sshsend="pscp"
    sshagent="pageant"
    privesc="runas /savecred /user:administrator"
else
    terminal="none"
    desktop="none"
    browser="none"
    smbtell="none"
    sshtell="none"
    smbsend="none"
    sshsend="none"
    sshagent="none"
    privesc="none"
fi

# Static options.env default settings.
execute="1"
access="1"
create="1"
destroy="0"
send="1"
resilient="0"
timeout="1501"
titling="0"
tabbed="0"
color="1"
privy="0"
debug="0"
width="1600"
height="900"

# Syntax indices for tokenReader()
typeset -r syntax_host_type=1
typeset -r syntax_host_name=2
typeset -r syntax_host_osmt=3
typeset -r syntax_host_acmt=4
typeset -r syntax_host_exmt=5
typeset -r syntax_host_user=6
typeset -r syntax_host_admin=7
typeset -r syntax_host_addr=8
typeset -r syntax_host_vrmt=9
typeset -r syntax_guest_type=1
typeset -r syntax_guest_name=2
typeset -r syntax_guest_osmt=3
typeset -r syntax_guest_acmt=4
typeset -r syntax_guest_exmt=5
typeset -r syntax_guest_user=6
typeset -r syntax_guest_admin=7
typeset -r syntax_guest_addr=8
typeset -r syntax_guest_host=9
typeset -r syntax_service_type=1
typeset -r syntax_service_name=2
typeset -r syntax_service_svmt=3
typeset -r syntax_service_acmt=4
typeset -r syntax_service_exmt=5
typeset -r syntax_service_user=6
typeset -r syntax_service_addr=7
typeset -r syntax_service_port=8
typeset -r syntax_service_host=9
typeset -r syntax_group_type=1
typeset -r syntax_group_name=2
typeset -r syntax_group_members=3
