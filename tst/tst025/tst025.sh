#!/bin/bash

# TST025: modify host, change any setting except vrmt, verify changes happened
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to modify host tst018.."
session modconf tst018 --type=host --addr=1.2.3.25

echo "Checking if modification happened.."
session list tst018 --verbose | grep -w "1.2.3.25"
if [ "$?" != 0 ]; then
    echo "Failure: modification did not happen for some reason.."
    failure="modification failed; $failure"
fi


# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi
