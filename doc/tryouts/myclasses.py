from zope.interface import implements
from zope.component import provideUtility
from myinterfaces import PluginBase


class RegisteredImplementation(object):
    implements(PluginBase)
    
    def load(self, input):
        return input.read()
    
    def save(self, output, data):
        return output.write(data)

provideUtility(RegisteredImplementation(), PluginBase)

