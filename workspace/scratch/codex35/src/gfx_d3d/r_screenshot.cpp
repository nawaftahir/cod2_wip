// r_screenshot.cpp - cubemap shots and screenshots.

#include "r_local.h"
#include "universal/com_math.h"
#include <math.h>
#include <dxerr9.h>

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
