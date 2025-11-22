@echo off

if exist "Python Utils\misc" (
    pushd "Python Utils\misc"
    start /B "" pythonw "motivator.py"
    popd
)


echo(
echo DEBUG: Echoing from bin\scripts
