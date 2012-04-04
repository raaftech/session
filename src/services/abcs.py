"""Module with local abstract base classes for services"""

#
# Here we define so-called abstract base classes.  For now we
# use them in order to enforce the implementation of certain
# methods, viz., the methods decorated with '@abstractmethod'
# below.
#

import sys

(python_version_major, python_version_minor, micro, releaselevel, serial) = sys.version_info

if python_version_major > 2 or (python_version_major == 2 and python_version_minor >= 6):
    # Python version >= 2.6

    # (N.B. The abc module was added in Python 2.6)

    from abc import ABCMeta, abstractmethod
    
    class Access:
        __metaclass__ = ABCMeta
        @abstractmethod
        def access(self, cmd): pass
    
    class Execution:
        __metaclass__ = ABCMeta
        @abstractmethod
        def execute(self, cmd): pass
    
    class Virtualization:
        __metaclass__ = ABCMeta
        @abstractmethod
        def start(self, m): pass
        @abstractmethod
        def stop(self, m): pass
        @abstractmethod
        def own(self, m): pass
        @abstractmethod
        def owns(self, m): pass

else:
    # Python version < 2.6

    class Access: pass
    class Execution: pass
    class Virtualization: pass

