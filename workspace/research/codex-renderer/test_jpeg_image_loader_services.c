#include <assert.h>
#include <stdlib.h>
#include <string.h>
#ifndef JPEG_IMAGE_SOURCE_ROOT
#define JPEG_IMAGE_SOURCE_ROOT scratch/codex_jpeg_service_abi
#endif
#define JPEG_IMAGE_STRING_RAW(value) #value
#define JPEG_IMAGE_STRING(value) JPEG_IMAGE_STRING_RAW(value)
#include JPEG_IMAGE_STRING(JPEG_IMAGE_SOURCE_ROOT/jpeg_complete_group.c)

static int file_mode;
static int file_frees;
static int warnings;
static size_t allocated;
static size_t released;

static void progressive_scan(unsigned char *data, int *position, int component,
                             int spectral_start, int approximation)
{
    int index;
    int count;
    int cursor;

    cursor = *position;
    count = 1;
    if (component == 0)
    {
        count = 3;
    }
    data[cursor++] = 0xff;
    data[cursor++] = 0xda;
    data[cursor++] = 0;
    data[cursor++] = 6 + count * 2;
    data[cursor++] = count;
    for (index = 0; index < count; index += 1)
    {
        data[cursor++] = component == 0 ? index + 1 : component;
        data[cursor++] = 0;
    }
    data[cursor++] = spectral_start;
    data[cursor++] = spectral_start == 0 ? 0 : 63;
    data[cursor++] = approximation;
    data[cursor++] = component == 0 ? 0x1f : 0x7f;
    *position = cursor;
}

static int fixture_read(const char *name, unsigned char **file)
{
    unsigned char *data;
    int position;
    int component;
    int components;
    int index;

    assert(strcmp(name, "synthetic.jpg") == 0);
    if (file_mode == 1)
    {
        *file = NULL;
        return -1;
    }
    data = (unsigned char *)malloc(256);
    assert(data != NULL);
    position = 0;
    components = 3;
    if (file_mode == 2)
    {
        components = 1;
    }
#define BYTE(value) data[position++] = (unsigned char)(value)
    BYTE(0xff); BYTE(0xd8);
    BYTE(0xff); BYTE(0xdb); BYTE(0); BYTE(67); BYTE(0);
    for (index = 0; index < 64; index += 1)
    {
        BYTE(1);
    }
    BYTE(0xff); BYTE(0xc4); BYTE(0); BYTE(39);
    for (index = 0; index < 2; index += 1)
    {
        BYTE(index * 16);
        BYTE(1);
        for (component = 1; component < 16; component += 1)
        {
            if (index == 0 && component == 1)
            {
                BYTE(1);
            }
            else
            {
                BYTE(0);
            }
        }
        BYTE(0);
        if (index == 0)
        {
            BYTE(8);
        }
    }
    BYTE(0xff); BYTE(file_mode == 3 ? 0xc2 : 0xc0); BYTE(0); BYTE(8 + components * 3);
    BYTE(8); BYTE(0); BYTE(2); BYTE(0); BYTE(3); BYTE(components);
    for (component = 1; component <= components; component += 1)
    {
        BYTE(component); BYTE(0x11); BYTE(0);
    }
    if (file_mode == 3)
    {
        progressive_scan(data, &position, 0, 0, 1);
        progressive_scan(data, &position, 0, 0, 0x10);
        for (component = 1; component <= 3; component += 1)
        {
            progressive_scan(data, &position, component, 1, 1);
            progressive_scan(data, &position, component, 1, 0x10);
        }
    }
    else
    {
    BYTE(0xff); BYTE(0xda); BYTE(0); BYTE(6 + components * 2); BYTE(components);
    for (component = 1; component <= components; component += 1)
    {
        BYTE(component); BYTE(0);
    }
    BYTE(0); BYTE(63); BYTE(0);
    /* DC coefficients Y=0, Cb=160, Cr=-160 distinguish the output color channels. */
    if (components == 3)
    {
        BYTE(0x2a); BYTE(0x04); BYTE(0xbe);
    }
    else
    {
        BYTE(0x3f);
    }
    }
    BYTE(0xff); BYTE(0xd9);
#undef BYTE
    assert(position < 256);
    *file = data;
    return position;
}

static void fixture_free_file(unsigned char *file)
{
    assert(file != NULL);
    file_frees += 1;
    free(file);
}

static void *fixture_temp(int bytes)
{
    void *object;
    assert(bytes == 24);
    object = malloc(bytes);
    assert(object != NULL);
    return object;
}

static void *fixture_alloc(size_t bytes)
{
    size_t *header;

    assert(sizeof(size_t) == 4);
    header = (size_t *)malloc(bytes + 8);
    assert(header != NULL);
    header[0] = bytes;
    allocated += bytes;
    return header + 2;
}

static void fixture_release(void *object)
{
    size_t *header;

    assert(object != NULL);
    header = (size_t *)object - 2;
    released += header[0];
    free(header);
}

static void fixture_error(int level, const char *message)
{
    (void)level;
    (void)message;
    abort();
}

static void fixture_print(int level, const char *format, ...)
{
    assert(level == 2 && strncmp(format, "WARNING:", 8) == 0);
    warnings += 1;
}

int (*jpeg_renderer_read_file)(const char *, unsigned char **) = fixture_read;
void (*jpeg_renderer_free_file)(unsigned char *) = fixture_free_file;
void *(*jpeg_renderer_temp_alloc)(int) = fixture_temp;
void *(*jpeg_renderer_alloc)(size_t) = fixture_alloc;
void (*jpeg_renderer_free)(void *) = fixture_release;
void (*jpeg_renderer_error)(int, const char *) = fixture_error;
void (*jpeg_renderer_print)(int, const char *, ...) = fixture_print;
unsigned int jpeg_renderer_max_texture_size = 16;

int main(void)
{
    unsigned char *file;
    unsigned char *pixels;
    unsigned int width;
    unsigned int height;
    int format;
    int pixel;

    assert(sizeof(void *) == 4);
    R_LoadJpg("synthetic.jpg", &file, &pixels, &width, &height, &format);
    assert(width == 3 && height == 2 && format == 0x15);
    assert(file != NULL && pixels != NULL && file_frees == 0 && warnings == 0);
    for (pixel = 0; pixel < 6; pixel += 1)
    {
        assert(pixels[pixel * 4] == 163 && pixels[pixel * 4 + 1] == 135);
        assert(pixels[pixel * 4 + 2] == 100 && pixels[pixel * 4 + 3] == 255);
    }
    assert(allocated == released);
    fixture_free_file(file);
    free(pixels);
    file_mode = 3;
    R_LoadJpg("synthetic.jpg", &file, &pixels, &width, &height, &format);
    assert(width == 3 && height == 2 && format == 0x15);
    for (pixel = 0; pixel < 6; pixel += 1)
    {
        assert(pixels[pixel * 4] == 128 && pixels[pixel * 4 + 1] == 128);
        assert(pixels[pixel * 4 + 2] == 128 && pixels[pixel * 4 + 3] == 255);
    }
    assert(allocated == released && warnings == 0);
    fixture_free_file(file);
    free(pixels);
    file = NULL;
    pixels = NULL;
    width = 99;
    height = 99;
    format = 99;
    file_mode = 1;
    R_LoadJpg("synthetic.jpg", &file, &pixels, &width, &height, &format);
    assert(file == NULL && pixels == NULL && width == 99 && height == 99 && format == 99);
    assert(file_frees == 2 && warnings == 0);
    file_mode = 0;
    jpeg_renderer_max_texture_size = 2;
    R_LoadJpg("synthetic.jpg", &file, &pixels, &width, &height, &format);
    assert(pixels == NULL && width == 99 && height == 99 && format == 99);
    assert(file_frees == 3 && warnings == 1 && allocated == released);
    jpeg_renderer_max_texture_size = 16;
    file_mode = 2;
    R_LoadJpg("synthetic.jpg", &file, &pixels, &width, &height, &format);
    assert(pixels == NULL && file_frees == 4 && warnings == 2 && allocated == released);
    return 0;
}
