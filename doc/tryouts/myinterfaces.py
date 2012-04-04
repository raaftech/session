from zope.interface import Interface

class PluginBase(Interface):
    def load(input):
        """Retrieve data from the input source and return an object."""
        return

    def save(output, data):
        """Save the data object to the output."""
        return

    def foo():
        """Do something else."""
        return

