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
    -----------------------------------------------------------
    windows.c: Windows platform layer
*/

#include "common.h"

#include <Windows.h>
#include <Shlwapi.h>

#define os_basename PathFindFileNameA
#define os_devnull() fopen("NUL:", "w")

#define OS_MAX_PATH MAX_PATH

#ifndef STUBGEN_USE_STDINT
/* NOTE: LONGLONG is defined as double on 32-bit.
         This has better compatibility than __int64, and since
         we don't do any 64-bit int math at all, it's fine for now.
         Should the need arise, replace this with INT64 */

typedef LONGLONG i64;
typedef INT      i32;
typedef SHORT    i16;
typedef CHAR     i8;

typedef ULONGLONG u64;
typedef DWORD     u32;
typedef WORD      u16;
typedef BYTE      u8;
#endif

internalfn
void printgle(char const* msg)
{
    char const* buf = 0;
    u32 nchars =
        FormatMessageA(
            FORMAT_MESSAGE_ALLOCATE_BUFFER |
            FORMAT_MESSAGE_FROM_SYSTEM |
            FORMAT_MESSAGE_IGNORE_INSERTS,
            0, GetLastError(),
            MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
            (char*)&buf, 0, 0
        );

    if (!nchars) {
        buf = "(could not format error message)";
    }

    fprintf(stderr, "%s: %s\n", msg, buf);
}

/* doesn't need to be unmappable for my usage */
internalfn
void* os_mmap_file(char const* path)
{
    void* res;
    HANDLE hfile;
    HANDLE hmapping;

    hfile = CreateFileA(
        path,
        GENERIC_READ,
        FILE_SHARE_READ,
        0,
        OPEN_EXISTING,
        FILE_ATTRIBUTE_NORMAL,
        0
    );

    if (hfile == INVALID_HANDLE_VALUE) {
        printgle("CreateFileA");
        return 0;
    }

    hmapping = CreateFileMapping(hfile, 0, PAGE_READONLY, 0, 0, 0);

    if (!hmapping) {
        printgle("CreateFileMapping");
        CloseHandle(hfile);
        return 0;
    }

    res = MapViewOfFile(hmapping, FILE_MAP_READ, 0, 0, 0);

    if (!res) {
        printgle("MapViewOfFile");
    }

    return res;
}

#include "main.c"

