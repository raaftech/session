@echo off

:: Warning.
if [%1]==[] goto error

:: Will cause variables to be expanded at execution time rather than at parse time.
setlocal enabledelayedexpansion

:: Delims is a TAB followed by a space.
for /f "tokens=2* delims=	 " %%a in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path') do set curpath=%%b

:: Match first: with ; before.
set input=%curpath%
set match=;%*
set replace=
set pass1=!input:%match%=%replace%!

:: Match second: with ; after.
set input=%pass1%
set match=%*;
set replace=
set pass2=!input:%match%=%replace%!

set newpath=%pass2%

:: Delete the old key, and add result from pass2.
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path"
reg add    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "Path" /t "REG_EXPAND_SZ" /d "%newpath%"
goto end

:error
echo Warning, be extremely careful with this script. Any input given is filtered from the system path and made permanent.

:end

