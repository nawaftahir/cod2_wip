#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include "scratch/codex_jpeg_master_api/jpeg_complete_group.c"

static void reject_state(j_common_ptr info)
{
    (void)info;
    abort();
}

int main(void)
{
    struct jpeg_decompress_struct info;
    struct jpeg_error_mgr error;
    jpeg_component_info components[3];
    int denominator;
    int width;
    int colorspace;
    int quantize;
    int component;
    int divisor;
    int size;
    int count;

    assert(sizeof(void *) == 4);
    memset(&error, 0, sizeof(error));
    error.error_exit = reject_state;
    for (denominator = 1; denominator <= 9; denominator += 1)
    {
        divisor = 1;
        if (denominator >= 8)
        {
            divisor = 8;
        }
        else if (denominator >= 4)
        {
            divisor = 4;
        }
        else if (denominator >= 2)
        {
            divisor = 2;
        }
        for (width = 1; width <= 33; width += 8)
        {
            for (colorspace = JCS_UNKNOWN; colorspace <= JCS_YCCK; colorspace += 1)
            {
                for (quantize = 0; quantize <= 1; quantize += 1)
                {
                    memset(&info, 0, sizeof(info));
                    memset(components, 0, sizeof(components));
                    info.err = &error;
                    info.global_state = DSTATE_READY;
                    info.image_width = width;
                    info.image_height = 17;
                    info.scale_num = 1;
                    info.scale_denom = denominator;
                    info.num_components = 3;
                    info.comp_info = components;
                    info.max_h_samp_factor = 2;
                    info.max_v_samp_factor = 2;
                    info.out_color_space = (J_COLOR_SPACE)colorspace;
                    info.jpeg_color_space = JCS_YCbCr;
                    info.quantize_colors = quantize;
                    for (component = 0; component < 3; component += 1)
                    {
                        components[component].h_samp_factor = 1;
                        components[component].v_samp_factor = 1;
                    }
                    components[0].h_samp_factor = 2;
                    components[0].v_samp_factor = 2;
                    jpeg_calc_output_dimensions(&info);
                    assert(info.output_width == (unsigned int)((width + divisor - 1) / divisor));
                    assert(info.output_height == (unsigned int)((17 + divisor - 1) / divisor));
                    assert(info.min_DCT_scaled_size == 8 / divisor);
                    count = 3;
                    if (colorspace == JCS_GRAYSCALE)
                    {
                        count = 1;
                    }
                    else if (colorspace == JCS_CMYK || colorspace == JCS_YCCK)
                    {
                        count = 4;
                    }
                    assert(info.out_color_components == count);
                    if (quantize)
                    {
                        count = 1;
                    }
                    assert(info.output_components == count);
                    if (colorspace == JCS_RGB && divisor == 1)
                    {
                        assert(info.rec_outbuf_height == 2);
                    }
                    else
                    {
                        assert(info.rec_outbuf_height == 1);
                    }
                    for (component = 0; component < 3; component += 1)
                    {
                        size = 8 / divisor;
                        if (component != 0 && size < 8)
                        {
                            size *= 2;
                        }
                        assert(components[component].DCT_scaled_size == size);
                        assert(components[component].downsampled_width ==
                            (unsigned int)((width * components[component].h_samp_factor * size + 15) / 16));
                    }
                }
            }
        }
    }
    return 0;
}
