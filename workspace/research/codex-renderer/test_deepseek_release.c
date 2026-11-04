#define main builtin_fixture_main
#include "scratch/deepseek_image_1/test_image_builtin.c"
#undef main

static int release_calls;

static unsigned long __stdcall release_texture(void *texture)
{
    assert(texture == texture_object);
    release_calls += 1;
    return 0;
}

int main(void)
{
    GfxImagePrefix image;
    int tracks[5] = {0, 1, 4, 2, 255};
    int i;

    assert(builtin_fixture_main() == 0);
    texture_vtable[2] = (void *)release_texture;
    for (i = 0; i < 5; i += 1)
    {
        memset(&image, 0, sizeof(image));
        image.track = (byte)tracks[i];
        image.mapType = 3;
        image.texture = texture_object;
        image.cardMemory[0] = 7;
        image.cardMemory[1] = 9;
        image_card_memory[0] = 100;
        image_card_memory[1] = 200;
        Image_Release(&image);
        assert(image.texture == 0 && image.mapType == 0);
        assert(image.cardMemory[0] == 0 && image.cardMemory[1] == 0);
        assert(image_card_memory[0] == (i < 3 ? 100 : 93));
        assert(image_card_memory[1] == (i < 3 ? 200 : 191));
        image.mapType = 4;
        image.cardMemory[0] = 7;
        image.cardMemory[1] = 9;
        Image_Release(&image);
        assert(image.mapType == 0 && image.cardMemory[0] == 7);
        assert(image.cardMemory[1] == 9);
        assert(image_card_memory[0] == (i < 3 ? 100 : 86));
        assert(image_card_memory[1] == (i < 3 ? 200 : 182));
    }
    assert(release_calls == 5);
    return 0;
}
