#!/bin/bash

# TST043: discover a host by subnet address, verify
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

# Some test-specific globals.
sesdir="$HOME/.session"

# Store modified time of any pre-existing session.conf.
if [ -e "$sesdir/cfg/session.conf" ]; then
    session_conf_seconds="$(date -r "$sesdir/cfg/session.conf" +%T)"
else
    session_conf_seconds="0"
fi

echo "Attempting discovery of $test_discovery_iprange.."
session discover $test_discovery_iprange

echo "Checking if $test_discovery_iprange was added.."
new_session_conf_seconds="$(date -r "$sesdir/cfg/session.conf" +%T)"
if [ "$session_conf_seconds" = "$new_session_conf_seconds" ]; then
    echo "Failure: could not perform discovery of $test_discovery_iprange.."
    failure="failed to discover $test_discovery_iprange; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi