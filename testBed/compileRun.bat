@echo off

setlocal
echo(

set "fileName=%~n1.cbl"
set "exeName=%~1"

echo ^> Compiling %~1 file. . .
cobc -x %fileName%
if errorlevel 1 (

    echo ^> Compilation failed.
    exit /b 1

) else (
    
    if exist %exeName%.exe (
        echo ^> Running in a new cmd. . .
        start cmd /c ".\%exeName%.exe & pause"
    )

)

echo(
