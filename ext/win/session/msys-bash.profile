# Copyright (C) 2001, 2002  Earnie Boyd  <earnie@users.sf.net>
# This file is part of the Minimal SYStem.
#   http://www.mingw.org/msys.shtml
# 
#         File:	profile
#  Description:	Shell environment initialization script
# Last Revised:	2002.05.04

if [ -z "$MSYSTEM" ]; then
  MSYSTEM=MINGW32
fi

# My decision to add a . to the PATH and as the first item in the path list
# is to mimick the Win32 method of finding executables.
#
# I filter the PATH value setting in order to get ready for self hosting the
# MSYS runtime and wanting different paths searched first for files.
if [ $MSYSTEM == MINGW32 ]; then
  export PATH=".:/usr/local/bin:/mingw/bin:/bin:$PATH"
else
  export PATH=".:/usr/local/bin:/bin:/mingw/bin:$PATH"
fi

if [ -z "$USERNAME" ]; then
  LOGNAME="`id -un`"
else
  LOGNAME="$USERNAME"
fi

# Set up USER's home directory
if [ -z "$HOME" ]; then
  HOME="`echo "/${HOMEDRIVE}${ORIGINAL_HOMEPATH}" | sed -e 's|:||g' -e 's|\\|/|g'`"
fi

if [ ! -d "$HOME" ]; then
  mkdir -p "$HOME"
  cp /etc/inputrc.default "$HOME"/.inputrc
fi

if [ "x$HISTFILE" == "x/.bash_history" ]; then
  HISTFILE=$HOME/.bash_history
fi

export HOME LOGNAME MSYSTEM HISTFILE

for i in /etc/profile.d/*.sh ; do
  if [ -f $i ]; then
    . $i
  fi
done

export MAKE_MODE='unix'
export PS1='[\u@\h \W]\$ '

alias dir="ls"
alias clear="clsb"
alias grep="grep --color"

export SESSION_VERSION="$(cat "$SESSION_EXECUTABLE" | grep "^# Version" | sed "s|^# ||g")"
alias session="session.sh"

cd "$HOME"
echo "$SESSION_VERSION"
