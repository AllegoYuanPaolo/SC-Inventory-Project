@echo off

setlocal enabledelayedexpansion

for %%F in *.cbl do (
    set "name=%%~nF"
    echo ^> Compiling module: %%F -> !name!.o
    cobc -c %%F -o test!name!.o
        if errorlevel 1 (
            echo    ERROR compiling %%F
        ) else (
            echo    ^> !name!.o made
        )

)


echo ^> Linking  modules with main
cobc -x test.cob test*.o 

echo ^> Modules compiled: 
dir /b *.o

start cmd /c ".\test.exe & pause" 