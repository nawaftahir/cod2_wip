/* ASM dump from: r_image_wavelet.cpp */
/* Original path: /Users/kevin/Development/i5works/COD2/Project/PC/gfx_d3d/r_image_wavelet.cpp */

#include "common_types.h"
#include <string.h>
#include <stdio.h>
#include <stdarg.h>

static int Image_SourceSliceSize(int format, int width, int height)
{
    switch (format)
    {
    case 0x15:
    case 0x47:
    case 0x4b:
    case 0x72:
        return width * height * 4;
    case 0x16:
        return width * height * 3;
    case 0x17:
    case 0x33:
    case 0x50:
        return width * height * 2;
    case 0x1c:
    case 0x32:
        return width * height;
    case 0x31545844:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * 8;
    case 0x33545844:
    case 0x35545844:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * 16;
    default:
        return 0;
    }
}

static void Image_CopyUploadRows(int format, int width, int height, const byte *source,
    unsigned int pitch, byte *destination)
{
    unsigned int rowBytes;
    int rowStep;
    int row;

    rowBytes = width;
    switch (format)
    {
    case 0x15:
    case 0x16:
        rowBytes *= 4;
        rowStep = 1;
        break;
    case 0x17:
    case 0x33:
        rowBytes *= 2;
        rowStep = 1;
        break;
    case 0x1c:
    case 0x32:
        rowStep = 1;
        break;
    case 0x31545844:
        rowBytes = ((width + 3) >> 2) * 8;
        rowStep = 4;
        break;
    case 0x33545844:
    case 0x35545844:
        rowBytes = ((width + 3) >> 2) * 16;
        rowStep = 4;
        break;
    default:
        return;
    }
    if (pitch == rowBytes)
    {
        memcpy(destination, source, ((height - 1) / rowStep + 1) * rowBytes);
        return;
    }
    for (row = 0; row < height; row += rowStep)
    {
        memcpy(destination, source, rowBytes);
        destination += pitch;
        source += rowBytes;
    }
}

extern const WaveletHuffmanDecode waveletDecodeBlue[4096]; /* waveletDecodeBlue - in rodata.c */
extern const WaveletHuffmanDecode waveletDecodeRedGreen[4096]; /* waveletDecodeRedGreen - in rodata.c */
extern const WaveletHuffmanDecode waveletDecodeAlpha[4096]; /* waveletDecodeAlpha - in rodata.c */

static void Wavelet_DecompressLevel(byte *src, byte *dst, WaveletDecode *decode);

static unsigned int Wavelet_ReadDword(const byte *p) {
    return p[0] | ((p[1] | ((p[2] | ((unsigned int)p[3] << 8)) << 8)) << 8);
}

static void Wavelet_AdvanceBits(WaveletDecode *decode, int numBits) {
    unsigned short newBit = decode->bit + numBits;
    decode->data += (newBit >> 3);
    decode->bit = newBit & 7;
}

static int Wavelet_ReadBit1(WaveletDecode *decode) {
    unsigned short val = decode->value;
    int bit = val & 1;
    unsigned int dword;

    val >>= 1;
    dword = Wavelet_ReadDword(decode->data);
    dword >>= decode->bit;
    dword <<= 15;
    val |= (unsigned short)dword;
    decode->value = val;
    Wavelet_AdvanceBits(decode, 1);
    return bit;
}

static void Wavelet_ReadBits(WaveletDecode *decode, short bits)
{
    unsigned short next;
    unsigned short bit;

    bit = decode->bit;
    decode->value >>= bits;
    next = (unsigned short)(bit + bits);
    decode->value |= (unsigned short)((Wavelet_ReadDword(decode->data) >> bit) << (16 - bits));
    decode->data += next >> 3;
    decode->bit = next & 7;
}

static int Wavelet_DecodeValue(WaveletDecode *decode,
                              const WaveletHuffmanDecode *table,
                              int extensionBits, int extensionBias)
{
    unsigned short value;
    int next;
    int index;
    short bits;
    int result;

    index = decode->value & 0xfff;
    bits = table[index].bits;
    decode->value >>= bits;
    value = decode->value | (unsigned short)((Wavelet_ReadDword(decode->data) >> decode->bit) << (16 - bits));
    next = decode->bit + bits;
    decode->bit = next & 7;
    decode->value = value;
    decode->data += (unsigned short)next >> 3;
    result = table[index].value;
    if (result == -32768)
    {
        result = (value & ((1U << extensionBits) - 1)) - extensionBias;
        Wavelet_ReadBits(decode, (short)extensionBits);
    }
    return result;
}

#define Wavelet_HuffmanDecode9(decode, table) Wavelet_DecodeValue(decode, table, 9, 255)
#define Wavelet_HuffmanDecode10(decode, table) Wavelet_DecodeValue(decode, table, 10, 510)

static void Wavelet_ApplyDelta(byte *src, WaveletDecode *decode, int blocks)
{
    int offset;
    int channels;
    int delta;

    offset = 0;
    if (decode->channels == decode->bpp)
    {
        blocks *= decode->channels;
        do
        {
            delta = Wavelet_HuffmanDecode9(decode, waveletDecodeAlpha);
            *src = (byte)(*src + delta);
            src += 1;
            blocks -= 1;
        } while (blocks != 0);
    }
    else
    {
        do
        {
            channels = decode->channels;
            do
            {
                delta = Wavelet_HuffmanDecode9(decode, waveletDecodeAlpha);
                src[offset] = (byte)(src[offset] + delta);
                offset += 1;
                channels -= 1;
            } while (channels != 0);
            src[offset] = 255;
            offset += 1;
            blocks -= 1;
        } while (blocks != 0);
    }
}

/* line 98 */
static void Wavelet_DecompressLevel(byte *src, byte *dst, WaveletDecode *decode)
{
    int w, h;
    int dstBpp, stride;
    int alpha0, alpha1;
    int dstBpp2;
    int x, y;
    int numBlocks;
    int hasAlphaRLE;

    /* line 117 */
    w = decode->width >> decode->mipLevel;
    /* line 118 */
    h = decode->height >> decode->mipLevel;

    /* line 120 */
    if (w - 1 <= 0) {
        /* line 122 */
        if (w > 0) {
            /* w stays */
        } else {
            w = 1;
        }
        goto small_case;
    }
    if (h - 1 <= 0) {
        goto small_case;
    }

    /* line 140 */
    if (!decode->dataInitialized) {
        /* lines 143-146: initialize bitstream */
        const byte *p = decode->data;
        unsigned short initVal;
        initVal = (unsigned short)p[0] | ((unsigned short)p[1] << 8);
        decode->value = initVal;
        decode->bit = 0;
        decode->data = p + 2;
        decode->dataInitialized = 1;
    }

    /* line 149 */
    dstBpp = decode->bpp;
    /* line 151 */
    stride = w * dstBpp;
    /* line 152 */
    alpha0 = dstBpp - 1;
    /* line 153 */
    dstBpp2 = dstBpp * 2;
    alpha1 = dstBpp2 - 1;

    /* line 155-157: Read 1 bit for hasAlphaRLE flag */
    hasAlphaRLE = decode->value & 1;
    Wavelet_ReadBits(decode, 1);

    if (hasAlphaRLE) {
        /* line 158 */
        int totalPixels = w * h;

        if (totalPixels <= -1) {
            numBlocks = (totalPixels + 3) >> 2;
        } else {
            numBlocks = totalPixels >> 2;
        }

        Wavelet_ApplyDelta(src, decode, numBlocks);
    }

    /* line 160: Main 2D wavelet reconstruction loop */
    for (y = 0; y < h; y += 2) {
        for (x = 0; x < w; x += 2) {
            int blue_d0, blue_d1, blue_d2;
            int rg_d0, rg_d1, rg_d2;
            int parityBlue, parityRG, parityAlpha;
            int base, a, b, c, e;
            byte *dstTR, *dstBL, *dstBR;

            /* line 166 */
            if (decode->channels == 1) {
                goto check_alpha;
            }

            /* line 168: Read blue channel parity bit */
            parityBlue = Wavelet_ReadBit1(decode);

            /* Decode 3 blue coefficients */
            blue_d0 = Wavelet_HuffmanDecode9(decode, waveletDecodeBlue);
            blue_d1 = Wavelet_HuffmanDecode9(decode, waveletDecodeBlue);
            blue_d2 = Wavelet_HuffmanDecode9(decode, waveletDecodeBlue);

            /* line 173-177: Reconstruct blue channel in 2x2 block */
            base = src[0] * 2;
            a = base + blue_d0;
            b = blue_d1 + blue_d2;
            dst[0] = (byte)(((a + b) >> 1) + parityBlue);
            dst[dstBpp] = (byte)((a - b) >> 1);
            c = base - blue_d0;
            e = blue_d1 - blue_d2;
            dst[stride] = (byte)((c + e) >> 1);
            dstBR = dst + stride + dstBpp;
            dst[stride + dstBpp] = (byte)((c - e) >> 1);

            /* line 179 */
            if (decode->channels <= 2) {
                goto check_alpha;
            }

            /* line 181: RG component 1 (index 1) parity + 3 coefficients */
            parityRG = Wavelet_ReadBit1(decode);

            rg_d0 = Wavelet_HuffmanDecode10(decode, waveletDecodeRedGreen) + blue_d0;
            rg_d1 = Wavelet_HuffmanDecode10(decode, waveletDecodeRedGreen) + blue_d1;
            rg_d2 = blue_d2 + Wavelet_HuffmanDecode10(decode, waveletDecodeRedGreen);

            /* line 186-190: Reconstruct component 1 in 2x2 block */
            base = src[1] * 2;
            a = base + rg_d0;
            b = rg_d1 + rg_d2;
            dst[1] = (byte)(((a + b) >> 1) + parityRG);
            dstTR = dst + dstBpp;
            dstTR[1] = (byte)((a - b) >> 1);
            dstBL = dst + stride;
            c = base - rg_d0;
            e = rg_d1 - rg_d2;
            dstBL[1] = (byte)((c + e) >> 1);
            dstBR = dst + stride + dstBpp;
            dstBR[1] = (byte)((c - e) >> 1);

            /* line 192: RG component 2 (index 2) parity + 3 coefficients */
            parityRG = Wavelet_ReadBit1(decode);

            rg_d0 = Wavelet_HuffmanDecode10(decode, waveletDecodeRedGreen) + blue_d0;
            rg_d1 = Wavelet_HuffmanDecode10(decode, waveletDecodeRedGreen) + blue_d1;
            rg_d2 = blue_d2 + Wavelet_HuffmanDecode10(decode, waveletDecodeRedGreen);

            /* line 197-201: Reconstruct component 2 in 2x2 block */
            base = src[2] * 2;
            a = base + rg_d0;
            b = rg_d1 + rg_d2;
            dst[2] = (byte)(((a + b) >> 1) + parityRG);
            dstTR[2] = (byte)((a - b) >> 1);
            c = base - rg_d0;
            e = rg_d1 - rg_d2;
            dstBL[2] = (byte)((c + e) >> 1);
            dstBR[2] = (byte)((c - e) >> 1);

check_alpha:
            /* line 205 */
            if (decode->channels == 3) {
                /* line 218: Check bpp for alpha fill */
                if (decode->bpp != 3) {
                    /* lines 220-223: Fill alpha with 0xff */
                    dst[alpha0] = 0xff;
                    dst[alpha1] = 0xff;
                    *(dst + stride + alpha0) = 0xff;
                    *(dst + stride + alpha1) = 0xff;
                }
                goto advance_ptrs;
            }

            /* line 207: Alpha parity + 3 coefficients */
            parityAlpha = Wavelet_ReadBit1(decode);

            {
                int alpha_d0, alpha_d1, alpha_d2;

                alpha_d0 = Wavelet_HuffmanDecode9(decode, waveletDecodeAlpha);
                alpha_d1 = Wavelet_HuffmanDecode9(decode, waveletDecodeAlpha);
                alpha_d2 = Wavelet_HuffmanDecode9(decode, waveletDecodeAlpha);

                /* line 212-216: Reconstruct alpha in 2x2 block */
                base = src[alpha0] * 2;
                a = base + alpha_d0;
                b = alpha_d1 + alpha_d2;
                dst[alpha0] = (byte)(((a + b) >> 1) + parityAlpha);
                dst[alpha1] = (byte)((a - b) >> 1);
                c = base - alpha_d0;
                e = alpha_d1 - alpha_d2;
                *(dst + stride + alpha0) = (byte)((c + e) >> 1);
                *(dst + stride + alpha1) = (byte)((c - e) >> 1);
            }

advance_ptrs:
            /* line 226-227: Advance src and dst pointers */
            src += dstBpp;
            dst += dstBpp2;
        }
        /* line 229 */
        dst += stride;
    }
    return;

small_case:
    /* lines 124-134: Simple case for w <= 1 or h <= 1 */
    {
        int maxH;
        int totalPixels;
        int i;

        if (h > 0) {
            maxH = h;
        } else {
            maxH = 1;
        }
        totalPixels = w + maxH - 1;

        for (i = 0; i < totalPixels; i++) {
            int channels = decode->channels;
            int j;

            for (j = 0; j < channels; j++) {
                /* line 132 */
                *dst = *(decode->data);
                dst++;
                decode->data++;
            }
            /* line 133 */
            if (decode->bpp != channels) {
                /* line 134 */
                *dst = 0xff;
                dst++;
            }
        }
    }
}

extern void *(*ri_hunk_allocate)(int bytes);
extern void (*ri_hunk_free)(void *memory);
extern byte can_mip_cubemaps;

/* Source-level interfaces; target custom-register emission needs callee TUs. */
extern int picmip_semantic_2_5;
extern int picmip_semantic_3;
extern int picmip_semantic_4;
/* SDK COM signatures; target slots 0x5c, 0x60, 0x64. */
typedef int (__stdcall *CreateTextureCall)(void *, unsigned int, unsigned int,
    unsigned int, unsigned int, int, int, void **, void *);
typedef int (__stdcall *CreateVolumeCall)(void *, unsigned int, unsigned int,
    unsigned int, unsigned int, unsigned int, int, int, void **, void *);
typedef int (__stdcall *CreateCubeCall)(void *, unsigned int, unsigned int,
    unsigned int, int, int, void **, void *);
extern void *renderer_device;
extern const char *__stdcall Renderer_ErrorDescription(int result);
extern void Renderer_Error(int code, const char *format, ...);

static void Image_Create2DTexture(GfxImagePrefix *image, int width, int height,
    int levels, unsigned int usage, int format, int pool)
{
    int result;

    image->height = (unsigned short)height;
    image->width = (unsigned short)width;
    image->depth = 1;
    image->mapType = 3;
    result = ((CreateTextureCall)(*(void ***)renderer_device)[23])(
        renderer_device, (unsigned short)width, (unsigned short)height,
        levels, usage, format, pool, &image->texture, 0);
    if (result < 0)
    {
        Renderer_Error(1, "Create2DTexture( %s, %i, %i, %i, %i ) failed: %08x = %s",
            image->name, (int)image->width, (int)image->height, 0, format,
            result, Renderer_ErrorDescription(result));
    }
}

static void Image_Create3DTexture(GfxImagePrefix *image, int width, int height,
    int depth, int levels, unsigned int usage, int format, int pool)
{
    int result;

    image->depth = (unsigned short)depth;
    image->height = (unsigned short)height;
    image->width = (unsigned short)width;
    image->mapType = 4;
    result = ((CreateVolumeCall)(*(void ***)renderer_device)[24])(
        renderer_device, (unsigned short)width, (unsigned short)height,
        (unsigned short)depth, levels, usage, format, pool, &image->texture, 0);
    if (result < 0)
    {
        Renderer_Error(1, "Create3DTexture( %s, %i, %i, %i, %i, %i ) failed: %08x = %s",
            image->name, (int)image->width, (int)image->height, (int)image->depth,
            0, format, result, Renderer_ErrorDescription(result));
    }
}

static void Image_CreateCubeTexture(GfxImagePrefix *image, int edge, int levels,
    unsigned int usage, int format, int pool)
{
    int result;

    image->width = (unsigned short)edge;
    image->height = (unsigned short)edge;
    image->depth = 1;
    image->mapType = 5;
    if (!can_mip_cubemaps)
    {
        levels = 1;
    }
    result = ((CreateCubeCall)(*(void ***)renderer_device)[25])(
        renderer_device, (unsigned short)edge, levels, 0, format, pool,
        &image->texture, 0);
    if (result < 0)
    {
        Renderer_Error(1, "CreateCubeTexture ( %s, %i, %i, %i ) failed: %08x = %s",
            image->name, (int)image->width, levels, format, result,
            Renderer_ErrorDescription(result));
    }
}
extern int image_card_memory[2];

static int Image_GetMipMemoryAmount(int format, int width, int height, int depth)
{
    switch (format)
    {
    case 0x15:
    case 0x16:
    case 0x47:
    case 0x4b:
    case 0x72:
        return width * height * depth * 4;
    case 0x17:
    case 0x33:
    case 0x50:
        return width * height * depth * 2;
    case 0x1c:
    case 0x32:
        return width * height * depth;
    case 0x31545844:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * depth * 8;
    case 0x33545844:
    case 0x35545844:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * depth * 16;
    default:
        return 0;
    }
}

static int Image_GetCardMemoryAmount(int flags, int format, int width, int height, int depth)
{
    int amount;

    amount = Image_GetMipMemoryAmount(format, width, height, depth);
    if (!(flags & 2))
    {
        while (width > 1 || height > 1 || depth > 1)
        {
            width >>= 1;
            if (1 - width >= 0)
            {
                width = 1;
            }
            height >>= 1;
            if (1 - height >= 0)
            {
                height = 1;
            }
            depth >>= 1;
            if (1 - depth >= 0)
            {
                depth = 1;
            }
            amount += Image_GetMipMemoryAmount(format, width, height, depth);
        }
    }
    if (flags & 4)
    {
        amount *= 6;
    }
    return amount;
}

static void Image_TrackTexture(GfxImagePrefix *image, int flags, int format,
    int width, int height, int depth)
{
    int platform;
    int w, h, d, amount;

    for (platform = 0; platform < 2; platform += 1)
    {
        w = width;
        h = height;
        d = depth;
        if (!(flags & 1))
        {
            w >>= image->picmip[platform];
            h >>= image->picmip[platform];
            d >>= image->picmip[platform];
            if (1 - w >= 0)
            {
                w = 1;
            }
            if (1 - h >= 0)
            {
                h = 1;
            }
            if (1 - d >= 0)
            {
                d = 1;
            }
        }
        amount = Image_GetCardMemoryAmount(flags, format, w, h, d);
        image->cardMemory[platform] = amount;
        if (image->track > 1 && image->track != 4)
        {
            image_card_memory[platform] += amount;
        }
    }
}

static void Image_PicmipForSemantic(byte semantic, byte *picmip)
{
    int value;

    switch (semantic)
    {
    case 2:
    case 5: value = picmip_semantic_2_5; break;
    case 3: value = picmip_semantic_3; break;
    case 4: value = picmip_semantic_4; break;
    default:
        picmip[0] = 0;
        picmip[1] = 0;
        return;
    }
    picmip[1] = 2;
    if (value < 0)
    {
        picmip[0] = 0;
        return;
    }
    if (value > 3)
    {
        value = 3;
    }
    picmip[0] = (byte)value;
}

static void Image_ClampPicmip(byte *picmip, int width, int height, int format)
{
    int block;
    int minimum;
    byte level;
    int i;

    block = 1;
    if (format == 0x31545844 || format == 0x33545844 || format == 0x35545844)
    {
        block = 4;
    }
    minimum = width;
    if (minimum >= height)
    {
        minimum = height;
    }
    level = 3;
    do
    {
        if ((minimum >> level) >= block)
        {
            break;
        }
        level -= 1;
    } while (level != 0);
    for (i = 0; i < 2; i += 1)
    {
        if (picmip[i] > level)
        {
            picmip[i] = level;
        }
    }
}

static void Image_Setup(GfxImagePrefix *image, int width, int height, int depth,
                        int flags, unsigned int usage, int format)
{
    int w;
    int h;
    int d;
    int levels;

    image->noPicmip = (flags & 3) != 0;
    if (image->noPicmip)
    {
        image->picmip[0] = 0;
        image->picmip[1] = 0;
    }
    else
    {
        Image_PicmipForSemantic(image->semantic, image->picmip);
    }
    Image_ClampPicmip(image->picmip, width, height, format);
    w = width >> image->picmip[0];
    if (w < 1)
    {
        w = 1;
    }
    h = height >> image->picmip[0];
    if (h < 1)
    {
        h = 1;
    }
    d = depth >> image->picmip[0];
    if (d < 1)
    {
        d = 1;
    }
    image->width = (unsigned short)w;
    image->height = (unsigned short)h;
    image->depth = (unsigned short)d;
    levels = (flags >> 1) & 1;
    if (flags & 4)
    {
        Image_CreateCubeTexture(image, w, levels, 0, format, 1);
    }
    else if (flags & 8)
    {
        Image_Create3DTexture(image, w, h, d, levels, usage, format, 1);
    }
    else
    {
        Image_Create2DTexture(image, w, h, levels, usage, format, 1);
    }
    Image_TrackTexture(image, flags, format, width, height, depth);
}
static void Image_Upload2D_CopyData_PC(const GfxImagePrefix *image, int format,
                                      int face, unsigned int mip, byte *pixels);
extern void Image_Upload3D_CopyData_PC(const GfxImagePrefix *image, int format,
                                      unsigned int mip, byte *pixels);

typedef struct ImageLockedBox
{
    int rowPitch;
    int slicePitch;
    void *bits;
} ImageLockedBox;
typedef int (__stdcall *ImageLockBoxCall)(void *, unsigned int, ImageLockedBox *, const void *, unsigned int);
typedef int (__stdcall *ImageUnlockBoxCall)(void *, unsigned int);
extern int *image_upload_debug;
extern FILE *image_upload_log;
extern int image_upload_retry;

typedef struct ImageLockedRect
{
    int pitch;
    void *bits;
} ImageLockedRect;
typedef int (__stdcall *ImageLockRectCall)(void *, unsigned int, ImageLockedRect *, const void *, unsigned int);
typedef int (__stdcall *ImageUnlockRectCall)(void *, unsigned int);
typedef int (__stdcall *ImageLockCubeCall)(void *, int, unsigned int, ImageLockedRect *, const void *, unsigned int);
typedef int (__stdcall *ImageUnlockCubeCall)(void *, int, unsigned int);

static void Image_Upload2D_CopyData_PC(const GfxImagePrefix *image, int format,
    int face, unsigned int mip, byte *pixels)
{
    int width, height;
    int dimension;
    ImageLockedRect locked;

    width = height = 1;
    dimension = image->width >> (unsigned short)mip;
    if (1 - dimension < 0)
    {
        width = dimension;
    }
    dimension = image->height >> (unsigned short)mip;
    if (1 - dimension < 0)
    {
        height = dimension;
    }
    if (image->mapType == 3)
    {
        do
        {
            if (image_upload_debug[2] && image_upload_log)
            {
                fprintf(image_upload_log, "%s", "image->texture.map->LockRect( mipLevel, &lockedRect, 0, 0 )\n");
                fflush(image_upload_log);
            }
            ((ImageLockRectCall)(*(void ***)image->texture)[19])(
                image->texture, mip, &locked, 0, 0);
        } while (image_upload_retry);
        Image_CopyUploadRows(format, width, height, pixels, locked.pitch, (byte *)locked.bits);
        do
        {
            if (image_upload_debug[2] && image_upload_log)
            {
                fprintf(image_upload_log, "%s", "image->texture.map->UnlockRect( mipLevel )\n");
                fflush(image_upload_log);
            }
            ((ImageUnlockRectCall)(*(void ***)image->texture)[20])(image->texture, mip);
        } while (image_upload_retry);
        return;
    }
    do
    {
        if (image_upload_debug[2] && image_upload_log)
        {
            fprintf(image_upload_log, "%s", "image->texture.cubemap->LockRect( cubemapFace, mipLevel, &lockedRect, 0, 0 )\n");
            fflush(image_upload_log);
        }
        ((ImageLockCubeCall)(*(void ***)image->texture)[19])(
            image->texture, face, mip, &locked, 0, 0);
    } while (image_upload_retry);
    Image_CopyUploadRows(format, width, height, pixels, locked.pitch, (byte *)locked.bits);
    do
    {
        if (image_upload_debug[2] && image_upload_log)
        {
            fprintf(image_upload_log, "%s", "image->texture.cubemap->UnlockRect( cubemapFace, mipLevel )\n");
            fflush(image_upload_log);
        }
        ((ImageUnlockCubeCall)(*(void ***)image->texture)[20])(image->texture, face, mip);
    } while (image_upload_retry);
}

void Image_Upload3D_CopyData_PC(const GfxImagePrefix *image, int format,
    unsigned int mip, byte *pixels)
{
    int width, height, depth;
    int sourceSlice;
    int slice;
    byte *destination;
    ImageLockedBox locked;

    width = image->width >> (mip & 31);
    if (1 - width >= 0)
    {
        width = 1;
    }
    height = image->height >> (mip & 31);
    if (1 - height >= 0)
    {
        height = 1;
    }
    depth = image->depth >> (mip & 31);
    if (1 - depth >= 0)
    {
        depth = 1;
    }
    sourceSlice = Image_SourceSliceSize(format, width, height);
    do
    {
        if (image_upload_debug[2] && image_upload_log)
        {
            fprintf(image_upload_log, "%s", "image->texture.volmap->LockBox( mipLevel, &lockedBox, 0, 0 )\n");
            fflush(image_upload_log);
        }
        ((ImageLockBoxCall)(*(void ***)image->texture)[19])(
            image->texture, mip, &locked, 0, 0);
    } while (image_upload_retry);
    destination = (byte *)locked.bits;
    for (slice = 0; slice < depth; slice += 1)
    {
        Image_CopyUploadRows(format, width, height, pixels, locked.rowPitch, destination);
        pixels += sourceSlice;
        destination += locked.slicePitch;
    }
    do
    {
        if (image_upload_debug[2] && image_upload_log)
        {
            fprintf(image_upload_log, "%s", "image->texture.volmap->UnlockBox( mipLevel )\n");
            fflush(image_upload_log);
        }
        ((ImageUnlockBoxCall)(*(void ***)image->texture)[20])(image->texture, mip);
    } while (image_upload_retry);
}
static void Image_LoadBitmap(GfxImagePrefix *image, const GfxImageFileHeader *header,
    const byte *data, int format, int bytesPerPixel)
{
    byte *converted;
    byte *destination;
    const byte *source;
    byte *pixels;
    int faceCount, mipCount, dimension, mip, width, height, face, count;

    Image_Setup(image, header->dimensions[0], header->dimensions[1],
        header->dimensions[2], header->flags, 0, format);
    faceCount = 1;
    if (image->mapType == 5)
    {
        faceCount = 6;
    }
    converted = 0;
    if (format == 0x16)
    {
        converted = (byte *)ri_hunk_allocate(image->width * image->height * 4);
    }
    mipCount = 1;
    if (!(header->flags & 2))
    {
        for (dimension = 1; dimension < header->dimensions[0] ||
            dimension < header->dimensions[1] || dimension < header->dimensions[2];
            dimension <<= 1)
        {
            mipCount += 1;
        }
    }
    for (mip = mipCount - 1; mip >= image->picmip[0]; mip -= 1)
    {
        width = header->dimensions[0] >> mip;
        height = header->dimensions[1] >> mip;
        if (1 - width >= 0)
        {
            width = 1;
        }
        if (1 - height >= 0)
        {
            height = 1;
        }
        for (face = 0; face < faceCount; face += 1)
        {
            pixels = (byte *)data;
            if (format == 0x16)
            {
                destination = converted;
                source = data;
                count = width * height;
                do
                {
                    destination[0] = source[0];
                    destination[1] = source[1];
                    destination[2] = source[2];
                    destination[3] = 255;
                    source += 3;
                    destination += 4;
                    count -= 1;
                } while (count);
                pixels = converted;
            }
            if (image->mapType == 4)
            {
                Image_Upload3D_CopyData_PC(image, format, mip - image->picmip[0], pixels);
            }
            else if (image->mapType != 5 || mip == image->picmip[0] || can_mip_cubemaps)
            {
                Image_Upload2D_CopyData_PC(image, format, face, mip - image->picmip[0], pixels);
            }
            data += width * height * bytesPerPixel;
        }
    }
    if (converted)
    {
        ri_hunk_free(converted);
    }
}
static void Image_LoadDxtc(GfxImagePrefix *image, const GfxImageFileHeader *header,
    const byte *data, int format, int bytesPerBlock)
{
    int mipCount, dimension, mip, width, height, face, faceCount;

    Image_Setup(image, header->dimensions[0], header->dimensions[1],
        header->dimensions[2], header->flags, 0, format);
    faceCount = 1;
    if (image->mapType == 5)
    {
        faceCount = 6;
    }
    mipCount = 1;
    if (!(header->flags & 2))
    {
        for (dimension = 1; dimension < header->dimensions[0] ||
            dimension < header->dimensions[1] || dimension < header->dimensions[2];
            dimension <<= 1)
        {
            mipCount += 1;
        }
    }
    for (mip = mipCount - 1; mip >= image->picmip[0]; mip -= 1)
    {
        width = header->dimensions[0] >> mip;
        height = header->dimensions[1] >> mip;
        if (1 - width >= 0)
        {
            width = 1;
        }
        if (1 - height >= 0)
        {
            height = 1;
        }
        for (face = 0; face < faceCount; face += 1)
        {
            if (image->mapType == 4)
            {
                Image_Upload3D_CopyData_PC(image, format, mip - image->picmip[0], (byte *)data);
            }
            else if (image->mapType != 5 || mip == image->picmip[0] || can_mip_cubemaps)
            {
                Image_Upload2D_CopyData_PC(image, format, face, mip - image->picmip[0], (byte *)data);
            }
            data += ((height + 3) >> 2) * ((width + 3) >> 2) * bytesPerBlock;
        }
    }
}

static void Image_LoadWavelet(GfxImagePrefix *image, const GfxImageFileHeader *header,
                              const byte *data, int format, int bytesPerPixel)
{
    WaveletDecode decode;
    byte *previous[6];
    byte *buffers[6];
    int width;
    int height;
    int levels;
    int extent;
    int totalSize;
    int faces;
    int face;
    int mipWidth;
    int mipHeight;
    int size;
    int mip;
    byte *destination;
    byte *source;

    Image_Setup(image, header->dimensions[0], header->dimensions[1],
                header->dimensions[2], header->flags, 0, format);
    width = header->dimensions[0];
    height = header->dimensions[1];
    decode.value = 0;
    decode.bit = 0;
    decode.width = width;
    decode.height = height;
    levels = 1;
    if (!(header->flags & 2))
    {
        for (extent = 1; extent < width || extent < height || extent < header->dimensions[2]; extent <<= 1)
        {
            levels += 1;
        }
    }
    decode.mipLevel = levels - 1;
    decode.dataInitialized = 0;
    decode.channels = bytesPerPixel;
    decode.bpp = bytesPerPixel;
    if (bytesPerPixel == 3)
    {
        decode.bpp = 4;
    }
    totalSize = width * height * decode.bpp;
    faces = 1;
    if (image->mapType == 5)
    {
        faces = 6;
    }
    for (face = 0; face < faces; face += 1)
    {
        previous[face] = 0;
    }
    for (face = 0; face < faces; face += 1)
    {
        buffers[face] = (byte *)ri_hunk_allocate(totalSize);
    }
    decode.data = data;
    while (decode.mipLevel >= image->picmip[0])
    {
        mipWidth = width >> decode.mipLevel;
        if (mipWidth < 1)
        {
            mipWidth = 1;
        }
        mipHeight = height >> decode.mipLevel;
        if (mipHeight < 1)
        {
            mipHeight = 1;
        }
        size = mipWidth * mipHeight * decode.bpp;
        for (face = 0; face < faces; face += 1)
        {
            source = previous[face];
            destination = buffers[face] + totalSize - size;
            previous[face] = destination;
            Wavelet_DecompressLevel(source, destination, &decode);
            mip = decode.mipLevel - image->picmip[0];
            if (image->mapType == 4)
            {
                Image_Upload3D_CopyData_PC(image, format, mip, destination);
            }
            else if (image->mapType != 5 || !mip || can_mip_cubemaps)
            {
                Image_Upload2D_CopyData_PC(image, format, face, mip, destination);
            }
        }
        decode.mipLevel -= 1;
    }
    for (face = faces - 1; face >= 0; face -= 1)
    {
        ri_hunk_free(buffers[face]);
    }
}

static void Image_LoadFromData(GfxImagePrefix *image, const GfxImageFileHeader *header, const byte *data)
{
    image->texture = 0;
    switch (header->format)
    {
    case 1: Image_LoadBitmap(image, header, data, 0x15, 4); break;
    case 2: Image_LoadBitmap(image, header, data, 0x16, 3); break;
    case 3: Image_LoadBitmap(image, header, data, 0x33, 2); break;
    case 4: Image_LoadBitmap(image, header, data, 0x32, 1); break;
    case 5: Image_LoadBitmap(image, header, data, 0x1c, 1); break;
    case 6: Image_LoadWavelet(image, header, data, 0x15, 4); break;
    case 7: Image_LoadWavelet(image, header, data, 0x16, 3); break;
    case 8: Image_LoadWavelet(image, header, data, 0x33, 2); break;
    case 9: Image_LoadWavelet(image, header, data, 0x32, 1); break;
    case 10: Image_LoadWavelet(image, header, data, 0x1c, 1); break;
    case 11: Image_LoadDxtc(image, header, data, 0x31545844, 8); break;
    case 12: Image_LoadDxtc(image, header, data, 0x33545844, 16); break;
    case 13: Image_LoadDxtc(image, header, data, 0x35545844, 16); break;
    }
}

static int Renderer_FormatPath(char *destination, int size, const char *format, ...)
{
    va_list args;
    int result;

    va_start(args, format);
    result = _vsnprintf(destination, size, format, args);
    va_end(args);
    destination[size - 1] = 0;
    return result;
}
extern void Renderer_Print(const char *format, ...);
extern int (*ri_image_read_file)(const char *path, void **data);
extern void (*ri_image_free_file)(void *data);

static byte Image_CheckFileHeader(const byte *header, const char *path)
{
    if (header[0] == 'I' && header[1] == 'W' && header[2] == 'i')
    {
        if (header[3] != 5)
        {
            Renderer_Print("^1ERROR: image '%s' is version %i but should be version %i\n",
                path, (int)header[3], 5);
            return 0;
        }
        return 1;
    }
    Renderer_Print("^1ERROR: image '%s' is not an IW image\n", path);
    return 0;
}

static byte Image_LoadFromFile(GfxImagePrefix *image)
{
    char path[64];
    void *file;
    int length;
    const byte *data;

    if (Renderer_FormatPath(path, sizeof(path), "%s%s%s", "images/", image->name, ".iwi") < 0)
    {
        Renderer_Print("^1ERROR: filename '%s' too long\n", path);
        return 0;
    }
    length = ri_image_read_file(path, &file);
    if (length < 0)
    {
        Renderer_Print("^1ERROR: image '%s' is missing\n", path);
        return 0;
    }
    if (!length)
    {
        Renderer_Print("^1ERROR: image '%s' has 0 length\n", path);
        ri_image_free_file(file);
        return 0;
    }
    data = (const byte *)file;
    if (data[5] & 3)
    {
        image->noPicmip = 1;
    }
    if (!Image_CheckFileHeader(data, path))
    {
        ri_image_free_file(file);
        return 0;
    }
    Image_LoadFromData(image, (const GfxImageFileHeader *)data, data + sizeof(GfxImageFileHeader));
    ri_image_free_file(file);
    return 1;
}

typedef unsigned int (__stdcall *ImageReleaseCall)(void *);

static void Image_Release(GfxImagePrefix *image)
{
    switch (image->track)
    {
    case 0:
    case 1:
    case 4:
        break;
    default:
        image_card_memory[0] -= image->cardMemory[0];
        image_card_memory[1] -= image->cardMemory[1];
        break;
    }
    if (image->texture)
    {
        ((ImageReleaseCall)(*(void ***)image->texture)[2])(image->texture);
        image->texture = 0;
        image->cardMemory[0] = 0;
        image->cardMemory[1] = 0;
    }
    image->mapType = 0;
}

void Image_Reload(GfxImagePrefix *image)
{
    Image_Release(image);
    if (!Image_LoadFromFile(image))
    {
        Renderer_Error(1, "failed to load image '%s'", image->name);
    }
}
