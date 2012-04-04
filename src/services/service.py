"""Service module"""

import time

from utils.errors import UnrecognizedInitArgsError
import config
from iron.sockets import Sockets, Assessment


class Service:
    """Descriptor of a service.
    Includes socket information.
    Subclassed.

    Attributes:
        .machine  Machine   on which this service runs (REQUIRED)
        .sockets  Sockets   through which this service is accessible
    """

    def __init__(self, **kwargs):
        self.machine = kwargs.pop('machine')  # Yes, raise exception if absent
        self.sockets = kwargs.pop('sockets', None)
        if kwargs: raise UnrecognizedInitArgsError(self)
        if self.sockets is None:
            self.sockets = Sockets()

    def get_assessment(self):
        """Update and get best assessment of this service using its available sockets"""
        for scktaddr in self.sockets:
            nw_ssssmnt = Assessment.assess(scktaddr)
            if nw_ssssmnt.condition == Assessment.RESPONDED:
                self.sockets[scktaddr] = nw_ssssmnt
                return nw_ssssmnt


class Services(dict):
    """Dictionary of Service objects keyed by name"""

    def best_access(self):
        '''Return the best access service, if any'''
        for srvnm in config.access_service_names:
            if srvnm in self:
                # FIXME: Check assessment
                return self[srvnm]
        return None

    def best_execution(self):
        '''Return the best execution service, if any'''
        for srvnm in config.execution_service_names:
            if srvnm in self:
                # FIXME: Check assessment
                return self[srvnm]
        return None

