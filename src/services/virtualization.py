"""Virtualization service"""

import iron.machine
import service


class Slaves(dict):
    """Dictionary of Machine objects keyed by name"""
    pass


class Virtualization(service.Service):
    """Parent class for Xen, etc."""

    def __init__(self, **kwargs):
        self.slaves = kwargs.pop('slaves', None)
        if self.slaves is None:
            self.slaves = Slaves()
        service.Service.__init__(self, **kwargs)

    def own(self, machine):
        """Take ownership of given machine"""
        if isinstance(machine, iron.machine.Machine):
            self.slaves[machine.name] = machine
        else:
            raise ValueError

    def owns(self, machine):
        """Whether self owns the given machine or not"""
        if isinstance(machine, iron.machine.Machine):
            return machine in self.slaves.values()
        elif isinstance(machine, str):
            return machine in self.slaves
        else:
            raise ValueError
        
    def _get_slave(self, m):
        """Get given slave machine (possibly given by name)"""
        if isinstance(m, iron.machine.Machine):
            return m
        elif isinstance(m, str):
            return self.slaves[m]
        else:
            raise ValueError
