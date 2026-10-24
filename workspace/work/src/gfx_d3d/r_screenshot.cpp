// Screenshots, console captures and cubemap shots.
#include "r_local.h"
#include <math.h>
#include <stdio.h>
#include <dxerr9.h>
#include "gfx.h"

// r_screenshot.cpp - cubemap shots and screenshots.
extern "C" void Com_Memcpy(void *dest, const void *src, int count);

// PINNED: retail 0x10025e80; the PC path captures the D3D front buffer.
Bool R_GetFrontBufferData(int x, int y, int width, int height, int bytesPerPixel, byte *buffer)
{
    IDirect3DSurface9 *surface = NULL;
    POINT pt;
    MONITORINFO monitorInfo;
    RECT sourceRect;
    D3DLOCKED_RECT lockedRect;
    HRESULT hr;
    int surfWidth;
    int surfHeight;
    int row;
    int col;
    const byte *srcPixel;
    byte *dstPixel;

    pt.x = x;
    pt.y = y;
    if (vidConfig.isFullscreen)
    {
        surfWidth = vidConfig.width;
        surfHeight = vidConfig.height;
    }
    else
    {
        HMONITOR monitor = MonitorFromWindow(dx.windows[0].hwnd, MONITOR_DEFAULTTONEAREST);
        monitorInfo.cbSize = sizeof(monitorInfo);
        if (!GetMonitorInfoA(monitor, &monitorInfo))
        {
            ri.Printf(3, "ERROR: cannot take screenshot: couldn't get screen dimensions\n");
            return 0;
        }
        ClientToScreen(dx.windows[0].hwnd, &pt);
        if (pt.x < monitorInfo.rcMonitor.left || pt.y < monitorInfo.rcMonitor.top
            || pt.x + width > monitorInfo.rcMonitor.right || pt.y + height > monitorInfo.rcMonitor.bottom)
        {
            ri.Printf(3, "ERROR: cannot take screenshot: game window is partially off-screen\n");
            return 0;
        }
        surfWidth = monitorInfo.rcMonitor.right - monitorInfo.rcMonitor.left;
        surfHeight = monitorInfo.rcMonitor.bottom - monitorInfo.rcMonitor.top;
        pt.x -= monitorInfo.rcMonitor.left;
        pt.y -= monitorInfo.rcMonitor.top;
    }
    hr = dx.device->CreateOffscreenPlainSurface(surfWidth, surfHeight, D3DFMT_A8R8G8B8, D3DPOOL_SCRATCH, &surface, NULL);
    if (FAILED(hr))
    {
        ri.Printf(3, "ERROR: cannot take screenshot: couldn't create the off-screen surface: %s (0x%08x)\n", DXGetErrorDescription9(hr), hr);
        return 0;
    }
    hr = dx.windows[0].swapChain->GetFrontBufferData(surface);
    if (FAILED(hr))
    {
        do
        {
            surface->Release();
            surface = NULL;
        } while (alwaysfails);
        goto createError;
    }
    sourceRect.left = pt.x;
    sourceRect.right = pt.x + width;
    sourceRect.top = pt.y;
    sourceRect.bottom = pt.y + height;
    hr = surface->LockRect(&lockedRect, &sourceRect, D3DLOCK_READONLY);
    if (FAILED(hr))
    {
        do
        {
            surface->Release();
            surface = NULL;
        } while (alwaysfails);
        ri.Printf(3, "ERROR: cannot take screenshot: LockRect failed: %s (0x%08x)\n", DXGetErrorDescription9(hr), hr);
        return 0;
    }
    srcPixel = (const byte *)lockedRect.pBits;
    dstPixel = buffer;
    if (bytesPerPixel == 3)
    {
        for (row = 0; row < height; ++row)
        {
            for (col = 0; col < width; ++col)
            {
                dstPixel[0] = srcPixel[0];
                dstPixel[1] = srcPixel[1];
                dstPixel[2] = srcPixel[2];
                dstPixel += 3;
                srcPixel += 4;
            }
            srcPixel += lockedRect.Pitch - 4 * width;
        }
    }
    else if (lockedRect.Pitch == 4 * width)
        Com_Memcpy(dstPixel, srcPixel, 4 * width * height);
    else
    {
        for (row = 0; row < height; ++row)
        {
            Com_Memcpy(dstPixel, srcPixel, 4 * width);
            dstPixel += 4 * width;
            srcPixel += lockedRect.Pitch;
        }
    }
    surface->UnlockRect();
    do
    {
        surface->Release();
        surface = NULL;
    } while (alwaysfails);
    return 1;

createError:
    ri.Printf(3, "ERROR: cannot take screenshot: couldn't create the off-screen surface: %s (0x%08x)\n", DXGetErrorDescription9(hr), hr);
    return 0;
}

void R_DownsamplePixelData(int oldSize, int newSize, int stride, int bytesPerPixel, byte *src, byte *dst)
{
    float colorScale = 1.0f / oldSize;
    int nextSample = bytesPerPixel * stride;
    int residual = newSize;
    int column;
    int color0;
    int color1;
    int color2;
    int sum1;
    int sum2;

    for (column = 0; column < newSize; ++column)
    {
        color0 = residual * src[0];
        color1 = residual * src[1];
        color2 = residual * src[2];
        src += nextSample;
        while (newSize + residual - oldSize <= 0)
        {
            color0 += newSize * src[0];
            color1 += newSize * src[1];
            color2 += newSize * src[2];
            residual += newSize;
            src += nextSample;
        }
        residual = newSize + residual - oldSize;
        sum1 = color1 + src[1] * (newSize - residual);
        sum2 = color2 + src[2] * (newSize - residual);
        dst[0] = (byte)I_fround(colorScale * (color0 + src[0] * (newSize - residual)));
        dst[1] = (byte)I_fround(colorScale * sum1);
        dst[2] = (byte)I_fround(colorScale * sum2);
        dst += nextSample;
    }
}

void R_UpsamplePixelData(int oldSize, int newSize, int stride, int bytesPerPixel, byte *src, byte *dst)
{
    int nextSample = bytesPerPixel * stride;
    byte *currSrc = src + (oldSize - 1) * nextSample;
    int forwardWeight = newSize - oldSize;
    int backwardWeight = newSize + oldSize;
    float colorScale = 0.5f / newSize;
    int column;

    dst += (newSize - 1) * nextSample;
    currSrc[nextSample] = currSrc[0];
    currSrc[nextSample + 1] = currSrc[1];
    currSrc[nextSample + 2] = currSrc[2];
    for (column = newSize - 1; column >= 0; --column)
    {
        if (currSrc >= src)
        {
            dst[0] = (byte)I_fround(colorScale * (forwardWeight * currSrc[nextSample] + backwardWeight * currSrc[0]));
            dst[1] = (byte)I_fround(colorScale * (forwardWeight * currSrc[nextSample + 1] + backwardWeight * currSrc[1]));
            dst[2] = (byte)I_fround(colorScale * (forwardWeight * currSrc[nextSample + 2] + backwardWeight * currSrc[2]));
        }
        else
        {
            dst[0] = (byte)I_fround(colorScale * ((forwardWeight + backwardWeight) * src[0]));
            dst[1] = (byte)I_fround(colorScale * ((forwardWeight + backwardWeight) * src[1]));
            dst[2] = (byte)I_fround(colorScale * ((forwardWeight + backwardWeight) * src[2]));
        }
        dst -= nextSample;
        backwardWeight += 2 * oldSize;
        forwardWeight -= 2 * oldSize;
        if (forwardWeight < 0)
        {
            backwardWeight -= 2 * newSize;
            forwardWeight += 2 * newSize;
            currSrc -= nextSample;
        }
    }
}

void R_ResampleImage(int oldWidth, int oldHeight, int newWidth, int newHeight, int bytesPerPixel, byte *data)
{
    byte *src;
    byte *dst;
    int row;
    int col;
    if (newWidth < oldWidth)
    {
        src = data;
        dst = data;
        for (row = 0; row < oldHeight; ++row)
        {
            R_DownsamplePixelData(oldWidth, newWidth, 1, bytesPerPixel, src, dst);
            src += bytesPerPixel * oldWidth;
            dst += bytesPerPixel * newWidth;
        }
    }
    else if (oldWidth < newWidth)
    {
        src = data + bytesPerPixel * oldWidth * (oldHeight - 1);
        dst = data + bytesPerPixel * newWidth * (oldHeight - 1);
        for (row = oldHeight - 1; row >= 0; --row)
        {
            R_UpsamplePixelData(oldWidth, newWidth, 1, bytesPerPixel, src, dst);
            src -= bytesPerPixel * oldWidth;
            dst -= bytesPerPixel * newWidth;
        }
    }
    if (newHeight < oldHeight)
    {
        src = data;
        dst = data;
        for (col = 0; col < newWidth; ++col)
        {
            R_DownsamplePixelData(oldHeight, newHeight, newWidth, bytesPerPixel, src, dst);
            src += bytesPerPixel;
            dst += bytesPerPixel;
        }
    }
    else if (oldHeight < newHeight)
    {
        src = data + bytesPerPixel * (newWidth - 1);
        dst = src;
        for (col = newWidth - 1; col >= 0; --col)
        {
            R_UpsamplePixelData(oldHeight, newHeight, newWidth, bytesPerPixel, src, dst);
            src -= bytesPerPixel;
            dst -= bytesPerPixel;
        }
    }
}

byte *R_TakeResampledScreenshot(int width, int height, int bytesPerPixel, int headerSize)
{
    int allocWidth = I_max(width, vidConfig.width);
    int allocHeight = I_max(height, vidConfig.height);
    byte *buffer = (byte *)ri.Z_MallocInternal(allocWidth * allocHeight * bytesPerPixel + headerSize);
    // Retail captures at the buffer start, then resamples after the header.
    if (!R_GetFrontBufferData(0, 0, vidConfig.width, vidConfig.height, bytesPerPixel, buffer))
    {
        ri.Z_FreeInternal(buffer);
        return NULL;
    }
    R_ResampleImage(vidConfig.width, vidConfig.height, width, height, bytesPerPixel, buffer + headerSize);
    return buffer;
}

void R_TakeScreenshotTga(int x, int y, int width, int height, const char *filename)
{
    int size = 18 + width * height * 3;
    byte *buffer = (byte *)ri.Z_MallocInternal(size);
    memset(buffer, 0, 18);
    buffer[2] = 2;
    buffer[12] = (byte)width;
    buffer[13] = (byte)(width >> 8);
    buffer[14] = (byte)height;
    buffer[15] = (byte)(height >> 8);
    buffer[16] = 24;
    buffer[17] = 32;
    if (R_GetFrontBufferData(x, y, width, height, 3, buffer + 18))
        ri.FS_WriteFile(filename, buffer, size);
    ri.Z_FreeInternal(buffer);
}

__declspec(noinline) float Vec3Normalize(float *v);

struct CubemapShotGlob
{
    unsigned char *pixels[6];
};

// PINNED 0x10696bb4
CubemapShotGlob cubeShotGlob;

void RB_SetRenderTarget(GfxRenderTargetId newTargetId);
void R_GammaCorrect(int bufferSize, byte *buffer);
extern const dvar_t *r_overbrightBits;

// PINNED 100266f0: flip complete BGRA words, leaving the odd middle row alone.
static __declspec(noinline) void R_FlipCubemapShot(byte *buffer)
{
    for (int row = 0; row < dx.cubemapShotRes / 2; ++row)
    {
        for (int column = 0; column < dx.cubemapShotRes; ++column)
        {
            int topOffset = (row * dx.cubemapShotRes + column) * 4;
            int bottomOffset = ((dx.cubemapShotRes - row - 1) * dx.cubemapShotRes + column) * 4;
            unsigned int pixel = *(unsigned int *)(buffer + topOffset);
            *(unsigned int *)(buffer + topOffset) = *(unsigned int *)(buffer + bottomOffset);
            *(unsigned int *)(buffer + bottomOffset) = pixel;
        }
    }
}

// PINNED 100268b0: failed capture still follows the flip/gamma path.
static __declspec(noinline) void R_CaptureCubemapShot(int shotIndex)
{
    int bufferSize = dx.cubemapShotRes * dx.cubemapShotRes * 4;
    byte *buffer = (byte *)ri.Z_MallocInternal(bufferSize);
    cubeShotGlob.pixels[shotIndex - 1] = buffer;
    R_GetFrontBufferData(dx.cubemapShotPixelBorder, dx.cubemapShotPixelBorder,
        dx.cubemapShotRes, dx.cubemapShotRes, 4, buffer);
    R_FlipCubemapShot(buffer);
    if (r_overbrightBits->current.integer > 0 && vidConfig.deviceSupportsGamma)
        R_GammaCorrect(bufferSize, buffer);
}

// PINNED 100269c0; descriptive name, historical helper name unconfirmed.
static __declspec(noinline) void R_ClearForCubemapShot()
{
    RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
    R_DX_CALL(dx.device->Clear( 0, 0, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER | D3DCLEAR_STENCIL, D3DCOLOR_ARGB(255,255,0,255), 1, 0 ));
}

// PINNED 10026a50: API59 slot64 narrows both arguments to unsigned shorts.
void R_BeginCubemapShot(int pixelWidthHeight, int pixelBorder)
{
    dx.cubemapShotRes = (unsigned short)pixelWidthHeight;
    dx.cubemapShotPixelBorder = (unsigned short)pixelBorder;
    R_ClearForCubemapShot();
}

// PINNED 10026a70: API59 slot65 restores the framebuffer after capture.
void R_EndCubemapShot(int shotIndex)
{
    R_CaptureCubemapShot(shotIndex);
    RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
}

// PINNED 0x101903a8; index 0 is CUBEMAPSHOT_NONE.
const float cubemapShotAxis[7][3][3] =
{
    { { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
    { { 0.0f, 0.0f, 1.0f }, { 1.0f, 0.0f, 0.0f }, { 0.0f, 1.0f, 0.0f } },
    { { 0.0f, 0.0f, -1.0f }, { -1.0f, 0.0f, 0.0f }, { 0.0f, 1.0f, 0.0f } },
    { { 0.0f, 1.0f, 0.0f }, { -1.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
    { { 0.0f, -1.0f, 0.0f }, { 1.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
    { { 1.0f, 0.0f, 0.0f }, { 0.0f, 1.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
    { { -1.0f, 0.0f, 0.0f }, { 0.0f, -1.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
};

float FresnelTerm(float n0, float n1, float cosIncidentAngle);

// PINNED 100265e0: the ray is normalized before using its Z for Fresnel alpha.
static __declspec(noinline) byte R_CubemapShotAlpha(int shotIndex, int column, int row, float n0, float n1)
{
    float halfSize = dx.cubemapShotRes * 0.5f;
    vec3_t direction;
    VectorScale(cubemapShotAxis[shotIndex][0], halfSize, direction);
    VectorMA(direction, column - halfSize + 0.5f, cubemapShotAxis[shotIndex][1], direction);
    VectorMA(direction, row - halfSize + 0.5f, cubemapShotAxis[shotIndex][2], direction);
    Vec3Normalize(direction);
    return (byte)I_fround(FresnelTerm(n0, n1, direction[2]) * 255.0f);
}

// PINNED 100267e0: preserve BGRA channel order after the18-byte TGA header.
static __declspec(noinline) void R_CopyCubemapShot(const byte *source, byte *targa)
{
    for (int row = 0; row < dx.cubemapShotRes; ++row)
    {
        for (int column = 0; column < dx.cubemapShotRes; ++column)
        {
            // targa has an 18-byte header before the pixels.
            int offset = (row * dx.cubemapShotRes + column) * 4;
            targa[offset + 18 + 2] = source[offset + 2];
            targa[offset + 18 + 1] = source[offset + 1];
            targa[offset + 18] = source[offset];
            targa[offset + 18 + 3] = source[offset + 3];
        }
    }
}

// PINNED 10026840: only the alpha byte is replaced, including for failed writes.
static __declspec(noinline) void R_WriteCubemapShotAlpha(int shotIndex, float n0, float n1, byte *targa)
{
    for (int row = 0; row < dx.cubemapShotRes; ++row)
    {
        for (int column = 0; column < dx.cubemapShotRes; ++column)
        {
            int offset = (row * dx.cubemapShotRes + column) * 4 + 18;
            targa[offset + 3] = R_CubemapShotAlpha(shotIndex, column, row, n0, n1);
        }
    }
}

// PINNED 10026920: release both buffers without clearing the saved face pointer.
static __declspec(noinline) void R_WriteCubemapShot(int shotIndex, const char *filename, float n0, float n1)
{
    int fileSize = dx.cubemapShotRes * dx.cubemapShotRes * 4 + 18;
    byte *targa = (byte *)ri.Z_MallocInternal(fileSize);
    int resolution = dx.cubemapShotRes;
    memset(targa, 0, 18);
    targa[2] = 2;
    targa[12] = (byte)resolution;
    targa[13] = (byte)(resolution >> 8);
    targa[14] = (byte)resolution;
    targa[15] = (byte)(resolution >> 8);
    targa[16] = 32;
    R_CopyCubemapShot(cubeShotGlob.pixels[shotIndex - 1], targa);
    R_WriteCubemapShotAlpha(shotIndex, n0, n1, targa);
    ri.FS_WriteFile(filename, targa, fileSize);
    ri.Z_FreeInternal(targa);
    ri.Z_FreeInternal(cubeShotGlob.pixels[shotIndex - 1]);
}

// PINNED 10026a90: API59 slot66 adapts the public filename-first parameter order.
void R_SaveCubemapShot(const char *filename, int shotIndex, float n0, float n1)
{
    R_WriteCubemapShot(shotIndex, filename, n0, n1);
}

static void R_GetDirForCubemapPixel(int faceIndex, float x, float y, float *dir)
{
    VectorMA(cubemapShotAxis[faceIndex + 1][0], x, cubemapShotAxis[faceIndex + 1][1], dir);
    VectorMA(dir, y, cubemapShotAxis[faceIndex + 1][2], dir);
    Vec3Normalize(dir);
}

void R_CubemapLightingForDir(float (**linearColors)[3], int width, int height, const float *dir, const float *baseColor, unsigned char *pixel)
{
    float color[3];
    float sourceDir[3];
    float facing;
    int sampleCount;
    int faceIndex;
    int x;
    int y;
    float xCoord;
    float yCoord;

    VectorClear(color);
    sampleCount = 0;
    for (faceIndex = 0; faceIndex < 6; ++faceIndex)
    {
        for (y = 0; y < height; ++y)
        {
            for (x = 0; x < width; ++x)
            {
                yCoord = ((y + 0.5f) + (y + 0.5f)) / height - 1.0f;
                xCoord = ((x + 0.5f) + (x + 0.5f)) / width - 1.0f;
                sourceDir[0] = xCoord * cubemapShotAxis[faceIndex + 1][1][0] + cubemapShotAxis[faceIndex + 1][0][0];
                sourceDir[1] = xCoord * cubemapShotAxis[faceIndex + 1][1][1] + cubemapShotAxis[faceIndex + 1][0][1];
                sourceDir[2] = xCoord * cubemapShotAxis[faceIndex + 1][1][2] + cubemapShotAxis[faceIndex + 1][0][2];
                sourceDir[0] += yCoord * cubemapShotAxis[faceIndex + 1][2][0];
                sourceDir[1] += yCoord * cubemapShotAxis[faceIndex + 1][2][1];
                sourceDir[2] += yCoord * cubemapShotAxis[faceIndex + 1][2][2];
                Vec3Normalize(sourceDir);
                facing = sourceDir[2] * dir[2] + sourceDir[1] * dir[1] + sourceDir[0] * dir[0];
                if (!(facing <= 0.0f))
                {
                    VectorMA(color, facing, linearColors[faceIndex][y * width + x], color);
                    ++sampleCount;
                }
            }
        }
    }
    VectorScale(color, 1.0f / sampleCount, color);
    color[0] = pow(color[0], 1.0f / 2.2f);
    color[1] = pow(color[1], 1.0f / 2.2f);
    color[2] = pow(color[2], 1.0f / 2.2f);
    Vec3Mul(color, baseColor, color);
    pixel[2] = I_fround(I_fmin(1.0f, color[0]) * 255.0f);
    pixel[1] = I_fround(I_fmin(1.0f, color[1]) * 255.0f);
    pixel[0] = I_fround(I_fmin(1.0f, color[2]) * 255.0f);
    pixel[3] = 0xff;
}

void R_CubemapLighting(float (**linearColors)[3], int width, int height, const float *baseColor, unsigned char **pixels)
{
    float dir[3];
    int faceIndex;
    int x;
    int y;
    float xCoord;
    float yCoord;

    for (faceIndex = 0; faceIndex < 6; ++faceIndex)
    {
        for (y = 0; y < height; ++y)
        {
            for (x = 0; x < width; ++x)
            {
                yCoord = ((y + 0.5f) + (y + 0.5f)) / height - 1.0f;
                xCoord = ((x + 0.5f) + (x + 0.5f)) / width - 1.0f;
                dir[0] = xCoord * cubemapShotAxis[faceIndex + 1][1][0] + cubemapShotAxis[faceIndex + 1][0][0];
                dir[1] = xCoord * cubemapShotAxis[faceIndex + 1][1][1] + cubemapShotAxis[faceIndex + 1][0][1];
                dir[2] = xCoord * cubemapShotAxis[faceIndex + 1][1][2] + cubemapShotAxis[faceIndex + 1][0][2];
                dir[0] += yCoord * cubemapShotAxis[faceIndex + 1][2][0];
                dir[1] += yCoord * cubemapShotAxis[faceIndex + 1][2][1];
                dir[2] += yCoord * cubemapShotAxis[faceIndex + 1][2][2];
                Vec3Normalize(dir);
                R_CubemapLightingForDir(linearColors, width, height, dir, baseColor, &pixels[faceIndex][4 * (y * width + x)]);
            }
        }
    }
}

static void R_CubemapShotExtractLinearLight(unsigned char **pixels, int width, int height, float (**linearColors)[3])
{
    int faceIndex;
    int pixelIndex;
    int x;
    int y;

    for (faceIndex = 0; faceIndex < 6; ++faceIndex)
    {
        pixelIndex = 0;
        for (y = 0; y < height; ++y)
        {
            for (x = 0; x < width; ++x)
            {
                linearColors[faceIndex][pixelIndex][0] = pow(pixels[faceIndex][4 * pixelIndex + 2] * (1.0f / 255.0f), 2.2f);
                linearColors[faceIndex][pixelIndex][1] = pow(pixels[faceIndex][4 * pixelIndex + 1] * (1.0f / 255.0f), 2.2f);
                linearColors[faceIndex][pixelIndex][2] = pow(pixels[faceIndex][4 * pixelIndex] * (1.0f / 255.0f), 2.2f);
                ++pixelIndex;
            }
        }
    }
}

void R_LightingFromCubemapShots(const float *baseColor)
{
    int pixelsPerFace;
    float (*linearColors[6])[3];

    pixelsPerFace = dx.cubemapShotRes * dx.cubemapShotRes;
    linearColors[0] = (float (*)[3])ri.Z_MallocInternal(72 * pixelsPerFace);
    linearColors[1] = &linearColors[0][pixelsPerFace];
    linearColors[2] = &linearColors[1][pixelsPerFace];
    linearColors[3] = &linearColors[2][pixelsPerFace];
    linearColors[4] = &linearColors[3][pixelsPerFace];
    linearColors[5] = &linearColors[4][pixelsPerFace];
    R_CubemapShotExtractLinearLight(cubeShotGlob.pixels, dx.cubemapShotRes, dx.cubemapShotRes, linearColors);
    R_CubemapLighting(linearColors, dx.cubemapShotRes, dx.cubemapShotRes, baseColor, cubeShotGlob.pixels);
    ri.Z_FreeInternal(linearColors[0]);
}

// Console screenshot and level shot capture.
extern vidConfig_t vidConfig;

// PINNED 1076a834: shared numbering for JPEG and TGA console captures.
static int lastScreenShotNumber;

byte *R_TakeResampledScreenshot(int width, int height, int bytesPerPixel, int headerSize);

// PINNED: retail 0x10026290 reads GfxWorld::baseName at +4.
void R_LevelShot()
{
    char filename[260];
    byte *buffer;
    sprintf(filename, "levelshots/%s.tga", rgp.world->baseName);
    buffer = R_TakeResampledScreenshot(128, 128, 3, 18);
    if (buffer)
    {
        memset(buffer, 0, 18);
        buffer[2] = 2;
        buffer[12] = 128;
        buffer[14] = 128;
        buffer[16] = 24;
        ri.FS_WriteFile(filename, buffer, 49170);
        ri.Z_FreeInternal(buffer);
        ri.Printf(0, "Wrote %s\n", filename);
    }
}

void R_SaveJpg(const char *filename, int quality, int width, int height, byte *pixels);
Bool R_GetFrontBufferData(int x, int y, int width, int height, int bytesPerPixel, byte *buffer);
void R_TakeScreenshotTga(int x, int y, int width, int height, const char *filename);

// PINNED 10026240/78: capture failure still frees the pixel allocation.
void R_TakeScreenshotJpeg(int x, int y, int width, int height, const char *filename)
{
    byte *buffer = (byte *)ri.Z_MallocInternal(width * height * 3);
    if (R_GetFrontBufferData(x, y, width, height, 3, buffer))
        R_SaveJpg(filename, 90, width, height, buffer);
    ri.Z_FreeInternal(buffer);
}

// PINNED 10026330/101: savegame thumbnails use512-square resampled JPEGs.
void R_SaveGameShot(const char *name)
{
    char filename[264];
    sprintf(filename, "%s.jpg", name);
    byte *buffer = R_TakeResampledScreenshot(512, 512, 3, 0);
    if (buffer)
    {
        R_SaveJpg(filename, 90, 512, 512, buffer);
        ri.Z_FreeInternal(buffer);
    }
}

// PINNED 100263a0/567: preserve the original9999 rejection and negative-counter fallback.
void R_ScreenShotCmd(int type)
{
    const char *extension;
    if (type == 0)
        extension = "jpg";
    else if (type == 1)
        extension = "tga";
    else
        return;
    if (!strcmp(ri.Cmd_Argv(1), "levelshot"))
    {
        R_LevelShot();
        return;
    }
    if (!strcmp(ri.Cmd_Argv(1), "savegame") && ri.Cmd_Argc() == 3 && ri.Cmd_Argv(2)[0])
    {
        R_SaveGameShot(ri.Cmd_Argv(2));
        return;
    }
    bool silent = !strcmp(ri.Cmd_Argv(1), "silent");
    char filename[256];
    if (ri.Cmd_Argc() == 2 && !silent)
        Com_sprintf(filename, sizeof(filename), "screenshots/%s.%s", ri.Cmd_Argv(1), extension);
    else
    {
        if (lastScreenShotNumber > 9999)
        {
            ri.Printf(0, "ScreenShot: Couldn't create a file\n");
            return;
        }
        for (;;)
        {
            if (lastScreenShotNumber < 0 || lastScreenShotNumber > 9999)
                Com_sprintf(filename, sizeof(filename), "screenshots/shot9999.%s", extension);
            else
                Com_sprintf(filename, sizeof(filename), "screenshots/shot%04i.%s", lastScreenShotNumber, extension);
            if (!ri.FS_FileExists(filename))
                break;
            if (++lastScreenShotNumber > 9999)
                break;
        }
        if (lastScreenShotNumber >= 9999)
        {
            ri.Printf(0, "ScreenShot: Couldn't create a file\n");
            return;
        }
        ++lastScreenShotNumber;
    }
    if (type == 1)
        R_TakeScreenshotTga(0, 0, vidConfig.width, vidConfig.height, filename);
    else
        R_TakeScreenshotJpeg(0, 0, vidConfig.width, vidConfig.height, filename);
    if (!silent)
        ri.Printf(0, "Wrote %s\n", filename);
}

// PINNED 100052a0/9: type1 is TGA.
void R_ScreenShot_f()
{
    R_ScreenShotCmd(1);
}

// PINNED 100052b0/9: type0 is JPEG.
void R_ScreenShotJpeg_f()
{
    R_ScreenShotCmd(0);
}
