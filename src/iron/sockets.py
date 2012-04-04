"""Module containing the Sockets, Assessment and related classes"""

import time
import socket
import nmap

from utils.utils import report_error
from utils.errors import UnrecognizedInitArgsError


class Assessment(tuple):
    """Assessment of a socket's condition at a particular time

    Comprises [0] condition and [1] time.  N.B.: it is immutable!
    The condition must be given at initialization; the time defaults to the present time.
    """

    # Conditions
    UNKNOWN = 'unknown'
    CONFIGURED_ON = 'configured-on'
    RESPONDED = 'responded'
    DID_NOT_RESPOND = 'did-not-respond'

    def __new__(klass, **kwargs):
        cndtn = kwargs.pop('condition')  # Yes, raise exception if absent
        tm = kwargs.pop('time', None)
        if kwargs: raise UnrecognizedInitArgsError(self)
        if tm is None:
            tm = time.time()
        return tuple.__new__(klass, (cndtn, tm))

    def __repr__(self):
        """Return string representation of self"""
        (s, t) = self
        return str(s) + '@' + str(t)

    @property
    def condition(self):
        return self[0]

    @property
    def time(self):
        return self[1]

    @staticmethod
    def assess(socketaddr):
        """Return condition of given socket address"""

        # Session did: nmap -n -PN --host-timeout 1501 -p $port $addr 2> /dev/null | grep -e open -e filtered
        addrss_fml = socketaddr[0]
        if addrss_fml == socket.AF_INET:
            host_str, port_str = socketaddr[1]
            port_num = socket.getservbyname(port_str)
            try:
                nm = nmap.PortScanner()
            except OSError:
                report_error("Could not obtain port state because the nmap port scanner application could not be run")
                return Assessment(condition=Assessment.UNKNOWN)
            try:
                nm.scan(host_str, str(port_num))
            except nmap.PortScannerError:
                report_error("Could not obtain port state; the nmap port scanner application reported an error")
                return Assessment(condition=Assessment.UNKNOWN)
            try:
                if nm[host_str]['tcp'][port_num]['state'] == 'open':
                    return Assessment(condition=Assessment.RESPONDED)
                else:
                    return Assessment(condition=Assessment.DID_NOT_RESPOND)
            except KeyError:
                return Assessment(condition=Assessment.DID_NOT_RESPOND)
        elif addrss_fml == socket.AF_UNIX:
            pass
            # FIXME: Implement
        elif addrss_fml == socket.AF_INET6:
            pass
            # FIXME: Implement
        elif addrss_fml is None:
            raise ValueError("Socket has no address family")
        else:
            raise ValueError("Socket has unrecognized address family")


class Sockets(dict):
    """Dictionary of assessments keyed by socketaddr

    Keys are intended to be socketaddrs.  A socketaddr is a 2ple consisting
    of (0) AF_* and (1) socket address of the forms used by the socket module,
    i.e.:
        (AF_UNIX, pathname:str)
        (AF_INET, (host:str, port:ctypes.c_uint16))
        (AF_INET6, (host:str, port:ctypes.c_uint16, flowinfo:ctypes.c_uint32, scopeid:ctypes.c_uint32))

    Values are assessments.
    """

    def best(self):
        """Return "best" socket

        For now actually just return some RESPONDED socket, otherwise just some socket.
        """
        retval = None
        for scktaddr in self:
            retval = scktaddr
            if self[scktaddr][0] == Assessment.RESPONDED:
                break
        return retval

