#!/bin/bash

# TST018: add existing host with any vrmt, including vmdata and vmhome
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to add a host.."
session addconf tst018 --type=host --vrmt=esx --osmt=esxi4 --acmt=ssh --exmt=ssh --user=root --admin=root --addr=1.2.3.18 --vmhome=/bin --vmdata=/vmfs/volumes/datastore1
if [ "$?" != 0 ]; then
    echo "Failure: could not add host for some reason.."
    failure="could not add host with a vrmt; $failure"
fi

echo "Checking if vmhome was stored correctly.."
cat ~/.session/sys/tst018/options.conf | grep "vmhome='/bin'"
if [ "$?" != 0 ]; then
    echo "Failure: vmhome was not set correctly.."
    failure="vmhome was not set correctly; $failure"
fi

echo "Checking if vmdata was stored correctly.."
cat ~/.session/sys/tst018/options.conf | grep "vmdata='/vmfs/volumes/datastore1'"
if [ "$?" != 0 ]; then
    echo "Failure: vmdata was not set correctly.."
    failure="vmdata was not set correctly; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi