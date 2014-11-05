#!/bin/bash

# TST038: delete all previous guests, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Deleting previously created guest tst019-1.."
session delconf tst019-1
if [ "$?" != 0 ]; then
    echo "Failure: could not delete guest tst019-1 for some reason.."
    failure="could not delete guest tst019-1; $failure"
fi

echo "Deleting previously created guest tst019-2.."
session delconf tst019-2
if [ "$?" != 0 ]; then
    echo "Failure: could not delete guest tst019-2 for some reason.."
    failure="could not delete guest tst019-2; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi