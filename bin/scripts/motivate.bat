@echo off
if exist "Python Utils\misc" (
    pushd "Python Utils\misc"
        python randomer.py
            for /L %%f in (1, 1, 5) do ( echo count >> counter.txt )
            start "" /B python motivator.py
    popd
)