"""Module containing the Network, Machines and related classes"""

import sys
import re

from utils.errors import UnrecognizedInitArgsError
import machine
                    

class MachinesNameError(Exception):
    """Exception raised if a machine's name is not the same as its key in the Machines dictionary"""
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value) + " mapped to object with different name"

class Machines(dict):
    """Dictionary of Machine objects keyed by name"""

    def check_name_consistency(self):
        """Check name consistency.  Throw exception if there is an error, otherwise do nothing.

        The mapping between key, Machine object, and the latter's name attribute
        must be one-to-one-to-one and the key must equal the attribute.
        """

        # Assertion: It suffices to check that each object's name attribute equals its key.
        # Proof: Assume each object's name equals its key.
        #    Can there be multiple objects with the same key?  No, dict prevents this.
        #    Can there be multiple names for the same object?  No, each object has one name attribute.
        #    Can there be multiple names for the same key?  No: then one of the names would not be equal to the key.
        #    Can there be multiple objects with the same name?  No, for if there were,
        #        the objects would be under the same key, which dict prevents.
        #    Can there be multiple keys for the same object?  No, because the object's one and only name matches its key,
        #        and if it were under multiple keys then the name would have to be different from all but one of the keys,
        #        contrary to our assumption.
        #    Can there be multiple keys for the same name?  No, because then all but one of the keys would be different
        #        from the name, contrary to our assumption.

        for nm, mchn in self.iteritems():
            if nm != mchn.name:
                raise MachinesNameError(nm)
            return

    # Regular expression used to parse session configuration files
    _sessionconf_re_obj = re.compile(r"(?P<type>\w+) (?P<machine>[a-zA-Z0-9_-]+)(?P<config>\(.*\))")

    def read_sessionconf(self, filename):
        fl = open(filename, 'r')
        for ln in fl:
            mtch = Machines._sessionconf_re_obj.match(ln)
            if mtch is None:
                continue
            name = mtch.group('machine')
            type = mtch.group('type')
            config = mtch.group('config').lstrip('(').rstrip(')')
            if type == 'host':
                self[name] = machine.Machine(name=name)
                # FIXME: Add info to the machine object
            elif type == 'guest':
                (os, acmt, exmt, user, admin, ipaddr, hst) = config.split(',')
                if not hst in self:
                    self[hst] = machine.Machine(name=hst)
                self[name] = machine.Machine(name=name, master=self[hst])
            elif type == 'group':
                pass
                # FIXME: Implement
            else:
                # Unrecognized type
                pass


class Network:
    """Network with a particular IP address
    Attributes:
        .address      string    addressing this network
        .machines     Machines  in this network
    """

    def __init__(self, **kwargs):
        self.address = kwargs.pop('address', None)
        self.machines = kwargs.pop('machines', None)
        if kwargs: raise UnrecognizedInitArgsError(self)
        if self.machines is None:
            self.machines = Machines()
        # FIXME: Make .machines a private attribute,
        # write add, remove, etc. methods
        # with appropriate checking of IP addresses against the address of the netork

    def discover(self, addrrange):
        """Discover machines in the address range of this network"""
        pass
        # FIXME: Implement
