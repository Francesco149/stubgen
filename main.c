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

#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define STUBGEN_VERSION_MAJOR 1
#define STUBGEN_VERSION_MINOR 0

/* ------------------------------------------------------------- */

#pragma pack(push, 4)
typedef struct
{
    u16 machine;
    u16 number_of_sections;
    u32 time_date_stamp;
    u32 pointer_to_symbol_table;
    u32 number_of_symbols;
    u16 size_of_optional_header;
    u16 characteristics;
}
image_file_header;

typedef struct
{
    u32 virtual_address;
    u32 size;
}
image_data_directory;

typedef struct
{
    u16 magic; /* 0x10b or 0x107 */
    u8 major_linker_version;
    u8 minor_linker_version;
    u32 size_of_code;
    u32 size_of_initialized_data;
    u32 size_of_uninitialized_data;
    u32 address_of_entry_point;
    u32 base_of_code;
    u32 base_of_data;
    u32 image_base;
    u32 section_alignment;
    u32 file_alignment;
    u16 major_operating_system_version;
    u16 minor_operating_system_version;
    u16 major_image_version;
    u16 minor_image_version;
    u16 major_subsystem_version;
    u16 minor_subsystem_version;
    u32 win32_version_value;
    u32 size_of_image;
    u32 size_of_headers;
    u32 check_sum;
    u16 subsystem;
    u16 dll_characteristics;
    u32 size_of_stack_reserve;
    u32 size_of_stack_commit;
    u32 size_of_heap_reserve;
    u32 size_of_heap_commit;
    u32 loader_flags;
    u32 number_of_rva_and_sizes;
    image_data_directory data_directory[16];
}
image_optional_header32;

typedef struct
{
    u32 signature; /* 0x00004550 */
    image_file_header file_header;
    image_optional_header32 optional_header;
}
image_nt_headers32;

typedef struct
{
    u32 characteristics;
    u32 time_date_stamp;
    u16 major_version;
    u16 minor_version;
    u32 name;
    u32 base;
    u32 number_of_functions;
    u32 number_of_names;
    u32 address_of_functions;
    u32 address_of_names;
    u32 address_of_name_ordinals;
}
image_export_directory;
#pragma pack(pop)

#pragma pack(push, 8)
typedef struct
{
    u16 magic; /* 0x20b */
    u8 major_linker_version;
    u8 minor_linker_version;
    u32 size_of_code;
    u32 size_of_initialized_data;
    u32 size_of_uninitialized_data;
    u32 address_of_entry_point;
    u32 base_of_code;
    u64 image_base;
    u32 section_alignment;
    u32 file_alignment;
    u16 major_operating_system_version;
    u16 minor_operating_system_version;
    u16 major_image_version;
    u16 minor_image_version;
    u16 major_subsystem_version;
    u16 minor_subsystem_version;
    u32 win32_version_value;
    u32 size_of_image;
    u32 size_of_headers;
    u32 check_sum;
    u16 subsystem;
    u16 dll_characteristics;
    u64 size_of_stack_reserve;
    u64 size_of_stack_commit;
    u64 size_of_heap_reserve;
    u64 size_of_heap_commit;
    u32 loader_flags;
    u32 number_of_rva_and_sizes;
    image_data_directory data_directory[16];
}
image_optional_header64;

typedef struct
{
    u32 signature; /* 0x00004550 */
    image_file_header file_header;
    image_optional_header64 optional_header;
}
image_nt_headers64;
#pragma pack(pop)

#pragma pack(push, 2)
typedef struct
{
    u16 e_magic; /* 5A4D */
    u16 e_cblp;
    u16 e_cp;
    u16 e_crlc;
    u16 e_cparhdr;
    u16 e_minalloc;
    u16 e_maxalloc;
    u16 e_ss;
    u16 e_sp;
    u16 e_csum;
    u16 e_ip;
    u16 e_cs;
    u16 e_lfarlc;
    u16 e_ovno;
    u16 e_res[4];
    u16 e_oemid;
    u16 e_oeminfo;
    u16 e_res2[10];
    i32 e_lfanew;
}
image_dos_header;

typedef struct
{
    char name[8];

    union
    {
        u32 physical_address;
        u32 virtual_size;
    }
    misc;

    u32 virtual_address;
    u32 size_of_raw_data;
    u32 pointer_to_raw_data;
    u32 pointer_to_relocations;
    u32 pointer_to_linenumbers;
    u16 number_of_relocations;
    u16 number_of_linenumbers;
    u32 characteristics;
}
image_section_header;
#pragma pack(pop)

/* ------------------------------------------------------------- */

globvar u8* pe_buf;
globvar image_nt_headers32* nt_hdr32 = 0;
globvar image_nt_headers64* nt_hdr64 = 0;

internalfn
void* pe_map_va(u32 va)
{
    u16 n;
    image_section_header* s;
    void* res = 0;

    if (nt_hdr32)
    {
        n = nt_hdr32->file_header.number_of_sections;

        s = (image_section_header*)
            ((u8*)&nt_hdr32->optional_header +
             nt_hdr32->file_header.size_of_optional_header);
    }

    else
    {
        n = nt_hdr64->file_header.number_of_sections;

        s = (image_section_header*)
            ((u8*)&nt_hdr64->optional_header +
             nt_hdr64->file_header.size_of_optional_header);

    }

    for (; n; --n, ++s)
    {
        if (va < s->virtual_address ||
            va >= s->virtual_address + s->misc.virtual_size)
        {
            continue;
        }

        va -= s->virtual_address;
        va += s->pointer_to_raw_data;

        res = pe_buf + va;
        break;
    }

    if (!res)
    {
        fprintf(stderr, "ABUNAI: Invalid virtual address\n");
        exit(1);
    }

    return res;
}

internalfn
image_export_directory* pe_exports(char const* file)
{
    image_dos_header* dos_hdr;
    image_data_directory* dir;

    /*
        should allow the OS to do copy on write if the dll is being
        used by at least one program
    */
    pe_buf = os_mmap_file(file);
    if (!pe_buf) {
        return 0;
    }

    dos_hdr = (image_dos_header*)pe_buf;

    if (dos_hdr->e_magic != 0x5a4d) {
        fprintf(stderr, "Invalid DOS Header\n");
        return 0;
    }

    nt_hdr32 = (image_nt_headers32*)(pe_buf + dos_hdr->e_lfanew);

    if (nt_hdr32->signature != 0x00004550) {
        fprintf(stderr, "Invalid NT Header\n");
        return 0;
    }

    if (nt_hdr32->optional_header.magic == 0x10b ||
        nt_hdr32->optional_header.magic == 0x107)
    {
        goto foundheader;
    }

    nt_hdr64 = (image_nt_headers64*)nt_hdr32;
    nt_hdr32 = 0;

    if (nt_hdr64->optional_header.magic != 0x20b) {
        fprintf(stderr, "Invalid Optional Header\n");
        return 0;
    }

foundheader:
    if (nt_hdr32) {
        dir = nt_hdr32->optional_header.data_directory;
    } else {
        dir = nt_hdr64->optional_header.data_directory;
    }

    return (image_export_directory*)
        pe_map_va(dir->virtual_address);
}

/* ------------------------------------------------------------- */

/* TODO: use platform-specific stat to check if file exists for
         better performance */

/* opens file for writing and asks for user confirmation if the
   file already exists */
internalfn
FILE* fopen_prompt(char const* file)
{
    int c, choice = 'n';

    FILE* fd = fopen(file, "r");
    if (!fd) {
        goto just_fucking_open_it;
    }

    fclose(fd);

    printf(
        "%s already exists, "
        "are you sure you want to overwrite it? [y/N]: ",
        file
    );

    do
    {
        int lc;

        c = getchar();

        lc = tolower(c);

        if (lc == 'y' || lc == 'n') {
            choice = lc;
            break;
        }
    }
    while (c != '\n' && c != EOF);

    for (; c != '\n' && c != EOF; c = getchar());

    if (choice == 'n') {
        fprintf(stderr, "Skipping %s\n", file);
        return os_devnull();
    }

just_fucking_open_it:
    fprintf(stderr, "Creating %s\n", file);

    fd = fopen(file, "w");
    if (!fd) {
        perror("fopen");
    }

    return fd;
}

#define STUBGEN_INLINE_ASM (1 << 0)
#define STUBGEN_ORDINALS   (1 << 1)
#define STUBGEN_CODE       (1 << 2)
#define STUBGEN_DEF        (1 << 3)
#define STUBGEN_BUILD      (1 << 4)

#define STUBGEN_DEFAULT_FLAGS \
    (STUBGEN_DEF | STUBGEN_CODE | STUBGEN_BUILD)

/* TODO: this is ugly. replace it with customizable
         template files */

internalfn
int stubgen_def(image_export_directory const* exports, u32 flags)
{
    u32 i;
    u32* name_offsets = (u32*)pe_map_va(exports->address_of_names);
    u16* ordinals = (u16*)
        pe_map_va(exports->address_of_name_ordinals);

    FILE* deffd = fopen_prompt("./exports.def");

    if (!deffd) {
        return 1;
    }

    fprintf(deffd, "EXPORTS\n");

    for (i = 0; i < exports->number_of_names; ++i)
    {
        char const* name = (char const*)pe_map_va(name_offsets[i]);
        u32 ordinal = exports->base + ordinals[i];

        name = (name && strlen(name)) ? name : "unknown";

        /* TODO: automatically give unique names to unknown
                 exports */

        if (flags & STUBGEN_ORDINALS)
        {
            fprintf(
                deffd,
                "%s=o%hd_%s @%hd\n",

                name,
                ordinal,
                name,
                ordinal
            );
        }

        else
        {
            fprintf(deffd, "%s=%s_stub\n", name, name);
        }
    }

    fclose(deffd);

    return 0;
}

internalfn
int stubgen_build(char const* dllname, u32 flags)
{
    FILE* buildfd = fopen_prompt("./build.bat");

    if (!buildfd) {
        return 1;
    }

    fprintf(
        buildfd,
        "@echo off"                         "\n"
        "set ARCH=32"                       "\n"
        "if not [%%1]==[] set ARCH=%%1"     "\n"
                                            "\n"
        "del %s"                            "\n"
        "del dllmain.obj"                   "\n",
        dllname
    );

    if (!(flags & STUBGEN_INLINE_ASM)) {
        fprintf(buildfd, "del trampolines%%ARCH%%.obj\n");
    }

    fprintf(
        buildfd,
                                        "\n"
        "cl /nologo ^"                  "\n"
        "   /MT /LD /Gm- /GR- /EHsc ^"  "\n"
        "   /W4 /O2 /c ^"               "\n"
        "   dllmain.c"                  "\n"
                                        "\n"
    );

    if (!(flags & STUBGEN_INLINE_ASM))
    {
        fprintf(
            buildfd,
            "if %%ARCH%%==64 (\n"
            "    ml64 /nologo /c /Cx /W3       "
                "trampolines%%ARCH%%.asm\n"
            ") ^\n"
            "else (\n"
            "    ml   /nologo /c /Cx /W3 /coff "
                "trampolines%%ARCH%%.asm\n"
            ")\n"
            "\n"
        );
    }

    fprintf(
        buildfd,
        "link /nologo ^"                                    "\n"
        "     /OUT:\"%s\" ^"                                "\n"
        "     /DLL /INCREMENTAL:NO /DEF:\"exports.def\" ^"  "\n"
        "     dllmain.obj ^"                                "\n",
        dllname
    );

    if (!(flags & STUBGEN_INLINE_ASM)) {
        fprintf(buildfd, "     trampolines%%ARCH%%.obj ^\n");
    }

    fprintf(buildfd, "     user32.lib\n");

    fclose(buildfd);

    return 0;
}

internalfn
int stubgen_code(image_export_directory const* exports, u32 flags)
{
    u32 i;
    u32* name_offsets = (u32*)pe_map_va(exports->address_of_names);
    u16* ordinals = (u16*)
        pe_map_va(exports->address_of_name_ordinals);

    /* --------------------------------------------------------- */

    /* hacky but saves if's */
    FILE* asmfd   = os_devnull();
    FILE* asmfd32 = os_devnull();
    FILE* asmfd64 = os_devnull();
    FILE* cfd     = fopen_prompt("./dllmain.c");

    if (!cfd) {
        return 1;
    }

    if (!(flags & STUBGEN_INLINE_ASM))
    {
        fclose(asmfd);
        fclose(asmfd32);
        fclose(asmfd64);

        asmfd   = fopen_prompt("./trampolines.asm");
        asmfd32 = fopen_prompt("./trampolines32.asm");
        asmfd64 = fopen_prompt("./trampolines64.asm");

        if (!asmfd || !asmfd32 || !asmfd64) {
            return 1;
        }
    }

    /* --------------------------------------------------------- */

    fprintf(
        cfd,
        "#include <Windows.h>"      "\n"
        "#include <Strsafe.h>"      "\n"
                                    "\n"
        "#define globvar static"    "\n"
        "#define internalfn static" "\n"
                                    "\n"
        "typedef DWORD u32;"        "\n"
        "typedef WORD  u16;"        "\n"
        "typedef BYTE  u8;"         "\n"
        "typedef BOOL  b32;"        "\n"
                                    "\n"
    );

    if (flags & STUBGEN_INLINE_ASM)
    {
        fprintf(
            cfd,
            "#ifdef _WIN64"         "\n"
            "# define PTR_SIZE 8"   "\n"
            "# define REGA rax"     "\n"
            "# define REGD rdx"     "\n"
            "#else"                 "\n"
            "# define PTR_SIZE 4"   "\n"
            "# define REGA eax"     "\n"
            "# define REGD edx"     "\n"
            "#endif"                "\n"
            "\n"
        );
    }

    fprintf(
        cfd,
        "globvar char dllname[MAX_PATH];"                    "\n"
        "globvar HMODULE hthis = 0;"                         "\n"
        "globvar HMODULE hdll = 0;"                          "\n"
        "FARPROC original_funcs[%u];"                        "\n"
                                                             "\n"
        "internalfn void die(char const* title);"            "\n"
                                                             "\n"
        "/* call this at the start of every hook */"         "\n"
        "internalfn void wait_init(); "                      "\n"
                                                             "\n"
        "/* ----------------------------------------------------"
                                                 "--------- */\n"
                                                             "\n"
        "/* hooks go here */"                                "\n"
                                                             "\n"
        "/* ----------------------------------------------------"
                                                 "--------- */\n"
                                                             "\n",

        exports->number_of_names
    );

    fprintf(
        cfd,
        "__declspec (align(8)) volatile LONG initdone = 0;"   "\n"
                                                              "\n"
        "void wait_init()"                                    "\n"
        "{"                                                   "\n"
        "    LONG val;"                                       "\n"
                                                              "\n"
        "spinlock:"                                           "\n"
        "    val = InterlockedCompareExchange"
                                            "(&initdone, 0, 0);\n"
                                                              "\n"
        "    if (val) {"                                      "\n"
        "        return;"                                     "\n"
        "    }"                                               "\n"
                                                              "\n"
        "    _mm_pause();"                                    "\n"
        "    goto spinlock;"                                  "\n"
        "}"                                                   "\n"
        "\n"
    );

    fprintf(
        cfd,
        "internalfn"                                           "\n"
        "void init()"                                          "\n"
        "{"                                                    "\n"
        "    FARPROC* p = original_funcs;"                     "\n"
        "    char buf[MAX_PATH];"                              "\n"
                                                               "\n"
        "    GetModuleFileNameA(hthis, dllname, MAX_PATH);"    "\n"
        "    StringCchPrintfA(buf, MAX_PATH, \"%%s_\", dllname);\n"
                                                               "\n"
        "    hdll = LoadLibraryA(buf);"                        "\n"
        "    if (!hdll) {"                                     "\n"
        "        die(dllname);"                                "\n"
        "    }"                                                "\n"
                                                               "\n"
        "#   define g(i, x) p[i] = GetProcAddress(hdll, x)"    "\n"
    );

    for (i = 0; i < exports->number_of_names; ++i)
    {
        char const* name = (char const*)pe_map_va(name_offsets[i]);
        fprintf(cfd, "    g(%u, \"%s\");\n", i, name);
    }

    fprintf(
        cfd,
        "#   undef g"                           "\n"
                                                "\n"
        "    InterlockedIncrement(&initdone);"  "\n"
        "}"                                     "\n"
                                                "\n"
    );

    /* --------------------------------------------------------- */

    /* NOTE: could also change this to a callable func to make
             the binary smaller */

    /* trampolines.asm */
    fprintf(
        asmfd,
        "EXTERN initdone:DWORD"         "\n"
                                        "\n"
        "asm_wait_init MACRO"           "\n"
        "    LOCAL loop"                "\n"
                                        "\n"
        "    push REGA"                 "\n"
        "    push REGD"                 "\n"
                                        "\n"
        "loop:"                         "\n"
        "    xor edx,edx"               "\n"
        "    xor eax,eax"               "\n"
        "    lock cmpxchg initdone,edx" "\n"
        "    jnz short initialized"     "\n"
        "    pause"                     "\n"
        "    jmp short loop"            "\n"
                                        "\n"
        "initialized:"                  "\n"
        "    pop REGD"                  "\n"
        "    pop REGA"                  "\n"
        "ENDM"                          "\n"
                                        "\n"
        "_TEXT SEGMENT"                 "\n"
                                        "\n"
    );

    /* trampolines32.asm */
    fprintf(
        asmfd32,
        ".486"                          "\n"
        ".MODEL flat, stdcall"          "\n"
                                        "\n"
        "PTR_SIZE TEXTEQU %%4"          "\n"
        "REGA     TEXTEQU <eax>"        "\n"
        "REGD     TEXTEQU <edx>"        "\n"
                                        "\n"
        "EXTERN original_funcs:DWORD"   "\n"
                                        "\n"
        "INCLUDE trampolines.asm"       "\n"
    );

    /* trampolines64.asm */
    fprintf(
        asmfd64,
        "PTR_SIZE TEXTEQU %%8"          "\n"
        "REGA     TEXTEQU <rax>"        "\n"
        "REGD     TEXTEQU <rdx>"        "\n"
                                        "\n"
        "EXTERN original_funcs:QWORD"   "\n"
                                        "\n"
        "INCLUDE trampolines.asm"       "\n"
    );

    /* --------------------------------------------------------- */

    if (flags & STUBGEN_INLINE_ASM)
    {
        /*
         * macros expand to one line, so we need extra __asm 's
         * https://msdn.microsoft.com/en-us/library/352sth8z.aspx
         */
        fprintf(
            cfd,
            "#define ASM_WAIT_INIT()                   \\\n"
            "    __asm                                 \\\n"
            "    {                                     \\\n"
            "        __asm push REGA                   \\\n"
            "        __asm push REGD                   \\\n"
            "    }                                     \\\n"
            "                                          \\\n"
        );

        fprintf(
            cfd,
            "    spinlock:                             \\\n"
            "    __asm                                 \\\n"
            "    {                                     \\\n"
            "        __asm xor edx,edx                 \\\n"
            "        __asm xor eax,eax                 \\\n"
            "        __asm lock cmpxchg initdone,edx   \\\n"
            "        __asm jnz short initialized       \\\n"
            "        __asm pause                       \\\n"
            "        __asm jmp short spinlock          \\\n"
            "    }                                     \\\n"
            "                                          \\\n"
        );

        fprintf(
            cfd,
            "    initialized:                          \\\n"
            "    __asm                                 \\\n"
            "    {                                     \\\n"
            "        __asm pop REGD                    \\\n"
            "        __asm pop REGA                    \\\n"
            "    }"                                     "\n"
                                                        "\n"
        );
    }

    for (i = 0; i < exports->number_of_names; ++i)
    {
        char const* name = (char const*)pe_map_va(name_offsets[i]);
        u32 ordinal = exports->base + ordinals[i];

        name = (name && strlen(name)) ? name : "unknown";

#       define PRINT_FUNC(fd, ordinal, name)           \
            if (flags & STUBGEN_ORDINALS) {            \
                fprintf(fd, "o%hd_%s", ordinal, name); \
            } else {                                   \
                fprintf(fd, "%s_stub", name);          \
            }

        if (flags & STUBGEN_INLINE_ASM)
        {
            fprintf(cfd, "__declspec(naked) void __stdcall ");

            PRINT_FUNC(cfd, ordinal, name)

            /* inline asm indexing is in bytes lol
             * pretty confusing */
            fprintf(
                cfd,
                "()"                                           "\n"
                "{"                                            "\n"
                "    ASM_WAIT_INIT()"                          "\n"
                "    __asm jmp original_funcs[%u * PTR_SIZE]"  "\n"
                "}"                                            "\n"
                                                               "\n"
                , i
            );
        }

        /* ----------------------------------------------------- */

        /* trampolines.asm */
        PRINT_FUNC(asmfd, ordinal, name)

        fprintf(
            asmfd,
            " PROC"                                 "\n"
            "asm_wait_init"                         "\n"
            "jmp [original_funcs + %u * PTR_SIZE]"  "\n",
            i
        );

        PRINT_FUNC(asmfd, ordinal, name)

        fprintf(asmfd, " ENDP\n\n");
    }

    fprintf(
        cfd,
        "internalfn"                                          "\n"
        "void die(char const* title)"                         "\n"
        "{"                                                   "\n"
        "    char const* buf = 0;"                            "\n"
        "    u32 nchars ="                                    "\n"
        "        FormatMessageA("                             "\n"
        "            FORMAT_MESSAGE_ALLOCATE_BUFFER |"        "\n"
        "            FORMAT_MESSAGE_FROM_SYSTEM |"            "\n"
        "            FORMAT_MESSAGE_IGNORE_INSERTS,"          "\n"
        "            0, GetLastError(),"                      "\n"
        "            MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),\n"
        "            (char*)&buf, 0, 0"                       "\n"
        "        );"                                          "\n"
    );

    fprintf(
        cfd,
                                                             "\n"
        "    if (!nchars) {"                                 "\n"
        "        buf = \"(could not format error)\";"        "\n"
        "    }"                                              "\n"
                                                             "\n"
        "    MessageBoxA(0, buf, title, MB_OK | MB_ICONERROR);\n"
        "    TerminateProcess(GetCurrentProcess(), 1);"      "\n"
        "}"                                                  "\n"
                                                             "\n"
    );

    fprintf(
        cfd,
        "b32 APIENTRY DllMain("                         "\n"
        "    HMODULE hmodule,"                          "\n"
        "    u32 reason,"                               "\n"
        "    void* res)"                                "\n"
        "{"                                             "\n"
        "    (void)res;"                                "\n"
                                                        "\n"
        "    DisableThreadLibraryCalls(hmodule);"       "\n"
        "    hthis = hmodule;"                          "\n"
                                                        "\n"
        "    switch (reason)"                           "\n"
        "    {"                                         "\n"
        "        case DLL_PROCESS_ATTACH:"              "\n"
        "            CreateThread("                     "\n"
        "                0, 0,"                         "\n"
        "                (LPTHREAD_START_ROUTINE)init," "\n"
        "                0, 0, 0"                       "\n"
        "            );"                                "\n"
        "            break;"                            "\n"
                                                        "\n"
        "        case DLL_PROCESS_DETACH:"              "\n"
        "            if (hdll) {"                       "\n"
        "                FreeLibrary(hdll);"            "\n"
        "            }"                                 "\n"
        "    }"                                         "\n"
                                                        "\n"
        "    return 1;"                                 "\n"
        "}"                                             "\n"
    );

    /* --------------------------------------------------------- */

    /* trampolines.asm */
    fprintf(
        asmfd,
        "_TEXT ENDS"    "\n"
        "END"           "\n"
    );

    fclose(asmfd);
    fclose(asmfd32);
    fclose(asmfd64);
    fclose(cfd);

    return 0;
}

internalfn
int stubgen(char const* dllfile, u32 flags)
{
    char buf[OS_MAX_PATH];
    char const* dllname;
    image_export_directory* exports = pe_exports(dllfile);

    strcpy(buf, dllfile);
    dllname = os_basename(buf);

    if (!exports) {
        return 1;
    }

    if (flags & STUBGEN_CODE)
    {
        fprintf(stderr, ":: Code\n");

        if (stubgen_code(exports, flags)) {
            return 1;
        }

        fprintf(stderr, "\n");
    }

    if (flags & STUBGEN_DEF)
    {
        fprintf(stderr, ":: Exports\n");

        if (stubgen_def(exports, flags)) {
            return 1;
        }

        fprintf(stderr, "\n");
    }

    if (flags & STUBGEN_BUILD)
    {
        fprintf(stderr, ":: Build script\n");

        if (stubgen_build(dllname, flags)) {
            return 1;
        }
    }

    return 0;
}

/* ------------------------------------------------------------- */

int main(int argc, char* argv[])
{
    char const* dll;
    char const* flagstr = 0;
    u32 flags = STUBGEN_DEFAULT_FLAGS;

    fprintf(
        stderr,
        "stubgen %d.%d %s\n\n",
        STUBGEN_VERSION_MAJOR,
        STUBGEN_VERSION_MINOR,
        (sizeof(void*) == 4 ? "i386" : "amd64")
    );

    if (argc < 2 || argc > 3)
    {
        fprintf(
            stderr,
            "Generates a template C project for a Windows proxy "
            "DLL in the current directory\n"
            "\n"
            "Usage: %s [flags] /path/to/file.dll\n"
            "\n"
            "Flags (default: dcb):\n"
            "    d: generate exports.def\n"
            "    c: generate dllmain.c "
            "(and trampolines{,32,64}.asm when not using "
            "inline asm)\n"
            "    b: generate build.bat\n"
            "    i: use inline asm (not supported on 64-bit)\n"
            "    o: explicitly use ordinals in exports "
            "(not recommended for normal Win32 API DLL's)\n",
            argv[0]
        );

        return 1;
    }

    switch (argc)
    {
        case 2: dll = argv[1]; break;
        default:
            flagstr = argv[1];
            dll     = argv[2];
    }

    if (flagstr)
    {
        flags = 0;

        for (; *flagstr; ++flagstr)
        {
            switch (*flagstr)
            {
                case 'd': flags |= STUBGEN_DEF;        break;
                case 'c': flags |= STUBGEN_CODE;       break;
                case 'b': flags |= STUBGEN_BUILD;      break;
                case 'i': flags |= STUBGEN_INLINE_ASM; break;
                case 'o': flags |= STUBGEN_ORDINALS;   break;

                default:
                    fprintf(
                        stderr,
                        "ABUNAI: ignoring unknown flag %c\n",
                        *flagstr
                    );
            }
        }

        if (!flags)
        {
            fprintf(
                stderr,
                "ABUNAI: no valid flags found, using defaults\n"
            );

            flags = STUBGEN_DEFAULT_FLAGS;
        }
    }

    return stubgen(dll, flags);
}
