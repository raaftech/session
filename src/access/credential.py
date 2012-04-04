"""Credential module"""

import paramiko

from utils.errors import UnrecognizedInitArgsError


class Credential:
    """A credential.
    """
    pass


class UsernameCredential(str, Credential):
    """A credential consisting of username only
    """

    def __new__(klass, **kwargs):
        username = kwargs.pop('username')  # Yes, raise exception if absent
        if kwargs: raise UnrecognizedInitArgsError(self)
        return str.__new__(klass, username)

    def _get_username(self):
        return self
    username = property(_get_username)


class UsernamePasswordCredential(tuple, Credential):
    """A credential consisting of username and password
    """

    def __new__(klass, **kwargs):
        username = kwargs.pop('username')  # Yes, raise exception if absent
        password = kwargs.pop('password')  # Yes, raise exception if absent
        if kwargs: raise UnrecognizedInitArgsError(self)
        return tuple.__new__(klass, (username, password))

    def __repr__(self):
        """Return string representation of self"""
        (s, t) = self
        return str(s) + ':' + str(t)

    def _get_username(self):
        return self[0]
    username = property(_get_username)

    def _get_password(self):
        return self[1]
    password = property(_get_password)


class UsernameKeyCredential(Credential):
    """A credential consisting of username and (private) key
    """

    def __init__(self, **kwargs):
        # key attribute set in subclass
        self.username = kwargs.pop('username')  # Yes, raise exception if absent
        if kwargs: raise UnrecognizedInitArgsError(self)


class UsernameDssCredential(UsernameKeyCredential):
    """A credential consisting of username and (private) DSS key
    """

    def __init__(self, **kwargs):
        filename = kwargs.pop('filename', None)
        data = kwargs.pop('data', None)
        if data is not None:
            self.key = paramiko.DSSKey(data=data)
        elif filename is not None:
            self.key = paramiko.DSSKey(filename=filename)
        UsernameKeyCredential.__init__(self, **kwargs)


class UsernameRsaCredential(UsernameKeyCredential):
    """A credential consisting of username and (private) DSS key
    """

    def __init__(self, **kwargs):
        filename = kwargs.pop('filename', None)
        data = kwargs.pop('data', None)
        if data is not None:
            self.key = paramiko.DSSKey(data=data)
        elif filename is not None:
            self.key = paramiko.RSAKey(filename=filename)
        UsernameKeyCredential.__init__(self, **kwargs)


