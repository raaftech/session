
class Enum(set):
    """Enumerated set of strings

    >>> e1 = Enum(['foo', 'bar'])
    >>> e2 = Enum(['foo', 'bar'])
    >>> e1.foo == e1.foo, e1.foo == e1.bar, e1.foo == e2.foo
    (True, False, False)
    """

    illegals = ['add', 'clear', 'copy', 'difference_update', 'discard', 'intersection_update', 'pop', 'remove', 'symmetric_difference_update', 'update']

    def __getattribute__(self, name):
        if name in Enum.illegals:
            raise AttributeError
        if set.__contains__(self, name):
            return name
        return set.__getattribute__(self, name)

