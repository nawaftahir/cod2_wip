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

/* Research prefix only: never allocate this as a complete engine image. */
typedef struct GfxImagePrefix
{
    int mapType;
    void *texture;
    byte picmip[2];
    byte semantic;
    byte noPicmip;
    byte track;
    int cardMemory[2];
    unsigned short width;
    unsigned short height;
    unsigned short depth;
} GfxImagePrefix;

typedef struct GfxImageFileHeader
{
    char tag[3];
    byte version;
    byte format;
    byte flags;
    short dimensions[3];
    int fileSizeForPicmip[4];
} GfxImageFileHeader;

#endif
