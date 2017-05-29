/*
    just some random OpenGL sample taken from
    https://www.opengl.org
    /archives/resources/code/samples/win32_tutorial/

    I take no credits for this other than refactoring code
*/

#include <windows.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include <stdio.h>

typedef BYTE  u8;
typedef DWORD u32;

#define internalfn static

internalfn
void display()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glBegin(GL_TRIANGLES);
    glColor3f(1.0f, 0.0f, 0.0f);
    glVertex2i(0,  1);
    glColor3f(0.0f, 1.0f, 0.0f);
    glVertex2i(-1, -1);
    glColor3f(0.0f, 0.0f, 1.0f);
    glVertex2i(1, -1);
    glEnd();
    glFlush();
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
}

internalfn
LRESULT WINAPI wndproc(HWND hwnd, u32 msg, WPARAM wp, LPARAM lp)
{
    static PAINTSTRUCT ps;

    switch (msg)
    {
        case WM_PAINT:
            display();
            BeginPaint(hwnd, &ps);
            EndPaint(hwnd, &ps);
            return 0;

        case WM_SIZE:
            glViewport(0, 0, LOWORD(lp), HIWORD(lp));
            PostMessage(hwnd, WM_PAINT, 0, 0);
            return 0;

        case WM_CHAR:
            switch (wp)
            {
                case 27: /* ESC key */
                    PostQuitMessage(0);
                    break;
            }
            return 0;

        case WM_CLOSE:
            PostQuitMessage(0);
            return 0;
    }

    return DefWindowProc(hwnd, msg, wp, lp);
}

internalfn
HWND gl_create_window(
    char* title,
    int x, int y, int width, int height,
    u8 type,
    u32 flags)
{
    int       pf;
    HDC       hdc;
    HWND      hwnd;
    WNDCLASSA wc;

    PIXELFORMATDESCRIPTOR pfd;
    static HINSTANCE hinstance = 0;

    if (!hinstance)
    {
        hinstance = GetModuleHandle(0);

        wc.style         = CS_OWNDC;
        wc.lpfnWndProc   = (WNDPROC)wndproc;
        wc.cbClsExtra    = 0;
        wc.cbWndExtra    = 0;
        wc.hInstance     = hinstance;
        wc.hIcon         = LoadIcon(0, IDI_WINLOGO);
        wc.hCursor       = LoadCursor(0, IDC_ARROW);
        wc.hbrBackground = 0;
        wc.lpszMenuName  = 0;
        wc.lpszClassName = "OpenGL";

        if (!RegisterClass(&wc)) {
            die("RegisterClass");
            return 0;
        }
    }

    hwnd =
        CreateWindowA(
            "OpenGL", title,
            WS_OVERLAPPEDWINDOW |
            WS_CLIPSIBLINGS | WS_CLIPCHILDREN,
            x, y, width, height,
            0, 0,
            hinstance,
            0
        );

    if (!hwnd) {
        die("CreateWindow");
        return 0;
    }

    hdc = GetDC(hwnd);
    if (!hdc) {
        die("GetDC");
        return 0;
    }

    memset(&pfd, 0, sizeof(pfd));

    pfd.nSize      = sizeof(pfd);
    pfd.nVersion   = 1;
    pfd.dwFlags    = PFD_DRAW_TO_WINDOW |
                     PFD_SUPPORT_OPENGL | flags;
    pfd.iPixelType = type;
    pfd.cColorBits = 32;

    pf = ChoosePixelFormat(hdc, &pfd);
    if (!pf) {
        die("ChoosePixelFormat");
        return 0;
    }

    if (!SetPixelFormat(hdc, pf, &pfd)) {
        die("SetPixelFormat");
        return 0;
    }

    DescribePixelFormat(
        hdc, pf, sizeof(PIXELFORMATDESCRIPTOR), &pfd
    );

    ReleaseDC(hwnd, hdc);

    return hwnd;
}

int APIENTRY WinMain(
    HINSTANCE hinstance,
    HINSTANCE hprev_instance,
    char* cmdline,
    int show)
{
    HDC   hdc;
    HGLRC hrc;
    HWND  hwnd;
    MSG   msg;

    (void)cmdline;
    (void)hprev_instance;
    (void)hinstance;

    hwnd =
        gl_create_window(
            "minimal",
            0, 0, 256, 256,
            PFD_TYPE_RGBA, 0
        );

    if (!hwnd) {
        exit(1);
    }

    hdc = GetDC(hwnd);
    hrc = wglCreateContext(hdc);
    wglMakeCurrent(hdc, hrc);

    ShowWindow(hwnd, show);

    while(GetMessage(&msg, hwnd, 0, 0))
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    wglMakeCurrent(0, 0);
    ReleaseDC(hwnd, hdc);
    wglDeleteContext(hrc);
    DestroyWindow(hwnd);

    return (int)msg.wParam;
}
