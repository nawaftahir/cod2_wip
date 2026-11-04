#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_image_alloc/j_wavelet.c"
#endif
#define RELOAD_TEST_ENTRY reload_fixture_main
#include "test_image_reload.c"

GfxImagePrefix *image_registry[2048];
void *(*ri_image_allocate)(int);
static union
{
    void *alignment;
    byte bytes[128];
} storage;
static int requested;

static void *allocate_image(int bytes)
{
    assert(bytes > 36 && bytes < 128);
    requested = bytes;
    memset(storage.bytes, 0xa5, sizeof(storage.bytes));
    return storage.bytes;
}

#ifndef ALLOC_TEST_ENTRY
#define ALLOC_TEST_ENTRY main
#endif
int ALLOC_TEST_ENTRY(void)
{
    GfxImagePrefix *created;
    char high_name[2] = {(char)255, 0};

    assert(reload_fixture_main() == 0);
    assert(sizeof(GfxImagePrefix) == 36);
    assert(Image_FindEmptySlot("") == 0);
    assert(Image_FindEmptySlot("a") == 1303);
    assert(Image_FindEmptySlot(high_name) == 1929);
    image_registry[1303] = &image;
    image_registry[1304] = &image;
    assert(Image_FindEmptySlot("a") == 1305);
    ri_image_allocate = allocate_image;
    created = Image_Alloc("a", 257, -1, 260);
    assert(requested == 38 && created == (GfxImagePrefix *)storage.bytes);
    assert(created->name == (char *)storage.bytes + 36 && strcmp(created->name, "a") == 0);
    assert(created->category == 1 && created->semantic == 255 && created->track == 4);
    assert(image_registry[1305] == created && storage.bytes[38] == 0xa5);
    assert((unsigned int)created->mapType == 0xa5a5a5a5U);
    return 0;
}
