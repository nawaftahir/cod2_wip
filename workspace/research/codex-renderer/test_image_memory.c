#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_memory_family/j_wavelet.c"
#endif
#define IMAGE_MEMORY_SOURCE
#define main create_fixture_main
#include "test_image_create.c"
#undef main

int image_card_memory[2];

#ifndef MEMORY_TEST_ENTRY
#define MEMORY_TEST_ENTRY main
#endif
int MEMORY_TEST_ENTRY(void)
{
    int track;
    int before[2];

    assert(create_fixture_main() == 0);
    assert(Image_GetMipMemoryAmount(0x15, 8, 4, 2) == 256);
    assert(Image_GetMipMemoryAmount(0x33, 8, 4, 2) == 128);
    assert(Image_GetMipMemoryAmount(0x32, 8, 4, 2) == 64);
    assert(Image_GetMipMemoryAmount(0x31545844, 5, 3, 2) == 32);
    assert(Image_GetMipMemoryAmount(0x33545844, 5, 3, 2) == 64);
    assert(Image_GetMipMemoryAmount(0x35545844, 1, 1, 1) == 16);
    assert(Image_GetMipMemoryAmount(0, 8, 4, 2) == 0);
    assert(Image_GetCardMemoryAmount(0, 0x32, 8, 4, 2) == 75);
    assert(Image_GetCardMemoryAmount(2, 0x32, 8, 4, 2) == 64);
    assert(Image_GetCardMemoryAmount(6, 0x32, 8, 4, 2) == 384);
    assert(Image_GetCardMemoryAmount(0, 0x31545844, 1, 1, 1) == 8);
    image.picmip[0] = 1;
    image.picmip[1] = 3;
    for (track = 0; track < 256; track += 1)
    {
        image.track = (byte)track;
        before[0] = image_card_memory[0];
        before[1] = image_card_memory[1];
        Image_TrackTexture(&image, 0, 0x32, 8, 4, 2);
        assert(image.cardMemory[0] == 11 && image.cardMemory[1] == 1);
        assert(image_card_memory[0] == before[0] + ((track > 1 && track != 4) ? 11 : 0));
        assert(image_card_memory[1] == before[1] + ((track > 1 && track != 4) ? 1 : 0));
    }
    Image_TrackTexture(&image, 3, 0x32, 8, 4, 2);
    assert(image.cardMemory[0] == 64 && image.cardMemory[1] == 64);
    Image_TrackTexture(&image, 4, 0x32, 8, 4, 2);
    assert(image.cardMemory[0] == 66 && image.cardMemory[1] == 6);
    return 0;
}
