#include <windows.h>
#include <dxerr9.h>
#include <stdio.h>
#include <string.h>

int main()
{
    unsigned int value;
    const wchar_t *name;
    const wchar_t *description;
    const char *asciiDescription;
    const wchar_t *p;
    const unsigned char *a;

    while (scanf("%x", &value) == 1)
    {
        name = DXGetErrorString9W((HRESULT)value);
        description = DXGetErrorDescription9W((HRESULT)value);
        asciiDescription = DXGetErrorDescription9A((HRESULT)value);
        printf("%08x\t", value);
        for (p = name; *p; ++p)
        {
            printf("%04x", (unsigned int)*p);
        }
        putchar('\t');
        for (a = (const unsigned char *)asciiDescription; *a; ++a)
        {
            printf("%02x", (unsigned int)*a);
        }
        putchar('\t');
        for (p = description; *p; ++p)
        {
            printf("%04x", (unsigned int)*p);
        }
        putchar('\n');
    }
    return 0;
}
