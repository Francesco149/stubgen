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
rem | example/build.bat: example Windows build script for Visual
rem | C++ Build Tools. most of this was automatically generated.

set ARCH=32
if not [%1]==[] set ARCH=%1

rem Build the OpenGL example
del test.obj
del test.exe

cl /nologo /MT /Gm- /GR- /EHsc /W4 /O2 ^
   test.c opengl32.lib glu32.lib user32.lib gdi32.lib

rem | Build DLL - untouched stubgen output except for adding libs
del opengl32.dll
del dllmain.obj
del trampolines%ARCH%.obj

cl /nologo ^
   /MT /LD /Gm- /GR- /EHsc ^
   /W4 /O2 /c ^
   dllmain.c

if %ARCH%==64 (
    ml64 /nologo /c /Cx /W3       trampolines%ARCH%.asm
) ^
else (
    ml   /nologo /c /Cx /W3 /coff trampolines%ARCH%.asm
)

link /nologo ^
     /OUT:"opengl32.dll" ^
     /DLL /INCREMENTAL:NO /DEF:"exports.def" ^
     dllmain.obj ^
     trampolines%ARCH%.obj ^
     user32.lib ^
     opengl32.lib ^
     glu32.lib ^
     gdi32.lib ^
     Shlwapi.lib

del opengl32.lib
