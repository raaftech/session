"""Module containing the Machine class"""

from utils.utils import report_error
from utils.errors import UnrecognizedInitArgsError
import services


class Machine:
    """Descriptor of a computing machine, physical or virtual

    Attributes:
        .name         string    naming this machine (REQUIRED)
        .os           OS        installed on the machine
        .master       Machine   that can start, stop, etc., this machine
        .services     Services  offered by this machine
    """

    def __init__(self, **kwargs):
        self.name = kwargs.pop('name')  # Yes, raise exception if absent
        self.os = kwargs.pop('os', None)
        self.master = kwargs.pop('master', None)
        self.services = kwargs.pop('services', None)
        if kwargs: raise UnrecognizedInitArgsError(self)
        if self.services is None:
            self.services = services.service.Services()

    def _get_virtualization_services_that_own(self, machine):
        """Get list of my virtualization services that own the given machine"""
        return [srvc for srvc in self.services.values() if isinstance(srvc, services.abcs.Virtualization) and srvc.owns(machine)]

    def get_assessment(self):
        """Get assessment of this machine as a whole, using its best access method"""
        return self.services.best_access().get_assessment()

    def execute(self, command):
        """Execute a shell command on this machine using its best execution method"""
        return self.services.best_execution().execute(command)

    def stop(self, machine=None):
        """Stop the given machine, or this machine if none is given"""
        # Similar to "restart" method

        if machine is None:
            self.os.stop()
            return

        #
        # Stop the given machine
        #
        cnt = 0
        for srvc in self._get_virtualization_services_that_own(machine):
            srvc.stop(machine=machine)
            cnt += 1
        if cnt == 0:
            report_error("Could not find machine to stop.")

    def restart(self, machine=None):
        """Reboot the given machine, or this machine if none is given"""
        # Similar to "stop" method

        if machine is None:
            self.os.restart()
            return

        #
        # Restart the given machine
        #
        cnt = 0
        for srvc in self._get_virtualization_services_that_own(machine):
            srvc.restart(machine=machine)
            cnt += 1
        if cnt == 0:
            report_error("Could not find machine to restart.")

    def start(self, machine=None):
        """Start the given machine, or this machine if none is given

        Makes use of recursion to start the whole stack of machines.

        E.g., suppose three machines stand in the master-slave chain a-b-c.
        | user       c             b             a
        | says       says          says          says
        | c.start()
        |            b.start(c)
        |                          a.start(b)
        |                                        start b
        |                          start c
        """

        # For this to work, the start() method must block until the started
        # machine is usable.  Using the example above, b's "a.start(b)" must
        # block until the real machine that b represents has started, so that
        # b's subsequent "start c" can succeed.

        #
        # Get self started if necessary
        #
        if self.master is not None:
            self.master.start(self)

        #
        # Start given machine
        #
        if machine is None:
            if self.master is None:
                report_error("A machine cannot start itself!")
            return

        for srvc in self._get_virtualization_services_that_own(machine):
            srvc.start(machine)
            return

        report_error("Could not find machine to start.")

