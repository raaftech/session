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


# Session version.
version="1.0.0"
tag="devel"

# Terminal escape sequences to set text colors.
color_red="\x1b[31m"      #color_red="$(tput setaf 1)"
color_green="\x1b[32m"    #color_green="$(tput setaf 2)"
color_yellow="\x1b[33m"   #color_yellow="$(tput setaf 3)"
color_blue="\x1b[34m"     #color_blue="$(tput setaf 4)"
color_end="\x1b[0m"       #color_end="$(tput sgr0)"

# Space-separated lists of keywords for known modes, os, virtualization, credential, service, execute and access methods.
known_types="host guest service group"
known_modes="serial parallel stateful"
known_osmts="embedded-like unix-like windows-like aix5 aix6 aix7 arch2kx debian4 debian5 debian6 dfbsd2 esx4 esxi4 esxi5 fbsd7 fbsd8 fedora12 fedora13 fedora14 fedora15 fedora16 hpux1123 hpux1131 macosx3 macosx4 macosx5 macosx6 macosx7 nbsd4 nbsd5 obsd4 obsd5 osuse11 osuse12 rhel3 rhel4 rhel5 rhel6 sles9 sles10 sles11 sol10 sol11 ubuntu8 ubuntu10 ubuntu11 ubuntu12 win2k3 win2k8 win7 win8 wins8 winxp"
known_vrmts="none hpvm kvm xen vbox vmw vmf pvm esx"
known_crmts="none ssh win"
known_svmts="none scripted"
known_exmts="none ssh smb"
known_acmts="none ssh tel rdp http"

# Locations of configuration files.
syscfd="/etc/session"
syscff="$syscfd/cfg/session.conf"
sysopt="$syscfd/cfg/options.conf"
usrcfd="$HOME/.session"
usrcff="$usrcfd/cfg/session.conf"
usropt="$usrcfd/cfg/options.conf"
config="$usrcfd/tmp/session.conf.active"

# Location of log file.
logfile="$usrcfd/log/session.log"


# Default session execution mode.
defaultmode="serial"
mode="$defaultmode"

# Local hostname, short form, lowercase.
hostname="$(hostname 2>/dev/null)"
hostname="${hostname%%.*}"
hostname="$(printf "$hostname\n" | tr A-Z a-z)"

# Platform detection.
uname="$(uname | tr A-Z a-z)"
if [[ "$uname" =~ "linux" ]]; then
    environment="linux"
    platform="linux"
elif [[ "$uname" =~ "darwin" ]]; then
    environment="macosx"
    platform="macosx"
elif [[ "$uname" =~ "uwin" ]]; then
    environment="uwin"
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

# Set pslist global according to platform or environment.
if [ "$platform" = "linux" -o "$platform" = "macosx" -o "$environment" = "uwin" ]; then
    pslist="ps ax"
elif [ "$platform" = "windows" ]; then
    pslist="tasklist"
else
    pslist="unknown"
fi

# Platform specific options.conf default settings.
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

# Static options.conf default settings.
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
