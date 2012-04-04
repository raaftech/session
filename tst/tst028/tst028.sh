#!/bin/bash

# TST028: modify guest, change host to other host, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to modify guest tst019-1.."
session modconf tst019-1 --type=guest --host=tst016

echo "Checking if modification happened.."
session list tst019-1 --verbose | grep -w "tst016"
if [ "$?" != 0 ]; then
    echo "Failure: modification did not happen.."
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
