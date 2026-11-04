// Same type tokens as the reference type header; PC layout pinned from loads.
#pragma once
struct WaveletDecode {
    short unsigned int value;
    short unsigned int bit;
    const byte *data;
    int width;
    int height;
    int channels;
    int bpp;
    int mipLevel;
    Bool dataInitialized;
};
