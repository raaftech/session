#!/bin/bash

# TST002: run a reinit, verify tools.found and tools.required are recreated
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

# Some test-specific globals.
sesdir="$HOME/.session"

# Store modified time of any pre-existing tools.found and tools.required.
if [ -e "$sesdir/cfg/tools.found" ]; then
    tools_found_seconds="$(date -r "$sesdir/cfg/tools.found" +%T)"
else
    tools_found_seconds="0"
fi

if [ -e "$sesdir/cfg/tools.required" ]; then
    tools_required_seconds="$(date -r "$sesdir/cfg/tools.required" +%T)"
else
    tools_required_seconds="0"
fi

# Run session reinit.
echo "Invoking session reinit.."
echo "This will create a new tools.found and tools.required which we will test.."
session reinit

# Where files modified?
if [ -e "$sesdir/cfg/tools.found" ]; then
    new_tools_found_seconds="$(date -r "$sesdir/cfg/tools.found" +%T)"
    if [ "$tools_found_seconds" != "$new_tools_found_seconds" ]; then
    	echo "Success: tools.found was succesfully recreated.."
    else
        echo "Failure: modification time on tools.found are the same.."
        failure="tools.found was not modified; $failure"
    fi
else
    echo "Failure: something must have gone wrong with creating tools.found.."
    failure="tools.found was not created; $failure"
fi

if [ -e "$sesdir/cfg/tools.required" ]; then
    new_tools_required_seconds="$(date -r "$sesdir/cfg/tools.required" +%T)"
    if [ "$tools_required_seconds" != "$new_tools_required_seconds" ]; then
        echo "Success: tools.required was succesfully recreated.."
    else
        echo "Failure: modification time on tools.required are the same.."
        failure="tools.required was not modified; $failure"
    fi
else
    echo "Failure: something must have gone wrong with creating tools.required.."
    failure="tools.required was not created; $failure"
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