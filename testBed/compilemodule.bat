@echo off

setlocal

set "file=%~1.cbl"

cobc -m %file%