#!/usr/bin/python
"""The main module"""

import sys

import config


def print_help():
    """Print help text"""
    print "Usage:", config.app_name, "ACTION"
    print "    where ACTION is one of the following:"
    for actn in sorted(actions):
        print "       ", actn

### Actions ###

def help(argv):
    """Print usage text"""
    print_help()

def test(argv):
    """Print 'testing' text"""
    print 'Testing', argv

def get_assessment(argv):
    """Check machine"""
    pass
    # FIXME: Implement.  Take argument as machine name, find that Machine and run its get_assessment()

actions = {
    'get-assessment': get_assessment,
    'help': help,
    'test': test
}

def perform_cmd(argv):
    """Perform action specified in argument list"""
    if len(argv) < 2:
        print_help()
        return

    ### Perform action ###
    try:
        actions[argv[1]](argv)
    except KeyError:
        print_help()
        return 1
    else:
        return 0

if __name__ == '__main__':
    sys.exit(perform_cmd(sys.argv))
