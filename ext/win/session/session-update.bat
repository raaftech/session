@echo off


:: Set session HOME.
set CURRENT_DIR=%~dp0

:: Remove existing session.sh if any.
del session.sh
del issues.txt

:: Fetch latest from svn.
svn export http://svn.raaftech.nl/session/branches/0.9/src/session.sh session.sh
svn export http://svn.raaftech.nl/session/branches/0.9/doc/ISSUES issues.txt

::  Convert stuff to dos-style line endings
set PATH=%PATH%;"%CURRENT_DIR%\..\mingw\msys\1.0\bin"
unix2dos *.bat *.txt

