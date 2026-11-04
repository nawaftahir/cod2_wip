#define _POSIX_C_SOURCE 200112L
#include <stdio.h>
#include <stdarg.h>
int _vsnprintf(char *destination, size_t size, const char *format, va_list args);
#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_path_formatter/j_wavelet.c"
#endif
#define IMAGE_PATH_SOURCE
#define FILE_TEST_ENTRY file_fixture_main
#include "test_image_file_loader.c"

/* Host adapter only, not proof of historical CRT byte/runtime equivalence. */
int _vsnprintf(char *destination, size_t size, const char *format, va_list args)
{
    int result;

    result = vsnprintf(destination, size, format, args);
    if (format_failure)
    {
        return -1;
    }
    if (result >= (int)size)
    {
        destination[size - 1] = '!';
        return -1;
    }
    return result;
}

#ifndef PATH_TEST_ENTRY
#define PATH_TEST_ENTRY main
#endif
int PATH_TEST_ENTRY(void)
{
    char buffer[10];

    assert(file_fixture_main() == 0);
    memset(buffer, 0xcc, sizeof(buffer));
    assert(Renderer_FormatPath(buffer + 1, 8, "%s", "abcdefghijkl") == -1);
    assert(buffer[8] == 0 && (byte)buffer[0] == 0xcc && (byte)buffer[9] == 0xcc);
    assert(memcmp(buffer + 1, "abcdefg", 7) == 0);
    assert(Renderer_FormatPath(buffer + 1, 8, "%s", "abc") == 3);
    assert(strcmp(buffer + 1, "abc") == 0);
    return 0;
}
