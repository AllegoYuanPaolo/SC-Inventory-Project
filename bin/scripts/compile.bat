@echo off

setlocal

set "file=src\modules\%~n1.cbl"
set "exe=%~1.exe"

shift

echo ^> Compiling. . .
cobc -x %file% -o bin\programs\%exe%
if errorlevel 1 (
    echo ^> ERROR compiling!
    exit /b 1
)

echo ^> File compiled!

::Check for flags
if /i "%~1"=="-run" (
    goto run
) else (
    goto end
)

:run
    pushd bin\programs
    echo ^> Running in new cmd
    start cmd /c "%exe% & pause"
    popd
goto end

:end
    exit /b 