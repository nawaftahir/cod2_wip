#include <assert.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#ifndef JPEG_MEMORY_SOURCE
#define JPEG_MEMORY_SOURCE "scratch/jpeg_callbacks/jmemmgr.c"
#endif
#include JPEG_MEMORY_SOURCE
#ifdef JPEG_MAIN_SOURCE
#include JPEG_MAIN_SOURCE
#endif
#ifdef JPEG_POST_SOURCE
#include JPEG_POST_SOURCE
#endif
#ifdef JPEG_SAMPLE_SOURCE
#include JPEG_SAMPLE_SOURCE
#endif
#ifdef JPEG_COEF_SOURCE
#include JPEG_COEF_SOURCE
#endif
#ifdef JPEG_IDCT_SOURCE
#include JPEG_IDCT_SOURCE
#endif

static unsigned int allocated;
static unsigned int released;

static void *allocate_bytes(size_t bytes)
{
    void *object;

    object = malloc(bytes);
    assert(object != 0);
    allocated += bytes;
    return object;
}

static void release_bytes(void *object, size_t bytes)
{
    assert(object != 0);
    released += bytes;
    free(object);
}

static void unexpected_error(j_common_ptr cinfo)
{
    (void)cinfo;
    abort();
}

int main(void)
{
    struct jpeg_compress_struct info;
    struct jpeg_error_mgr error;
    j_common_ptr common;
    unsigned char *small;
    unsigned char *large;
    JSAMPARRAY samples;
    JBLOCKARRAY blocks;
#ifdef JPEG_MEMORY_VIRTUAL
    jvirt_sarray_ptr virtual_samples;
    jvirt_barray_ptr virtual_blocks;
#endif
    int i;

    assert(sizeof(void *) == 4);
    assert(sizeof(small_pool_hdr) == 16 && sizeof(large_pool_hdr) == 16);
    assert(sizeof(first_pool_slop) == 8 && sizeof(extra_pool_slop) == 8);
    assert(offsetof(struct jpeg_common_struct, target_alloc) == 24);
    assert(offsetof(struct jpeg_common_struct, target_free) == 28);
    memset(&info, 0, sizeof(info));
    memset(&error, 0, sizeof(error));
    error.error_exit = unexpected_error;
    info.err = &error;
    info.target_alloc = allocate_bytes;
    info.target_free = release_bytes;
    common = (j_common_ptr)&info;
    jinit_memory_mgr(common);
#ifdef JPEG_MEMORY_VIRTUAL
    assert(common->mem->max_memory_to_use == 0);
    virtual_samples = request_virt_sarray(common, JPOOL_IMAGE, TRUE, 17, 5, 2);
    virtual_blocks = request_virt_barray(common, JPOOL_IMAGE, TRUE, 2, 5, 2);
    realize_virt_arrays(common);
    samples = access_virt_sarray(common, virtual_samples, 0, 2, TRUE);
    blocks = access_virt_barray(common, virtual_blocks, 0, 2, TRUE);
    assert(samples[0][0] == 0 && samples[1][16] == 0);
    assert(blocks[0][0][0] == 0 && blocks[1][1][63] == 0);
    samples[1][16] = 73;
    blocks[1][1][63] = 91;
    assert(access_virt_sarray(common, virtual_samples, 1, 1, FALSE)[0][16] == 73);
    assert(access_virt_barray(common, virtual_blocks, 1, 1, FALSE)[0][1][63] == 91);
    access_virt_sarray(common, virtual_samples, 2, 2, TRUE);
    access_virt_barray(common, virtual_blocks, 2, 2, TRUE);
    samples = access_virt_sarray(common, virtual_samples, 4, 1, TRUE);
    blocks = access_virt_barray(common, virtual_blocks, 4, 1, TRUE);
    assert(samples[0][16] == 0 && blocks[0][1][63] == 0);
#endif
    small = alloc_small(common, JPOOL_PERMANENT, 13);
    large = alloc_large(common, JPOOL_IMAGE, 25);
    assert(((size_t)small & 7) == 0 && ((size_t)large & 7) == 0);
    memset(small, 0x5a, 13);
    memset(large, 0x6b, 25);
    samples = alloc_sarray(common, JPOOL_IMAGE, 17, 3);
    for (i = 0; i < 3; i += 1)
    {
        assert(samples[i] == samples[0] + i * 17);
        memset(samples[i], i + 1, 17);
    }
    blocks = alloc_barray(common, JPOOL_IMAGE, 2, 3);
    for (i = 0; i < 3; i += 1)
    {
        assert(blocks[i] == blocks[0] + i * 2);
        memset(blocks[i], 0, 2 * sizeof(JBLOCK));
    }
    free_pool(common, JPOOL_IMAGE);
    assert(small[0] == 0x5a && small[12] == 0x5a);
    self_destruct(common);
    assert(info.mem == 0);
    assert(allocated == released && allocated > 0);
#ifdef JPEG_MAIN_SOURCE
    {
        struct jpeg_decompress_struct decoder;
        struct jpeg_upsampler upsample;
        jpeg_component_info component;
        my_main_ptr main_controller;
        int context;

        for (context = 0; context < 2; context += 1)
        {
            memset(&decoder, 0, sizeof(decoder));
            memset(&upsample, 0, sizeof(upsample));
            memset(&component, 0, sizeof(component));
            decoder.err = &error;
            decoder.target_alloc = allocate_bytes;
            decoder.target_free = release_bytes;
            decoder.upsample = &upsample;
            decoder.comp_info = &component;
            decoder.num_components = 1;
            decoder.min_DCT_scaled_size = 8;
            decoder.total_iMCU_rows = 2;
            decoder.output_height = 12;
#ifdef JPEG_POST_SOURCE
            decoder.output_width = 16;
            decoder.out_color_components = 1;
            decoder.max_v_samp_factor = 2;
            decoder.quantize_colors = TRUE;
#endif
            component.v_samp_factor = 1;
            component.h_samp_factor = 1;
            component.DCT_scaled_size = 8;
            component.width_in_blocks = 2;
            component.height_in_blocks = 2;
            component.component_needed = TRUE;
            upsample.need_context_rows = context;
            jinit_memory_mgr((j_common_ptr)&decoder);
            jinit_d_main_controller(&decoder, FALSE);
            main_controller = (my_main_ptr)decoder.main;
            assert(main_controller->buffer[0] != 0);
            assert(main_controller->pub.start_pass == start_pass_main);
            start_pass_main(&decoder, JBUF_PASS_THRU);
            assert(main_controller->buffer_full == FALSE);
            assert(main_controller->rowgroup_ctr == 0);
            if (context)
            {
                assert(main_controller->pub.process_data == process_data_context_main);
                assert(main_controller->whichptr == 0);
                assert(main_controller->xbuffer[0][0][-1] == main_controller->buffer[0][0]);
            }
            else
            {
                assert(main_controller->pub.process_data == process_data_simple_main);
            }
#ifdef JPEG_POST_SOURCE
            jinit_d_post_controller(&decoder, FALSE);
            assert(((my_post_ptr)decoder.post)->strip_height == 2);
            assert(((my_post_ptr)decoder.post)->buffer != 0);
            start_pass_dpost(&decoder, JBUF_PASS_THRU);
            assert(decoder.post->post_process_data == post_process_1pass);
#endif
#ifdef JPEG_SAMPLE_SOURCE
            decoder.max_h_samp_factor = 2;
            decoder.max_v_samp_factor = 2;
            decoder.do_fancy_upsampling = FALSE;
            jinit_upsampler(&decoder);
            assert(((my_upsample_ptr)decoder.upsample)->methods[0] == h2v2_upsample);
            start_pass_upsample(&decoder);
            assert(((my_upsample_ptr)decoder.upsample)->rows_to_go == 12);
            {
                JSAMPARRAY output = 0;
                fullsize_upsample(&decoder, &component, main_controller->buffer[0], &output);
                assert(output == main_controller->buffer[0]);
                noop_upsample(&decoder, &component, main_controller->buffer[0], &output);
                assert(output == 0);
            }
#endif
#ifdef JPEG_COEF_SOURCE
            decoder.comps_in_scan = 1;
            decoder.cur_comp_info[0] = &component;
            component.last_row_height = 1;
            jinit_d_coef_controller(&decoder, FALSE);
            start_input_pass(&decoder);
            assert(decoder.input_iMCU_row == 0);
            assert(((my_coef_ptr)decoder.coef)->MCU_ctr == 0);
            assert(((my_coef_ptr)decoder.coef)->MCU_vert_offset == 0);
            assert(((my_coef_ptr)decoder.coef)->MCU_rows_per_iMCU_row == 1);
            assert(dummy_consume_data(&decoder) == JPEG_SUSPENDED);
#endif
#ifdef JPEG_IDCT_SOURCE
            {
                JQUANT_TBL quant;
                int coefficient;
                for (coefficient = 0; coefficient < 64; coefficient += 1)
                {
                    quant.quantval[coefficient] = (UINT16)(coefficient + 1);
                }
                component.quant_table = &quant;
                jinit_inverse_dct(&decoder);
                assert(decoder.idct->start_pass == start_pass);
                decoder.dct_method = JDCT_ISLOW;
                decoder.idct->start_pass(&decoder);
                assert(decoder.idct->inverse_DCT[0] == jpeg_idct_islow);
                for (coefficient = 0; coefficient < 64; coefficient += 1)
                {
                    assert(((ISLOW_MULT_TYPE *)component.dct_table)[coefficient] == coefficient + 1);
                }
                ((ISLOW_MULT_TYPE *)component.dct_table)[0] = 123;
                decoder.idct->start_pass(&decoder);
                assert(((ISLOW_MULT_TYPE *)component.dct_table)[0] == 123);
                decoder.dct_method = JDCT_IFAST;
                decoder.idct->start_pass(&decoder);
                assert(decoder.idct->inverse_DCT[0] == jpeg_idct_ifast);
                assert(((IFAST_MULT_TYPE *)component.dct_table)[0] == 4);
                assert(((IFAST_MULT_TYPE *)component.dct_table)[1] == 11);
                decoder.dct_method = JDCT_FLOAT;
                decoder.idct->start_pass(&decoder);
                assert(decoder.idct->inverse_DCT[0] == jpeg_idct_float);
                assert(((FLOAT_MULT_TYPE *)component.dct_table)[0] == 1.0f);
                component.DCT_scaled_size = 4;
                decoder.idct->start_pass(&decoder);
                assert(decoder.idct->inverse_DCT[0] == jpeg_idct_4x4);
                component.DCT_scaled_size = 2;
                decoder.idct->start_pass(&decoder);
                assert(decoder.idct->inverse_DCT[0] == jpeg_idct_2x2);
                component.DCT_scaled_size = 1;
                decoder.idct->start_pass(&decoder);
                assert(decoder.idct->inverse_DCT[0] == jpeg_idct_1x1);
                component.DCT_scaled_size = 8;
                component.component_needed = FALSE;
                ((ISLOW_MULT_TYPE *)component.dct_table)[0] = 123;
                decoder.idct->start_pass(&decoder);
                assert(((ISLOW_MULT_TYPE *)component.dct_table)[0] == 123);
                component.component_needed = TRUE;
                component.quant_table = 0;
                decoder.idct->start_pass(&decoder);
                assert(((ISLOW_MULT_TYPE *)component.dct_table)[0] == 123);
            }
#endif
            self_destruct((j_common_ptr)&decoder);
            assert(decoder.mem == 0 && allocated == released);
        }
    }
#endif
    return 0;
}
