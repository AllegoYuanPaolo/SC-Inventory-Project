@echo off
setlocal enabledelayedexpansion

REM === Paths ===
set SRC_DIR=src\modules
set OUT_DIR=bin\programs

REM === Ensure output directory exists ===
if not exist "%OUT_DIR%" (
    mkdir "%OUT_DIR%"
)

REM === Loop through all .cbl files in source directory ===
for %%f in ("%SRC_DIR%\*.cbl") do (
    echo Compiling %%~nxf ...
    
    REM Compile COBOL source to DLL
    REM Adjust the compiler command to your COBOL toolchain (example: GnuCOBOL or Micro Focus)
    cobc -m "%%f" /I src/copylib -o "%OUT_DIR%\%%~nf.dll"
    
    if errorlevel 1 (
        echo Failed to compile %%~nxf
    ) else (
        echo Successfully built: %OUT_DIR%\%%~nf.dll
    )
)

echo.
echo === Build complete ===
endlocal
pause
