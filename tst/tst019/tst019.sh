#!/bin/bash

# TST019: add two guests with the previous host as their parent
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to add two guests.."

session addconf tst019-1 --type=guest --osmt=rhel5 --acmt=ssh --exmt=ssh --user=root --admin=root --addr=1.2.3.191 --host=tst018
if [ "$?" != 0 ]; then
    echo "Failure: could not add guest tst019-1 for some reason.."
    failure="could not add guest tst019-1; $failure"
fi

session addconf tst019-2 --type=guest --osmt=rhel5 --acmt=ssh --exmt=ssh --user=root --admin=root --addr=1.2.3.192 --host=tst018
if [ "$?" != 0 ]; then
    echo "Failure: could not add guest tst019-2 for some reason.."
    failure="could not add guest tst019-2; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi