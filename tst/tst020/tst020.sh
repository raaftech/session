#!/bin/bash

# TST020: add service with none svmt with the previous guest as its parent
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to add a none service.."
session addconf tst020 --type=service --svmt=none --addr=2.3.4.5 --port=8080 --host=tst019
if [ "$?" != 0 ]; then
    echo "Failure: could not add service for some reason.."
    failure="could not add service; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi