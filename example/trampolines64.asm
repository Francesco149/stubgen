;   This code is public domain and comes with no warranty.
;   You are free to do whatever you want with it. You can
;   contact me at lolisamurai@tfwno.gf but don't expect any
;   support.
;   I hope you will find the code useful or at least
;   interesting to read. Have fun!
;   -----------------------------------------------------------
;   This file is part of "stubgen", a portable Windows DLL stub
;   generator for Windows and Linux.
;   -----------------------------------------------------------
;   example/trampolines64.asm: 64-bit layer for trampolines.asm
;   automatically generated

PTR_SIZE TEXTEQU %8
REGA     TEXTEQU <rax>
REGD     TEXTEQU <rdx>

EXTERN original_funcs:QWORD

INCLUDE trampolines.asm
