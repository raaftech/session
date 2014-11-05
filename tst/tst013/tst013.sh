#!/bin/bash

# TST013: add guest with an existing host with a none vrmt, should fail
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=1 # For this test to pass, the exit code should be?

invalid=host-with-none-vrmt
session addconf $invalid --type=host --osmt=embedded-like --acmt=none --exmt=none --user=none --admin=none --addr=1.2.3.4 --vrmt=none
session addconf tst013 --type=guest --osmt=embedded-like --acmt=none --exmt=none --user=none --admin=none --addr=1.2.3.5 --host=$invalid
if [ "$?" != 0 ]; then
    echo "Failure: host \"$invalid\" has no vrmt.."
    failure="host \"$invalid\" not a vm host; $failure"
fi

echo "Removing leftover host and guest.."
session delconf tst013
session delconf $invalid

# Check to see if failure was set.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi