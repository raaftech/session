#!/usr/bin/python
"""Test suite"""

import sys
import unittest
from unittest import TestCase
import cStringIO
import socket
import time

import s2
import utils
import iron.network
import iron.machine
import iron.sockets
import services.service
import services.ssh
import oses.linux
import oses.windows
import access.credential

class HandyTestCase(TestCase):

    def divert_stdout(self):
        self.orig_stdout = sys.stdout
        sys.stdout = cStringIO.StringIO()

    def undivert_stdout(self):
        strm = sys.stdout
        sys.stdout = self.orig_stdout
        return strm

    def assert_contains_string(self, strm, strng, msg=None):
        self.assertEqual(strm.getvalue(), strng, msg)


class TestMain(HandyTestCase):

    def setUp(self):
        pass

    def test_help(self):
        """Test the 'help' command"""
        self.divert_stdout()
        s2.print_help()
        strm = self.undivert_stdout()
        self.assert_contains_string(
            strm,
            """Usage: s2 ACTION
    where ACTION is one of the following:
        get-assessment
        help
        test
""")

    def test_test(self):
        """Test main's 'test' command"""
        argv = ['s2.py', 'test']
        self.divert_stdout()
        s2.perform_cmd(argv)
        strm = self.undivert_stdout()
        self.assert_contains_string(
            strm,
            """Testing ['s2.py', 'test']
""")


class LandscapeyCase(HandyTestCase):

    def set_up_landscape(self):
        """Set up a simple landscape with two machines, lclhst and slvhst."""
        
        lclhst = iron.machine.Machine(name='lclhst')
        lclhst.os=oses.linux.Linux(machine=lclhst)
        for service_name in ['microsoft_ds', 'ssh', 'xen']:
            __import__('services.' + service_name)
            srv = services.__dict__[service_name].__dict__[service_name.capitalize()](machine=lclhst)
            srv.sockets = iron.sockets.Sockets()
            srv.sockets[(socket.AF_INET, ('127.0.0.1', service_name))] = iron.sockets.Assessment(condition=iron.sockets.Assessment.RESPONDED)
            lclhst.services[service_name] = srv
        self.ntwrk = iron.network.Network(address='1.2.3.4')
        slvhst = iron.machine.Machine(name='slvhst', master=lclhst)
        slvhst.os = oses.windows.Windows(machine=slvhst)
        lclhst.services['xen'].own(slvhst)
        self.ntwrk.machines['lclhst'] = lclhst
        self.ntwrk.machines['slvhst'] = slvhst


class TestLandscape(LandscapeyCase):

    def test_landscape_correctness(self):
        """Test the simple landscape for correctness"""
	self.set_up_landscape()
        lclhst = self.ntwrk.machines['lclhst']
        slvhst = self.ntwrk.machines['slvhst']
        self.assertEqual(lclhst.name, 'lclhst')
        self.assertEqual(slvhst.name, 'slvhst')
        self.assertTrue('ssh' in lclhst.services)
        self.assertTrue('microsoft_ds' in lclhst.services)
        self.assertTrue('xen' in lclhst.services)
        self.assertTrue(isinstance(lclhst.os, oses.linux.Linux))
        self.assertTrue(isinstance(slvhst.os, oses.windows.Windows))
        self.assertTrue(lclhst.services['xen'].owns('slvhst'))
        self.assertTrue(lclhst.services.best_access().__class__.__name__ == 'Ssh')
        self.assertTrue(lclhst.services.best_execution().__class__.__name__ == 'Microsoft_ds')
        self.assertTrue((socket.AF_INET, ('127.0.0.1', 'ssh')) in lclhst.services['ssh'].sockets)
        self.assertTrue((socket.AF_INET, ('127.0.0.1', 'microsoft_ds')) in lclhst.services['microsoft_ds'].sockets)
        self.assertTrue((socket.AF_INET, ('127.0.0.1', 'xen')) in lclhst.services['xen'].sockets)
        self.assertFalse((socket.AF_INET, ('127.0.0.1', 'xen')) in lclhst.services['ssh'].sockets)
        self.assertTrue('lclhst' in self.ntwrk.machines)
        self.assertTrue(str(lclhst.get_assessment()).startswith("responded@"))
        for cmd, outpt in [
            ("lclhst.stop()", "Stopping.\n"),
            ("lclhst.stop('slvhst')", "Stopping slvhst.\n"),
            ("lclhst.stop(slvhst)", "Stopping slvhst.\n"),
            ("lclhst.stop('lclhst')", "s2: Error: Could not find machine to stop.\n"),
            ("lclhst.stop(lclhst)", "s2: Error: Could not find machine to stop.\n"),
            ("lclhst.stop('bOgUsname')", "s2: Error: Could not find machine to stop.\n"),
            ("lclhst.stop(iron.machine.Machine(name='b0gUsNaMe'))", "s2: Error: Could not find machine to stop.\n"),
            ("lclhst.start()", "s2: Error: A machine cannot start itself!\n"),
            ("lclhst.start('slvhst')", "Starting slvhst.\n"),
            ("lclhst.start(slvhst)", "Starting slvhst.\n"),
            ("lclhst.start('lclhst')", "s2: Error: Could not find machine to start.\n"),
            ("lclhst.start(lclhst)", "s2: Error: Could not find machine to start.\n"),
            ("lclhst.start('bOgUsname')", "s2: Error: Could not find machine to start.\n"),
            ("lclhst.start(iron.machine.Machine(name='b0gUsNaMe'))", "s2: Error: Could not find machine to start.\n"),
            ("lclhst.restart()", "Restarting.\n"),
            ("lclhst.restart('slvhst')", "Restarting slvhst.\n"),
            ("lclhst.restart(slvhst)", "Restarting slvhst.\n"),
            ("lclhst.restart('lclhst')", "s2: Error: Could not find machine to restart.\n"),
            ("lclhst.restart(lclhst)", "s2: Error: Could not find machine to restart.\n"),
            ("lclhst.restart('bOgUsname')", "s2: Error: Could not find machine to restart.\n"),
            ("lclhst.restart(iron.machine.Machine(name='b0gUsNaMe'))", "s2: Error: Could not find machine to restart.\n"),
            ("print 'yay'", "yay\n")
        ]:
            self.divert_stdout()
            exec(cmd)
            strm = self.undivert_stdout()
            msg = "On command " + repr(cmd) + " expected " + repr(outpt) + " but got " + repr(strm.getvalue()) + "."
            self.assert_contains_string(strm, outpt, msg)

        # Now corrupt things
        self.ntwrk.machines.check_name_consistency()
        self.ntwrk.machines['slvhst'].name = 'othername'  # "Corrupt" machines dictionary
        self.assertRaises(iron.network.MachinesNameError, self.ntwrk.machines.check_name_consistency)

class TestReadSessionconf(HandyTestCase):

    def test_read_sessionconf(self):
        """Test the session.conf-reading code"""
        mchns = iron.network.Machines()
        mchns.read_sessionconf("test.session.conf")
        self.assertTrue('aaaa' in mchns)
        # FIXME: Added masses more tests here

class TestManipulateVmware(TestCase):

    def test_switch_off_dubrovnic(self):
        dubrovnic = iron.machine.Machine(name='dubrovnic')
        dubrovnic.os = oses.linux.Linux(machine=dubrovnic)
        ssh = services.ssh.Ssh(machine=dubrovnic)
        ssh.sockets[(socket.AF_INET, ('192.168.20.122', 'ssh'))] = iron.sockets.Assessment(condition=iron.sockets.Assessment.RESPONDED)
        ssh.credential = access.credential.UsernameDssCredential(username="user", filename="./user.id_dsa")
        dubrovnic.services['ssh'] = ssh
        dubrovnic.stop()
        ssh.credential = access.credential.UsernamePasswordCredential(username="user", password="user") 
        dubrovnic.stop()

class TestAssessment(TestCase):

    def _create_assessment_badly_1(self):
        ssssmnt = iron.sockets.Assessment()

    def test_assessment(self):
        self.assertRaises(KeyError, self._create_assessment_badly_1)
        ssssmnt = iron.sockets.Assessment(condition=iron.sockets.Assessment.RESPONDED)
        tm = time.time()
        ssssmnt = iron.sockets.Assessment(condition=iron.sockets.Assessment.RESPONDED, time=tm)
        self.assertEqual(ssssmnt.time, tm)


loader = unittest.TestLoader()
suite = loader.loadTestsFromTestCase(TestMain)
suite.addTest(loader.loadTestsFromTestCase(TestLandscape))
suite.addTest(loader.loadTestsFromTestCase(TestReadSessionconf))
suite.addTest(loader.loadTestsFromTestCase(TestAssessment))
suite.addTest(loader.loadTestsFromTestCase(TestManipulateVmware))
unittest.TextTestRunner(verbosity=2).run(suite)

