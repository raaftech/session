#!/bin/bash

# TST021: add service with scripted svmt with the previous guest as its parent
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to add a scripted service.."
session addconf tst021 --type=service --svmt=scripted --addr=2.3.4.5 --port=8080 --host=tst019 --svstatus="ps ax | grep tst021 | grep -v grep" --svstart="service tst021 start" --svstop="service tst021 stop"
if [ "$?" != 0 ]; then
    echo "Failure: could not add service for some reason.."
    failure="could not add service; $failure"
fi

echo "Checking if svstatus was stored correctly.."
cat ~/.session/sys/tst021/options.conf | grep "svstatus='ps ax | grep tst021 | grep -v grep'"
if [ "$?" != 0 ]; then
    echo "Failure: svstatus was not set correctly.."
    failure="svstatus was not set correctly; $failure"
fi

echo "Checking if svstart was stored correctly.."
cat ~/.session/sys/tst021/options.conf | grep "svstart='service tst021 start'"
if [ "$?" != 0 ]; then
    echo "Failure: svstart was not set correctly.."
    failure="svstart was not set correctly; $failure"
fi

echo "Checking if svstop was stored correctly.."
cat ~/.session/sys/tst021/options.conf | grep "svstop='service tst021 stop'"
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