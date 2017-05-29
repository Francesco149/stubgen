#!/bin/sh

#   This code is public domain and comes with no warranty.
#   You are free to do whatever you want with it. You can
#   contact me at lolisamurai@tfwno.gf but don't expect any
#   support.
#   I hope you will find the code useful or at least
#   interesting to read. Have fun!
#   -----------------------------------------------------------
#   This file is part of "stubgen", a portable Windows DLL stub
#   generator for Windows and Linux.

EXENAME=stubgen

${CXX:-gcc}              \
    -std=c89             \
    -pedantic            \
    -O2                  \
    $@                   \
    -Wall                \
    linux.c              \
    -o $EXENAME
[ -f ./$EXENAME ] && strip -R .comment ./$EXENAME
