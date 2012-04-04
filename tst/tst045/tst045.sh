#!/bin/bash

# TST045: check guest that does not exist, state should be non-existing
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Checking state of non-existing guest.."
parent=$(session list all --verbose | grep '127.0.0.1' | cut -d ' ' -f 2 | cut -d '(' -f 1)
if [ ! -z "$parent" ]; then
	session addconf $test_nonexisting_guest --type=guest --osmt=unix-like --acmt=ssh --exmt=ssh --user=foo --admin=root --addr=1.2.3.45 --host=$parent
else
    echo "Failure: could not find a suitable host.."
    failure="no host system found; $failure"
fi

result=$(session state $test_nonexisting_guest)
echo $result
session delconf $test_nonexisting_guest

if [[ ! "$result" =~ "non-existing" ]]; then
    echo "Failure: state check did not return non-existing.."
    failure="state check failed; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi