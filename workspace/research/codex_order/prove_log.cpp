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
    typedef double (__cdecl *MathFn)(double);
    MathFn function = (MathFn)((char *)image + 0xd7a20);
    static const double inputs[][2] = {{1,0}, {2,0.6931471805599453}, {4,1.3862943611198906}, {0.5,-0.6931471805599453}, {2.718281828459045,1}};
    for (int i = 0; i < 5; ++i)
    {
        double difference = function(inputs[i][0]) - inputs[i][1];
        if (!(difference >= -1e-12 && difference <= 1e-12))
        {
            report("MATH FAILED\n", 12);
            ExitProcess(10 + i);
        }
    }
    report("PASS: retail log, five cases; no retail entry point\n", 51);
    ExitProcess(0);
}
