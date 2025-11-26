@echo off

setlocal

if exist "Python Utils\misc" (
    pushd "Python Utils\misc"
    start /B "" pythonw "motivator.py"
    popd
)


set "program=%~1"

pushd bin\programs
    echo ^> Running in new cmd
    start "%program%" cmd  /c "%program% & pause"
popd