#!/bin/bash

# TST032: modify service, change svstate, svstart, svstop, verify options.conf
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to modify a scripted service.."
session modconf tst021 --type=service --svmt=scripted --svstatus="ps ax | grep foobar | grep -v grep" --svstart="service foobar start" --svstop="service foobar stop"
if [ "$?" != 0 ]; then
    echo "Failure: could not modify service for some reason.."
    failure="could not modify service; $failure"
fi

echo "Checking if svstatus was changed correctly.."
cat ~/.session/sys/tst021/options.conf | grep "svstatus='ps ax | grep foobar | grep -v grep'"
if [ "$?" != 0 ]; then
    echo "Failure: svstatus was not set correctly.."
    failure="svstatus was not set correctly; $failure"
fi

echo "Checking if svstart was changed correctly.."
cat ~/.session/sys/tst021/options.conf | grep "svstart='service foobar start'"
if [ "$?" != 0 ]; then
    echo "Failure: svstart was not set correctly.."
    failure="svstart was not set correctly; $failure"
fi

echo "Checking if svstop was changed correctly.."
cat ~/.session/sys/tst021/options.conf | grep "svstop='service foobar stop'"
if [ "$?" != 0 ]; then
    echo "Failure: svstop was not set correctly.."
    failure="svstop was not set correctly; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi
