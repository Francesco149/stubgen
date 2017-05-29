/*
    This code is public domain and comes with no warranty.
    You are free to do whatever you want with it. You can
    contact me at lolisamurai@tfwno.gf but don't expect any
    support.
    I hope you will find the code useful or at least
    interesting to read. Have fun!
    -----------------------------------------------------------
    This file is part of "stubgen", a portable Windows DLL stub
    generator for Windows and Linux.
*/

#include <stdio.h>

#define globvar    static
#define internalfn static

#ifdef STUBGEN_USE_STDINT
#include <stdint.h>

typedef int_least64_t   i64;
typedef int_least32_t   i32;
typedef int_least16_t   i16;
typedef int_least8_t    i8;

typedef uint_least64_t  u64;
typedef uint_least32_t  u32;
typedef uint_least16_t  u16;
typedef uint_least8_t   u8;
#endif

