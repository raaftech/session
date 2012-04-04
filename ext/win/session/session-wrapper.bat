@echo off


:: Will cause variables to be expanded at execution time rather than at parse time.
setlocal enabledelayedexpansion

:: Convert the windows path of the home directory to non-colon backslashed style.
set input=\%HOMEDRIVE%%HOMEPATH%
set match=:
set replace=
set backslashed=!input:%match%=%replace%!

:: Convert non-colon backslashed style to forward slashes.
set input=%backslashed%
set match=\
set replace=/
set forwarded=!input:%match%=%replace%!

:: Set human HOME to MinGW style path.
set HOME=%forwarded%

:: Set session HOME.
set SESSION_HOME=%~dp0

:: Convert the windows path of the session directory to non-colon backslashed style.
set input=\%SESSION_HOME%
set match=:
set replace=
set backslashed=!input:%match%=%replace%!

:: Convert non-colon backslashed style to forward slashes.
set input=%backslashed%
set match=\
set replace=/
set forwarded=!input:%match%=%replace%!

:: Set session HOME.
set SESSION_EXECUTABLE=%forwarded%/session/session.sh

:: Set Path with Session requirements appended.
set PATH=%SESSION_HOME%\mingw\bin;%SESSION_HOME%\mingw\msys\1.0\bin;%SESSION_HOME%\cryptrdp5;%SESSION_HOME%\pstools;%SESSION_HOME%\putty;%SESSION_HOME%\nmap;%SESSION_HOME%\session;%PATH%

:: Save HOMEPATH (Seems to get mangled to backslash by msys, used by /etc/profile).
set ORIGINAL_HOMEPATH=%HOMEPATH%

:: Determine which cmd.exe to use
set SESSION_CMD=%COMSPEC%
if %PROCESSOR_ARCHITECTURE%==x86 set SESSION_CMD=%COMSPEC%
if %PROCESSOR_ARCHITECTURE%==AMD64 set SESSION_CMD=%WINDIR%\SysWOW64\cmd.exe

:: Invoke session directly.
"%SESSION_CMD%" /c ""%SESSION_HOME%\mingw\msys\1.0\bin\bash" "%SESSION_EXECUTABLE%"" %*

