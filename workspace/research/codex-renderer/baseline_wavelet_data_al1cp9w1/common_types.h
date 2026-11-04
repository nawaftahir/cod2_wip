#ifndef CODEX_WAVELET_TYPES_H
#define CODEX_WAVELET_TYPES_H

typedef unsigned char byte;

typedef struct WaveletDecode
{
    unsigned short value;
    unsigned short bit;
    const byte *data;
    int width;
    int height;
    int channels;
    int bpp;
    int mipLevel;
    unsigned char dataInitialized;
} WaveletDecode;

typedef struct WaveletHuffmanDecode
{
    short value;
    short bits;
} WaveletHuffmanDecode;

#endif
