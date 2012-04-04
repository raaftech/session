"""OS module"""

from utils.errors import UnrecognizedInitArgsError


class OS:
    """Parent class for Linux, Windows, etc.
    Attributes:
        .machine      Machine    - on which this OS is installed (REQUIRED)
    """

    def __init__(self, **kwargs):
        self.machine = kwargs.pop('machine')  # Yes, raise exception if absent
        if kwargs: raise UnrecognizedInitArgsError(self)
