@echo off
setlocal

if exist "Python Utils\misc" (
    pushd "Python Utils\misc"
    start /B "" pythonw "motivator.py"
    popd
)

echo ^> Python Tools:
echo    ^> ["back" to exit]
    for %%f in ("Python Utils\*.py") do (
        if /I not "%%~f"  == "__pycache__" (
            echo %%~nxf
        )
    )



    set /p "tool=Use: "
    set "toolPath=Python Utils\%tool%"
        if /I "%tool%"=="back" (
            echo ^> Exiting program
            exit /b
        )

        if not exist "%toolPath%.py"  (
            echo    ^> Tool not found
            exit /b
        )
    start /wait "Python Tools - %tool%" cmd /c "python "%toolPath%.py" & pause"



