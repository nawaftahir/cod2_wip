#include <windows.h>
extern "C" int _fltused = 0;

static void report(const char *text, DWORD size)
{
    DWORD written;
    WriteFile(GetStdHandle(STD_OUTPUT_HANDLE), text, size, &written, NULL);
}

extern "C" void entry()
{
    HMODULE image = LoadLibraryExA("binaries\\CoD2Radiant.exe", NULL, DONT_RESOLVE_DLL_REFERENCES);
    if (image != (HMODULE)0x400000)
    {
        report("MAP FAILED\n", 11);
        ExitProcess(2);
    }
    typedef double (__cdecl *MathFn)(double, double);
    MathFn function = (MathFn)((char *)image + 0xd7790);
    static const double inputs[][3] = {{2,0,1}, {2,1,2}, {2,3,8}, {2,-2,0.25}, {9,0.5,3}};
    for (int i = 0; i < 5; ++i)
    {
        double difference = function(inputs[i][0], inputs[i][1]) - inputs[i][2];
        if (!(difference >= -1e-12 && difference <= 1e-12))
        {
            report("MATH FAILED\n", 12);
            ExitProcess(10 + i);
        }
    }
    report("PASS: retail pow, five cases; no retail entry point\n", 51);
    ExitProcess(0);
}
