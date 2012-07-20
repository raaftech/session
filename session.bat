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

:: Set putty HOME.
set PUTTY_HOME=%ProgramFiles(x86)%/PuTTY

:: Set msys HOME.
set MSYS_HOME=%ProgramFiles(x86)%/MinGW/msys/1.0

:: Set msys EXECUTABLE.
set MSYS_EXECUTABLE=%MSYS_HOME%/bin/bash.exe

:: Set session HOME.
set SESSION_HOME=%HOME%/Source/Projects/Session

:: Set session EXECUTABLE.
set SESSION_EXECUTABLE=%SESSION_HOME%/session.sh

:: Determine which cmd.exe to use
set SESSION_CMD=%COMSPEC%
if %PROCESSOR_ARCHITECTURE%==x86 set SESSION_CMD=%COMSPEC%
if %PROCESSOR_ARCHITECTURE%==AMD64 set SESSION_CMD=%WINDIR%\SysWOW64\cmd.exe

:: Append path.
set PATH=%MSYS_HOME%/bin;%PUTTY_HOME%;%PATH%

:: Invoke session directly.
REM "%SESSION_CMD%" /c ""%MSYS_EXECUTABLE%" "%SESSION_EXECUTABLE%"" %*
"%MSYS_EXECUTABLE%" "%SESSION_EXECUTABLE%" %*

