"""ssh service module"""

import socket
import paramiko

from utils.utils import report_error
from utils.errors import UnrecognizedInitArgsError, NotImplementedError
import access.credential
import service
import abcs
from iron.sockets import Assessment


class Ssh(service.Service, abcs.Access, abcs.Execution):
    """Ssh service

    Additional attributes:
        credential   Credential  which can be used to authenticate to this service
    """

    def __init__(self, **kwargs):
        self.credential = kwargs.pop('credential', None)
        service.Service.__init__(self, **kwargs)

    def execute(self, command):
        #rsa_key = access.credential.UsernameRSACredential(filename=private_key_file)
        for scktaddr in self.sockets:
            if self.sockets[scktaddr][0] == Assessment.RESPONDED:
                cnnctn = SshConnection(socket_addr=scktaddr, credential=self.credential)
                try:
                    cnnctn.execute(command)
                finally:
                    cnnctn.close()
                return
        report_error("Could not access the machine.")
        return

    def access(self, command):
        raise NotImplementedError(self)
        # FIXME: Implement


#
# Derived from code at http://media.commandline.org.uk/code/ssh.txt
#

import os

class SshConnection:

    def __init__(self, **kwargs):
        scktaddr = kwargs.pop('socket_addr')  # Yes, raise exception if absent
        crdntl = kwargs.pop('credential')   # Yes, raise exception if absent
        if kwargs: raise UnrecognizedInitArgsError(self)

        (af, hst_prt) = scktaddr
        if af != socket.AF_INET:
            raise NotImplementedError(self)

        # Ensure that port is represented by an integer, not a string
        (hst, prt) = hst_prt
        if isinstance(prt, str):
            prtnum = socket.getservbyname(prt)
            hst_prt = (hst, prtnum)

        self._sftp_live = False
        self._sftp = None

        # Log to a temporary file
        #import tempfile
        #templog = tempfile.mkstemp('.txt', 'ssh-')[1]
        #paramiko.util.log_to_file(templog)

        # Begin the SSH transport
        self._transport = paramiko.Transport(hst_prt)
        self._tranport_live = True
        # Authenticate the transport
        if isinstance(crdntl, access.credential.UsernamePasswordCredential):
            self._transport.connect(username=crdntl.username, password=crdntl.password)
        elif isinstance(crdntl, access.credential.UsernameKeyCredential):
            self._transport.connect(username=crdntl.username, pkey=crdntl.key)
    
    def _sftp_connect(self):
        """Establish the SFTP connection."""
        if not self._sftp_live:
            self._sftp = paramiko.SFTPClient.from_transport(self._transport)
            self._sftp_live = True

    def get(self, remotepath, localpath = None):
        """Copies a file between the remote host and the local host."""
        if not localpath:
            localpath = os.path.split(remotepath)[1]
        self._sftp_connect()
        self._sftp.get(remotepath, localpath)

    def put(self, localpath, remotepath = None):
        """Copies a file between the local host and the remote host."""
        if not remotepath:
            remotepath = os.path.split(localpath)[1]
        self._sftp_connect()
        self._sftp.put(localpath, remotepath)

    def execute(self, command):
        """Execute the given commands on a remote machine."""
        channel = self._transport.open_session()
        channel.exec_command(command)
        output = channel.makefile('rb', -1).readlines()
        if output:
            return output
        else:
            return channel.makefile_stderr('rb', -1).readlines()

    def close(self):
        """Closes the connection and cleans up."""
        # Close SFTP Connection.
        if self._sftp_live:
            self._sftp.close()
            self._sftp_live = False
        # Close the SSH Transport.
        if self._tranport_live:
            self._transport.close()
            self._tranport_live = False

    def __del__(self):
        """Attempt to clean up if not explicitly closed."""
        self.close()

