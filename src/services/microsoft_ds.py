"""microsoft-ds service, serving your local psexec command"""

import service

import abcs


class Microsoft_ds(service.Service, abcs.Execution):

    def execute(self, cmd):
        # FIXME: Implement
        pass

