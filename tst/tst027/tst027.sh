#!/bin/bash

# TST027: modify host and change vmhome and vmdata, verify options.conf is changed
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

echo "Attempting to modify host tst016.."
session modconf tst016 --type=host --vrmt=kvm --osmt=rhel6 --acmt=ssh --exmt=ssh --vmhome=/usr/bin --vmdata=/var/lib/libvirt

echo "Checking if vmhome was stored correctly.."
cat ~/.session/sys/tst016/options.conf | grep "vmhome='/usr/bin'"
if [ "$?" != 0 ]; then
    echo "Failure: vmhome was not set correctly.."
    failure="vmhome was not set correctly; $failure"
fi

echo "Checking if vmdata was stored correctly.."
cat ~/.session/sys/tst016/options.conf | grep "vmdata='/var/lib/libvirt'"
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
