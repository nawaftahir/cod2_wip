#include <assert.h>
#include <stddef.h>
#include <string.h>
#ifndef WAVELET_SOURCE
#define WAVELET_SOURCE "scratch/wavelet_reference/j_wavelet.c"
#endif
#include WAVELET_SOURCE

/* Synthetic tables only; not retail compressed-image fixtures. */
const WaveletHuffmanDecode waveletDecodeBlue[4096] = {{0, 0}};
const WaveletHuffmanDecode waveletDecodeRedGreen[4096] = {{0, 0}};
#ifdef WAVELET_DELTA_TEST
const WaveletHuffmanDecode waveletDecodeAlpha[4096] = {{1, 1}};
#else
const WaveletHuffmanDecode waveletDecodeAlpha[4096] = {{0, 0}};
#endif

int main(void)
{
    WaveletDecode decode;
    byte input[12] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    byte output[18];
    int i;

    assert(offsetof(WaveletDecode, data) == 4);
    assert(offsetof(WaveletDecode, width) == 8);
    assert(offsetof(WaveletDecode, channels) == 16);
    assert(offsetof(WaveletDecode, bpp) == 20);
    assert(offsetof(WaveletDecode, mipLevel) == 24);
    assert(offsetof(WaveletDecode, dataInitialized) == 28);
    assert(sizeof(WaveletHuffmanDecode) == 4);
    memset(&decode, 0, sizeof(decode));
    memset(output, 0x55, sizeof(output));
    decode.data = input;
    decode.width = 1;
    decode.height = 4;
    decode.channels = 3;
    decode.bpp = 4;
    Wavelet_DecompressLevel(0, output + 1, &decode);
    assert(output[0] == 0x55 && output[17] == 0x55);
    assert(decode.data == input + 12 && !decode.dataInitialized);
    for (i = 0; i < 4; i += 1)
    {
        assert(memcmp(output + 1 + i * 4, input + i * 3, 3) == 0);
        assert(output[4 + i * 4] == 255);
    }
    memset(&decode, 0, sizeof(decode));
    decode.data = input;
    decode.width = 4;
    decode.height = 1;
    decode.channels = 1;
    decode.bpp = 1;
    Wavelet_DecompressLevel(0, output, &decode);
    assert(memcmp(output, input, 4) == 0 && decode.data == input + 4);
#ifdef WAVELET_CLUSTER_TEST
    {
        WaveletHuffmanDecode table[4096];
        byte bits[8] = {0};

        memset(table, 0, sizeof(table));
        memset(&decode, 0, sizeof(decode));
        table[0].value = 42;
        table[0].bits = 3;
        decode.data = bits;
        assert(Wavelet_DecodeValue(&decode, table, 9, 255) == 42);
        assert(decode.bit == 3 && decode.data == bits && decode.value == 0);
        table[0].value = -32768;
        decode.bit = 0;
        assert(Wavelet_DecodeValue(&decode, table, 9, 255) == -255);
        assert(decode.bit == 4 && decode.data == bits + 1 && decode.value == 0);
        decode.data = bits;
        decode.bit = 7;
        assert(Wavelet_DecodeValue(&decode, table, 10, 510) == -510);
        assert(decode.bit == 4 && decode.data == bits + 2 && decode.value == 0);
    }
#endif
#ifdef WAVELET_DELTA_TEST
    {
        byte bits[8] = {0};
        byte pixels[10] = {77, 10, 20, 30, 99, 40, 50, 60, 88, 77};
        byte single[5] = {77, 251, 255, 0, 77};

        memset(&decode, 0, sizeof(decode));
        decode.data = bits;
        decode.channels = 3;
        decode.bpp = 4;
        Wavelet_ApplyDelta(pixels + 1, &decode, 2);
        assert(pixels[0] == 77 && pixels[9] == 77);
        assert(pixels[1] == 11 && pixels[2] == 21 && pixels[3] == 31);
        assert(pixels[5] == 41 && pixels[6] == 51 && pixels[7] == 61);
        assert(pixels[4] == 255 && pixels[8] == 255);
        assert(decode.bit == 6 && decode.data == bits);
        memset(&decode, 0, sizeof(decode));
        decode.data = bits;
        decode.channels = 1;
        decode.bpp = 1;
        Wavelet_ApplyDelta(single + 1, &decode, 3);
        assert(single[0] == 77 && single[4] == 77);
        assert(single[1] == 252 && single[2] == 0 && single[3] == 1);
        assert(decode.bit == 3 && decode.data == bits);
    }
#endif
    return 0;
}
