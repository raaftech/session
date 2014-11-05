#!/bin/bash

# TST010: add host system with a non-valid fqdn, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

invalid="invalid.domain.com_"
session addconf tst010 --type=host --osmt=embedded-like --acmt=none --exmt=none --user=none --admin=none --addr=$invalid
if [ "$?" != 0 ]; then
    echo "Failure: addr \"$invalid\" is not a valid fqdn.."
    failure="addr \"$invalid\" invalid; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi