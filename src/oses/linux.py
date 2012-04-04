"""Linux OS module"""

import os
import abcs


class Linux(os.OS, abcs.OS):

    def stop(self):
        print "Stopping."
        self.machine.execute("echo 'shutdown -h now' | wall")

    def restart(self):
        print "Restarting."
        self.machine.execute("echo 'reboot' | wall")
