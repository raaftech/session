#!/bin/bash

# TST011: add host system with a non-valid vrmt, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

invalid=non-existing-vrmt
session addconf tst011 --type=host --osmt=embedded-like --acmt=none --exmt=none --user=none --admin=none --addr=1.2.3.4 --vrmt=$invalid --vmhome=/vmhome --vmdata=/vmdata
if [ "$?" != 0 ]; then
    echo "Failure: vrmt \"$invalid\" is not a valid vrmt.."
    failure="vrmt \"$invalid\" invalid; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi