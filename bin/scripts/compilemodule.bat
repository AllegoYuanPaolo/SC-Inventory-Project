@echo off

setlocal
set "file=.\src\modules\%~1.cbl"
set "module=%~1.dll"
echo ^> Compiling module %file%. . .
cobc -m %file% -o bin\programs\%module%
    if errorlevel 1 (
        echo ^> ERROR compiling module, 
        exit /b
    )