#include <assert.h>
#include <stdlib.h>
#include <string.h>
#ifndef JPEG_MARKER_SOURCE_ROOT
#define JPEG_MARKER_SOURCE_ROOT scratch/codex_jpeg_raw_caller
#endif
#define JPEG_MARKER_INCLUDE_INNER(root) #root
#define JPEG_MARKER_INCLUDE(root) JPEG_MARKER_INCLUDE_INNER(root/jpeg_complete_group.c)
#include JPEG_MARKER_INCLUDE(JPEG_MARKER_SOURCE_ROOT)

static unsigned int allocation_count;

static void *tracked_alloc(size_t bytes)
{
    void *object;

    object = malloc(bytes);
    assert(object != NULL);
    allocation_count += 1;
    return object;
}

static void tracked_free(void *object, size_t bytes)
{
    (void)bytes;
    assert(object != NULL && allocation_count != 0);
    allocation_count -= 1;
    free(object);
}

static void unexpected_error(j_common_ptr info)
{
    (void)info;
    abort();
}

static void ignore_trace(j_common_ptr info, int level)
{
    (void)info;
    (void)level;
}

static boolean suspend_input(j_decompress_ptr info)
{
    (void)info;
    return FALSE;
}

static void skip_input(j_decompress_ptr info, long bytes)
{
    assert(bytes >= 0 && (unsigned long)bytes <= info->src->bytes_in_buffer);
    info->src->next_input_byte += bytes;
    info->src->bytes_in_buffer -= bytes;
}

static unsigned int append_marker(unsigned char *stream, unsigned int position,
                                  int marker, const unsigned char *data, unsigned int bytes)
{
    assert(position + bytes + 4 <= 128);
    stream[position] = 0xff;
    stream[position + 1] = (unsigned char)marker;
    stream[position + 2] = (unsigned char)((bytes + 2) >> 8);
    stream[position + 3] = (unsigned char)(bytes + 2);
    memcpy(stream + position + 4, data, bytes);
    return position + bytes + 4;
}

int main(void)
{
    struct jpeg_decompress_struct info;
    struct jpeg_error_mgr error;
    struct jpeg_source_mgr source;
    const unsigned char jfif[14] = {'J', 'F', 'I', 'F', 0, 1, 2, 1, 0, 72, 0, 72, 0, 0};
    const unsigned char adobe[12] = {'A', 'd', 'o', 'b', 'e', 0, 100, 0, 0, 0, 0, 2};
    const unsigned char comment[8] = {'m', 'e', 't', 'a', 'd', 'a', 't', 'a'};
    unsigned char stream[128];
    unsigned int length;
    jpeg_saved_marker_ptr saved;
    my_marker_ptr marker;
    int save;

    assert(sizeof(void *) == 4);
    stream[0] = 0xff;
    stream[1] = 0xd8;
    length = append_marker(stream, 2, M_APP0, jfif, sizeof(jfif));
    length = append_marker(stream, length, M_APP14, adobe, sizeof(adobe));
    length = append_marker(stream, length, M_COM, comment, sizeof(comment));
    stream[length] = 0xff;
    stream[length + 1] = 0xd9;
    length += 2;
    for (save = 0; save < 2; save += 1)
    {
        memset(&info, 0, sizeof(info));
        memset(&source, 0, sizeof(source));
        info.err = jpeg_std_error(&error);
        error.error_exit = unexpected_error;
        error.emit_message = ignore_trace;
        info.target_alloc = tracked_alloc;
        info.target_free = tracked_free;
        jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
        source.next_input_byte = stream;
        source.bytes_in_buffer = length;
        source.fill_input_buffer = suspend_input;
        source.skip_input_data = skip_input;
        info.src = &source;
        if (save)
        {
            jpeg_save_markers(&info, M_APP0, sizeof(jfif));
            jpeg_save_markers(&info, M_APP14, sizeof(adobe));
            jpeg_save_markers(&info, M_COM, 3);
            source.bytes_in_buffer = 11;
            assert(info.marker->read_markers(&info) == JPEG_SUSPENDED);
            marker = (my_marker_ptr)info.marker;
            assert(marker->cur_marker != NULL && marker->bytes_read == 5);
            assert(source.next_input_byte == stream + 11 && source.bytes_in_buffer == 0);
            source.bytes_in_buffer = length - 11;
        }
        assert(info.marker->read_markers(&info) == JPEG_REACHED_EOI);
        assert(info.saw_JFIF_marker && info.JFIF_major_version == 1 && info.JFIF_minor_version == 2);
        assert(info.density_unit == 1 && info.X_density == 72 && info.Y_density == 72);
        assert(info.saw_Adobe_marker && info.Adobe_transform == 2);
        assert(source.next_input_byte == stream + length && source.bytes_in_buffer == 0);
        if (save)
        {
            saved = info.marker_list;
            assert(saved != NULL && saved->marker == M_APP0);
            assert(saved->original_length == 14 && saved->data_length == 14);
            assert(memcmp(saved->data, jfif, 14) == 0);
            saved = saved->next;
            assert(saved != NULL && saved->marker == M_APP14);
            assert(saved->original_length == 12 && saved->data_length == 12);
            assert(memcmp(saved->data, adobe, 12) == 0);
            saved = saved->next;
            assert(saved != NULL && saved->marker == M_COM && saved->next == NULL);
            assert(saved->original_length == 8 && saved->data_length == 3);
            assert(memcmp(saved->data, comment, 3) == 0);
        }
        else
        {
            assert(info.marker_list == NULL);
        }
        jpeg_destroy_decompress(&info);
        assert(info.mem == NULL && allocation_count == 0);
    }
    return 0;
}
