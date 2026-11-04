#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_volume_upload/j_wavelet.c"
#endif
#define IMAGE_VOLUME_SOURCE
#define MEMORY_TEST_ENTRY memory_fixture_main
#include "test_image_memory.c"

static int debug_value[3];
int *image_upload_debug = debug_value;
FILE *image_upload_log;
int image_upload_retry;
static byte volume_data[64];
static int lock_calls, unlock_calls;
static unsigned int expected_mip;

static int __stdcall lock_volume(void *texture, unsigned int mip,
    ImageLockedBox *locked, const void *box, unsigned int flags)
{
    assert(texture == image.texture && mip == expected_mip && !box && !flags);
    lock_calls += 1;
    locked->rowPitch = 4;
    locked->slicePitch = 16;
    locked->bits = volume_data;
    image_upload_retry = lock_calls == 1;
    return 0;
}

static int __stdcall unlock_volume(void *texture, unsigned int mip)
{
    assert(texture == image.texture && mip == expected_mip);
    unlock_calls += 1;
    image_upload_retry = unlock_calls == 1;
    return 0;
}

#ifndef VOLUME_TEST_ENTRY
#define VOLUME_TEST_ENTRY main
#endif
int VOLUME_TEST_ENTRY(void)
{
    static void *volume_slots[21];
    static void **volume_vtable = volume_slots;
    byte pixels[8] = {1, 2, 3, 4, 5, 6, 7, 8};
    char log_text[512];
    size_t size;

    assert(memory_fixture_main() == 0);
    assert(sizeof(ImageLockedBox) == 12 && offsetof(ImageLockedBox, bits) == 8);
    volume_slots[19] = (void *)lock_volume;
    volume_slots[20] = (void *)unlock_volume;
    image.texture = &volume_vtable;
    image.width = 2; image.height = 2; image.depth = 2;
    memset(volume_data, 0xcc, sizeof(volume_data));
    debug_value[2] = 1;
    image_upload_log = tmpfile();
    assert(image_upload_log);
    Image_Upload3D_CopyData_PC(&image, 0x32, 0, pixels);
    assert(lock_calls == 2 && unlock_calls == 2 && image_upload_retry == 0);
    assert(memcmp(volume_data, pixels, 2) == 0);
    assert(memcmp(volume_data + 4, pixels + 2, 2) == 0);
    assert(memcmp(volume_data + 16, pixels + 4, 2) == 0);
    assert(memcmp(volume_data + 20, pixels + 6, 2) == 0);
    assert(volume_data[2] == 0xcc && volume_data[6] == 0xcc && volume_data[22] == 0xcc);
    rewind(image_upload_log);
    size = fread(log_text, 1, sizeof(log_text) - 1, image_upload_log);
    log_text[size] = 0;
    assert(strstr(log_text, "LockBox( mipLevel, &lockedBox, 0, 0 )\n"));
    assert(strstr(log_text, "UnlockBox( mipLevel )\n"));
    fclose(image_upload_log);
    image_upload_log = 0;
    debug_value[2] = 0;
    lock_calls = 0; unlock_calls = 0;
    expected_mip = 7;
    memset(volume_data, 0xcc, sizeof(volume_data));
    Image_Upload3D_CopyData_PC(&image, 0x32, expected_mip, pixels);
    assert(volume_data[0] == 1 && volume_data[1] == 0xcc);
    assert(lock_calls == 2 && unlock_calls == 2);
    return 0;
}
