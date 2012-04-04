#!/bin/bash

# TST029: modify guest, change host to non-existing host, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

echo "Attempting to modify guest tst019-2.."
session modconf tst019-2 --type=guest --host=nonexisting

echo "Checking if modification happened.."
session list tst019-2 --verbose | grep -w "nonexisting"
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
