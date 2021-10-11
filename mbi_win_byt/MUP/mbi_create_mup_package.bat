@echo off

REM /*****************************************************************************************************/
REM /* Script file for creating driver package for MUP 2.4.3 support with driverarchive option           */
REM /* Follow the following steps to covert the driver package layout for MUP 2.4.3 support              */
REM /*    1. Copy the driver package to any folder you want                                              */
REM /*    2. Run mbi_create_mup_package.bat <driver_package_folder>                                      */
REM /*****************************************************************************************************/

if "%1" EQU "" goto usage

if not exist %1 goto path_not_found
if not exist %1\drivers goto drivers_not_found
if not exist %1\drivers\x64 goto x64_not_found

set package_root=%1

mkdir %package_root%\drivers\production


REM =============  copy files to drivers\production\Windows10-x64  =============
echo copy files to drivers\production\Windows10-x64 ...

set source_path=%package_root%\drivers\x64
set target_path=%package_root%\drivers\production\Windows10-x64

mkdir %target_path%
xcopy %source_path%\*.* %target_path% >nul


REM =============  remove drivers\x64 folder  =============
echo remove drivers\x64 folder ...
del /q %package_root%\drivers\x64\*.*
rmdir /q %package_root%\drivers\x64


:finish
echo MUP driver package creation is complete!

goto end

:path_not_found
echo driver package path is not found
goto end

:drivers_not_found
echo 'drivers' subfolder is not found
goto end

:x64_not_found
echo 'drivers\x64' subfolder is not found
goto end


:usage
echo Usage : mbi_create_mup_package ^<driver package path^>

:end