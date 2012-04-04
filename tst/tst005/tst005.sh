#!/bin/bash

# TST005: add host system with a non-valid osmt, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

invalid=non-existing-osmt
session addconf tst005 --type=host --osmt=$invalid --acmt=none --exmt=none --user=none --admin=none --addr=1.2.3.4
if [ "$?" != 0 ]; then
    echo "Failure: osmt \"$invalid\" is not a valid osmt.."
    failure="osmt \"$invalid\" invalid; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi