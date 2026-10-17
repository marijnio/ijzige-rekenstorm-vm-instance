@echo off
setlocal
title DOSBox-X Launcher - Ontdekkingstocht in de IJzige Rekenstorm

set "SCRIPT_DIR=%~dp0"
set "DOSBOX_EXE=%SCRIPT_DIR%dosbox-x\bin\x64\Release\dosbox-x.exe"
set "CONF_FILE=%SCRIPT_DIR%dosbox-x.conf"

if not exist "%DOSBOX_EXE%" (
    echo [ERROR] dosbox-x.exe not found at: %DOSBOX_EXE%
    pause
    exit /b 1
)

if not exist "%CONF_FILE%" (
    echo [ERROR] dosbox-x.conf not found at: %CONF_FILE%
    pause
    exit /b 1
)

echo Starting DOSBox-X with REKENSTORM.ISO mounted on D:, Sound Blaster 16, and SVGA...
"%DOSBOX_EXE%" -conf "%CONF_FILE%"

exit /b 0
