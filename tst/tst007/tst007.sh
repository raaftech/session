#!/bin/bash

# TST007: add host system with a non-valid exmt, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

invalid=non-existing-exmt
session addconf tst007 --type=host --osmt=embedded-like --acmt=none --exmt=$invalid --user=none --admin=none --addr=1.2.3.4
if [ "$?" != 0 ]; then
    echo "Failure: exmt \"$invalid\" is not a valid exmt.."
    failure="exmt \"$invalid\" invalid; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi