@echo off
setlocal
title Ontdekkingstocht in de IJzige Rekenstorm

echo ====================================================================
echo   Ontdekkingstocht in de IJzige Rekenstorm (1997)
echo   16-bit Windows (Win16) Game Launcher via otvdm (winevdm)
echo ====================================================================
echo.

set "SCRIPT_DIR=%~dp0"
set "ISO_PATH=%SCRIPT_DIR%iso\REKENSTORM.ISO"
set "OTVDM_EXE=%SCRIPT_DIR%otvdm\otvdmw.exe"
set "MOUNT_PS1=%SCRIPT_DIR%mount_iso.ps1"
set "MAGPIE_EXE=%SCRIPT_DIR%magpie\Magpie.exe"

if not exist "%ISO_PATH%" (
    echo [ERROR] Game ISO not found at: %ISO_PATH%
    pause
    exit /b 1
)

if not exist "%OTVDM_EXE%" (
    set "OTVDM_EXE=%SCRIPT_DIR%otvdm\otvdm.exe"
)

if not exist "%OTVDM_EXE%" (
    echo [ERROR] otvdm executable not found at: %OTVDM_EXE%
    pause
    exit /b 1
)

:: Start Magpie in background if available and not already running
tasklist /fi "imagename eq Magpie.exe" 2>nul | find /i "Magpie.exe" >nul
if errorlevel 1 (
    if exist "%MAGPIE_EXE%" (
        echo [INFO] Starting Magpie window upscaler in background...
        start "" "%MAGPIE_EXE%"
    )
)

echo [1/3] Mounting ISO image as drive D:...
powershell -NoProfile -ExecutionPolicy Bypass -File "%MOUNT_PS1%"
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Failed to mount ISO as drive D: or locate game files.
    echo Please make sure drive letter D: is free and not occupied.
    pause
    exit /b 1
)

if not exist "D:\TMSWINCD\TMSWINCD.EXE" (
    echo [ERROR] Game executable not found at D:\TMSWINCD\TMSWINCD.EXE.
    pause
    exit /b 1
)

echo [2/3] Drive D: is ready.
echo [3/3] Launching TMSWINCD.EXE with otvdm...
echo.
echo ====================================================================
echo  HOTKEY FOR FULLSCREEN (Magpie):
echo  Click inside the game window and press:  Win + Shift + A
echo  (Press it again or press Esc to return to windowed mode)
echo ====================================================================
echo.
echo Running game... (close the game window when done)

"%OTVDM_EXE%" "D:\TMSWINCD\TMSWINCD.EXE"

echo.
echo Game finished. Dismounting ISO from drive D:...
powershell -NoProfile -ExecutionPolicy Bypass -File "%MOUNT_PS1%" -Dismount
echo Done.
exit /b 0
