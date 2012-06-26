# nose tests

import os
import string
import nose
import nose.plugins
import nose.plugins.capture
import tempfile
import re

import enum
import session

def assert_is_sane_absolute_path(s):
    assert isinstance(s, str)
    assert s is not None
    assert s[0] == '/'
    assert len(s) > 1

def assert_is_sane_directory_name(s):
    assert isinstance(s, str)
    assert s is not None
    assert len(s) > 1
    assert '/' not in s

def assert_is_sane_file_name(s):
    assert isinstance(s, str)
    assert s is not None
    assert len(s) > 1
    assert '/' not in s

def test_Enum():
    e0 = enum.Enum([])
    assert len(e0) == 0
    e0 = enum.Enum(['a', 'a'])
    assert len(e0) == 1
    e0 = enum.Enum(['a', 'b'])
    assert len(e0) == 2
    assert e0.a != e0.b
    assert e0.a in e0
    e1 = enum.Enum(['a', 'b'])
    assert e1.a in e1

@nose.tools.raises(AttributeError)
def test_Enum_bad_clear_method():
    e = enum.Enum(['x'])
    e.clear()  # Illegal method

def test_session_home():
    assert_is_sane_absolute_path(session.session_home)
    assert os.path.isfile(os.path.join(session.session_home, 'src/session.py'))
    assert not os.path.isfile(os.path.join(session.session_home, 'src/bogusu89ujfjksjh'))

def test_compute_usrcfd():
    assert_is_sane_absolute_path(session.usrcfd)

def test_version():
    assert len(session.version) > 2
    assert float(session.version) >= 2.0

def test_tag():
    assert len(session.tag) > 0

def test_terminal_color_escape_sequences():
    for s in session.terminal_color_escape_sequences:
        assert s is not None
        assert isinstance(s, str)

def assert_is_sane_enum(e):
    assert isinstance(e, session.Enum)
    assert isinstance(e, set)
    assert len(e) > 0

def test_KnownThingies():
    for e in [session.KnownTypes, session.KnownModes, session.KnownOsMts, session.KnownVrMts, session.KnownCrMts, session.KnownSvMts, session.KnownExMts, session.KnownAcMts]:
        assert_is_sane_enum(e)

def test_paths():
    for s in [
        session.cfg_dirname,
        session.tmp_dirname,
        session.log_dirname
        ]:
        assert_is_sane_directory_name(s)
        
    for s in [
        session.cff_filename,
        session.opt_filename,
        session.log_filename
        ]:
        assert_is_sane_file_name(s)

    for s in [
        session.syscfd,
        session.usrcfd,
        session.syscfd_cfg,
        session.usrcfd_cfg,
        session.usrcfd_tmp,
        session.usrcfd_log,
        session.syscff,
        session.sysopt,
        session.usrcff,
        session.usropt,
        session.logfile
        ]:
        assert_is_sane_absolute_path(session.usrcfd)

def test_mode():
    for m in [session.defaultmode, session.mode]:
        assert m in session.KnownModes

def test_hostname():
    s = session.hostname
    assert isinstance(s, str)
    assert len(s) > 1
    assert str.islower(s)
    assert '.' not in s

def test_platform():
    s = session.platform_
    assert s in session.Platforms

def test_Options():
    o = session.Options()
    assert o.ass_repr() == ''
    o['foo'] = 1
    assert o.ass_repr() == 'foo=1\n'
    o['bar'] = 2
    assert o.ass_repr() == """foo=1
bar=2
"""

def test_options():
    o = session.options
    assert isinstance(o, session.Options)
    assert o['terminal'] in session.Terminals
    assert o['desktop'] in session.Desktops
    assert o['browser'] in session.Browsers
    assert o['smbtell'] in session.Smbtells
    assert o['sshtell'] in session.Sshtells
    assert o['smbsend'] in session.Smbsends
    assert o['sshsend'] in session.Sshsends
    assert o['privesc'] in session.Privescs
    assert o['debug'] == '1' or o['debug'] == '0'

def test_read_settings_from_file():
    o = session.Options()
    o['foo'] = 'bar'
    with tempfile.NamedTemporaryFile() as f:
        f.write("""
            foo=1 #xxx
                # 
                 bar=gah""")
        f.flush()
        o.read_settings_from_file(f.name)
    assert o['foo'] == '1'
    assert o['bar'] == 'gah'
    assert len(o) == 2

def test_backslash_char():
    assert len(session.backslash_char) == 1

def test_username():
    assert len(session.user) > 0
    assert len(session.userDblBacksl) > 0

def test_report():
    c = nose.plugins.capture.Capture()
    msg = 'foo'
    c.begin()
    session.report(msg)
    c.finalize(0)
    assert c.buffer == msg + '\n'
    c.begin()
    session.reportSession(msg)
    c.finalize(0)
    assert c.buffer == 'Session: ' + msg + '\n'
    c.begin()
    session.reportError('Ignore this test message content in test_report()')
    c.finalize(0)
    assert c.buffer == ''  # Because msg didn't go to stdout


# test_reportSession
# test_reportInfo
# test_reportWarning
# test_reportError
# test_reportDebugUnconditionally
# test_reportDebug
# test_reportDebugFuncEntry

# test_isLoopback() is tested inline

def test_isLocal():
    assert session.isLocal(session.hostname)

# forwardizePath tested inline

# backwardizePath tested inline

# toRemoteWindowsPath tested inline

def test_viaScript():
    c = nose.plugins.capture.Capture()
    c.begin()
    print 'STUFFSTUFF'
    session.viaScript('echo "Ignore this test message content in test_viaScript()"', 'yowza')
    c.finalize(0)
    assert c.buffer == 'STUFFSTUFF\n'  # We don't capture the subprocess's output

def test_localTellCommandString():
    r = session.localTellCommandString('scuba')
    assert r == 'scuba\n' or c == '@echo off\nscuba\n'

def test_psexecSmbTellCommandString():
    r = session.psexecSmbTellCommandString('addressie', 'usie', 'passie', 'commandie')
    assert r == 'psexec \\\\addressie -h usie passie cmd.exe /c "commandie" 2>nul\n'

def test_winexeSmbTellCommandString():
    r = session.winexeSmbTellCommandString('addressie', 'usie', 'passie', 'commandie')
    assert r == '''winexe --debug-stderr --user 'usie' --password='passie' //addressie 'cmd.exe /c "commandie"' 2>/dev/null\n'''

def test_plinkSshTellCommandString():
    r = session.plinkSshTellCommandString('addressie', 'usie', 'commandie')
    pat = 'plink -batch -x -i .* -l "usie" addressie "commandie"\n'
    assert r is None or re.match(pat, r) is not None

def test_sshSshTellCommandString():
    r = session.sshSshTellCommandString('addressie', 'usie', 'commandie')
    pat = '''ssh -i .* -l 'usie' 'addressie' 'commandie'\n'''
    assert r is None or re.match(pat, r) is not None

def test_localSendCommandString():
    bckp = session.platform_
    session.platform_ = session.Platforms.windows
    r = session.localSendCommandString(r'\sourcie', r'\targie')
    assert r == 'robocopy /e "/sourcie" "/targie" >nul 2>&1\n'
    session.platform_ = session.Platforms.linux
    r = session.localSendCommandString('/sourcie', '/targie')
    assert r == 'cp -Rpd "/sourcie" "/targie" >/dev/null 2>&1 </dev/null\n'
    session.platform_ = bckp

def test_robocopySmbSendCommandString():
    bckp = session.platform_
    session.platform_ = session.Platforms.windows
    r = session.robocopySmbSendCommandString('addrie', 'userie', 'passie', r'C:\sourcie', r'C:\targie')
    mtch = r"""net use \\addrie\C$ /user:"userie" "passie" 2>nul
robocopy /e "C:/sourcie" "\\addrie\C$\targie" >nul 2>&1
net use \\addrie\C$ /delete >nul 2>&1
"""
    assert r == mtch
    session.platform_ = bckp

def test_smbclientSmbSendCommandString():
    bckp = session.platform_
    session.platform_ = session.Platforms.linux
    r = session.smbclientSmbSendCommandString('addrie', 'userie', 'passie', '/foo/sourcie', r'C:\targie')
    mtch = r"""smbclient '//addrie/C$' -U "userie%passie" -c 'mkdir "\targie";cd "\targie";lcd "/foo/sourcie";prompt off;recurse on;mput *;quit' 2>/dev/null
"""
    assert r == mtch
    session.platform_ = bckp

def test_pscpSshSendCommandString():
    bckp = session.platform_
    session.platform_ = session.Platforms.windows
    r = session.pscpSshSendCommandString('addrie', 'usroptie', '/foo/sourcie', r'C:\targie')
    pat = r"""pscp -i .* -scp -p -q -r -l "usroptie" "/foo/sourcie" addrie:"C:\targie"
    assert r is None or re.match(pat, r) is not None
"""
    session.platform_ = bckp

def test_scpSshSendCommandString():
    bckp = session.platform_
    session.platform_ = session.Platforms.linux
    r = session.scpSshSendCommandString('addrie', 'usroptie', '/foo/sourcie', '/targie')
    pat = r"""scp -q -i .* -r "/foo/sourcie" usroptie@addrie:"/targie"
"""
    assert r is None or re.match(pat, r) is not None
    session.platform_ = bckp

def test_sshKeyPaths():
    r = session.sshKeyPaths()
    if r is None:
        return
    assert len(r) == 2
    (priv, pub) = r
    assert os.path.exists(priv)
    assert pub is None or os.path.exists(pub)
    # FIXME: Test more thoroughly
 
def test_runningProcessOfProgram():
    assert session.runningProcessOfProgram('python') is not None  # We know that the Python interpreter is running, at least ;)
    assert session.runningProcessOfProgram('bogusmcbogusjfsdiruw8eo') is None

def test_grepq():
    (fd, pth) = tempfile.mkstemp()
    f = os.fdopen(fd, 'r+')
    f.write('foo\nbar\nbaz')
    f.seek(0)
    assert session.grepq('foo', f)
    f.seek(0)
    assert session.grepq('baz', f)
    f.seek(0)
    assert not session.grepq('glub', f)
    f.close()
    os.remove(pth)

def test_configureSshDisableStrictHostKeyChecking():
    drctr_path = tempfile.mkdtemp()
    file_path = os.path.join(drctr_path,'config')
    session.configureSshDisableStrictHostKeyChecking(drctr_path)
    assert os.path.isfile(file_path)
    old_size = os.path.getsize(file_path)
    session.configureSshDisableStrictHostKeyChecking(drctr_path)
    new_size = os.path.getsize(file_path)
    assert old_size == new_size 
    # Could check contents here too
    os.remove(file_path)
    os.rmdir(drctr_path)
    assert not os.path.isfile(file_path)

def test_startSshAgent():
    # TODO
    pass

#
# Tests that make irreversible changes
#

def test_write_settings_to_options_file():
    # Corrupts session.options
    (fd, pth) = tempfile.mkstemp()
    os.close(fd)
    session.options.write_settings_to_file(pth)
    with open(pth, 'r') as f:
        cntnt = f.read()
    os.remove(pth)
    assert len(cntnt) > 0
    session.options = session.Options()
    session.options['foo'] = 1  # 8 characters
    session.options['bar'] = 0  # 8 characters
    (fd, pth) = tempfile.mkstemp()
    os.close(fd)
    session.options.write_settings_to_file(pth)
    with open(pth, 'r') as f:
        cntnt = f.read()
    os.remove(pth)
    assert len(cntnt) == 12

def test_write_settings_to_file():
    # Corrupts session.options
    with tempfile.NamedTemporaryFile() as f:
        session.options.write_settings_to_file(f.name)
        f.flush()
        cntnt = f.read()
    assert len(cntnt) > 0

    session.options = session.Options()
    session.options['foo'] = 1  # 8 characters
    session.options['bar'] = 0  # 8 characters
    with tempfile.NamedTemporaryFile() as f:
        session.options.write_settings_to_file(f.name)
        f.flush()
        cntnt = f.read()
    assert len(cntnt) == 12

    # import time
    # time.sleep(30)
