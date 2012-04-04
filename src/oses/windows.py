"""Windows OS module"""

import os
import abcs


class Windows(os.OS, abcs.OS):

    def stop(self):
        print "Stopping."
        # FIXME: Implement

    def restart(self):
        print "Restarting."
        # FIXME: Implement
