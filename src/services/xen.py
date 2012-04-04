"""xen service"""

import virtualization
import abcs


class Xen(virtualization.Virtualization, abcs.Virtualization):
    """Descriptor of a Xen service"""

    def start(self, machine):
        """Start given slave machine"""

        mchn = self._get_slave(machine)
        print "Starting", mchn.name + "."
        # N.B.: Return only when slave is up and running!
        # FIXME: Implement
        
    def stop(self, machine):
        """Stop given slave machine"""

        mchn = self._get_slave(machine)
        print "Stopping", mchn.name + "."
        # FIXME: Implement

    def restart(self, machine):
        """Restart given slave machine"""

        mchn = self._get_slave(machine)
        print "Restarting", mchn.name + "."
        # N.B.: Return only when slave is up and running!
        # FIXME: Implement

