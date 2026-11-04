#include <assert.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#ifndef JPEG_INPUT_SOURCE
#define JPEG_INPUT_SOURCE "scratch/jpeg_inline_utils/jdinput.c"
#endif
#include JPEG_INPUT_SOURCE

static void unexpected_error(j_common_ptr cinfo)
{
    (void)cinfo;
    abort();
}

int main(void)
{
    struct jpeg_decompress_struct info;
    struct jpeg_error_mgr error;
    jpeg_component_info components[2];
    int i;

    assert(sizeof(void *) == 4);
    assert(offsetof(struct jpeg_decompress_struct, comps_in_scan) == 0x12c);
    assert(offsetof(struct jpeg_decompress_struct, MCUs_per_row) == 0x140);
    memset(&info, 0, sizeof(info));
    memset(&error, 0, sizeof(error));
    memset(components, 0, sizeof(components));
    error.error_exit = unexpected_error;
    info.err = &error;
    info.comps_in_scan = 1;
    info.cur_comp_info[0] = &components[0];
    components[0].width_in_blocks = 4;
    components[0].height_in_blocks = 5;
    components[0].v_samp_factor = 3;
    components[0].DCT_scaled_size = 8;
    per_scan_setup(&info);
    assert(info.MCUs_per_row == 4 && info.MCU_rows_in_scan == 5);
    assert(info.blocks_in_MCU == 1 && info.MCU_membership[0] == 0);
    assert(components[0].MCU_width == 1 && components[0].MCU_height == 1);
    assert(components[0].last_col_width == 1 && components[0].last_row_height == 2);

    info.comps_in_scan = 2;
    info.image_width = 17;
    info.image_height = 33;
    info.max_h_samp_factor = 2;
    info.max_v_samp_factor = 2;
    for (i = 0; i < 2; i += 1)
    {
        info.cur_comp_info[i] = &components[i];
        components[i].h_samp_factor = 2 - i;
        components[i].v_samp_factor = 2 - i;
        components[i].width_in_blocks = 3;
        components[i].height_in_blocks = 5;
        components[i].DCT_scaled_size = 8;
    }
    per_scan_setup(&info);
    assert(info.MCUs_per_row == 2 && info.MCU_rows_in_scan == 3);
    assert(info.blocks_in_MCU == 5);
    for (i = 0; i < 4; i += 1)
    {
        assert(info.MCU_membership[i] == 0);
    }
    assert(info.MCU_membership[4] == 1);
    assert(components[0].MCU_blocks == 4 && components[0].MCU_sample_width == 16);
    assert(components[0].last_col_width == 1 && components[0].last_row_height == 1);
    assert(components[1].MCU_blocks == 1 && components[1].MCU_sample_width == 8);
    assert(components[1].last_col_width == 1 && components[1].last_row_height == 1);
    return 0;
}
