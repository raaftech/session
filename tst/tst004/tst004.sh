#!/bin/bash

# TST004: add host system with an invalid name, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

# Check three invalid names. Set failure if any fails.
invalids="-invalid invalid- in~valid"
for invalid in $invalids; do
	session addconf $invalid --type=host --osmt=embedded-like --acmt=none --exmt=none --user=none --admin=none --addr=1.2.3.4
	if [ "$?" != 0 ]; then
	    echo "Failure: name \"$invalid\" is not a valid name.."
        failure="name \"$invalid\" invalid; $failure"
	fi
done

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi