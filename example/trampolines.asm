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
;   example/trampolines.asm: automatically generated.
;   passes through all of the original DLL calls.
;   when you want to hook something, comment it out here and
;   define it in dllmain.c

EXTERN initdone:DWORD

asm_wait_init MACRO
    LOCAL loop

    push REGA
    push REGD

loop:
    xor edx,edx
    xor eax,eax
    lock cmpxchg initdone,edx
    jnz short initialized
    pause
    jmp short loop

initialized:
    pop REGD
    pop REGA
ENDM

_TEXT SEGMENT

GlmfBeginGlsBlock_stub PROC
asm_wait_init
jmp [original_funcs + 0 * PTR_SIZE]
GlmfBeginGlsBlock_stub ENDP

GlmfCloseMetaFile_stub PROC
asm_wait_init
jmp [original_funcs + 1 * PTR_SIZE]
GlmfCloseMetaFile_stub ENDP

GlmfEndGlsBlock_stub PROC
asm_wait_init
jmp [original_funcs + 2 * PTR_SIZE]
GlmfEndGlsBlock_stub ENDP

GlmfEndPlayback_stub PROC
asm_wait_init
jmp [original_funcs + 3 * PTR_SIZE]
GlmfEndPlayback_stub ENDP

GlmfInitPlayback_stub PROC
asm_wait_init
jmp [original_funcs + 4 * PTR_SIZE]
GlmfInitPlayback_stub ENDP

GlmfPlayGlsRecord_stub PROC
asm_wait_init
jmp [original_funcs + 5 * PTR_SIZE]
GlmfPlayGlsRecord_stub ENDP

glAccum_stub PROC
asm_wait_init
jmp [original_funcs + 6 * PTR_SIZE]
glAccum_stub ENDP

glAlphaFunc_stub PROC
asm_wait_init
jmp [original_funcs + 7 * PTR_SIZE]
glAlphaFunc_stub ENDP

glAreTexturesResident_stub PROC
asm_wait_init
jmp [original_funcs + 8 * PTR_SIZE]
glAreTexturesResident_stub ENDP

glArrayElement_stub PROC
asm_wait_init
jmp [original_funcs + 9 * PTR_SIZE]
glArrayElement_stub ENDP

glBegin_stub PROC
asm_wait_init
jmp [original_funcs + 10 * PTR_SIZE]
glBegin_stub ENDP

glBindTexture_stub PROC
asm_wait_init
jmp [original_funcs + 11 * PTR_SIZE]
glBindTexture_stub ENDP

glBitmap_stub PROC
asm_wait_init
jmp [original_funcs + 12 * PTR_SIZE]
glBitmap_stub ENDP

glBlendFunc_stub PROC
asm_wait_init
jmp [original_funcs + 13 * PTR_SIZE]
glBlendFunc_stub ENDP

glCallList_stub PROC
asm_wait_init
jmp [original_funcs + 14 * PTR_SIZE]
glCallList_stub ENDP

glCallLists_stub PROC
asm_wait_init
jmp [original_funcs + 15 * PTR_SIZE]
glCallLists_stub ENDP

glClear_stub PROC
asm_wait_init
jmp [original_funcs + 16 * PTR_SIZE]
glClear_stub ENDP

glClearAccum_stub PROC
asm_wait_init
jmp [original_funcs + 17 * PTR_SIZE]
glClearAccum_stub ENDP

glClearColor_stub PROC
asm_wait_init
jmp [original_funcs + 18 * PTR_SIZE]
glClearColor_stub ENDP

glClearDepth_stub PROC
asm_wait_init
jmp [original_funcs + 19 * PTR_SIZE]
glClearDepth_stub ENDP

glClearIndex_stub PROC
asm_wait_init
jmp [original_funcs + 20 * PTR_SIZE]
glClearIndex_stub ENDP

glClearStencil_stub PROC
asm_wait_init
jmp [original_funcs + 21 * PTR_SIZE]
glClearStencil_stub ENDP

glClipPlane_stub PROC
asm_wait_init
jmp [original_funcs + 22 * PTR_SIZE]
glClipPlane_stub ENDP

glColor3b_stub PROC
asm_wait_init
jmp [original_funcs + 23 * PTR_SIZE]
glColor3b_stub ENDP

glColor3bv_stub PROC
asm_wait_init
jmp [original_funcs + 24 * PTR_SIZE]
glColor3bv_stub ENDP

glColor3d_stub PROC
asm_wait_init
jmp [original_funcs + 25 * PTR_SIZE]
glColor3d_stub ENDP

glColor3dv_stub PROC
asm_wait_init
jmp [original_funcs + 26 * PTR_SIZE]
glColor3dv_stub ENDP

glColor3f_stub PROC
asm_wait_init
jmp [original_funcs + 27 * PTR_SIZE]
glColor3f_stub ENDP

glColor3fv_stub PROC
asm_wait_init
jmp [original_funcs + 28 * PTR_SIZE]
glColor3fv_stub ENDP

glColor3i_stub PROC
asm_wait_init
jmp [original_funcs + 29 * PTR_SIZE]
glColor3i_stub ENDP

glColor3iv_stub PROC
asm_wait_init
jmp [original_funcs + 30 * PTR_SIZE]
glColor3iv_stub ENDP

glColor3s_stub PROC
asm_wait_init
jmp [original_funcs + 31 * PTR_SIZE]
glColor3s_stub ENDP

glColor3sv_stub PROC
asm_wait_init
jmp [original_funcs + 32 * PTR_SIZE]
glColor3sv_stub ENDP

glColor3ub_stub PROC
asm_wait_init
jmp [original_funcs + 33 * PTR_SIZE]
glColor3ub_stub ENDP

glColor3ubv_stub PROC
asm_wait_init
jmp [original_funcs + 34 * PTR_SIZE]
glColor3ubv_stub ENDP

glColor3ui_stub PROC
asm_wait_init
jmp [original_funcs + 35 * PTR_SIZE]
glColor3ui_stub ENDP

glColor3uiv_stub PROC
asm_wait_init
jmp [original_funcs + 36 * PTR_SIZE]
glColor3uiv_stub ENDP

glColor3us_stub PROC
asm_wait_init
jmp [original_funcs + 37 * PTR_SIZE]
glColor3us_stub ENDP

glColor3usv_stub PROC
asm_wait_init
jmp [original_funcs + 38 * PTR_SIZE]
glColor3usv_stub ENDP

glColor4b_stub PROC
asm_wait_init
jmp [original_funcs + 39 * PTR_SIZE]
glColor4b_stub ENDP

glColor4bv_stub PROC
asm_wait_init
jmp [original_funcs + 40 * PTR_SIZE]
glColor4bv_stub ENDP

glColor4d_stub PROC
asm_wait_init
jmp [original_funcs + 41 * PTR_SIZE]
glColor4d_stub ENDP

glColor4dv_stub PROC
asm_wait_init
jmp [original_funcs + 42 * PTR_SIZE]
glColor4dv_stub ENDP

glColor4f_stub PROC
asm_wait_init
jmp [original_funcs + 43 * PTR_SIZE]
glColor4f_stub ENDP

glColor4fv_stub PROC
asm_wait_init
jmp [original_funcs + 44 * PTR_SIZE]
glColor4fv_stub ENDP

glColor4i_stub PROC
asm_wait_init
jmp [original_funcs + 45 * PTR_SIZE]
glColor4i_stub ENDP

glColor4iv_stub PROC
asm_wait_init
jmp [original_funcs + 46 * PTR_SIZE]
glColor4iv_stub ENDP

glColor4s_stub PROC
asm_wait_init
jmp [original_funcs + 47 * PTR_SIZE]
glColor4s_stub ENDP

glColor4sv_stub PROC
asm_wait_init
jmp [original_funcs + 48 * PTR_SIZE]
glColor4sv_stub ENDP

glColor4ub_stub PROC
asm_wait_init
jmp [original_funcs + 49 * PTR_SIZE]
glColor4ub_stub ENDP

glColor4ubv_stub PROC
asm_wait_init
jmp [original_funcs + 50 * PTR_SIZE]
glColor4ubv_stub ENDP

glColor4ui_stub PROC
asm_wait_init
jmp [original_funcs + 51 * PTR_SIZE]
glColor4ui_stub ENDP

glColor4uiv_stub PROC
asm_wait_init
jmp [original_funcs + 52 * PTR_SIZE]
glColor4uiv_stub ENDP

glColor4us_stub PROC
asm_wait_init
jmp [original_funcs + 53 * PTR_SIZE]
glColor4us_stub ENDP

glColor4usv_stub PROC
asm_wait_init
jmp [original_funcs + 54 * PTR_SIZE]
glColor4usv_stub ENDP

glColorMask_stub PROC
asm_wait_init
jmp [original_funcs + 55 * PTR_SIZE]
glColorMask_stub ENDP

glColorMaterial_stub PROC
asm_wait_init
jmp [original_funcs + 56 * PTR_SIZE]
glColorMaterial_stub ENDP

glColorPointer_stub PROC
asm_wait_init
jmp [original_funcs + 57 * PTR_SIZE]
glColorPointer_stub ENDP

glCopyPixels_stub PROC
asm_wait_init
jmp [original_funcs + 58 * PTR_SIZE]
glCopyPixels_stub ENDP

glCopyTexImage1D_stub PROC
asm_wait_init
jmp [original_funcs + 59 * PTR_SIZE]
glCopyTexImage1D_stub ENDP

glCopyTexImage2D_stub PROC
asm_wait_init
jmp [original_funcs + 60 * PTR_SIZE]
glCopyTexImage2D_stub ENDP

glCopyTexSubImage1D_stub PROC
asm_wait_init
jmp [original_funcs + 61 * PTR_SIZE]
glCopyTexSubImage1D_stub ENDP

glCopyTexSubImage2D_stub PROC
asm_wait_init
jmp [original_funcs + 62 * PTR_SIZE]
glCopyTexSubImage2D_stub ENDP

glCullFace_stub PROC
asm_wait_init
jmp [original_funcs + 63 * PTR_SIZE]
glCullFace_stub ENDP

glDebugEntry_stub PROC
asm_wait_init
jmp [original_funcs + 64 * PTR_SIZE]
glDebugEntry_stub ENDP

glDeleteLists_stub PROC
asm_wait_init
jmp [original_funcs + 65 * PTR_SIZE]
glDeleteLists_stub ENDP

glDeleteTextures_stub PROC
asm_wait_init
jmp [original_funcs + 66 * PTR_SIZE]
glDeleteTextures_stub ENDP

glDepthFunc_stub PROC
asm_wait_init
jmp [original_funcs + 67 * PTR_SIZE]
glDepthFunc_stub ENDP

glDepthMask_stub PROC
asm_wait_init
jmp [original_funcs + 68 * PTR_SIZE]
glDepthMask_stub ENDP

glDepthRange_stub PROC
asm_wait_init
jmp [original_funcs + 69 * PTR_SIZE]
glDepthRange_stub ENDP

glDisable_stub PROC
asm_wait_init
jmp [original_funcs + 70 * PTR_SIZE]
glDisable_stub ENDP

glDisableClientState_stub PROC
asm_wait_init
jmp [original_funcs + 71 * PTR_SIZE]
glDisableClientState_stub ENDP

glDrawArrays_stub PROC
asm_wait_init
jmp [original_funcs + 72 * PTR_SIZE]
glDrawArrays_stub ENDP

glDrawBuffer_stub PROC
asm_wait_init
jmp [original_funcs + 73 * PTR_SIZE]
glDrawBuffer_stub ENDP

glDrawElements_stub PROC
asm_wait_init
jmp [original_funcs + 74 * PTR_SIZE]
glDrawElements_stub ENDP

glDrawPixels_stub PROC
asm_wait_init
jmp [original_funcs + 75 * PTR_SIZE]
glDrawPixels_stub ENDP

glEdgeFlag_stub PROC
asm_wait_init
jmp [original_funcs + 76 * PTR_SIZE]
glEdgeFlag_stub ENDP

glEdgeFlagPointer_stub PROC
asm_wait_init
jmp [original_funcs + 77 * PTR_SIZE]
glEdgeFlagPointer_stub ENDP

glEdgeFlagv_stub PROC
asm_wait_init
jmp [original_funcs + 78 * PTR_SIZE]
glEdgeFlagv_stub ENDP

glEnable_stub PROC
asm_wait_init
jmp [original_funcs + 79 * PTR_SIZE]
glEnable_stub ENDP

glEnableClientState_stub PROC
asm_wait_init
jmp [original_funcs + 80 * PTR_SIZE]
glEnableClientState_stub ENDP

glEnd_stub PROC
asm_wait_init
jmp [original_funcs + 81 * PTR_SIZE]
glEnd_stub ENDP

glEndList_stub PROC
asm_wait_init
jmp [original_funcs + 82 * PTR_SIZE]
glEndList_stub ENDP

glEvalCoord1d_stub PROC
asm_wait_init
jmp [original_funcs + 83 * PTR_SIZE]
glEvalCoord1d_stub ENDP

glEvalCoord1dv_stub PROC
asm_wait_init
jmp [original_funcs + 84 * PTR_SIZE]
glEvalCoord1dv_stub ENDP

glEvalCoord1f_stub PROC
asm_wait_init
jmp [original_funcs + 85 * PTR_SIZE]
glEvalCoord1f_stub ENDP

glEvalCoord1fv_stub PROC
asm_wait_init
jmp [original_funcs + 86 * PTR_SIZE]
glEvalCoord1fv_stub ENDP

glEvalCoord2d_stub PROC
asm_wait_init
jmp [original_funcs + 87 * PTR_SIZE]
glEvalCoord2d_stub ENDP

glEvalCoord2dv_stub PROC
asm_wait_init
jmp [original_funcs + 88 * PTR_SIZE]
glEvalCoord2dv_stub ENDP

glEvalCoord2f_stub PROC
asm_wait_init
jmp [original_funcs + 89 * PTR_SIZE]
glEvalCoord2f_stub ENDP

glEvalCoord2fv_stub PROC
asm_wait_init
jmp [original_funcs + 90 * PTR_SIZE]
glEvalCoord2fv_stub ENDP

glEvalMesh1_stub PROC
asm_wait_init
jmp [original_funcs + 91 * PTR_SIZE]
glEvalMesh1_stub ENDP

glEvalMesh2_stub PROC
asm_wait_init
jmp [original_funcs + 92 * PTR_SIZE]
glEvalMesh2_stub ENDP

glEvalPoint1_stub PROC
asm_wait_init
jmp [original_funcs + 93 * PTR_SIZE]
glEvalPoint1_stub ENDP

glEvalPoint2_stub PROC
asm_wait_init
jmp [original_funcs + 94 * PTR_SIZE]
glEvalPoint2_stub ENDP

glFeedbackBuffer_stub PROC
asm_wait_init
jmp [original_funcs + 95 * PTR_SIZE]
glFeedbackBuffer_stub ENDP

glFinish_stub PROC
asm_wait_init
jmp [original_funcs + 96 * PTR_SIZE]
glFinish_stub ENDP

;glFlush_stub PROC
;asm_wait_init
;jmp [original_funcs + 97 * PTR_SIZE]
;glFlush_stub ENDP

glFogf_stub PROC
asm_wait_init
jmp [original_funcs + 98 * PTR_SIZE]
glFogf_stub ENDP

glFogfv_stub PROC
asm_wait_init
jmp [original_funcs + 99 * PTR_SIZE]
glFogfv_stub ENDP

glFogi_stub PROC
asm_wait_init
jmp [original_funcs + 100 * PTR_SIZE]
glFogi_stub ENDP

glFogiv_stub PROC
asm_wait_init
jmp [original_funcs + 101 * PTR_SIZE]
glFogiv_stub ENDP

glFrontFace_stub PROC
asm_wait_init
jmp [original_funcs + 102 * PTR_SIZE]
glFrontFace_stub ENDP

glFrustum_stub PROC
asm_wait_init
jmp [original_funcs + 103 * PTR_SIZE]
glFrustum_stub ENDP

glGenLists_stub PROC
asm_wait_init
jmp [original_funcs + 104 * PTR_SIZE]
glGenLists_stub ENDP

glGenTextures_stub PROC
asm_wait_init
jmp [original_funcs + 105 * PTR_SIZE]
glGenTextures_stub ENDP

glGetBooleanv_stub PROC
asm_wait_init
jmp [original_funcs + 106 * PTR_SIZE]
glGetBooleanv_stub ENDP

glGetClipPlane_stub PROC
asm_wait_init
jmp [original_funcs + 107 * PTR_SIZE]
glGetClipPlane_stub ENDP

glGetDoublev_stub PROC
asm_wait_init
jmp [original_funcs + 108 * PTR_SIZE]
glGetDoublev_stub ENDP

glGetError_stub PROC
asm_wait_init
jmp [original_funcs + 109 * PTR_SIZE]
glGetError_stub ENDP

glGetFloatv_stub PROC
asm_wait_init
jmp [original_funcs + 110 * PTR_SIZE]
glGetFloatv_stub ENDP

glGetIntegerv_stub PROC
asm_wait_init
jmp [original_funcs + 111 * PTR_SIZE]
glGetIntegerv_stub ENDP

glGetLightfv_stub PROC
asm_wait_init
jmp [original_funcs + 112 * PTR_SIZE]
glGetLightfv_stub ENDP

glGetLightiv_stub PROC
asm_wait_init
jmp [original_funcs + 113 * PTR_SIZE]
glGetLightiv_stub ENDP

glGetMapdv_stub PROC
asm_wait_init
jmp [original_funcs + 114 * PTR_SIZE]
glGetMapdv_stub ENDP

glGetMapfv_stub PROC
asm_wait_init
jmp [original_funcs + 115 * PTR_SIZE]
glGetMapfv_stub ENDP

glGetMapiv_stub PROC
asm_wait_init
jmp [original_funcs + 116 * PTR_SIZE]
glGetMapiv_stub ENDP

glGetMaterialfv_stub PROC
asm_wait_init
jmp [original_funcs + 117 * PTR_SIZE]
glGetMaterialfv_stub ENDP

glGetMaterialiv_stub PROC
asm_wait_init
jmp [original_funcs + 118 * PTR_SIZE]
glGetMaterialiv_stub ENDP

glGetPixelMapfv_stub PROC
asm_wait_init
jmp [original_funcs + 119 * PTR_SIZE]
glGetPixelMapfv_stub ENDP

glGetPixelMapuiv_stub PROC
asm_wait_init
jmp [original_funcs + 120 * PTR_SIZE]
glGetPixelMapuiv_stub ENDP

glGetPixelMapusv_stub PROC
asm_wait_init
jmp [original_funcs + 121 * PTR_SIZE]
glGetPixelMapusv_stub ENDP

glGetPointerv_stub PROC
asm_wait_init
jmp [original_funcs + 122 * PTR_SIZE]
glGetPointerv_stub ENDP

glGetPolygonStipple_stub PROC
asm_wait_init
jmp [original_funcs + 123 * PTR_SIZE]
glGetPolygonStipple_stub ENDP

glGetString_stub PROC
asm_wait_init
jmp [original_funcs + 124 * PTR_SIZE]
glGetString_stub ENDP

glGetTexEnvfv_stub PROC
asm_wait_init
jmp [original_funcs + 125 * PTR_SIZE]
glGetTexEnvfv_stub ENDP

glGetTexEnviv_stub PROC
asm_wait_init
jmp [original_funcs + 126 * PTR_SIZE]
glGetTexEnviv_stub ENDP

glGetTexGendv_stub PROC
asm_wait_init
jmp [original_funcs + 127 * PTR_SIZE]
glGetTexGendv_stub ENDP

glGetTexGenfv_stub PROC
asm_wait_init
jmp [original_funcs + 128 * PTR_SIZE]
glGetTexGenfv_stub ENDP

glGetTexGeniv_stub PROC
asm_wait_init
jmp [original_funcs + 129 * PTR_SIZE]
glGetTexGeniv_stub ENDP

glGetTexImage_stub PROC
asm_wait_init
jmp [original_funcs + 130 * PTR_SIZE]
glGetTexImage_stub ENDP

glGetTexLevelParameterfv_stub PROC
asm_wait_init
jmp [original_funcs + 131 * PTR_SIZE]
glGetTexLevelParameterfv_stub ENDP

glGetTexLevelParameteriv_stub PROC
asm_wait_init
jmp [original_funcs + 132 * PTR_SIZE]
glGetTexLevelParameteriv_stub ENDP

glGetTexParameterfv_stub PROC
asm_wait_init
jmp [original_funcs + 133 * PTR_SIZE]
glGetTexParameterfv_stub ENDP

glGetTexParameteriv_stub PROC
asm_wait_init
jmp [original_funcs + 134 * PTR_SIZE]
glGetTexParameteriv_stub ENDP

glHint_stub PROC
asm_wait_init
jmp [original_funcs + 135 * PTR_SIZE]
glHint_stub ENDP

glIndexMask_stub PROC
asm_wait_init
jmp [original_funcs + 136 * PTR_SIZE]
glIndexMask_stub ENDP

glIndexPointer_stub PROC
asm_wait_init
jmp [original_funcs + 137 * PTR_SIZE]
glIndexPointer_stub ENDP

glIndexd_stub PROC
asm_wait_init
jmp [original_funcs + 138 * PTR_SIZE]
glIndexd_stub ENDP

glIndexdv_stub PROC
asm_wait_init
jmp [original_funcs + 139 * PTR_SIZE]
glIndexdv_stub ENDP

glIndexf_stub PROC
asm_wait_init
jmp [original_funcs + 140 * PTR_SIZE]
glIndexf_stub ENDP

glIndexfv_stub PROC
asm_wait_init
jmp [original_funcs + 141 * PTR_SIZE]
glIndexfv_stub ENDP

glIndexi_stub PROC
asm_wait_init
jmp [original_funcs + 142 * PTR_SIZE]
glIndexi_stub ENDP

glIndexiv_stub PROC
asm_wait_init
jmp [original_funcs + 143 * PTR_SIZE]
glIndexiv_stub ENDP

glIndexs_stub PROC
asm_wait_init
jmp [original_funcs + 144 * PTR_SIZE]
glIndexs_stub ENDP

glIndexsv_stub PROC
asm_wait_init
jmp [original_funcs + 145 * PTR_SIZE]
glIndexsv_stub ENDP

glIndexub_stub PROC
asm_wait_init
jmp [original_funcs + 146 * PTR_SIZE]
glIndexub_stub ENDP

glIndexubv_stub PROC
asm_wait_init
jmp [original_funcs + 147 * PTR_SIZE]
glIndexubv_stub ENDP

glInitNames_stub PROC
asm_wait_init
jmp [original_funcs + 148 * PTR_SIZE]
glInitNames_stub ENDP

glInterleavedArrays_stub PROC
asm_wait_init
jmp [original_funcs + 149 * PTR_SIZE]
glInterleavedArrays_stub ENDP

glIsEnabled_stub PROC
asm_wait_init
jmp [original_funcs + 150 * PTR_SIZE]
glIsEnabled_stub ENDP

glIsList_stub PROC
asm_wait_init
jmp [original_funcs + 151 * PTR_SIZE]
glIsList_stub ENDP

glIsTexture_stub PROC
asm_wait_init
jmp [original_funcs + 152 * PTR_SIZE]
glIsTexture_stub ENDP

glLightModelf_stub PROC
asm_wait_init
jmp [original_funcs + 153 * PTR_SIZE]
glLightModelf_stub ENDP

glLightModelfv_stub PROC
asm_wait_init
jmp [original_funcs + 154 * PTR_SIZE]
glLightModelfv_stub ENDP

glLightModeli_stub PROC
asm_wait_init
jmp [original_funcs + 155 * PTR_SIZE]
glLightModeli_stub ENDP

glLightModeliv_stub PROC
asm_wait_init
jmp [original_funcs + 156 * PTR_SIZE]
glLightModeliv_stub ENDP

glLightf_stub PROC
asm_wait_init
jmp [original_funcs + 157 * PTR_SIZE]
glLightf_stub ENDP

glLightfv_stub PROC
asm_wait_init
jmp [original_funcs + 158 * PTR_SIZE]
glLightfv_stub ENDP

glLighti_stub PROC
asm_wait_init
jmp [original_funcs + 159 * PTR_SIZE]
glLighti_stub ENDP

glLightiv_stub PROC
asm_wait_init
jmp [original_funcs + 160 * PTR_SIZE]
glLightiv_stub ENDP

glLineStipple_stub PROC
asm_wait_init
jmp [original_funcs + 161 * PTR_SIZE]
glLineStipple_stub ENDP

glLineWidth_stub PROC
asm_wait_init
jmp [original_funcs + 162 * PTR_SIZE]
glLineWidth_stub ENDP

glListBase_stub PROC
asm_wait_init
jmp [original_funcs + 163 * PTR_SIZE]
glListBase_stub ENDP

glLoadIdentity_stub PROC
asm_wait_init
jmp [original_funcs + 164 * PTR_SIZE]
glLoadIdentity_stub ENDP

glLoadMatrixd_stub PROC
asm_wait_init
jmp [original_funcs + 165 * PTR_SIZE]
glLoadMatrixd_stub ENDP

glLoadMatrixf_stub PROC
asm_wait_init
jmp [original_funcs + 166 * PTR_SIZE]
glLoadMatrixf_stub ENDP

glLoadName_stub PROC
asm_wait_init
jmp [original_funcs + 167 * PTR_SIZE]
glLoadName_stub ENDP

glLogicOp_stub PROC
asm_wait_init
jmp [original_funcs + 168 * PTR_SIZE]
glLogicOp_stub ENDP

glMap1d_stub PROC
asm_wait_init
jmp [original_funcs + 169 * PTR_SIZE]
glMap1d_stub ENDP

glMap1f_stub PROC
asm_wait_init
jmp [original_funcs + 170 * PTR_SIZE]
glMap1f_stub ENDP

glMap2d_stub PROC
asm_wait_init
jmp [original_funcs + 171 * PTR_SIZE]
glMap2d_stub ENDP

glMap2f_stub PROC
asm_wait_init
jmp [original_funcs + 172 * PTR_SIZE]
glMap2f_stub ENDP

glMapGrid1d_stub PROC
asm_wait_init
jmp [original_funcs + 173 * PTR_SIZE]
glMapGrid1d_stub ENDP

glMapGrid1f_stub PROC
asm_wait_init
jmp [original_funcs + 174 * PTR_SIZE]
glMapGrid1f_stub ENDP

glMapGrid2d_stub PROC
asm_wait_init
jmp [original_funcs + 175 * PTR_SIZE]
glMapGrid2d_stub ENDP

glMapGrid2f_stub PROC
asm_wait_init
jmp [original_funcs + 176 * PTR_SIZE]
glMapGrid2f_stub ENDP

glMaterialf_stub PROC
asm_wait_init
jmp [original_funcs + 177 * PTR_SIZE]
glMaterialf_stub ENDP

glMaterialfv_stub PROC
asm_wait_init
jmp [original_funcs + 178 * PTR_SIZE]
glMaterialfv_stub ENDP

glMateriali_stub PROC
asm_wait_init
jmp [original_funcs + 179 * PTR_SIZE]
glMateriali_stub ENDP

glMaterialiv_stub PROC
asm_wait_init
jmp [original_funcs + 180 * PTR_SIZE]
glMaterialiv_stub ENDP

glMatrixMode_stub PROC
asm_wait_init
jmp [original_funcs + 181 * PTR_SIZE]
glMatrixMode_stub ENDP

glMultMatrixd_stub PROC
asm_wait_init
jmp [original_funcs + 182 * PTR_SIZE]
glMultMatrixd_stub ENDP

glMultMatrixf_stub PROC
asm_wait_init
jmp [original_funcs + 183 * PTR_SIZE]
glMultMatrixf_stub ENDP

glNewList_stub PROC
asm_wait_init
jmp [original_funcs + 184 * PTR_SIZE]
glNewList_stub ENDP

glNormal3b_stub PROC
asm_wait_init
jmp [original_funcs + 185 * PTR_SIZE]
glNormal3b_stub ENDP

glNormal3bv_stub PROC
asm_wait_init
jmp [original_funcs + 186 * PTR_SIZE]
glNormal3bv_stub ENDP

glNormal3d_stub PROC
asm_wait_init
jmp [original_funcs + 187 * PTR_SIZE]
glNormal3d_stub ENDP

glNormal3dv_stub PROC
asm_wait_init
jmp [original_funcs + 188 * PTR_SIZE]
glNormal3dv_stub ENDP

glNormal3f_stub PROC
asm_wait_init
jmp [original_funcs + 189 * PTR_SIZE]
glNormal3f_stub ENDP

glNormal3fv_stub PROC
asm_wait_init
jmp [original_funcs + 190 * PTR_SIZE]
glNormal3fv_stub ENDP

glNormal3i_stub PROC
asm_wait_init
jmp [original_funcs + 191 * PTR_SIZE]
glNormal3i_stub ENDP

glNormal3iv_stub PROC
asm_wait_init
jmp [original_funcs + 192 * PTR_SIZE]
glNormal3iv_stub ENDP

glNormal3s_stub PROC
asm_wait_init
jmp [original_funcs + 193 * PTR_SIZE]
glNormal3s_stub ENDP

glNormal3sv_stub PROC
asm_wait_init
jmp [original_funcs + 194 * PTR_SIZE]
glNormal3sv_stub ENDP

glNormalPointer_stub PROC
asm_wait_init
jmp [original_funcs + 195 * PTR_SIZE]
glNormalPointer_stub ENDP

glOrtho_stub PROC
asm_wait_init
jmp [original_funcs + 196 * PTR_SIZE]
glOrtho_stub ENDP

glPassThrough_stub PROC
asm_wait_init
jmp [original_funcs + 197 * PTR_SIZE]
glPassThrough_stub ENDP

glPixelMapfv_stub PROC
asm_wait_init
jmp [original_funcs + 198 * PTR_SIZE]
glPixelMapfv_stub ENDP

glPixelMapuiv_stub PROC
asm_wait_init
jmp [original_funcs + 199 * PTR_SIZE]
glPixelMapuiv_stub ENDP

glPixelMapusv_stub PROC
asm_wait_init
jmp [original_funcs + 200 * PTR_SIZE]
glPixelMapusv_stub ENDP

glPixelStoref_stub PROC
asm_wait_init
jmp [original_funcs + 201 * PTR_SIZE]
glPixelStoref_stub ENDP

glPixelStorei_stub PROC
asm_wait_init
jmp [original_funcs + 202 * PTR_SIZE]
glPixelStorei_stub ENDP

glPixelTransferf_stub PROC
asm_wait_init
jmp [original_funcs + 203 * PTR_SIZE]
glPixelTransferf_stub ENDP

glPixelTransferi_stub PROC
asm_wait_init
jmp [original_funcs + 204 * PTR_SIZE]
glPixelTransferi_stub ENDP

glPixelZoom_stub PROC
asm_wait_init
jmp [original_funcs + 205 * PTR_SIZE]
glPixelZoom_stub ENDP

glPointSize_stub PROC
asm_wait_init
jmp [original_funcs + 206 * PTR_SIZE]
glPointSize_stub ENDP

glPolygonMode_stub PROC
asm_wait_init
jmp [original_funcs + 207 * PTR_SIZE]
glPolygonMode_stub ENDP

glPolygonOffset_stub PROC
asm_wait_init
jmp [original_funcs + 208 * PTR_SIZE]
glPolygonOffset_stub ENDP

glPolygonStipple_stub PROC
asm_wait_init
jmp [original_funcs + 209 * PTR_SIZE]
glPolygonStipple_stub ENDP

glPopAttrib_stub PROC
asm_wait_init
jmp [original_funcs + 210 * PTR_SIZE]
glPopAttrib_stub ENDP

glPopClientAttrib_stub PROC
asm_wait_init
jmp [original_funcs + 211 * PTR_SIZE]
glPopClientAttrib_stub ENDP

glPopMatrix_stub PROC
asm_wait_init
jmp [original_funcs + 212 * PTR_SIZE]
glPopMatrix_stub ENDP

glPopName_stub PROC
asm_wait_init
jmp [original_funcs + 213 * PTR_SIZE]
glPopName_stub ENDP

glPrioritizeTextures_stub PROC
asm_wait_init
jmp [original_funcs + 214 * PTR_SIZE]
glPrioritizeTextures_stub ENDP

glPushAttrib_stub PROC
asm_wait_init
jmp [original_funcs + 215 * PTR_SIZE]
glPushAttrib_stub ENDP

glPushClientAttrib_stub PROC
asm_wait_init
jmp [original_funcs + 216 * PTR_SIZE]
glPushClientAttrib_stub ENDP

glPushMatrix_stub PROC
asm_wait_init
jmp [original_funcs + 217 * PTR_SIZE]
glPushMatrix_stub ENDP

glPushName_stub PROC
asm_wait_init
jmp [original_funcs + 218 * PTR_SIZE]
glPushName_stub ENDP

glRasterPos2d_stub PROC
asm_wait_init
jmp [original_funcs + 219 * PTR_SIZE]
glRasterPos2d_stub ENDP

glRasterPos2dv_stub PROC
asm_wait_init
jmp [original_funcs + 220 * PTR_SIZE]
glRasterPos2dv_stub ENDP

glRasterPos2f_stub PROC
asm_wait_init
jmp [original_funcs + 221 * PTR_SIZE]
glRasterPos2f_stub ENDP

glRasterPos2fv_stub PROC
asm_wait_init
jmp [original_funcs + 222 * PTR_SIZE]
glRasterPos2fv_stub ENDP

glRasterPos2i_stub PROC
asm_wait_init
jmp [original_funcs + 223 * PTR_SIZE]
glRasterPos2i_stub ENDP

glRasterPos2iv_stub PROC
asm_wait_init
jmp [original_funcs + 224 * PTR_SIZE]
glRasterPos2iv_stub ENDP

glRasterPos2s_stub PROC
asm_wait_init
jmp [original_funcs + 225 * PTR_SIZE]
glRasterPos2s_stub ENDP

glRasterPos2sv_stub PROC
asm_wait_init
jmp [original_funcs + 226 * PTR_SIZE]
glRasterPos2sv_stub ENDP

glRasterPos3d_stub PROC
asm_wait_init
jmp [original_funcs + 227 * PTR_SIZE]
glRasterPos3d_stub ENDP

glRasterPos3dv_stub PROC
asm_wait_init
jmp [original_funcs + 228 * PTR_SIZE]
glRasterPos3dv_stub ENDP

glRasterPos3f_stub PROC
asm_wait_init
jmp [original_funcs + 229 * PTR_SIZE]
glRasterPos3f_stub ENDP

glRasterPos3fv_stub PROC
asm_wait_init
jmp [original_funcs + 230 * PTR_SIZE]
glRasterPos3fv_stub ENDP

glRasterPos3i_stub PROC
asm_wait_init
jmp [original_funcs + 231 * PTR_SIZE]
glRasterPos3i_stub ENDP

glRasterPos3iv_stub PROC
asm_wait_init
jmp [original_funcs + 232 * PTR_SIZE]
glRasterPos3iv_stub ENDP

glRasterPos3s_stub PROC
asm_wait_init
jmp [original_funcs + 233 * PTR_SIZE]
glRasterPos3s_stub ENDP

glRasterPos3sv_stub PROC
asm_wait_init
jmp [original_funcs + 234 * PTR_SIZE]
glRasterPos3sv_stub ENDP

glRasterPos4d_stub PROC
asm_wait_init
jmp [original_funcs + 235 * PTR_SIZE]
glRasterPos4d_stub ENDP

glRasterPos4dv_stub PROC
asm_wait_init
jmp [original_funcs + 236 * PTR_SIZE]
glRasterPos4dv_stub ENDP

glRasterPos4f_stub PROC
asm_wait_init
jmp [original_funcs + 237 * PTR_SIZE]
glRasterPos4f_stub ENDP

glRasterPos4fv_stub PROC
asm_wait_init
jmp [original_funcs + 238 * PTR_SIZE]
glRasterPos4fv_stub ENDP

glRasterPos4i_stub PROC
asm_wait_init
jmp [original_funcs + 239 * PTR_SIZE]
glRasterPos4i_stub ENDP

glRasterPos4iv_stub PROC
asm_wait_init
jmp [original_funcs + 240 * PTR_SIZE]
glRasterPos4iv_stub ENDP

glRasterPos4s_stub PROC
asm_wait_init
jmp [original_funcs + 241 * PTR_SIZE]
glRasterPos4s_stub ENDP

glRasterPos4sv_stub PROC
asm_wait_init
jmp [original_funcs + 242 * PTR_SIZE]
glRasterPos4sv_stub ENDP

glReadBuffer_stub PROC
asm_wait_init
jmp [original_funcs + 243 * PTR_SIZE]
glReadBuffer_stub ENDP

glReadPixels_stub PROC
asm_wait_init
jmp [original_funcs + 244 * PTR_SIZE]
glReadPixels_stub ENDP

glRectd_stub PROC
asm_wait_init
jmp [original_funcs + 245 * PTR_SIZE]
glRectd_stub ENDP

glRectdv_stub PROC
asm_wait_init
jmp [original_funcs + 246 * PTR_SIZE]
glRectdv_stub ENDP

glRectf_stub PROC
asm_wait_init
jmp [original_funcs + 247 * PTR_SIZE]
glRectf_stub ENDP

glRectfv_stub PROC
asm_wait_init
jmp [original_funcs + 248 * PTR_SIZE]
glRectfv_stub ENDP

glRecti_stub PROC
asm_wait_init
jmp [original_funcs + 249 * PTR_SIZE]
glRecti_stub ENDP

glRectiv_stub PROC
asm_wait_init
jmp [original_funcs + 250 * PTR_SIZE]
glRectiv_stub ENDP

glRects_stub PROC
asm_wait_init
jmp [original_funcs + 251 * PTR_SIZE]
glRects_stub ENDP

glRectsv_stub PROC
asm_wait_init
jmp [original_funcs + 252 * PTR_SIZE]
glRectsv_stub ENDP

glRenderMode_stub PROC
asm_wait_init
jmp [original_funcs + 253 * PTR_SIZE]
glRenderMode_stub ENDP

glRotated_stub PROC
asm_wait_init
jmp [original_funcs + 254 * PTR_SIZE]
glRotated_stub ENDP

glRotatef_stub PROC
asm_wait_init
jmp [original_funcs + 255 * PTR_SIZE]
glRotatef_stub ENDP

glScaled_stub PROC
asm_wait_init
jmp [original_funcs + 256 * PTR_SIZE]
glScaled_stub ENDP

glScalef_stub PROC
asm_wait_init
jmp [original_funcs + 257 * PTR_SIZE]
glScalef_stub ENDP

glScissor_stub PROC
asm_wait_init
jmp [original_funcs + 258 * PTR_SIZE]
glScissor_stub ENDP

glSelectBuffer_stub PROC
asm_wait_init
jmp [original_funcs + 259 * PTR_SIZE]
glSelectBuffer_stub ENDP

glShadeModel_stub PROC
asm_wait_init
jmp [original_funcs + 260 * PTR_SIZE]
glShadeModel_stub ENDP

glStencilFunc_stub PROC
asm_wait_init
jmp [original_funcs + 261 * PTR_SIZE]
glStencilFunc_stub ENDP

glStencilMask_stub PROC
asm_wait_init
jmp [original_funcs + 262 * PTR_SIZE]
glStencilMask_stub ENDP

glStencilOp_stub PROC
asm_wait_init
jmp [original_funcs + 263 * PTR_SIZE]
glStencilOp_stub ENDP

glTexCoord1d_stub PROC
asm_wait_init
jmp [original_funcs + 264 * PTR_SIZE]
glTexCoord1d_stub ENDP

glTexCoord1dv_stub PROC
asm_wait_init
jmp [original_funcs + 265 * PTR_SIZE]
glTexCoord1dv_stub ENDP

glTexCoord1f_stub PROC
asm_wait_init
jmp [original_funcs + 266 * PTR_SIZE]
glTexCoord1f_stub ENDP

glTexCoord1fv_stub PROC
asm_wait_init
jmp [original_funcs + 267 * PTR_SIZE]
glTexCoord1fv_stub ENDP

glTexCoord1i_stub PROC
asm_wait_init
jmp [original_funcs + 268 * PTR_SIZE]
glTexCoord1i_stub ENDP

glTexCoord1iv_stub PROC
asm_wait_init
jmp [original_funcs + 269 * PTR_SIZE]
glTexCoord1iv_stub ENDP

glTexCoord1s_stub PROC
asm_wait_init
jmp [original_funcs + 270 * PTR_SIZE]
glTexCoord1s_stub ENDP

glTexCoord1sv_stub PROC
asm_wait_init
jmp [original_funcs + 271 * PTR_SIZE]
glTexCoord1sv_stub ENDP

glTexCoord2d_stub PROC
asm_wait_init
jmp [original_funcs + 272 * PTR_SIZE]
glTexCoord2d_stub ENDP

glTexCoord2dv_stub PROC
asm_wait_init
jmp [original_funcs + 273 * PTR_SIZE]
glTexCoord2dv_stub ENDP

glTexCoord2f_stub PROC
asm_wait_init
jmp [original_funcs + 274 * PTR_SIZE]
glTexCoord2f_stub ENDP

glTexCoord2fv_stub PROC
asm_wait_init
jmp [original_funcs + 275 * PTR_SIZE]
glTexCoord2fv_stub ENDP

glTexCoord2i_stub PROC
asm_wait_init
jmp [original_funcs + 276 * PTR_SIZE]
glTexCoord2i_stub ENDP

glTexCoord2iv_stub PROC
asm_wait_init
jmp [original_funcs + 277 * PTR_SIZE]
glTexCoord2iv_stub ENDP

glTexCoord2s_stub PROC
asm_wait_init
jmp [original_funcs + 278 * PTR_SIZE]
glTexCoord2s_stub ENDP

glTexCoord2sv_stub PROC
asm_wait_init
jmp [original_funcs + 279 * PTR_SIZE]
glTexCoord2sv_stub ENDP

glTexCoord3d_stub PROC
asm_wait_init
jmp [original_funcs + 280 * PTR_SIZE]
glTexCoord3d_stub ENDP

glTexCoord3dv_stub PROC
asm_wait_init
jmp [original_funcs + 281 * PTR_SIZE]
glTexCoord3dv_stub ENDP

glTexCoord3f_stub PROC
asm_wait_init
jmp [original_funcs + 282 * PTR_SIZE]
glTexCoord3f_stub ENDP

glTexCoord3fv_stub PROC
asm_wait_init
jmp [original_funcs + 283 * PTR_SIZE]
glTexCoord3fv_stub ENDP

glTexCoord3i_stub PROC
asm_wait_init
jmp [original_funcs + 284 * PTR_SIZE]
glTexCoord3i_stub ENDP

glTexCoord3iv_stub PROC
asm_wait_init
jmp [original_funcs + 285 * PTR_SIZE]
glTexCoord3iv_stub ENDP

glTexCoord3s_stub PROC
asm_wait_init
jmp [original_funcs + 286 * PTR_SIZE]
glTexCoord3s_stub ENDP

glTexCoord3sv_stub PROC
asm_wait_init
jmp [original_funcs + 287 * PTR_SIZE]
glTexCoord3sv_stub ENDP

glTexCoord4d_stub PROC
asm_wait_init
jmp [original_funcs + 288 * PTR_SIZE]
glTexCoord4d_stub ENDP

glTexCoord4dv_stub PROC
asm_wait_init
jmp [original_funcs + 289 * PTR_SIZE]
glTexCoord4dv_stub ENDP

glTexCoord4f_stub PROC
asm_wait_init
jmp [original_funcs + 290 * PTR_SIZE]
glTexCoord4f_stub ENDP

glTexCoord4fv_stub PROC
asm_wait_init
jmp [original_funcs + 291 * PTR_SIZE]
glTexCoord4fv_stub ENDP

glTexCoord4i_stub PROC
asm_wait_init
jmp [original_funcs + 292 * PTR_SIZE]
glTexCoord4i_stub ENDP

glTexCoord4iv_stub PROC
asm_wait_init
jmp [original_funcs + 293 * PTR_SIZE]
glTexCoord4iv_stub ENDP

glTexCoord4s_stub PROC
asm_wait_init
jmp [original_funcs + 294 * PTR_SIZE]
glTexCoord4s_stub ENDP

glTexCoord4sv_stub PROC
asm_wait_init
jmp [original_funcs + 295 * PTR_SIZE]
glTexCoord4sv_stub ENDP

glTexCoordPointer_stub PROC
asm_wait_init
jmp [original_funcs + 296 * PTR_SIZE]
glTexCoordPointer_stub ENDP

glTexEnvf_stub PROC
asm_wait_init
jmp [original_funcs + 297 * PTR_SIZE]
glTexEnvf_stub ENDP

glTexEnvfv_stub PROC
asm_wait_init
jmp [original_funcs + 298 * PTR_SIZE]
glTexEnvfv_stub ENDP

glTexEnvi_stub PROC
asm_wait_init
jmp [original_funcs + 299 * PTR_SIZE]
glTexEnvi_stub ENDP

glTexEnviv_stub PROC
asm_wait_init
jmp [original_funcs + 300 * PTR_SIZE]
glTexEnviv_stub ENDP

glTexGend_stub PROC
asm_wait_init
jmp [original_funcs + 301 * PTR_SIZE]
glTexGend_stub ENDP

glTexGendv_stub PROC
asm_wait_init
jmp [original_funcs + 302 * PTR_SIZE]
glTexGendv_stub ENDP

glTexGenf_stub PROC
asm_wait_init
jmp [original_funcs + 303 * PTR_SIZE]
glTexGenf_stub ENDP

glTexGenfv_stub PROC
asm_wait_init
jmp [original_funcs + 304 * PTR_SIZE]
glTexGenfv_stub ENDP

glTexGeni_stub PROC
asm_wait_init
jmp [original_funcs + 305 * PTR_SIZE]
glTexGeni_stub ENDP

glTexGeniv_stub PROC
asm_wait_init
jmp [original_funcs + 306 * PTR_SIZE]
glTexGeniv_stub ENDP

glTexImage1D_stub PROC
asm_wait_init
jmp [original_funcs + 307 * PTR_SIZE]
glTexImage1D_stub ENDP

glTexImage2D_stub PROC
asm_wait_init
jmp [original_funcs + 308 * PTR_SIZE]
glTexImage2D_stub ENDP

glTexParameterf_stub PROC
asm_wait_init
jmp [original_funcs + 309 * PTR_SIZE]
glTexParameterf_stub ENDP

glTexParameterfv_stub PROC
asm_wait_init
jmp [original_funcs + 310 * PTR_SIZE]
glTexParameterfv_stub ENDP

glTexParameteri_stub PROC
asm_wait_init
jmp [original_funcs + 311 * PTR_SIZE]
glTexParameteri_stub ENDP

glTexParameteriv_stub PROC
asm_wait_init
jmp [original_funcs + 312 * PTR_SIZE]
glTexParameteriv_stub ENDP

glTexSubImage1D_stub PROC
asm_wait_init
jmp [original_funcs + 313 * PTR_SIZE]
glTexSubImage1D_stub ENDP

glTexSubImage2D_stub PROC
asm_wait_init
jmp [original_funcs + 314 * PTR_SIZE]
glTexSubImage2D_stub ENDP

glTranslated_stub PROC
asm_wait_init
jmp [original_funcs + 315 * PTR_SIZE]
glTranslated_stub ENDP

glTranslatef_stub PROC
asm_wait_init
jmp [original_funcs + 316 * PTR_SIZE]
glTranslatef_stub ENDP

glVertex2d_stub PROC
asm_wait_init
jmp [original_funcs + 317 * PTR_SIZE]
glVertex2d_stub ENDP

glVertex2dv_stub PROC
asm_wait_init
jmp [original_funcs + 318 * PTR_SIZE]
glVertex2dv_stub ENDP

glVertex2f_stub PROC
asm_wait_init
jmp [original_funcs + 319 * PTR_SIZE]
glVertex2f_stub ENDP

glVertex2fv_stub PROC
asm_wait_init
jmp [original_funcs + 320 * PTR_SIZE]
glVertex2fv_stub ENDP

glVertex2i_stub PROC
asm_wait_init
jmp [original_funcs + 321 * PTR_SIZE]
glVertex2i_stub ENDP

glVertex2iv_stub PROC
asm_wait_init
jmp [original_funcs + 322 * PTR_SIZE]
glVertex2iv_stub ENDP

glVertex2s_stub PROC
asm_wait_init
jmp [original_funcs + 323 * PTR_SIZE]
glVertex2s_stub ENDP

glVertex2sv_stub PROC
asm_wait_init
jmp [original_funcs + 324 * PTR_SIZE]
glVertex2sv_stub ENDP

glVertex3d_stub PROC
asm_wait_init
jmp [original_funcs + 325 * PTR_SIZE]
glVertex3d_stub ENDP

glVertex3dv_stub PROC
asm_wait_init
jmp [original_funcs + 326 * PTR_SIZE]
glVertex3dv_stub ENDP

glVertex3f_stub PROC
asm_wait_init
jmp [original_funcs + 327 * PTR_SIZE]
glVertex3f_stub ENDP

glVertex3fv_stub PROC
asm_wait_init
jmp [original_funcs + 328 * PTR_SIZE]
glVertex3fv_stub ENDP

glVertex3i_stub PROC
asm_wait_init
jmp [original_funcs + 329 * PTR_SIZE]
glVertex3i_stub ENDP

glVertex3iv_stub PROC
asm_wait_init
jmp [original_funcs + 330 * PTR_SIZE]
glVertex3iv_stub ENDP

glVertex3s_stub PROC
asm_wait_init
jmp [original_funcs + 331 * PTR_SIZE]
glVertex3s_stub ENDP

glVertex3sv_stub PROC
asm_wait_init
jmp [original_funcs + 332 * PTR_SIZE]
glVertex3sv_stub ENDP

glVertex4d_stub PROC
asm_wait_init
jmp [original_funcs + 333 * PTR_SIZE]
glVertex4d_stub ENDP

glVertex4dv_stub PROC
asm_wait_init
jmp [original_funcs + 334 * PTR_SIZE]
glVertex4dv_stub ENDP

glVertex4f_stub PROC
asm_wait_init
jmp [original_funcs + 335 * PTR_SIZE]
glVertex4f_stub ENDP

glVertex4fv_stub PROC
asm_wait_init
jmp [original_funcs + 336 * PTR_SIZE]
glVertex4fv_stub ENDP

glVertex4i_stub PROC
asm_wait_init
jmp [original_funcs + 337 * PTR_SIZE]
glVertex4i_stub ENDP

glVertex4iv_stub PROC
asm_wait_init
jmp [original_funcs + 338 * PTR_SIZE]
glVertex4iv_stub ENDP

glVertex4s_stub PROC
asm_wait_init
jmp [original_funcs + 339 * PTR_SIZE]
glVertex4s_stub ENDP

glVertex4sv_stub PROC
asm_wait_init
jmp [original_funcs + 340 * PTR_SIZE]
glVertex4sv_stub ENDP

glVertexPointer_stub PROC
asm_wait_init
jmp [original_funcs + 341 * PTR_SIZE]
glVertexPointer_stub ENDP

glViewport_stub PROC
asm_wait_init
jmp [original_funcs + 342 * PTR_SIZE]
glViewport_stub ENDP

wglChoosePixelFormat_stub PROC
asm_wait_init
jmp [original_funcs + 343 * PTR_SIZE]
wglChoosePixelFormat_stub ENDP

wglCopyContext_stub PROC
asm_wait_init
jmp [original_funcs + 344 * PTR_SIZE]
wglCopyContext_stub ENDP

wglCreateContext_stub PROC
asm_wait_init
jmp [original_funcs + 345 * PTR_SIZE]
wglCreateContext_stub ENDP

wglCreateLayerContext_stub PROC
asm_wait_init
jmp [original_funcs + 346 * PTR_SIZE]
wglCreateLayerContext_stub ENDP

wglDeleteContext_stub PROC
asm_wait_init
jmp [original_funcs + 347 * PTR_SIZE]
wglDeleteContext_stub ENDP

wglDescribeLayerPlane_stub PROC
asm_wait_init
jmp [original_funcs + 348 * PTR_SIZE]
wglDescribeLayerPlane_stub ENDP

wglDescribePixelFormat_stub PROC
asm_wait_init
jmp [original_funcs + 349 * PTR_SIZE]
wglDescribePixelFormat_stub ENDP

wglGetCurrentContext_stub PROC
asm_wait_init
jmp [original_funcs + 350 * PTR_SIZE]
wglGetCurrentContext_stub ENDP

wglGetCurrentDC_stub PROC
asm_wait_init
jmp [original_funcs + 351 * PTR_SIZE]
wglGetCurrentDC_stub ENDP

wglGetDefaultProcAddress_stub PROC
asm_wait_init
jmp [original_funcs + 352 * PTR_SIZE]
wglGetDefaultProcAddress_stub ENDP

wglGetLayerPaletteEntries_stub PROC
asm_wait_init
jmp [original_funcs + 353 * PTR_SIZE]
wglGetLayerPaletteEntries_stub ENDP

wglGetPixelFormat_stub PROC
asm_wait_init
jmp [original_funcs + 354 * PTR_SIZE]
wglGetPixelFormat_stub ENDP

wglGetProcAddress_stub PROC
asm_wait_init
jmp [original_funcs + 355 * PTR_SIZE]
wglGetProcAddress_stub ENDP

;wglMakeCurrent_stub PROC
;asm_wait_init
;jmp [original_funcs + 356 * PTR_SIZE]
;wglMakeCurrent_stub ENDP

wglRealizeLayerPalette_stub PROC
asm_wait_init
jmp [original_funcs + 357 * PTR_SIZE]
wglRealizeLayerPalette_stub ENDP

wglSetLayerPaletteEntries_stub PROC
asm_wait_init
jmp [original_funcs + 358 * PTR_SIZE]
wglSetLayerPaletteEntries_stub ENDP

wglSetPixelFormat_stub PROC
asm_wait_init
jmp [original_funcs + 359 * PTR_SIZE]
wglSetPixelFormat_stub ENDP

wglShareLists_stub PROC
asm_wait_init
jmp [original_funcs + 360 * PTR_SIZE]
wglShareLists_stub ENDP

wglSwapBuffers_stub PROC
asm_wait_init
jmp [original_funcs + 361 * PTR_SIZE]
wglSwapBuffers_stub ENDP

wglSwapLayerBuffers_stub PROC
asm_wait_init
jmp [original_funcs + 362 * PTR_SIZE]
wglSwapLayerBuffers_stub ENDP

wglSwapMultipleBuffers_stub PROC
asm_wait_init
jmp [original_funcs + 363 * PTR_SIZE]
wglSwapMultipleBuffers_stub ENDP

wglUseFontBitmapsA_stub PROC
asm_wait_init
jmp [original_funcs + 364 * PTR_SIZE]
wglUseFontBitmapsA_stub ENDP

wglUseFontBitmapsW_stub PROC
asm_wait_init
jmp [original_funcs + 365 * PTR_SIZE]
wglUseFontBitmapsW_stub ENDP

wglUseFontOutlinesA_stub PROC
asm_wait_init
jmp [original_funcs + 366 * PTR_SIZE]
wglUseFontOutlinesA_stub ENDP

wglUseFontOutlinesW_stub PROC
asm_wait_init
jmp [original_funcs + 367 * PTR_SIZE]
wglUseFontOutlinesW_stub ENDP

_TEXT ENDS
END
