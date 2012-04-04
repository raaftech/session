#!/bin/bash

# TST001: session first time run should create default .session layout
test_intr=0 # Is this test interactive (0=no, 1=yes)?
test_exit=0 # For this test to pass, the exit code should be?

# Some test-specific globals.
sesdir="$HOME/.session"
reqdirs="cfg log sys tmp tpl"
reqfiles="session.conf options.conf tools.required tools.found"

# First check if an existing $sesdir is found and temporarily move it
# out of the way.
if [ -d "$sesdir" ]; then
	echo "Existing $sesdir directory found, moving out of the way.."
	mv "$sesdir" "$sesdir.backup.$$"
	sesmoved="1"
fi

# Simulated first-time run of session.
echo "Invoking session with no pre-existing $sesdir (first-time run).."
echo "This will create a new $sesdir which we will test.."
session version

# Does $sesdir exist and is it a directory?
if [ -d "$sesdir" ]; then
    echo "Success: $sesdir was found and is a directory.."
else
    echo "Failure: $sesdir was not found or is not a directory.."
    failure="$sesdir was not found or not a directory; $failure"
fi

# Do $reqdirs exist and are they directories?
for reqdir in $reqdirs; do
    if [ -d "$sesdir/$reqdir" ]; then
        echo "Success: $sesdir/$reqdir was found and is a directory.."
    else
        echo "Failure: $sesdir/$reqdir was not found or is not a directory.."    
        failure="$sesdir/$reqdir was not found or not a directory; $failure"
    fi
done

# Do $reqfiles exist and are they files?
for reqfile in $reqfiles; do
    if [ -e "$sesdir/cfg/$reqfile" ]; then
        echo "Success: $sesdir/cfg/$reqfile was found and is a file.."
    else
        echo "Failure: $sesdir/cfg/$reqfile was not found or is not a file.."    
        failure="$sesdir/cfg/$reqfile was not found or is not a file; $failure"
    fi
done

# Tests are done. Since all other tests require a known-state $sesdir, we will
# not automatically remove the created $sesdir, but inform the user that we
# have moved any possibly pre-existing $sesdir to a safe location.
echo "Tests are done, leaving created $sesdir in place for other tests."
if [ "$sesmoved" ]; then
	echo "Your previous session settings were saved as $sesdir.backup.$$."
    unset sesmoved
fi

# If $failure was not set, everything worked as expected, exit 0, else
# something went wrong, exit 1.
if [ ! "$failure" ]; then
    echo "No failures occurred, exiting with exit code 0."
    exit 0
else
    echo "One or more failures occurred, exiting with exit code 1."
    exit 1
fi