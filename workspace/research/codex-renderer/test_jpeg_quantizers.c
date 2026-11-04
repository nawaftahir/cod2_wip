#include <assert.h>
#include <setjmp.h>
#include <stdlib.h>
#include <string.h>
#include "scratch/codex_jpeg_master_api/jmemmgr.c"
#include "scratch/codex_jpeg_master_api/jcomapi.c"
#include "scratch/codex_jpeg_master_api/jerror.c"
#define my_cquantizer one_pass_cquantizer
#define my_cquantize_ptr one_pass_cquantize_ptr
#include "scratch/codex_jpeg_master_api/jquant1.c"
#undef my_cquantize_ptr
#undef my_cquantizer
#include "scratch/codex_jpeg_master_api/jquant2.c"

static size_t allocated;
static size_t released;
static JSAMPLE clamp_storage[768];
static jmp_buf fatal_return;
static int fatal_expected;

static void *allocate_bytes(size_t bytes)
{
    void *object;
    object = malloc(bytes);
    assert(object != NULL);
    allocated += bytes;
    return object;
}

static void release_bytes(void *object, size_t bytes)
{
    released += bytes;
    free(object);
}

static void unexpected_error(void)
{
    if (!fatal_expected)
    {
        abort();
    }
    longjmp(fatal_return, 1);
}

static void ignore_message(char *message)
{
    (void)message;
}

static void exercise(int two_pass, int components, J_DITHER_MODE mode)
{
    static struct jpeg_decompress_struct info;
    static struct jpeg_error_mgr error;
    JSAMPLE input[2][24];
    JSAMPLE output[2][8];
    JSAMPROW input_rows[2];
    JSAMPROW output_rows[2];
    int row;
    int pixel;
    int channel;
    int difference;

    memset(&info, 0, sizeof(info));
    info.err = jpeg_std_error(&error);
    error.target_error = unexpected_error;
    error.target_print = ignore_message;
    info.target_alloc = allocate_bytes;
    info.target_free = release_bytes;
    info.is_decompressor = TRUE;
    info.output_width = 8;
    info.out_color_components = components;
    if (components == 3)
    {
        info.out_color_space = JCS_RGB;
    }
    else
    {
        info.out_color_space = JCS_GRAYSCALE;
    }
    info.desired_number_of_colors = 8;
    info.dither_mode = mode;
    info.enable_2pass_quant = TRUE;
    /* Fixture-only simple clamp segment; this does not test IDCT range wrapping. */
    info.sample_range_limit = clamp_storage + 256;
    jinit_memory_mgr((j_common_ptr)&info);
    for (row = 0; row < 2; row += 1)
    {
        input_rows[row] = input[row];
        output_rows[row] = output[row];
        for (pixel = 0; pixel < 8; pixel += 1)
        {
            for (channel = 0; channel < components; channel += 1)
            {
                input[row][pixel * components + channel] =
                    (((pixel ^ row) >> channel) & 1) * 255;
            }
        }
    }
    if (two_pass)
    {
        jinit_2pass_quantizer(&info);
        (*info.cquantize->start_pass)(&info, TRUE);
        (*info.cquantize->color_quantize)(&info, input_rows, NULL, 2);
        (*info.cquantize->finish_pass)(&info);
        assert(info.actual_number_of_colors == 8);
    }
    else
    {
        jinit_1pass_quantizer(&info);
    }
    (*info.cquantize->start_pass)(&info, FALSE);
    for (row = 0; row < 2; row += 1)
    {
        (*info.cquantize->color_quantize)(&info, input_rows + row, output_rows + row, 1);
    }
    for (row = 0; row < 2; row += 1)
    {
        for (pixel = 0; pixel < 8; pixel += 1)
        {
            assert(output[row][pixel] < info.actual_number_of_colors);
            for (channel = 0; channel < components; channel += 1)
            {
                difference = (int)info.colormap[channel][output[row][pixel]] -
                    input[row][pixel * components + channel];
                assert(abs(difference) <= (two_pass ? 4 : 0));
            }
        }
    }
    (*info.cquantize->finish_pass)(&info);
    if (two_pass)
    {
        (*info.cquantize->new_color_map)(&info);
        (*info.cquantize->start_pass)(&info, FALSE);
        (*info.cquantize->color_quantize)(&info, input_rows, output_rows, 2);
        assert(output[0][0] != output[0][7]);
    }
    else
    {
        fatal_expected = 1;
        if (setjmp(fatal_return) == 0)
        {
            (*info.cquantize->new_color_map)(&info);
            abort();
        }
        fatal_expected = 0;
        assert(error.msg_code == JERR_MODE_CHANGE);
    }
    jpeg_destroy((j_common_ptr)&info);
    assert(info.mem == NULL && allocated == released);
}

int main(void)
{
    int value;
    int components;
    int mode;

    assert(sizeof(void *) == 4);
    for (value = -256; value < 512; value += 1)
    {
        if (value < 0)
        {
            clamp_storage[value + 256] = 0;
        }
        else if (value > 255)
        {
            clamp_storage[value + 256] = 255;
        }
        else
        {
            clamp_storage[value + 256] = value;
        }
    }
    for (components = 1; components <= 3; components += 2)
    {
        for (mode = JDITHER_NONE; mode <= JDITHER_FS; mode += 1)
        {
            exercise(0, components, (J_DITHER_MODE)mode);
        }
    }
    for (mode = JDITHER_NONE; mode <= JDITHER_FS; mode += 1)
    {
        exercise(1, 3, (J_DITHER_MODE)mode);
    }
    return 0;
}
