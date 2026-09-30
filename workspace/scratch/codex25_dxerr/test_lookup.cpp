#include <windows.h>
#include <dxerr9.h>
#include <stdio.h>
#include <string.h>
#include <wchar.h>

extern "C" const char *WINAPI CodexNameA(HRESULT hr);
extern "C" const wchar_t *WINAPI CodexNameW(HRESULT hr);
extern "C" const char *WINAPI CodexDescriptionA(HRESULT hr);
extern "C" const wchar_t *WINAPI CodexDescriptionW(HRESULT hr);

static int check(unsigned long value)
{
    HRESULT hr;

    hr = (HRESULT)value;
    return strcmp(DXGetErrorString9A(hr), CodexNameA(hr))
        || wcscmp(DXGetErrorString9W(hr), CodexNameW(hr))
        || strcmp(DXGetErrorDescription9A(hr), CodexDescriptionA(hr))
        || wcscmp(DXGetErrorDescription9W(hr), CodexDescriptionW(hr));
}

int main()
{
    unsigned long value;
    unsigned long count;
    int i;

    count = 0;
    while (scanf("%lx", &value) == 1)
    {
        if (check(value))
        {
            printf("FAIL %08lx\n", value);
            return 1;
        }
        ++count;
    }
    value = 0x63726432;
    for (i = 0; i < 100000; ++i)
    {
        value = value * 1664525UL + 1013904223UL;
        if (check(value))
        {
            printf("FAIL %08lx\n", value);
            return 1;
        }
        ++count;
    }
    printf("PASS %lu inputs; %lu source/reference lookup comparisons\n", count, count * 4);
    return 0;
}
