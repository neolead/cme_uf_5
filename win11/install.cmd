@echo off
echo ============================================
echo  CME UF MIDI Keyboard Driver Installer
echo  Windows 11 x64
echo ============================================
echo.

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script must be run as Administrator!
    echo Right-click and select "Run as administrator"
    pause
    exit /b 1
)

echo Installing CME UF MIDI driver...
echo.

:: Install using pnputil (modern Win11 method)
pnputil /add-driver "%~dp0esimidiport.inf" /install

if %errorlevel% equ 0 (
    echo.
    echo ============================================
    echo  SUCCESS! Driver installed.
    echo  Please reconnect your CME UF keyboard.
    echo ============================================
) else (
    echo.
    echo WARNING: pnputil returned error %errorlevel%
    echo Trying force install method...
    echo.
    cd /d "%~dp0"
    pnputil -i -a esimidiport.inf
    if %errorlevel% equ 0 (
        echo SUCCESS with force method!
    ) else (
        echo.
        echo FAILED. Try these steps manually:
        echo 1. Open Device Manager
        echo 2. Find the unknown USB device (VID_7104 PID_2202)
        echo 3. Right-click - Update driver
        echo 4. Browse - point to this folder
        echo.
        echo Or run: pnputil /add-driver esimidiport.inf /install
    )
)

echo.
pause
