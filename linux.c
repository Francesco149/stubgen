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
    linux.c: Linux platform layer
*/

#include "common.h"

#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <linux/limits.h>
#include <libgen.h>

#ifndef STUBGEN_USE_STDINT
typedef double i64; /* placeholder - we don't do any 64bit math */
typedef int    i32;
typedef short  i16;
typedef char   i8;

typedef double          u64;
typedef unsigned int    u32;
typedef unsigned short  u16;
typedef unsigned char   u8;
#endif

#define os_basename basename
#define os_devnull() fopen("/dev/null", "w")

#define OS_MAX_PATH PATH_MAX

internalfn
void* os_mmap_file(char const* path)
{
    int fd;
    void* res;
    struct stat st;

    fd = open(path, O_RDONLY);
    if (fd < 0) {
        perror("open");
        return 0;
    }

    if (stat(path, &st) < 0) {
        perror("stat");
        return 0;
    }

    res = mmap(0, st.st_size, PROT_READ, MAP_SHARED, fd, 0);
    if (res == (void*)-1) {
        perror("mmap");
        return 0;
    }

    return res;
}

#include "main.c"

