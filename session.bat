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

:: Set bash EXECUTABLE.
set BASH_EXECUTABLE=bash.exe

:: Set session HOME.
set SESSION_HOME=/mnt/d/Dropbox/Source/RAAF/session

:: Set session EXECUTABLE.
set SESSION_EXECUTABLE=%SESSION_HOME%/session.sh

:: Invoke session directly.
"%BASH_EXECUTABLE%" "%SESSION_EXECUTABLE%" %*
