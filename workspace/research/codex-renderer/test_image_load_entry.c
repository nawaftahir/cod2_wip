#define IMAGE_CREATE_SOURCE "scratch/wavelet_load_entry/j_wavelet.c"
#define ALLOC_TEST_ENTRY alloc_fixture_main
#include "test_image_alloc.c"

static int builtins;

GfxImagePrefix *Image_LoadBuiltin(const char *name, int semantic, int track)
{
    assert(strcmp(name, "$white") == 0 && semantic == 7 && track == 9);
    builtins += 1;
    return &image;
}

int main(void)
{
    GfxImagePrefix *loaded;
    int i, registered;

    assert(alloc_fixture_main() == 0);
    assert(Image_Load("$white", 7, 9) == &image && builtins == 1);
    memset(image_registry, 0, sizeof(image_registry));
    file_length = sizeof(image_file);
    bitmap_format = 0x16;
    loaded = Image_Load("test image", 0, 4);
    assert(loaded && loaded->texture && loaded->category == 3);
    assert(loaded->semantic == 0 && loaded->track == 4);
    assert(strcmp(loaded->name, "test image") == 0);
    assert(requested == 47);
    file_length = -1;
    assert(Image_Load("test image", 0, 4) == 0);
    registered = 0;
    for (i = 0; i < 2048; i += 1)
    {
        if (image_registry[i]) registered += 1;
    }
    assert(registered == 2);
    return 0;
}
