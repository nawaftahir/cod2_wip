// PC 1.0 wavelet decoder; names from references, layouts from the anchor.
#include "gfx.h"
#include "r_image_wavelet_tables.h"

static void Wavelet_ConsumeBits(unsigned short bitCount, WaveletDecode *decode)
{
    decode->value >>= bitCount;
    unsigned int bytes = (((unsigned int)decode->data[3] << 8 | decode->data[2]) << 8 | decode->data[1]) << 8 | decode->data[0];
    decode->value |= bytes >> decode->bit << (16 - bitCount);
    decode->bit += bitCount;
    decode->data += decode->bit >> 3;
    decode->bit &= 7;
}

static int Wavelet_DecodeValue(const WaveletHuffmanDecode *table, unsigned short bitCount,
    int bias, WaveletDecode *decode)
{
    int index = decode->value & 0xfff;
    Wavelet_ConsumeBits(table[index].bits, decode);
    int value = table[index].value;
    if (value == -32768)
    {
        value = (decode->value & ((1 << bitCount) - 1)) - bias;
        Wavelet_ConsumeBits(bitCount, decode);
    }
    return value;
}

static void Wavelet_AddDeltaToMipmap(byte *inout, int size, WaveletDecode *decode)
{
    int index = 0;
    if (decode->channels == decode->bpp)
    {
        int remaining = size * decode->channels;
        do
        {
            int delta = Wavelet_DecodeValue(waveletDecodeAlpha, 9, 255, decode);
            *inout += delta;
            ++inout;
        } while (--remaining);
    }
    else
    {
        do
        {
            int remaining = decode->channels;
            do
            {
                int delta = Wavelet_DecodeValue(waveletDecodeAlpha, 9, 255, decode);
                inout[index] += delta;
                ++index;
            } while (--remaining);
            inout[index++] = 255;
        } while (--size);
    }
}

// PINNED: decode fields value/bit/data 0/2/4, dimensions 8/c, channels/bpp 10/14.
void Wavelet_DecompressLevel(byte *src, byte *dst, WaveletDecode *decode)
{
    int coeff[4][3];
    int parity;
    int base;
    int w = decode->width >> decode->mipLevel;
    int h = decode->height >> decode->mipLevel;
    if (w > 1 && h > 1)
    {
        if (!decode->dataInitialized)
        {
            decode->value = decode->data[0] | decode->data[1] << 8;
            decode->bit = 0;
            decode->data += 2;
            decode->dataInitialized = 1;
        }
        int bpp = decode->bpp;
        int stride = w * bpp;
        int alpha0 = bpp - 1;
        int alpha1 = 2 * bpp - 1;
        bool needsMipDelta = (decode->value & 1) != 0;
        Wavelet_ConsumeBits(1, decode);
        if (needsMipDelta)
            Wavelet_AddDeltaToMipmap(src, w * h / 4, decode);
        for (int y = 0; y < h; y += 2)
        {
            for (int x = 0; x < w; x += 2)
            {
                if (decode->channels != 1)
                {
                    parity = decode->value & 1;
                    Wavelet_ConsumeBits(1, decode);
                    coeff[0][0] = Wavelet_DecodeValue(waveletDecodeBlue, 9, 255, decode);
                    coeff[0][1] = Wavelet_DecodeValue(waveletDecodeBlue, 9, 255, decode);
                    coeff[0][2] = Wavelet_DecodeValue(waveletDecodeBlue, 9, 255, decode);
                    base = 2 * src[0];
                    dst[0] = (byte)(parity + ((coeff[0][2] + coeff[0][1] + coeff[0][0] + base) >> 1));
                    dst[bpp] = (byte)((coeff[0][0] + base - (coeff[0][2] + coeff[0][1])) >> 1);
                    dst[stride] = (byte)((coeff[0][1] - coeff[0][2] + base - coeff[0][0]) >> 1);
                    dst[stride + bpp] = (byte)((base - coeff[0][0] - (coeff[0][1] - coeff[0][2])) >> 1);
                    if (decode->channels >= 3)
                    {
                        parity = decode->value & 1;
                        Wavelet_ConsumeBits(1, decode);
                        coeff[1][0] = coeff[0][0] + Wavelet_DecodeValue(waveletDecodeRedGreen, 10, 510, decode);
                        coeff[1][1] = coeff[0][1] + Wavelet_DecodeValue(waveletDecodeRedGreen, 10, 510, decode);
                        coeff[1][2] = coeff[0][2] + Wavelet_DecodeValue(waveletDecodeRedGreen, 10, 510, decode);
                        base = 2 * src[1];
                        dst[1] = (byte)(parity + ((coeff[1][2] + coeff[1][1] + coeff[1][0] + base) >> 1));
                        dst[bpp + 1] = (byte)((coeff[1][0] + base - (coeff[1][2] + coeff[1][1])) >> 1);
                        dst[stride + 1] = (byte)((coeff[1][1] - coeff[1][2] + base - coeff[1][0]) >> 1);
                        dst[stride + bpp + 1] = (byte)((base - coeff[1][0] - (coeff[1][1] - coeff[1][2])) >> 1);
                        parity = decode->value & 1;
                        Wavelet_ConsumeBits(1, decode);
                        coeff[2][0] = coeff[0][0] + Wavelet_DecodeValue(waveletDecodeRedGreen, 10, 510, decode);
                        coeff[2][1] = coeff[0][1] + Wavelet_DecodeValue(waveletDecodeRedGreen, 10, 510, decode);
                        coeff[2][2] = coeff[0][2] + Wavelet_DecodeValue(waveletDecodeRedGreen, 10, 510, decode);
                        base = 2 * src[2];
                        dst[2] = (byte)(parity + ((coeff[2][2] + coeff[2][1] + coeff[2][0] + base) >> 1));
                        dst[bpp + 2] = (byte)((coeff[2][0] + base - (coeff[2][2] + coeff[2][1])) >> 1);
                        dst[stride + 2] = (byte)((coeff[2][1] - coeff[2][2] + base - coeff[2][0]) >> 1);
                        dst[stride + bpp + 2] = (byte)((base - coeff[2][0] - (coeff[2][1] - coeff[2][2])) >> 1);
                    }
                }
                if (decode->channels != 3)
                {
                    parity = decode->value & 1;
                    Wavelet_ConsumeBits(1, decode);
                    coeff[3][0] = Wavelet_DecodeValue(waveletDecodeAlpha, 9, 255, decode);
                    coeff[3][1] = Wavelet_DecodeValue(waveletDecodeAlpha, 9, 255, decode);
                    coeff[3][2] = Wavelet_DecodeValue(waveletDecodeAlpha, 9, 255, decode);
                    base = 2 * src[alpha0];
                    dst[alpha0] = (byte)(parity + ((coeff[3][2] + coeff[3][1] + coeff[3][0] + base) >> 1));
                    dst[alpha1] = (byte)((coeff[3][0] + base - (coeff[3][2] + coeff[3][1])) >> 1);
                    dst[stride + alpha0] = (byte)((coeff[3][1] - coeff[3][2] + base - coeff[3][0]) >> 1);
                    dst[stride + alpha1] = (byte)((base - coeff[3][0] - (coeff[3][1] - coeff[3][2])) >> 1);
                }
                else if (decode->channels != decode->bpp)
                {
                    dst[alpha0] = 255;
                    dst[alpha1] = 255;
                    dst[stride + alpha0] = 255;
                    dst[stride + alpha1] = 255;
                }
                src += bpp;
                dst += 2 * bpp;
            }
            dst += stride;
        }
    }
    else
    {
        if (w < 1) w = 1;
        if (h < 1) h = 1;
        // PINNED PC small-mip bound is w+h-1, not the CoD4 reference's product.
        int size = w + h - 1;
        do
        {
            for (int channel = 0; channel < decode->channels; ++channel)
                *dst++ = *decode->data++;
            if (decode->bpp != decode->channels)
                *dst++ = 255;
        } while (--size);
    }
}
