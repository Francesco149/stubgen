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
;   example/trampolines32.asm: 32-bit layer for trampolines.asm
;   automatically generated

.486
.MODEL flat, stdcall

PTR_SIZE TEXTEQU %4
REGA     TEXTEQU <eax>
REGD     TEXTEQU <edx>

EXTERN original_funcs:DWORD

INCLUDE trampolines.asm
