#include <assert.h>
#include <stdlib.h>
#include <string.h>
#ifndef JPEG_COLOR_SOURCE
#define JPEG_COLOR_SOURCE "scratch/jpeg_bgr/jdcolor.c"
#endif
#include JPEG_COLOR_SOURCE

static void *allocate_table(j_common_ptr cinfo, int pool, size_t bytes)
{
    (void)cinfo;
    assert(pool == JPOOL_IMAGE && bytes == 256 * sizeof(int));
    return malloc(bytes);
}

int main(void)
{
    struct jpeg_decompress_struct info;
    struct jpeg_memory_mgr memory;
    my_color_deconverter convert;
    JSAMPLE range[768];
    JSAMPLE y[3];
    JSAMPLE cb[3];
    JSAMPLE cr[3];
    JSAMPROW channels[3];
    JSAMPARRAY input[3];
    JSAMPLE pixels[9];
    JSAMPROW output[1];
    int i;

    assert(sizeof(void *) == 4);
    assert(RGB_BLUE == 0 && RGB_GREEN == 1 && RGB_RED == 2);
    memset(&info, 0, sizeof(info));
    memset(&memory, 0, sizeof(memory));
    memset(&convert, 0, sizeof(convert));
    memory.alloc_small = allocate_table;
    info.mem = &memory;
    info.cconvert = &convert.pub;
    info.output_width = 3;
    info.sample_range_limit = range + 256;
    for (i = -256; i < 512; i += 1)
    {
        if (i < 0)
        {
            range[i + 256] = 0;
        }
        else if (i > 255)
        {
            range[i + 256] = 255;
        }
        else
        {
            range[i + 256] = (JSAMPLE)i;
        }
    }
    build_ycc_rgb_table(&info);
    y[0] = 128; cb[0] = 128; cr[0] = 128;
    y[1] = 128; cb[1] = 128; cr[1] = 255;
    y[2] = 128; cb[2] = 255; cr[2] = 128;
    channels[0] = y; channels[1] = cb; channels[2] = cr;
    for (i = 0; i < 3; i += 1)
    {
        input[i] = &channels[i];
    }
    output[0] = pixels;
    ycc_rgb_convert(&info, input, 0, output, 1);
    assert(pixels[0] == 128 && pixels[1] == 128 && pixels[2] == 128);
    assert(pixels[3] == 128 && pixels[4] == 37 && pixels[5] == 255);
    assert(pixels[6] == 255 && pixels[7] == 84 && pixels[8] == 128);
    free(convert.Cr_r_tab);
    free(convert.Cb_b_tab);
    free(convert.Cr_g_tab);
    free(convert.Cb_g_tab);
    return 0;
}
