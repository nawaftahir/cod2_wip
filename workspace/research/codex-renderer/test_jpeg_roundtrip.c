#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define JPEG_INTERNALS
#include "scratch/jpeg_bgr/jpeglib.h"

static JOCTET encoded[65536];
static size_t encoded_size;

static void release_bytes(void *object, size_t bytes)
{
    (void)bytes;
    free(object);
}

/* Host integration adapter: stock IJG Create APIs erase renderer callbacks. */
static void initialize_memory(j_common_ptr info)
{
    info->target_alloc = malloc;
    info->target_free = release_bytes;
    jinit_memory_mgr(info);
}

static void init_destination(j_compress_ptr cinfo)
{
    cinfo->dest->next_output_byte = encoded;
    cinfo->dest->free_in_buffer = sizeof(encoded);
}

static boolean full_destination(j_compress_ptr cinfo)
{
    (void)cinfo;
    assert(0);
    return FALSE;
}

static void finish_destination(j_compress_ptr cinfo)
{
    encoded_size = sizeof(encoded) - cinfo->dest->free_in_buffer;
}

int main(void)
{
    struct jpeg_compress_struct compressor;
    struct jpeg_decompress_struct decompressor;
    struct jpeg_error_mgr error;
    struct jpeg_destination_mgr destination;
    JSAMPLE row[16 * 3];
    JSAMPROW rows[1];
    FILE *stream;
    int i;

    memset(&compressor, 0, sizeof(compressor));
    compressor.err = jpeg_std_error(&error);
    compressor.client_data = encoded;
#ifdef JPEG_API_CREATE
    compressor.target_alloc = malloc;
    compressor.target_free = release_bytes;
    jpeg_create_compress(&compressor);
#else
    initialize_memory((j_common_ptr)&compressor);
    compressor.global_state = CSTATE_START;
    compressor.input_gamma = 1.0;
#endif
    assert(compressor.client_data == encoded && compressor.err == &error);
    assert(compressor.target_alloc == malloc && compressor.target_free == release_bytes);
    destination.init_destination = init_destination;
    destination.empty_output_buffer = full_destination;
    destination.term_destination = finish_destination;
    compressor.dest = &destination;
    compressor.image_width = 16;
    compressor.image_height = 16;
    compressor.input_components = 3;
    compressor.in_color_space = JCS_RGB;
    jpeg_set_defaults(&compressor);
    jpeg_set_quality(&compressor, 100, TRUE);
    for (i = 0; i < 16; i += 1)
    {
        row[i * 3] = 20;
        row[i * 3 + 1] = 100;
        row[i * 3 + 2] = 220;
    }
    rows[0] = row;
    jpeg_start_compress(&compressor, TRUE);
    while (compressor.next_scanline < compressor.image_height)
    {
        assert(jpeg_write_scanlines(&compressor, rows, 1) == 1);
    }
    jpeg_finish_compress(&compressor);
    jpeg_destroy_compress(&compressor);
    assert(encoded_size > 100 && encoded[0] == 0xff && encoded[1] == 0xd8);
    assert(encoded[encoded_size - 2] == 0xff && encoded[encoded_size - 1] == 0xd9);
    stream = tmpfile();
    assert(stream && fwrite(encoded, 1, encoded_size, stream) == encoded_size);
    rewind(stream);
    memset(&decompressor, 0, sizeof(decompressor));
    decompressor.err = jpeg_std_error(&error);
    decompressor.client_data = encoded;
#ifdef JPEG_API_CREATE
    decompressor.target_alloc = malloc;
    decompressor.target_free = release_bytes;
    jpeg_create_decompress(&decompressor);
#else
    decompressor.is_decompressor = TRUE;
    initialize_memory((j_common_ptr)&decompressor);
    jinit_marker_reader(&decompressor);
    jinit_input_controller(&decompressor);
    decompressor.global_state = DSTATE_START;
#endif
    assert(decompressor.client_data == encoded && decompressor.err == &error);
    assert(decompressor.target_alloc == malloc && decompressor.target_free == release_bytes);
    jpeg_stdio_src(&decompressor, stream);
    assert(jpeg_read_header(&decompressor, TRUE) == JPEG_HEADER_OK);
    assert(jpeg_start_decompress(&decompressor));
    assert(decompressor.output_width == 16 && decompressor.output_height == 16);
    assert(decompressor.output_components == 3);
    while (decompressor.output_scanline < decompressor.output_height)
    {
        assert(jpeg_read_scanlines(&decompressor, rows, 1) == 1);
        for (i = 0; i < 16; i += 1)
        {
            assert(row[i * 3] >= 18 && row[i * 3] <= 22);
            assert(row[i * 3 + 1] >= 98 && row[i * 3 + 1] <= 102);
            assert(row[i * 3 + 2] >= 218 && row[i * 3 + 2] <= 222);
        }
    }
    assert(jpeg_finish_decompress(&decompressor));
    jpeg_destroy_decompress(&decompressor);
    fclose(stream);
    return 0;
}
