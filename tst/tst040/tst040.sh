#!/bin/bash

# TST040: delete a non-existing entity, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

echo "Deleting non-existing entry tst040.."
session delconf tst040
if [ "$?" != 0 ]; then
    echo "Failure: could not delete host tst040 for some reason.."
    failure="failed to delete host tst040; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi