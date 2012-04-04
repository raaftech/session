#!/bin/bash

# TST012: add guest with a non-existing host, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

invalid=non-existing-host
session addconf tst012 --type=guest --osmt=embedded-like --acmt=none --exmt=none --user=none --admin=none --addr=1.2.3.4 --host=$invalid
if [ "$?" != 0 ]; then
    echo "Failure: host \"$invalid\" does not exist.."
    failure="host \"$invalid\" invalid; $failure"
fi

session delconf tst012
if [ "$?" != 0 ]; then
    echo "Failure: guest \"tst012\" does not exist.."
    failure="guest \"tst012\" invalid; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi