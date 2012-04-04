@echo off

:: Warning.
if [%1]==[] goto error

:: Will cause variables to be expanded at execution time rather than at parse time.
setlocal enabledelayedexpansion

:: Delims is a TAB followed by a space.
for /f "tokens=2* delims=	 " %%a in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set curpath=%%b

set newpath=%curpath%;%*

:: Delete the old key, and add result from pass2.
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path"
reg add    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path" /t "REG_EXPAND_SZ" /d "%newpath%"
goto end

:error
echo Any input given is appended to the system path and made permanent.

:end

