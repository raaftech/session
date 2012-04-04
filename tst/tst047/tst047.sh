#!/bin/bash

# TST047: check host that is not on or reachable, state should be unreachable
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Checking state of host that is either off or unreachable.."
session addconf $test_stopped_host --type=host --osmt=unix-like --acmt=ssh --exmt=ssh --user=foo --admin=root --addr=1.2.3.47
result=$(session state $test_stopped_host)
echo $result
session delconf $test_stopped_host

if [[ ! "$result" =~ "unreachable" ]]; then
    echo "Failure: state check did not return unreachable.."
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