#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_all_upload/j_wavelet.c"
#endif
#define IMAGE_ALL_UPLOAD_SOURCE
#define VOLUME_TEST_ENTRY volume_fixture_main
#include "test_image_volume.c"

static int selected_face;

static int __stdcall lock_rect(void *texture, unsigned int mip,
    ImageLockedRect *locked, const void *rect, unsigned int flags)
{
    assert(texture == image.texture && mip == expected_mip && !rect && !flags);
    lock_calls += 1;
    locked->pitch = 4;
    locked->bits = volume_data;
    image_upload_retry = lock_calls == 1;
    return 0;
}

static int __stdcall unlock_rect(void *texture, unsigned int mip)
{
    assert(texture == image.texture && mip == expected_mip);
    unlock_calls += 1;
    image_upload_retry = unlock_calls == 1;
    return 0;
}

static int __stdcall lock_cube(void *texture, int face, unsigned int mip,
    ImageLockedRect *locked, const void *rect, unsigned int flags)
{
    assert(face == selected_face);
    return lock_rect(texture, mip, locked, rect, flags);
}

static int __stdcall unlock_cube(void *texture, int face, unsigned int mip)
{
    assert(face == selected_face);
    return unlock_rect(texture, mip);
}

#ifndef ALL_UPLOAD_TEST_ENTRY
#define ALL_UPLOAD_TEST_ENTRY main
#endif
int ALL_UPLOAD_TEST_ENTRY(void)
{
    static void *rect_slots[21];
    static void **rect_vtable = rect_slots;
    byte pixels[6] = {1, 2, 3, 4, 5, 6};
    char log_text[2048];
    size_t size;
    int face;

    assert(volume_fixture_main() == 0);
    assert(sizeof(ImageLockedRect) == 8 && offsetof(ImageLockedRect, bits) == 4);
    image.texture = &rect_vtable;
    image.width = 3; image.height = 2; image.depth = 1;
    expected_mip = 0;
    image_upload_log = tmpfile();
    assert(image_upload_log);
    debug_value[2] = 1;
    for (face = -1; face < 6; face += 1)
    {
        selected_face = face;
        image.mapType = face < 0 ? 3 : 5;
        rect_slots[19] = face < 0 ? (void *)lock_rect : (void *)lock_cube;
        rect_slots[20] = face < 0 ? (void *)unlock_rect : (void *)unlock_cube;
        memset(volume_data, 0xcc, sizeof(volume_data));
        lock_calls = 0; unlock_calls = 0;
        Image_Upload2D_CopyData_PC(&image, 0x32, face, 0, pixels);
        assert(lock_calls == 2 && unlock_calls == 2);
        assert(memcmp(volume_data, pixels, 3) == 0);
        assert(memcmp(volume_data + 4, pixels + 3, 3) == 0);
        assert(volume_data[3] == 0xcc && volume_data[7] == 0xcc);
    }
    rewind(image_upload_log);
    size = fread(log_text, 1, sizeof(log_text) - 1, image_upload_log);
    log_text[size] = 0;
    assert(strstr(log_text, "image->texture.map->LockRect"));
    assert(strstr(log_text, "image->texture.map->UnlockRect"));
    assert(strstr(log_text, "image->texture.cubemap->LockRect"));
    assert(strstr(log_text, "image->texture.cubemap->UnlockRect"));
    fclose(image_upload_log);
    image_upload_log = 0;
    debug_value[2] = 0;
    return 0;
}
