#!/bin/bash

# TST017: add existing host with any vrmt, vmdata and vmhome are required
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

echo "Attempting to add a host without required vmhome and vmdata.."
session addconf tst017 --type=host --vrmt=esx --osmt=esxi4 --acmt=ssh --exmt=ssh --user=root --admin=root --addr=1.2.3.4
if [ "$?" = 0 ]; then
    echo "Failure: host was added to configuration without error.."
    failure="could add host with a vrmt; $failure"
fi

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "Failures occured as expected, exiting with exit code 1."
    exit 1
else
    echo "No failures occurred though they were expected, exiting with exit code 0."
    exit 0
fi
