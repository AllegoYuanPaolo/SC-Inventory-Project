@echo off

setlocal

set "program=%~1"

pushd bin\programs
    echo ^> Running in new cmd
    start "%program%" cmd  /c "%program% & pause"
popd