/* CoD2 1.0 Windows image loader; target10014940, not the modernized web loader. */
extern int (*jpeg_renderer_read_file)(const char *name, unsigned char **data);
extern void (*jpeg_renderer_free_file)(unsigned char *data);
extern void *(*jpeg_renderer_temp_alloc)(int bytes);
extern void *(*jpeg_renderer_alloc)(size_t bytes);
extern void (*jpeg_renderer_free)(void *object);
extern void (*jpeg_renderer_error)(int level, const char *message);
extern void (*jpeg_renderer_print)(int level, const char *format, ...);
extern unsigned int jpeg_renderer_max_texture_size;

typedef struct
{
    struct jpeg_source_mgr pub;
    boolean start_of_file;
} jpeg_memory_source;

static void *image_jpeg_alloc(size_t bytes)
{
    return (*jpeg_renderer_alloc)(bytes);
}

static void image_jpeg_free(void *object, size_t bytes)
{
    (void)bytes;
    (*jpeg_renderer_free)(object);
}

static void image_jpeg_error(void)
{
    (*jpeg_renderer_error)(0, "jpeg internal error");
}

static void image_jpeg_print(char *message)
{
    (*jpeg_renderer_print)(0, "%s\n", message);
}

static void image_jpeg_init_source(j_decompress_ptr info)
{
    ((jpeg_memory_source *)info->src)->start_of_file = TRUE;
}

static void image_jpeg_skip_input(j_decompress_ptr info, long bytes)
{
    if (bytes > 0)
    {
        info->src->next_input_byte += bytes;
        info->src->bytes_in_buffer -= bytes;
    }
}

static void image_jpeg_term_source(j_decompress_ptr info)
{
    (void)info;
}

static __forceinline void image_jpeg_memory_source(j_decompress_ptr info, unsigned char *data, int bytes)
{
    jpeg_memory_source *source;

    if (info->src == NULL)
    {
        info->src = (struct jpeg_source_mgr *)(*info->mem->alloc_small)
            ((j_common_ptr)info, JPOOL_PERMANENT, sizeof(jpeg_memory_source));
    }
    source = (jpeg_memory_source *)info->src;
    source->pub.bytes_in_buffer = bytes;
    source->pub.init_source = image_jpeg_init_source;
    source->pub.fill_input_buffer = NULL;
    source->pub.skip_input_data = image_jpeg_skip_input;
    source->pub.resync_to_restart = jpeg_resync_to_restart;
    source->pub.term_source = image_jpeg_term_source;
    source->pub.next_input_byte = data;
}

static __declspec(noinline) void R_LoadJpg(const char *name, unsigned char **file, unsigned char **pic,
               unsigned int *width, unsigned int *height, int *format)
{
    struct jpeg_decompress_struct info;
    struct jpeg_error_mgr error;
    unsigned char *encoded;
    unsigned char *pixels;
    unsigned char *row;
    unsigned int stride;
    int bytes;
    int column;

    bytes = (*jpeg_renderer_read_file)(name, &encoded);
    if (encoded == NULL)
    {
        return;
    }
    info.err = jpeg_std_error(&error);
    error.target_error = image_jpeg_error;
    error.target_print = image_jpeg_print;
    info.target_alloc = image_jpeg_alloc;
    info.target_free = image_jpeg_free;
    jpeg_CreateDecompress(&info, JPEG_LIB_VERSION, sizeof(info));
    image_jpeg_memory_source(&info, encoded, bytes);
    jpeg_read_header(&info, TRUE);
    jpeg_start_decompress(&info);
    if (info.output_width > jpeg_renderer_max_texture_size ||
        info.output_height > jpeg_renderer_max_texture_size)
    {
        (*jpeg_renderer_print)(2, "WARNING: image '%s' is larger than %i on at least one side\n",
                              name, jpeg_renderer_max_texture_size);
        jpeg_destroy_decompress(&info);
        (*jpeg_renderer_free_file)(encoded);
        return;
    }
    if (info.output_components != 3)
    {
        (*jpeg_renderer_print)(2, "WARNING: jpeg image '%s' is not RGB\n", name);
        jpeg_destroy_decompress(&info);
        (*jpeg_renderer_free_file)(encoded);
        return;
    }
    *width = info.output_width;
    *height = info.output_height;
    *format = 0x15;
    pixels = (unsigned char *)(*jpeg_renderer_temp_alloc)
        (info.output_height * info.output_width * 4);
    *pic = pixels;
    stride = info.output_width * 4;
    *file = encoded;
    while (info.output_scanline < info.output_height)
    {
        row = pixels;
        jpeg_read_scanlines(&info, &row, 1);
        for (column = (int)info.output_width - 1; column >= 0; column -= 1)
        {
            pixels[column * 4 + 3] = 0xff;
            pixels[column * 4 + 2] = pixels[column * info.output_components + 2];
            pixels[column * 4 + 1] = pixels[column * info.output_components + 1];
            pixels[column * 4] = pixels[column * info.output_components];
        }
        pixels += stride;
    }
    jpeg_finish_decompress(&info);
    jpeg_destroy_decompress(&info);
}
