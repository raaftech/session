#!/bin/bash

# TST039: delete all previous hosts, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Deleting previously created host tst016.."
session delconf tst016
if [ "$?" != 0 ]; then
    echo "Failure: could not delete host tst016 for some reason.."
    failure="could not delete host tst016; $failure"
fi

echo "Deleting previously created host tst018.."
session delconf tst018
if [ "$?" != 0 ]; then
    echo "Failure: could not delete host tst018 for some reason.."
    failure="could not delete host tst018; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi