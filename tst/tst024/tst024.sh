#!/bin/bash

# TST024: add group with the two previous services
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to add a group with service tst020 and tst021.."
session addconf servicegroup --type=group --members=tst020,tst021
if [ "$?" != 0 ]; then
    echo "Failure: could not add group for some reason.."
    failure="could not add group; $failure"
fi


# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi
