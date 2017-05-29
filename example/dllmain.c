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
    example/dllmain.c: Example OpenGL proxy DLL code that hooks
    glFlush and displays a text overlay. everything except the
    hooks is automatically generated
*/

#include <Windows.h>
#include <Shlwapi.h>
#include <GL/gl.h>

#define globvar static
#define internalfn static

typedef DWORD u32;
typedef WORD  u16;
typedef BYTE  u8;
typedef BOOL  b32;

globvar char dllname[MAX_PATH];
globvar HMODULE hthis = 0;
globvar HMODULE hdll = 0;
FARPROC original_funcs[368];

internalfn void die(char const* title);
internalfn void wait_init();

/* ------------------------------------------------------------- */

typedef BOOL WINAPI wglMakeCurrent_sig(HDC hdc, HGLRC hglrc);
wglMakeCurrent_sig* pwglMakeCurrent = 0;
#define wglMakeCurrent pwglMakeCurrent

typedef void glFlush_sig();
glFlush_sig* pglFlush = 0;
#define glFlush pglFlush

/* ------------------------------------------------------------- */

globvar GLuint font = 0;

BOOL WINAPI wglMakeCurrent_stub(HDC hdc, HGLRC hglrc)
{
    BOOL res;

    wait_init(); /* remember to call this! */

    if (pglFlush) {
        return wglMakeCurrent(hdc, hglrc);
    }

    /* indices are from trampolines.asm */
    pglFlush        = (glFlush_sig*)       original_funcs[ 97];
    pwglMakeCurrent = (wglMakeCurrent_sig*)original_funcs[356];

    res = wglMakeCurrent(hdc, hglrc);

    font = glGenLists(255);
    if (!font) {
        die("glGenLists failed");
    }

    SelectObject(hdc, GetStockObject(SYSTEM_FONT));
    wglUseFontBitmaps(hdc, 0, 255, font);

    return res;
}

void glFlush_stub()
{
    char const* msg = "Hello from the proxy dll!";

    wait_init(); /* remember to call this! */

    if (!font) {
        die("font was not initialized");
    }

    glColor3f(1.0f, 1.0f, 1.0f);

    glRasterPos2f(-0.9f, 0.8f);
    glPushAttrib(GL_LIST_BIT);
    glListBase(font);
    glCallLists(lstrlenA(msg), GL_UNSIGNED_BYTE, msg);
    glPopAttrib();

    glFlush();
}

/* ------------------------------------------------------------- */

/*
    because we can't LoadLibrary or do fancy stuff from DllMain,
    we are running init() in a separate thread and therefore there
    is no guarantee that whoever loaded the library won't try to
    use it before init() is done, leading to NULL function pointers
    being called.

    to fix this, I just have this flag which is atomically set to 1
    when init() finishes. each trampoline to the original functions
    then calls wait_init() which will hang and atomically poll on
    initdone until it is set to 1.
*/
__declspec (align(8)) volatile LONG initdone = 0;

internalfn
void wait_init()
{
    LONG val;

spinlock:
    val = InterlockedCompareExchange(&initdone, 0, 0);

    if (val) {
        return;
    }

    _mm_pause();
    goto spinlock;
}

internalfn
void init()
{
    FARPROC* p = original_funcs;
    char buf[MAX_PATH];

    GetModuleFileNameA(hthis, dllname, MAX_PATH);

    GetSystemDirectoryA(buf, MAX_PATH);
    PathAppendA(buf, PathFindFileNameA(dllname));

    hdll = LoadLibraryA(buf);
    if (!hdll) {
        die(dllname);
    }

#   define g(i, x) p[i] = GetProcAddress(hdll, x)
    g(0, "GlmfBeginGlsBlock");
    g(1, "GlmfCloseMetaFile");
    g(2, "GlmfEndGlsBlock");
    g(3, "GlmfEndPlayback");
    g(4, "GlmfInitPlayback");
    g(5, "GlmfPlayGlsRecord");
    g(6, "glAccum");
    g(7, "glAlphaFunc");
    g(8, "glAreTexturesResident");
    g(9, "glArrayElement");
    g(10, "glBegin");
    g(11, "glBindTexture");
    g(12, "glBitmap");
    g(13, "glBlendFunc");
    g(14, "glCallList");
    g(15, "glCallLists");
    g(16, "glClear");
    g(17, "glClearAccum");
    g(18, "glClearColor");
    g(19, "glClearDepth");
    g(20, "glClearIndex");
    g(21, "glClearStencil");
    g(22, "glClipPlane");
    g(23, "glColor3b");
    g(24, "glColor3bv");
    g(25, "glColor3d");
    g(26, "glColor3dv");
    g(27, "glColor3f");
    g(28, "glColor3fv");
    g(29, "glColor3i");
    g(30, "glColor3iv");
    g(31, "glColor3s");
    g(32, "glColor3sv");
    g(33, "glColor3ub");
    g(34, "glColor3ubv");
    g(35, "glColor3ui");
    g(36, "glColor3uiv");
    g(37, "glColor3us");
    g(38, "glColor3usv");
    g(39, "glColor4b");
    g(40, "glColor4bv");
    g(41, "glColor4d");
    g(42, "glColor4dv");
    g(43, "glColor4f");
    g(44, "glColor4fv");
    g(45, "glColor4i");
    g(46, "glColor4iv");
    g(47, "glColor4s");
    g(48, "glColor4sv");
    g(49, "glColor4ub");
    g(50, "glColor4ubv");
    g(51, "glColor4ui");
    g(52, "glColor4uiv");
    g(53, "glColor4us");
    g(54, "glColor4usv");
    g(55, "glColorMask");
    g(56, "glColorMaterial");
    g(57, "glColorPointer");
    g(58, "glCopyPixels");
    g(59, "glCopyTexImage1D");
    g(60, "glCopyTexImage2D");
    g(61, "glCopyTexSubImage1D");
    g(62, "glCopyTexSubImage2D");
    g(63, "glCullFace");
    g(64, "glDebugEntry");
    g(65, "glDeleteLists");
    g(66, "glDeleteTextures");
    g(67, "glDepthFunc");
    g(68, "glDepthMask");
    g(69, "glDepthRange");
    g(70, "glDisable");
    g(71, "glDisableClientState");
    g(72, "glDrawArrays");
    g(73, "glDrawBuffer");
    g(74, "glDrawElements");
    g(75, "glDrawPixels");
    g(76, "glEdgeFlag");
    g(77, "glEdgeFlagPointer");
    g(78, "glEdgeFlagv");
    g(79, "glEnable");
    g(80, "glEnableClientState");
    g(81, "glEnd");
    g(82, "glEndList");
    g(83, "glEvalCoord1d");
    g(84, "glEvalCoord1dv");
    g(85, "glEvalCoord1f");
    g(86, "glEvalCoord1fv");
    g(87, "glEvalCoord2d");
    g(88, "glEvalCoord2dv");
    g(89, "glEvalCoord2f");
    g(90, "glEvalCoord2fv");
    g(91, "glEvalMesh1");
    g(92, "glEvalMesh2");
    g(93, "glEvalPoint1");
    g(94, "glEvalPoint2");
    g(95, "glFeedbackBuffer");
    g(96, "glFinish");
    g(97, "glFlush");
    g(98, "glFogf");
    g(99, "glFogfv");
    g(100, "glFogi");
    g(101, "glFogiv");
    g(102, "glFrontFace");
    g(103, "glFrustum");
    g(104, "glGenLists");
    g(105, "glGenTextures");
    g(106, "glGetBooleanv");
    g(107, "glGetClipPlane");
    g(108, "glGetDoublev");
    g(109, "glGetError");
    g(110, "glGetFloatv");
    g(111, "glGetIntegerv");
    g(112, "glGetLightfv");
    g(113, "glGetLightiv");
    g(114, "glGetMapdv");
    g(115, "glGetMapfv");
    g(116, "glGetMapiv");
    g(117, "glGetMaterialfv");
    g(118, "glGetMaterialiv");
    g(119, "glGetPixelMapfv");
    g(120, "glGetPixelMapuiv");
    g(121, "glGetPixelMapusv");
    g(122, "glGetPointerv");
    g(123, "glGetPolygonStipple");
    g(124, "glGetString");
    g(125, "glGetTexEnvfv");
    g(126, "glGetTexEnviv");
    g(127, "glGetTexGendv");
    g(128, "glGetTexGenfv");
    g(129, "glGetTexGeniv");
    g(130, "glGetTexImage");
    g(131, "glGetTexLevelParameterfv");
    g(132, "glGetTexLevelParameteriv");
    g(133, "glGetTexParameterfv");
    g(134, "glGetTexParameteriv");
    g(135, "glHint");
    g(136, "glIndexMask");
    g(137, "glIndexPointer");
    g(138, "glIndexd");
    g(139, "glIndexdv");
    g(140, "glIndexf");
    g(141, "glIndexfv");
    g(142, "glIndexi");
    g(143, "glIndexiv");
    g(144, "glIndexs");
    g(145, "glIndexsv");
    g(146, "glIndexub");
    g(147, "glIndexubv");
    g(148, "glInitNames");
    g(149, "glInterleavedArrays");
    g(150, "glIsEnabled");
    g(151, "glIsList");
    g(152, "glIsTexture");
    g(153, "glLightModelf");
    g(154, "glLightModelfv");
    g(155, "glLightModeli");
    g(156, "glLightModeliv");
    g(157, "glLightf");
    g(158, "glLightfv");
    g(159, "glLighti");
    g(160, "glLightiv");
    g(161, "glLineStipple");
    g(162, "glLineWidth");
    g(163, "glListBase");
    g(164, "glLoadIdentity");
    g(165, "glLoadMatrixd");
    g(166, "glLoadMatrixf");
    g(167, "glLoadName");
    g(168, "glLogicOp");
    g(169, "glMap1d");
    g(170, "glMap1f");
    g(171, "glMap2d");
    g(172, "glMap2f");
    g(173, "glMapGrid1d");
    g(174, "glMapGrid1f");
    g(175, "glMapGrid2d");
    g(176, "glMapGrid2f");
    g(177, "glMaterialf");
    g(178, "glMaterialfv");
    g(179, "glMateriali");
    g(180, "glMaterialiv");
    g(181, "glMatrixMode");
    g(182, "glMultMatrixd");
    g(183, "glMultMatrixf");
    g(184, "glNewList");
    g(185, "glNormal3b");
    g(186, "glNormal3bv");
    g(187, "glNormal3d");
    g(188, "glNormal3dv");
    g(189, "glNormal3f");
    g(190, "glNormal3fv");
    g(191, "glNormal3i");
    g(192, "glNormal3iv");
    g(193, "glNormal3s");
    g(194, "glNormal3sv");
    g(195, "glNormalPointer");
    g(196, "glOrtho");
    g(197, "glPassThrough");
    g(198, "glPixelMapfv");
    g(199, "glPixelMapuiv");
    g(200, "glPixelMapusv");
    g(201, "glPixelStoref");
    g(202, "glPixelStorei");
    g(203, "glPixelTransferf");
    g(204, "glPixelTransferi");
    g(205, "glPixelZoom");
    g(206, "glPointSize");
    g(207, "glPolygonMode");
    g(208, "glPolygonOffset");
    g(209, "glPolygonStipple");
    g(210, "glPopAttrib");
    g(211, "glPopClientAttrib");
    g(212, "glPopMatrix");
    g(213, "glPopName");
    g(214, "glPrioritizeTextures");
    g(215, "glPushAttrib");
    g(216, "glPushClientAttrib");
    g(217, "glPushMatrix");
    g(218, "glPushName");
    g(219, "glRasterPos2d");
    g(220, "glRasterPos2dv");
    g(221, "glRasterPos2f");
    g(222, "glRasterPos2fv");
    g(223, "glRasterPos2i");
    g(224, "glRasterPos2iv");
    g(225, "glRasterPos2s");
    g(226, "glRasterPos2sv");
    g(227, "glRasterPos3d");
    g(228, "glRasterPos3dv");
    g(229, "glRasterPos3f");
    g(230, "glRasterPos3fv");
    g(231, "glRasterPos3i");
    g(232, "glRasterPos3iv");
    g(233, "glRasterPos3s");
    g(234, "glRasterPos3sv");
    g(235, "glRasterPos4d");
    g(236, "glRasterPos4dv");
    g(237, "glRasterPos4f");
    g(238, "glRasterPos4fv");
    g(239, "glRasterPos4i");
    g(240, "glRasterPos4iv");
    g(241, "glRasterPos4s");
    g(242, "glRasterPos4sv");
    g(243, "glReadBuffer");
    g(244, "glReadPixels");
    g(245, "glRectd");
    g(246, "glRectdv");
    g(247, "glRectf");
    g(248, "glRectfv");
    g(249, "glRecti");
    g(250, "glRectiv");
    g(251, "glRects");
    g(252, "glRectsv");
    g(253, "glRenderMode");
    g(254, "glRotated");
    g(255, "glRotatef");
    g(256, "glScaled");
    g(257, "glScalef");
    g(258, "glScissor");
    g(259, "glSelectBuffer");
    g(260, "glShadeModel");
    g(261, "glStencilFunc");
    g(262, "glStencilMask");
    g(263, "glStencilOp");
    g(264, "glTexCoord1d");
    g(265, "glTexCoord1dv");
    g(266, "glTexCoord1f");
    g(267, "glTexCoord1fv");
    g(268, "glTexCoord1i");
    g(269, "glTexCoord1iv");
    g(270, "glTexCoord1s");
    g(271, "glTexCoord1sv");
    g(272, "glTexCoord2d");
    g(273, "glTexCoord2dv");
    g(274, "glTexCoord2f");
    g(275, "glTexCoord2fv");
    g(276, "glTexCoord2i");
    g(277, "glTexCoord2iv");
    g(278, "glTexCoord2s");
    g(279, "glTexCoord2sv");
    g(280, "glTexCoord3d");
    g(281, "glTexCoord3dv");
    g(282, "glTexCoord3f");
    g(283, "glTexCoord3fv");
    g(284, "glTexCoord3i");
    g(285, "glTexCoord3iv");
    g(286, "glTexCoord3s");
    g(287, "glTexCoord3sv");
    g(288, "glTexCoord4d");
    g(289, "glTexCoord4dv");
    g(290, "glTexCoord4f");
    g(291, "glTexCoord4fv");
    g(292, "glTexCoord4i");
    g(293, "glTexCoord4iv");
    g(294, "glTexCoord4s");
    g(295, "glTexCoord4sv");
    g(296, "glTexCoordPointer");
    g(297, "glTexEnvf");
    g(298, "glTexEnvfv");
    g(299, "glTexEnvi");
    g(300, "glTexEnviv");
    g(301, "glTexGend");
    g(302, "glTexGendv");
    g(303, "glTexGenf");
    g(304, "glTexGenfv");
    g(305, "glTexGeni");
    g(306, "glTexGeniv");
    g(307, "glTexImage1D");
    g(308, "glTexImage2D");
    g(309, "glTexParameterf");
    g(310, "glTexParameterfv");
    g(311, "glTexParameteri");
    g(312, "glTexParameteriv");
    g(313, "glTexSubImage1D");
    g(314, "glTexSubImage2D");
    g(315, "glTranslated");
    g(316, "glTranslatef");
    g(317, "glVertex2d");
    g(318, "glVertex2dv");
    g(319, "glVertex2f");
    g(320, "glVertex2fv");
    g(321, "glVertex2i");
    g(322, "glVertex2iv");
    g(323, "glVertex2s");
    g(324, "glVertex2sv");
    g(325, "glVertex3d");
    g(326, "glVertex3dv");
    g(327, "glVertex3f");
    g(328, "glVertex3fv");
    g(329, "glVertex3i");
    g(330, "glVertex3iv");
    g(331, "glVertex3s");
    g(332, "glVertex3sv");
    g(333, "glVertex4d");
    g(334, "glVertex4dv");
    g(335, "glVertex4f");
    g(336, "glVertex4fv");
    g(337, "glVertex4i");
    g(338, "glVertex4iv");
    g(339, "glVertex4s");
    g(340, "glVertex4sv");
    g(341, "glVertexPointer");
    g(342, "glViewport");
    g(343, "wglChoosePixelFormat");
    g(344, "wglCopyContext");
    g(345, "wglCreateContext");
    g(346, "wglCreateLayerContext");
    g(347, "wglDeleteContext");
    g(348, "wglDescribeLayerPlane");
    g(349, "wglDescribePixelFormat");
    g(350, "wglGetCurrentContext");
    g(351, "wglGetCurrentDC");
    g(352, "wglGetDefaultProcAddress");
    g(353, "wglGetLayerPaletteEntries");
    g(354, "wglGetPixelFormat");
    g(355, "wglGetProcAddress");
    g(356, "wglMakeCurrent");
    g(357, "wglRealizeLayerPalette");
    g(358, "wglSetLayerPaletteEntries");
    g(359, "wglSetPixelFormat");
    g(360, "wglShareLists");
    g(361, "wglSwapBuffers");
    g(362, "wglSwapLayerBuffers");
    g(363, "wglSwapMultipleBuffers");
    g(364, "wglUseFontBitmapsA");
    g(365, "wglUseFontBitmapsW");
    g(366, "wglUseFontOutlinesA");
    g(367, "wglUseFontOutlinesW");
#   undef g

    InterlockedIncrement(&initdone);
}

internalfn
void die(char const* title)
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
        buf = "(could not format error)";
    }

    MessageBoxA(0, buf, title, MB_OK | MB_ICONERROR);
    TerminateProcess(GetCurrentProcess(), 1);
}

b32 APIENTRY DllMain(
    HMODULE hmodule,
    u32 reason_for_call,
    void* reserved)
{
    (void)reserved;

    hthis = hmodule;

    switch (reason_for_call)
    {
        case DLL_PROCESS_ATTACH:
            CreateThread(
                0, 0,
                (LPTHREAD_START_ROUTINE)init,
                0, 0, 0
            );
            break;

        case DLL_PROCESS_DETACH:
            if (hdll) {
                FreeLibrary(hdll);
            }
    }

    return 1;
}
