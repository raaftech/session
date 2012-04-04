from zope.interface.verify import verifyClass, verifyObject
from zope.component import getUtility
from myinterfaces import PluginBase
from myclasses import RegisteredImplementation

foo = getUtility(PluginBase)

verifyObject(PluginBase, foo)
verifyClass(PluginBase, RegisteredImplementation)

print list(PluginBase)
