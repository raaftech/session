#!/bin/bash

# TST026: modify host with no vrmt to any vrmt, verify vmhome, vmdata are required
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

echo "Attempting to modify host tst016.."
session modconf tst016 --type=host --vrmt=kvm --osmt=rhel6 --acmt=ssh --exmt=ssh

echo "Checking if modification happened.."
session list tst016 --verbose | grep -w "kvm"
if [ "$?" != 0 ]; then
    echo "Failure: modification did not happen (as expected).."
    failure="modification failed; $failure"
fi


# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi
