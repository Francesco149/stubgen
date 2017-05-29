@echo off

rem | This code is public domain and comes with no warranty.
rem | You are free to do whatever you want with it. You can
rem | contact me at lolisamurai@tfwno.gf but don't expect any
rem | support.
rem | I hope you will find the code useful or at least
rem | interesting to read. Have fun!
rem | -----------------------------------------------------------
rem | This file is part of "stubgen", a portable Windows DLL stub
rem | generator for Windows and Linux.
rem | -----------------------------------------------------------
rem | build.bat: Windows build script for Visual C++ Build Tools

del stubgen.exe
del stubgen.obj

cl  -D_CRT_SECURE_NO_WARNINGS=1 ^
    -O2 ^
    -nologo -MT -Gm- -GR- -EHsc -W4 ^
    windows.c ^
    Shlwapi.lib ^
    -Fe"stubgen.exe"
