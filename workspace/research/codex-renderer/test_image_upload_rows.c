#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_upload_helpers/j_wavelet.c"
#endif
#define MEMORY_TEST_ENTRY memory_fixture_main
#include "test_image_memory.c"

int main(void)
{
    byte source[256];
    byte destination[256];
    int i, row;

    assert(memory_fixture_main() == 0);
    for (i = 0; i < 256; i += 1)
    {
        source[i] = (byte)i;
    }
    memset(destination, 0xcc, sizeof(destination));
    Image_CopyUploadRows(0x32, 3, 5, source, 8, destination);
    for (row = 0; row < 5; row += 1)
    {
        assert(memcmp(destination + row * 8, source + row * 3, 3) == 0);
        assert(destination[row * 8 + 3] == 0xcc);
    }
    memset(destination, 0xcc, sizeof(destination));
    Image_CopyUploadRows(0x31545844, 5, 5, source, 24, destination);
    assert(memcmp(destination, source, 16) == 0);
    assert(memcmp(destination + 24, source + 16, 16) == 0);
    assert(destination[16] == 0xcc && destination[40] == 0xcc);
    memset(destination, 0xcc, sizeof(destination));
    Image_CopyUploadRows(0x35545844, 5, 5, source, 32, destination);
    assert(memcmp(destination, source, 64) == 0 && destination[64] == 0xcc);
    memset(destination, 0xcc, sizeof(destination));
    Image_CopyUploadRows(0x16, 3, 2, source, 12, destination);
    assert(memcmp(destination, source, 24) == 0 && destination[24] == 0xcc);
    assert(Image_SourceSliceSize(0x16, 3, 2) == 18);
    assert(Image_SourceSliceSize(0x15, 3, 2) == 24);
    assert(Image_SourceSliceSize(0x31545844, 5, 5) == 32);
    assert(Image_SourceSliceSize(0x33545844, 5, 5) == 64);
    memset(destination, 0xcc, sizeof(destination));
    Image_CopyUploadRows(0, 3, 2, source, 12, destination);
    for (i = 0; i < 256; i += 1)
    {
        assert(destination[i] == 0xcc);
    }
    return 0;
}
