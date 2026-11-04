#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_bitmap_loader/j_wavelet.c"
#endif
#define IMAGE_BITMAP_SOURCE
#define IMAGE_DXT_SOURCE
#define ALL_UPLOAD_TEST_ENTRY all_upload_fixture_main
#include "test_image_all_upload.c"

static byte conversion[18];
static byte bitmap_output[32];
static void *bitmap_slots[21];
static void **bitmap_vtable = bitmap_slots;
static int allocations, frees, bitmap_uploads, bitmap_format;

static void *allocate_bitmap(int bytes)
{
    assert(bytes == 16);
    memset(conversion, 0xcc, sizeof(conversion));
    allocations += 1;
    return conversion + 1;
}

static void free_bitmap(void *buffer)
{
    assert(buffer == conversion + 1);
    assert(conversion[0] == 0xcc && conversion[17] == 0xcc);
    frees += 1;
}

static int __stdcall create_bitmap(void *dev, unsigned int w, unsigned int h,
    unsigned int levels, unsigned int usage, int format, int pool, void **out, void *shared)
{
    assert(w == 2 && h == 2 && levels == 1 && usage == 0 && pool == 1);
    assert(format == bitmap_format && !shared);
    *out = &bitmap_vtable;
    return 0;
}

static int __stdcall bitmap_lock(void *texture, unsigned int mip,
    ImageLockedRect *locked, const void *rect, unsigned int flags)
{
    assert(mip == 0 && !rect && !flags);
    locked->pitch = 12;
    locked->bits = bitmap_output;
    image_upload_retry = 0;
    return 0;
}

static int __stdcall bitmap_unlock(void *texture, unsigned int mip)
{
    assert(mip == 0);
    bitmap_uploads += 1;
    return 0;
}

#ifndef BITMAP_TEST_ENTRY
#define BITMAP_TEST_ENTRY main
#endif
int BITMAP_TEST_ENTRY(void)
{
    GfxImageFileHeader header;
    byte bgr[12] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    byte bgra[16] = {1, 2, 3, 255, 4, 5, 6, 255, 7, 8, 9, 255, 10, 11, 12, 255};

    assert(all_upload_fixture_main() == 0);
    ri_hunk_allocate = allocate_bitmap;
    ri_hunk_free = free_bitmap;
    slots[23] = (void *)create_bitmap;
    bitmap_slots[19] = (void *)bitmap_lock;
    bitmap_slots[20] = (void *)bitmap_unlock;
    memset(&header, 0, sizeof(header));
    header.flags = 2;
    header.dimensions[0] = 2; header.dimensions[1] = 2; header.dimensions[2] = 1;
    header.format = 2;
    bitmap_format = 0x16;
    memset(bitmap_output, 0xcc, sizeof(bitmap_output));
    Image_LoadFromData(&image, &header, bgr);
    assert(allocations == 1 && frees == 1 && bitmap_uploads == 1);
    assert(memcmp(bitmap_output, bgra, 8) == 0);
    assert(memcmp(bitmap_output + 12, bgra + 8, 8) == 0);
    assert(bitmap_output[8] == 0xcc && bitmap_output[20] == 0xcc);
    header.format = 1;
    bitmap_format = 0x15;
    memset(bitmap_output, 0xcc, sizeof(bitmap_output));
    Image_LoadFromData(&image, &header, bgra);
    assert(allocations == 1 && frees == 1 && bitmap_uploads == 2);
    assert(memcmp(bitmap_output, bgra, 8) == 0);
    assert(memcmp(bitmap_output + 12, bgra + 8, 8) == 0);
    return 0;
}
