#include <assert.h>
#include <stddef.h>
#include <setjmp.h>
#include <stdlib.h>
#include <string.h>
#ifndef JPEG_SOURCE_ROOT
#define JPEG_SOURCE_ROOT scratch/codex_jpeg_image_loader
#endif
#define JPEG_STRING_RAW(value) #value
#define JPEG_STRING(value) JPEG_STRING_RAW(value)
#define JPEG_INCLUDE(name) JPEG_STRING(JPEG_SOURCE_ROOT/name)
#include JPEG_INCLUDE(jmemmgr.c)
#include JPEG_INCLUDE(jcomapi.c)
#include JPEG_INCLUDE(jerror.c)
#include JPEG_INCLUDE(jdinput.c)
#include JPEG_INCLUDE(jdmarker.c)
#include JPEG_INCLUDE(jdapimin.c)
#include JPEG_INCLUDE(jdapistd.c)

static jmp_buf fatal_return;
static char printed[JMSG_LENGTH_MAX];
static size_t allocated;
static size_t released;
static int rows_ready;
static int finish_calls;
static int consume_calls;
static int term_calls;
static int progress_calls;
static int source_initializations;

static void initialize_source(j_decompress_ptr info)
{
    assert(info->global_state == DSTATE_START);
    source_initializations += 1;
}

static boolean suspend_source(j_decompress_ptr info)
{
    assert(info->src->bytes_in_buffer == 0);
    return FALSE;
}

/* Startup is outside this API fixture; fail if it is accidentally exercised. */
static void jinit_master_decompress(j_decompress_ptr info)
{
    (void)info;
    abort();
}

static void process_rows(j_decompress_ptr info, JSAMPARRAY rows,
                         JDIMENSION *count, JDIMENSION maximum)
{
    assert(info->global_state == DSTATE_SCANNING && maximum == 1);
    assert(rows != 0 && *count == 0);
    if (rows_ready)
    {
        rows[0][0] = 42;
        *count = 1;
    }
}

static void monitor_progress(j_common_ptr info)
{
    assert(info->progress->pass_counter == 0);
    assert(info->progress->pass_limit == 1);
    progress_calls += 1;
}

static void finish_output(j_decompress_ptr info)
{
    assert(info->global_state == DSTATE_SCANNING);
    finish_calls += 1;
}

static int consume_end(j_decompress_ptr info)
{
    consume_calls += 1;
    if (consume_calls == 1)
    {
        return JPEG_SUSPENDED;
    }
    info->inputctl->eoi_reached = TRUE;
    return JPEG_REACHED_EOI;
}

static void terminate_source(j_decompress_ptr info)
{
    assert(info->global_state == DSTATE_STOPPING);
    term_calls += 1;
}

static void *allocate_bytes(size_t size)
{
    void *object;
    object = malloc(size);
    assert(object != 0);
    allocated += size;
    return object;
}

static void release_bytes(void *object, size_t size)
{
    released += size;
    free(object);
}

static void print_message(char *message)
{
    assert(strlen(message) < sizeof(printed));
    strcpy(printed, message);
}

static void fatal_error(void)
{
    longjmp(fatal_return, 1);
}

int main(void)
{
    static struct jpeg_decompress_struct info;
    static struct jpeg_error_mgr error;
    struct jpeg_d_main_controller main_controller;
    struct jpeg_progress_mgr progress;
    struct jpeg_decomp_master master;
    struct jpeg_source_mgr source;
    JSAMPLE sample;
    JSAMPROW row;
    static const JOCTET header[] =
    {
        0xff, 0xd8, 0xff, 0xc0, 0x00, 0x0b, 0x08, 0x00, 0x01,
        0x00, 0x02, 0x01, 0x01, 0x11, 0x00, 0xff, 0xda, 0x00,
        0x08, 0x01, 0x01, 0x00, 0x00, 0x3f, 0x00, 0xff, 0xd9
    };
    static const JOCTET tables_only[] = {0xff, 0xd8, 0xff, 0xd9};

    assert(sizeof(void *) == 4);
    assert(offsetof(struct jpeg_error_mgr, target_error) == 0x84);
    assert(offsetof(struct jpeg_error_mgr, target_print) == 0x88);
    assert(sizeof(struct jpeg_error_mgr) == 0x8c);
    info.err = jpeg_std_error(&error);
    error.target_error = fatal_error;
    error.target_print = print_message;
    info.target_alloc = allocate_bytes;
    info.target_free = release_bytes;
    info.client_data = &allocated;
    jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
    assert(info.err == &error && info.client_data == &allocated);
    assert(info.target_alloc == allocate_bytes && info.target_free == release_bytes);
    assert(info.is_decompressor && info.global_state == DSTATE_START);
    assert(info.marker != 0 && info.inputctl != 0 && info.src == 0);
    assert(info.marker->read_markers == read_markers);
    assert(info.inputctl->start_input_pass == inputctl_start_input_pass);
    assert(info.inputctl->finish_input_pass == finish_input_pass);
    assert(info.inputctl->consume_input == consume_markers);
    assert(info.inputctl->reset_input_controller == reset_input_controller);
    (*info.mem->alloc_small)((j_common_ptr)&info, JPOOL_IMAGE, 71);
    error.msg_code = JERR_NO_SOI;
    error.msg_parm.i[0] = 1;
    error.msg_parm.i[1] = 2;
    (*error.output_message)((j_common_ptr)&info);
    assert(strcmp(printed, "Not a JPEG file: starts with 0x01 0x02") == 0);
    error.msg_code = JERR_OUT_OF_MEMORY;
    error.msg_parm.i[0] = 7;
    info.global_state = DSTATE_SCANNING;
    if (setjmp(fatal_return) == 0)
    {
        (*error.error_exit)((j_common_ptr)&info);
        abort();
    }
    assert(strcmp(printed, "Insufficient memory (case 7)") == 0);
    assert(info.mem == 0 && info.global_state == 0 && allocated == released);
    if (setjmp(fatal_return) == 0)
    {
        (*error.error_exit)((j_common_ptr)&info);
        abort();
    }
    assert(allocated == released);
    if (setjmp(fatal_return) == 0)
    {
        jpeg_CreateDecompress(&info, JPEG_LIB_VERSION + 1, sizeof(info));
        abort();
    }
    assert(info.mem == 0 && allocated == released);
    if (setjmp(fatal_return) == 0)
    {
        jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info) - 1);
        abort();
    }
    assert(info.mem == 0 && allocated == released);
    jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
    memset(&main_controller, 0, sizeof(main_controller));
    memset(&progress, 0, sizeof(progress));
    memset(&master, 0, sizeof(master));
    memset(&source, 0, sizeof(source));
    main_controller.process_data = process_rows;
    progress.progress_monitor = monitor_progress;
    master.finish_output_pass = finish_output;
    source.term_source = terminate_source;
    info.main = &main_controller;
    info.progress = &progress;
    info.master = &master;
    info.src = &source;
    info.output_height = 1;
    info.global_state = DSTATE_SCANNING;
    row = &sample;
    assert(jpeg_read_scanlines(&info, &row, 1) == 0);
    assert(info.output_scanline == 0 && progress_calls == 1);
    rows_ready = 1;
    assert(jpeg_read_scanlines(&info, &row, 1) == 1);
    assert(info.output_scanline == 1 && progress_calls == 2 && sample == 42);
    assert(jpeg_read_scanlines(&info, &row, 1) == 0);
    assert(error.num_warnings == 1 && progress_calls == 2);
    info.inputctl->consume_input = consume_end;
    assert(!jpeg_finish_decompress(&info));
    assert(info.global_state == DSTATE_STOPPING && finish_calls == 1 && term_calls == 0);
    assert(jpeg_finish_decompress(&info));
    assert(info.global_state == DSTATE_START && finish_calls == 1 && term_calls == 1);
    jpeg_destroy_decompress(&info);
    assert(info.mem == 0 && allocated == released);
    jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
    memset(&source, 0, sizeof(source));
    source.init_source = initialize_source;
    source.fill_input_buffer = suspend_source;
    info.src = &source;
    assert(jpeg_read_header(&info, TRUE) == JPEG_SUSPENDED);
    assert(info.global_state == DSTATE_INHEADER && source_initializations == 1);
    source.next_input_byte = header;
    source.bytes_in_buffer = sizeof(header);
    assert(jpeg_read_header(&info, TRUE) == JPEG_HEADER_OK);
    assert(info.global_state == DSTATE_READY && source_initializations == 1);
    assert(info.image_width == 2 && info.image_height == 1 && info.num_components == 1);
    assert(info.jpeg_color_space == JCS_GRAYSCALE && info.out_color_space == JCS_GRAYSCALE);
    assert(info.scale_num == 1 && info.scale_denom == 1 && info.output_gamma == 1.0);
    assert(jpeg_consume_input(&info) == JPEG_REACHED_SOS);
    jpeg_destroy_decompress(&info);
    assert(allocated == released);
    jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
    info.src = &source;
    source.next_input_byte = tables_only;
    source.bytes_in_buffer = sizeof(tables_only);
    assert(jpeg_read_header(&info, FALSE) == JPEG_HEADER_TABLES_ONLY);
    assert(info.global_state == DSTATE_START && source_initializations == 2);
    jpeg_destroy_decompress(&info);
    assert(allocated == released);
    jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
    info.src = &source;
    source.next_input_byte = tables_only;
    source.bytes_in_buffer = sizeof(tables_only);
    if (setjmp(fatal_return) == 0)
    {
        jpeg_read_header(&info, TRUE);
        abort();
    }
    assert(error.msg_code == JERR_NO_IMAGE && info.mem == 0 && allocated == released);
    jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
    info.global_state = DSTATE_SCANNING;
    if (setjmp(fatal_return) == 0)
    {
        jpeg_read_header(&info, TRUE);
        abort();
    }
    assert(error.msg_code == JERR_BAD_STATE && info.mem == 0 && allocated == released);
    return 0;
}
