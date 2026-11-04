#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include "scratch/codex_jpeg_api_common_group/jmemmgr.c"
#include "scratch/codex_jpeg_api_common_group/jcomapi.c"
#include "scratch/codex_jpeg_api_common_group/jdmarker.c"

static jmp_buf failure;
static int error_code;

static void release_bytes(void *object, size_t bytes)
{
    (void)bytes;
    free(object);
}

static void report_error(j_common_ptr info)
{
    error_code = info->err->msg_code;
    longjmp(failure, 1);
}

static void emit_message(j_common_ptr info, int severity)
{
    (void)info;
    (void)severity;
}

static boolean suspend_input(j_decompress_ptr info)
{
    (void)info;
    return FALSE;
}

static void skip_input(j_decompress_ptr info, long bytes)
{
    assert(bytes >= 0 && (size_t)bytes <= info->src->bytes_in_buffer);
    info->src->next_input_byte += bytes;
    info->src->bytes_in_buffer -= bytes;
}

int main(void)
{
    struct jpeg_decompress_struct info;
    struct jpeg_error_mgr error;
    struct jpeg_source_mgr source;
    unsigned char stream[192];
    unsigned int position;
    int i;
    int precision;
    int result;

    assert(sizeof(void *) == 4);
    for (precision = 0; precision < 2; precision += 1)
    {
        memset(&info, 0, sizeof(info));
        memset(&error, 0, sizeof(error));
        memset(&source, 0, sizeof(source));
        error.error_exit = report_error;
        error.emit_message = emit_message;
        info.err = &error;
        info.target_alloc = malloc;
        info.target_free = release_bytes;
        info.src = &source;
        source.fill_input_buffer = suspend_input;
        source.skip_input_data = skip_input;
        jinit_memory_mgr((j_common_ptr)&info);
        jinit_marker_reader(&info);
        position = 0;
        stream[position++] = 0xff;
        stream[position++] = 0xd8;
        stream[position++] = 0xff;
        stream[position++] = 0xdb;
        stream[position++] = 0;
        stream[position++] = (unsigned char)(67 + precision * 64);
        stream[position++] = (unsigned char)(precision << 4);
        for (i = 0; i < 64; i += 1)
        {
            if (precision)
            {
                stream[position++] = 1;
            }
            stream[position++] = (unsigned char)(i + 1);
        }
        stream[position++] = 0xff;
        stream[position++] = 0xc4;
        stream[position++] = 0;
        stream[position++] = 20;
        stream[position++] = 0;
        for (i = 0; i < 16; i += 1)
        {
            stream[position++] = (unsigned char)(i == 0);
        }
        stream[position++] = 42;
        stream[position++] = 0xff;
        stream[position++] = 0xdd;
        stream[position++] = 0;
        stream[position++] = 4;
        stream[position++] = 0x12;
        stream[position++] = 0x34;
        stream[position++] = 0xff;
        stream[position++] = 0xd9;
        assert(position <= sizeof(stream));
        source.next_input_byte = stream;
        source.bytes_in_buffer = position;
        error_code = 0;
        assert(setjmp(failure) == 0);
        result = info.marker->read_markers(&info);
        assert(result == JPEG_REACHED_EOI && error_code == 0);
        for (i = 0; i < 64; i += 1)
        {
            assert(info.quant_tbl_ptrs[0]->quantval[jpeg_natural_order[i]] == i + 1 + precision * 256);
        }
        assert(info.dc_huff_tbl_ptrs[0]->bits[1] == 1);
        assert(info.dc_huff_tbl_ptrs[0]->huffval[0] == 42);
        assert(info.restart_interval == 0x1234);
        assert(source.bytes_in_buffer == 0);
        source.next_input_byte = stream;
        source.bytes_in_buffer = 0;
        reset_marker_reader(&info);
        assert(info.marker->read_markers(&info) == JPEG_SUSPENDED);
        source.next_input_byte = stream;
        source.bytes_in_buffer = 1;
        assert(info.marker->read_markers(&info) == JPEG_SUSPENDED);
        assert(source.next_input_byte == stream && source.bytes_in_buffer == 1);
        reset_marker_reader(&info);
        source.next_input_byte = stream;
        source.bytes_in_buffer = position;
        stream[6] = (unsigned char)((precision << 4) | 4);
        if (setjmp(failure) == 0)
        {
            info.marker->read_markers(&info);
            abort();
        }
        assert(error_code == JERR_DQT_INDEX);
        stream[6] = (unsigned char)(precision << 4);
        reset_marker_reader(&info);
        source.next_input_byte = stream;
        source.bytes_in_buffer = position;
        stream[7 + 64 * (precision + 1) + 5] = 255;
        stream[7 + 64 * (precision + 1) + 6] = 255;
        if (setjmp(failure) == 0)
        {
            info.marker->read_markers(&info);
            abort();
        }
        assert(error_code == JERR_BAD_HUFF_TABLE);
        reset_marker_reader(&info);
        source.next_input_byte = stream;
        stream[1] = 0;
        source.bytes_in_buffer = 2;
        if (setjmp(failure) == 0)
        {
            info.marker->read_markers(&info);
            abort();
        }
        assert(error_code == JERR_NO_SOI);
        jpeg_destroy((j_common_ptr)&info);
        assert(info.mem == 0);
    }
    return 0;
}
