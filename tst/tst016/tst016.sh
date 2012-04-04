#!/bin/bash

# TST016: add existing host with no vrmt, vmdata and vmhome are not required
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to add a host.."
session addconf tst016 --type=host --vrmt=none --osmt=embedded-like --acmt=none --exmt=none --user=none --admin=none --addr=1.2.3.16
if [ "$?" != 0 ]; then
    echo "Failure: could not add host for some reason.."
    failure="could not add host with none vrmt; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi