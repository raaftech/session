@echo off


:: Will cause variables to be expanded at execution time rather than at parse time.
setlocal enabledelayedexpansion

:: Set session HOME.
set CURRENT_DIR=%~dp0

:: Install custom msys bash profile.
del /q  "%CURRENT_DIR%\..\mingw\msys\1.0\etc\profile.orig"
move /y "%CURRENT_DIR%\..\mingw\msys\1.0\etc\profile" "%CURRENT_DIR%\..\mingw\msys\1.0\etc\profile.orig"
copy /-y "%CURRENT_DIR%\msys-bash.profile" "%CURRENT_DIR%\..\mingw\msys\1.0\etc\profile"

:: Copy main batch scripts.
del /q  "%CURRENT_DIR%\..\session.bat"
copy /-y "%CURRENT_DIR%\session-wrapper.bat" "%CURRENT_DIR%\..\session.bat"
del /q  "%CURRENT_DIR%\..\session-shell.bat"
copy /-y "%CURRENT_DIR%\session-shell.bat" "%CURRENT_DIR%\..\session-shell.bat"

