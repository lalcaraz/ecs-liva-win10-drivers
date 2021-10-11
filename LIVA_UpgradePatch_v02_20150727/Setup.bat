@echo off

@title Process...
@echo .

@cd %~dp0
@dir /a "C:\" > temp.log
find /i /c "unattend.xml" temp.log > nul
if errorlevel 1 goto pass

@attrib -h -r -s C:\unattend.xml
@del C:\unattend.xml

@dir /a "C:\" > temp.log
find /i /c "unattend.xml" temp.log > nul
if errorlevel 1 goto pass

@goto fail

:pass
@cd "%~dp0"
@del temp.log
cls
@color 2e
@echo Success .....
@echo Press any key to close this program & pause>nul
exit

:fail
@cd "%~dp0"
@del temp.log
@color 4e
@echo There was a problem repairing your PC.
@echo Please execute this program in Administrator and try again.
@echo Thanks! & pause>nul
exit