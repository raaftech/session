#!/bin/bash

# TST031: modify service, change host to non-existing host, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

echo "Attempting to modify service tst021.."
session modconf tst021 --type=service --host=nonexisting

echo "Checking if modification happened.."
session list tst021 --verbose | grep -w "nonexisting"
if [ "$?" = 0 ]; then
    echo "Failure: modification happened.."
    failure="modification succeeded; $failure"
fi


# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi
