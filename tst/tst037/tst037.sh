#!/bin/bash

# TST037: delete all previous services, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Deleting previously created service tst020.."
session delconf tst020
if [ "$?" != 0 ]; then
    echo "Failure: could not delete service tst020 for some reason.."
    failure="could not delete service tst020; $failure"
fi

echo "Deleting previously created service tst021.."
session delconf tst021
if [ "$?" != 0 ]; then
    echo "Failure: could not delete service tst021 for some reason.."
    failure="could not delete service tst021; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi