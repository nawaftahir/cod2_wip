#include <windows.h>
#include <stdio.h>
#include <string.h>

extern "C" const char *WINAPI DXGetErrorString9A(HRESULT hr);
extern "C" const char *WINAPI CodexErrorString9A(HRESULT hr);

int main()
{
    unsigned long value;
    unsigned long count;
    unsigned long randomValue;
    int i;

    count = 0;
    while (scanf("%lx", &value) == 1)
    {
        if (strcmp(DXGetErrorString9A((HRESULT)value), CodexErrorString9A((HRESULT)value)))
        {
            printf("FAIL %08lx\n", value);
            return 1;
        }
        ++count;
    }
    randomValue = 0x63726432;
    for (i = 0; i < 100000; ++i)
    {
        randomValue = randomValue * 1664525UL + 1013904223UL;
        if (strcmp(DXGetErrorString9A((HRESULT)randomValue), CodexErrorString9A((HRESULT)randomValue)))
        {
            printf("FAIL %08lx\n", randomValue);
            return 1;
        }
        ++count;
    }
    printf("PASS %lu source/reference lookup comparisons\n", count);
    return 0;
}
