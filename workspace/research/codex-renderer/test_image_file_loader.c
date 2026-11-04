#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_file_loader/j_wavelet.c"
#endif
#define BITMAP_TEST_ENTRY bitmap_fixture_main
#include "test_image_bitmap_loader.c"

int (*ri_image_read_file)(const char *, void **);
void (*ri_image_free_file)(void *);
static struct
{
    GfxImageFileHeader header;
    byte pixels[16];
} image_file;
static int format_failure, file_length, reads, file_frees, printed;

#ifndef IMAGE_PATH_SOURCE
int Renderer_FormatPath(char *destination, int size, const char *format, ...)
{
    va_list args;
    const char *prefix, *name, *suffix;
    assert(size == 64 && strcmp(format, "%s%s%s") == 0);
    va_start(args, format);
    prefix = va_arg(args, const char *);
    name = va_arg(args, const char *);
    suffix = va_arg(args, const char *);
    assert(strcmp(prefix, "images/") == 0 && strcmp(suffix, ".iwi") == 0);
    assert(strlen(prefix) + strlen(name) + strlen(suffix) < (size_t)size);
    sprintf(destination, "%s%s%s", prefix, name, suffix);
    va_end(args);
    return format_failure ? -1 : (int)strlen(destination);
}
#endif

void Renderer_Print(const char *format, ...)
{
    va_list args;
    assert(strstr(format, "ERROR:"));
    va_start(args, format);
    assert(strcmp(va_arg(args, const char *), "images/test image.iwi") == 0);
    if (strstr(format, "version %i"))
    {
        assert(va_arg(args, int) == image_file.header.version);
        assert(va_arg(args, int) == 5);
    }
    va_end(args);
    printed += 1;
}

static int read_image(const char *path, void **out)
{
    assert(strcmp(path, "images/test image.iwi") == 0);
    reads += 1;
    *out = &image_file;
    return file_length;
}

static void free_image(void *data)
{
    assert(data == &image_file);
    file_frees += 1;
}

#ifndef FILE_TEST_ENTRY
#define FILE_TEST_ENTRY main
#endif
int FILE_TEST_ENTRY(void)
{
    int original_uploads;
    byte expected[16] = {1, 2, 3, 255, 4, 5, 6, 255, 7, 8, 9, 255, 10, 11, 12, 255};
    int i;

    assert(bitmap_fixture_main() == 0);
    ri_image_read_file = read_image;
    ri_image_free_file = free_image;
    memset(&image_file, 0, sizeof(image_file));
    memcpy(image_file.header.tag, "IWi", 3);
    image_file.header.version = 5;
    image_file.header.flags = 2;
    image_file.header.format = 2;
    image_file.header.dimensions[0] = 2;
    image_file.header.dimensions[1] = 2;
    image_file.header.dimensions[2] = 1;
    for (i = 0; i < 12; i += 1) image_file.pixels[i] = (byte)(i + 1);
    format_failure = 1;
    assert(!Image_LoadFromFile(&image) && reads == 0 && file_frees == 0);
    format_failure = 0; file_length = -1;
    assert(!Image_LoadFromFile(&image) && reads == 1 && file_frees == 0);
    file_length = 0;
    assert(!Image_LoadFromFile(&image) && reads == 2 && file_frees == 1);
    file_length = sizeof(image_file);
    image_file.header.tag[0] = 'x';
    assert(!Image_LoadFromFile(&image) && file_frees == 2);
    image_file.header.tag[0] = 'I'; image_file.header.version = 255;
    assert(!Image_LoadFromFile(&image) && file_frees == 3);
    image_file.header.version = 5;
    bitmap_format = 0x16;
    original_uploads = bitmap_uploads;
    assert(Image_LoadFromFile(&image) == 1 && file_frees == 4);
    assert(bitmap_uploads == original_uploads + 1 && printed == 5);
    assert(memcmp(bitmap_output, expected, 8) == 0);
    assert(memcmp(bitmap_output + 12, expected + 8, 8) == 0);
    return 0;
}
