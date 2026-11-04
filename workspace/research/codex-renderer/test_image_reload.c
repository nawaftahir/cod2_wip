#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_reload_group/j_wavelet.c"
#endif
#define IMAGE_RELOAD_ERROR
#define PATH_TEST_ENTRY path_fixture_main
#include "test_image_path_formatter.c"

static int released;

static unsigned int __stdcall release_texture(void *texture)
{
    assert(texture == image.texture);
    released += 1;
    return 0;
}

#ifndef RELOAD_TEST_ENTRY
#define RELOAD_TEST_ENTRY main
#endif
int RELOAD_TEST_ENTRY(void)
{
    assert(path_fixture_main() == 0);
    bitmap_slots[2] = (void *)release_texture;
    image.track = 2;
    image.cardMemory[0] = 16; image.cardMemory[1] = 4;
    image_card_memory[0] = 100; image_card_memory[1] = 200;
    Image_Release(&image);
    assert(released == 1 && !image.texture && image.mapType == 0);
    assert(image.cardMemory[0] == 0 && image.cardMemory[1] == 0);
    assert(image_card_memory[0] == 84 && image_card_memory[1] == 196);
    image.track = 4;
    image.cardMemory[0] = 7; image.cardMemory[1] = 9;
    Image_Release(&image);
    assert(released == 1 && image.cardMemory[0] == 7 && image.cardMemory[1] == 9);
    assert(image_card_memory[0] == 84 && image_card_memory[1] == 196);
    Image_Reload(&image);
    assert(image.texture && image.mapType == 3 && reload_errors == 0);
    file_length = -1;
    Image_Reload(&image);
    assert(released == 2 && !image.texture && image.mapType == 0 && reload_errors == 1);
    return 0;
}
