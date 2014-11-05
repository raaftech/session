#!/bin/bash

# TST050: check host with a disabled acmt or exmt, state should be busy
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

session addconf $test_busy_host --type=host --osmt=unix-like --acmt=tnet --exmt=tnet --user=foo --admin=root --addr=1.2.3.47
result=$(session state $test_busy_host)
echo $result
session delconf $test_busy_host

if [[ ! "$result" =~ "busy" ]]; then
    echo "Failure: state check did not return busy.."
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
