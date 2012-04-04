#!/bin/bash

# TST036: delete all previous groups, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Deleting previously created hostgroup.."
session delconf hostgroup
if [ "$?" != 0 ]; then
    echo "Failure: could not delete hostgroup for some reason.."
    failure="could not delete hostgroup; $failure"
fi

echo "Deleting previously created guestgroup.."
session delconf guestgroup
if [ "$?" != 0 ]; then
    echo "Failure: could not delete guestgroup for some reason.."
    failure="could not delete guestgroup; $failure"
fi

echo "Deleting previously created servicegroup.."
session delconf servicegroup
if [ "$?" != 0 ]; then
    echo "Failure: could not delete servicegroup for some reason.."
    failure="could not delete servicegroup; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi