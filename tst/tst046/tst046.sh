#!/bin/bash

# TST046: check service that does not exist, state should be unknown
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Checking state of a service that does not exist.."
session addconf $test_nonexisting_host --type=host --osmt=unix-like --acmt=ssh --exmt=ssh --user=foo --admin=root --addr=1.2.3.44
session addconf $test_nonexisting_service --type=service --svmt=scripted --addr=1.2.3.46 --port=12346 --svstatus=blahstatus --svstart=blahstart --svstop=blahstop --host=$test_nonexisting_host

result=$(session state $test_nonexisting_service)
echo $result
session delconf $test_nonexisting_service
session delconf $test_nonexisting_host

if [[ ! "$result" =~ "unknown" ]]; then
    echo "Failure: state check did not return unknown.."
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