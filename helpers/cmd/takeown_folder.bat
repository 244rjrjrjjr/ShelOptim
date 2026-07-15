@echo off
:: Usage: takeown_folder.bat "C:\path\to\folder"
if "%~1"=="" (
  echo Usage: takeown_folder.bat "path"
  exit /b 1
)
takeown /F "%~1" /R /D Y
icacls "%~1" /grant administrators:F /T
echo Ownership + full control granted to Administrators.
