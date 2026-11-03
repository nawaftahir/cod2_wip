// Renderer JPEG input and output using the original IJG dependency.
#include "r_local.h"
#include <stdio.h>
#define INT32 JpegInt32
extern "C" {
#include "../jpeg-6b/jpeglib.h"
}
#undef INT32
#include <stddef.h>

struct JpegMemoryDestination
{
    jpeg_destination_mgr pub;
    byte *buffer;
    size_t size;
};

static int hackSize;

typedef char jpegLayoutCheck[(sizeof(jpeg_compress_struct) == 368 &&
    sizeof(jpeg_decompress_struct) == 440 && sizeof(jpeg_error_mgr) == 140 &&
    sizeof(JpegMemoryDestination) == 28 &&
    offsetof(jpeg_compress_struct, alloc) == 0x18 &&
    offsetof(jpeg_compress_struct, dest) == 0x20 &&
    offsetof(jpeg_compress_struct, image_width) == 0x24 &&
    offsetof(jpeg_compress_struct, next_scanline) == 0xd8 &&
    offsetof(jpeg_error_mgr, exit) == 0x84 && offsetof(jpeg_error_mgr, printf) == 0x88) ? 1 : -1];

// PINNED 10014580: reuse the fixed output buffer without another allocation.
static void init_destination(j_compress_ptr cinfo)
{
    JpegMemoryDestination *dest = (JpegMemoryDestination *)cinfo->dest;
    dest->pub.next_output_byte = dest->buffer;
    dest->pub.free_in_buffer = dest->size;
}

// PINNED 100145a0: the original callback does not replenish an exhausted buffer.
static boolean empty_output_buffer(j_compress_ptr cinfo)
{
    return TRUE;
}

static void term_destination(j_compress_ptr cinfo)
{
    JpegMemoryDestination *dest = (JpegMemoryDestination *)cinfo->dest;
    hackSize = (int)(dest->size - dest->pub.free_in_buffer);
}

static void *Z_MallocJpeg(size_t size)
{
    return ri.Z_MallocInternal(size);
}

static void Z_FreeJpeg(void *pointer, size_t size)
{
    ri.Z_FreeInternal(pointer);
}

static void ExitJpeg()
{
    ri.Error(ERR_FATAL, "jpeg internal error");
}

static void PrintfJpeg(char *message)
{
    ri.Printf(0, "%s\n", message);
}

// PINNED 100145d0/62; helper name unconfirmed.
void jpeg_memory_dest(j_compress_ptr cinfo, byte *buffer, size_t size)
{
    if (!cinfo->dest)
        cinfo->dest = (jpeg_destination_mgr *)(*cinfo->mem->alloc_small)((j_common_ptr)cinfo,
            JPOOL_PERMANENT, sizeof(JpegMemoryDestination));
    JpegMemoryDestination *dest = (JpegMemoryDestination *)cinfo->dest;
    dest->pub.init_destination = init_destination;
    dest->pub.empty_output_buffer = empty_output_buffer;
    dest->pub.term_destination = term_destination;
    dest->buffer = buffer;
    dest->size = size;
}

// PINNED 10014670/713: release the temporary output before destroying the codec.
void R_SaveJpg(const char *filename, int quality, int width, int height, byte *pixels)
{
    jpeg_compress_struct cinfo;
    jpeg_error_mgr error;
    cinfo.err = jpeg_std_error(&error, ExitJpeg, PrintfJpeg);
    cinfo.alloc.malloc = Z_MallocJpeg;
    cinfo.alloc.free = Z_FreeJpeg;
    jpeg_create_compress(&cinfo);
    int size = width * height * 3;
    byte *output = (byte *)ri.Hunk_AllocateTempMemoryInternal(size);
    jpeg_memory_dest(&cinfo, output, size);
    cinfo.image_width = width;
    cinfo.image_height = height;
    cinfo.input_components = 3;
    cinfo.in_color_space = JCS_RGB;
    jpeg_set_defaults(&cinfo);
    jpeg_set_quality(&cinfo, quality, TRUE);
    jpeg_start_compress(&cinfo, TRUE);
    int stride = width * 3;
    while (cinfo.next_scanline < cinfo.image_height)
    {
        JSAMPROW row = pixels + cinfo.next_scanline * stride;
        jpeg_write_scanlines(&cinfo, &row, 1);
    }
    jpeg_finish_compress(&cinfo);
    ri.FS_WriteFile(filename, output, hackSize);
    ri.Hunk_FreeTempMemory(output);
    jpeg_destroy_compress(&cinfo);
}

// PINNED 10014940/785: the successful caller owns both returned allocations.
void R_LoadJpg(const char *filename, byte **file, byte **pixels,
    int *width, int *height, D3DFORMAT *format)
{
    byte *input;
    int size = ri.FS_ReadFile(filename, (void **)&input);
    if (!input)
        return;
    jpeg_decompress_struct cinfo;
    jpeg_error_mgr error;
    cinfo.err = jpeg_std_error(&error, ExitJpeg, PrintfJpeg);
    cinfo.alloc.malloc = Z_MallocJpeg;
    cinfo.alloc.free = Z_FreeJpeg;
    jpeg_create_decompress(&cinfo);
    jpeg_memory_src(&cinfo, input, size);
    jpeg_read_header(&cinfo, TRUE);
    jpeg_start_decompress(&cinfo);
    if (cinfo.output_width > (unsigned int)vidConfig.maxTextureSize ||
        cinfo.output_height > (unsigned int)vidConfig.maxTextureSize)
    {
        ri.Printf(2, "WARNING: image '%s' is larger than %i on at least one side\n",
            filename, vidConfig.maxTextureSize);
        jpeg_destroy_decompress(&cinfo);
        ri.FS_FreeFile(input);
        return;
    }
    if (cinfo.output_components != 3)
    {
        ri.Printf(2, "WARNING: jpeg image '%s' is not RGB\n", filename);
        jpeg_destroy_decompress(&cinfo);
        ri.FS_FreeFile(input);
        return;
    }
    *width = cinfo.output_width;
    *height = cinfo.output_height;
    *format = D3DFMT_A8R8G8B8;
    byte *output = (byte *)ri.Hunk_AllocateTempMemoryInternal(cinfo.output_width * cinfo.output_height * 4);
    *pixels = output;
    int stride = cinfo.output_width * 4;
    *file = input;
    while (cinfo.output_scanline < cinfo.output_height)
    {
        JSAMPROW row = output;
        jpeg_read_scanlines(&cinfo, &row, 1);
        for (int x = cinfo.output_width - 1; x >= 0; --x)
        {
            output[x * 4 + 3] = 255;
            output[x * 4 + 2] = output[x * cinfo.output_components + 2];
            output[x * 4 + 1] = output[x * cinfo.output_components + 1];
            output[x * 4] = output[x * cinfo.output_components];
        }
        output += stride;
    }
    jpeg_finish_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
}
