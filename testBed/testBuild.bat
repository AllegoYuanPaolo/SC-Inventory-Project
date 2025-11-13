:: compile main and module
@echo off
setlocal enabledelayedexpansion 

for %%F in (src\modules\test\*.cbl) do (
    set "name=%%~nF"
    echo ^> Compiling module: %%F -> build\!name!.o
    cobc -c %%F -o build\test\TEST!name!.o
        if errorlevel 1 (
            echo    ERROR compiling %%F!
        ) 

        if exist build\test\!name!.o (
            echo    ^> !name!.o made!
        )
    echo ^> %%F compiled!
)

:: check for test exe folder
if not exist bin\programs\test (
    md bin\programs\test

)

if not exist build\test (
    md build\test
)

:: compile main and modules
echo ^> Linking modules with main. . .
cobc -x src\main\test\test.cob build\test\*.o -o bin\programs\test\test.exe
if errorlevel 1 (
    echo ERROR linking with testMain!
)

if not exist bin\programs\test\test.exe (
    echo    ^> test.exe not found!
)

echo ^> Modules compiled:
dir /b build\test\*.o

start cmd /c ".\bin\programs\test\test.exe & pause"
