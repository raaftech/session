#!/bin/bash

# TST042: discover a host by valid ip address, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

# Some test-specific globals.
sesdir="$HOME/.session"

echo "Attempting discovery of $test_discovery_ipaddress.."
session discover $test_discovery_ipaddress

echo "Checking if $test_discovery_ipaddress was added.."
cat "$sesdir/cfg/session.conf" | grep "$test_discovery_ipaddress"
if [ "$?" != 0 ]; then
    echo "Failure: could not perform discovery of $test_discovery_ipaddress.."
    failure="failed to discover $test_discovery_ipaddress; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi