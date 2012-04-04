#!/bin/bash

# TST003: run version, verify it matches Version in session header
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

# Determine dynamically where we are.
if [ ! "$TST003_HOME" ]; then
    ABS="$PWD"
    IFS="/"
    for DIR in $0; do
        if [ -n "$DIR" ]; then
            if [ "$DIR" = ".." ]; then
                ABS="${ABS%/*}"
            elif [ "$DIR" != "." ]; then
                ABS="$ABS/$DIR"
            fi
        fi
    done;
    unset DIR
    unset IFS
    OFFSET=""
    if [ -e "$(dirname "$ABS")$OFFSET" ]; then
        # Found, probably called relatively.
        cd "$(dirname "$ABS")$OFFSET"
        TST003_HOME="$(pwd)"
        unset ABS
    elif [ -e "(dirname "$0")$OFFSET" ]; then
        # Found, probably called absolutely.
        cd "$(dirname "$0")$OFFSET"
        TST003_HOME="$(pwd)"
    fi
    unset ABS
    unset OFFSET
fi

# Set detected or statically set TST003_HOME to internal representation.
tst003_home="$TST003_HOME"

source_version=$(cat $tst003_home/../../src/session-* | grep "^# Version" | sed "s|^# ||g" | uniq)
runner_version=$(session version)

if [ "$source_version" = "$runner_version" ]; then
    echo "Success: source version matches running version.."
else
    echo "Failure: source version is not the same as running version.."
    failure="source and runner versions of session differ; $failure"
fi

# If $failure was not set, everything worked as expected, exit 0, else
# something went wrong, exit 1.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi