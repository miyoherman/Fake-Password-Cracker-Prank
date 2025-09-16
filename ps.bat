@echo off
title Password Cracker v1.0
color 0A
echo Initializing system...
ping localhost -n 2 >nul
echo Connecting to 127.0.0.1...
ping localhost -n 2 >nul
echo Access granted!
echo.

set /p target=Enter target username: 
echo Attempting to crack password for %target%...
ping localhost -n 2 >nul

setlocal enabledelayedexpansion
set charset=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()
set /a length=8
set password=

:generate
set password=
for /l %%i in (1,1,%length%) do (
    set /a rand=!random! %% 72
    for %%j in (!rand!) do set password=!password!!charset:~%%j,1!
)

echo Trying password: %password%
ping localhost -n 1 >nul
set /a tries+=1

if %tries% GEQ 5 (
    echo.
    echo Password cracked: p@ssw0rd123
    echo Login success!
    echo.
    pause
    exit
) else (
    goto generate
)
