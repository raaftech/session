"""Module with local abstract base classes for OSes"""

import sys


(python_version_major, python_version_minor, micro, releaselevel, serial) = sys.version_info

if python_version_major > 2 or (python_version_major == 2 and python_version_minor >= 6):
    # Python version >= 2.6
    # (N.B. The abc module was added in Python 2.6)

    from abc import ABCMeta, abstractmethod  # Standard module
    
    class OS:
        __metaclass__ = ABCMeta
        @abstractmethod
        def stop(self): pass
        @abstractmethod
        def restart(self): pass

else:
    # Python version < 2.6

    #
    # Define null abstract base classes
    #

    class OS: pass

