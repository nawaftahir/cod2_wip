// PINNED PC filter generators 10034ca0--100353be.
#include "gfx.h"
#include <math.h>

typedef char filter_pass_size[(sizeof(GfxImageFilterPass) == 0x98) ? 1 : -1];
typedef char filter_material_offset[(offsetof(r_global_permanent_t, symmetricFilterMaterial) == 0x10b0) ? 1 : -1];

static int RB_GaussianFilterPoints1D(float pixels, int srcRes, int dstRes,
    int tapLimit, float *tapOffsets, float *tapWeights)
{
    float srcResF = (float)srcRes;
    float ratio = srcResF / (float)dstRes;
    int ratioRounded = I_fround(ratio);
    float offset = 0.0f;
    if (!(ratioRounded & 1))
        offset = 0.5f;
    float gaussianExponent = -0.5f / (pixels * pixels);
    float totalWeight = 0.0f;
    int tapIndex;
    for (tapIndex = 0; tapIndex < tapLimit; ++tapIndex)
    {
        float sample0 = (float)(tapIndex * 2) + offset;
        float sample1 = (float)(tapIndex * 2 + 1) + offset;
        float weight0 = (float)exp(sample0 * sample0 * gaussianExponent);
        float weight1 = (float)exp(sample1 * sample1 * gaussianExponent);
        if (tapIndex == 0 && offset == 0.0f)
            weight0 *= 0.5f;
        float combinedWeight = weight0 + weight1;
        tapWeights[tapIndex] = combinedWeight;
        if (combinedWeight == 0.0f)
        {
            float sampleAverage = (sample0 + sample1) * 0.5f;
            tapOffsets[tapIndex] = sampleAverage / srcResF;
        }
        else
            tapOffsets[tapIndex] = (sample0 * weight0 + sample1 * weight1)
                / (srcResF * combinedWeight);
        totalWeight += tapWeights[tapIndex];
    }
    if (totalWeight <= 0.001f)
    {
        tapWeights[0] = 0.5f;
        return 1;
    }
    float normFactor = 0.5f / totalWeight;
    int tapCount = tapLimit;
    for (tapIndex = tapLimit - 1; tapIndex >= 0; --tapIndex)
    {
        tapWeights[tapIndex] *= normFactor;
        if (tapWeights[tapIndex] < 0.01f)
            tapCount = tapIndex + 1;
    }
    return tapCount;
}

static void RB_GenerateGaussianFilter1D(float radius, int *res, int axis,
    GfxImageFilterPass *filterPass)
{
    float tapOffsets[8], tapWeights[8];
    int tapHalfCount = RB_GaussianFilterPoints1D(radius, res[axis], res[axis],
        8, tapOffsets, tapWeights);
    filterPass->material = rgp.symmetricFilterMaterial[tapHalfCount - 1];
    filterPass->tapHalfCount = tapHalfCount;
    for (int i = 0; i < 8; ++i)
    {
        filterPass->tapOffsetsAndWeights[i][axis] = tapOffsets[i];
        filterPass->tapOffsetsAndWeights[i][1 - axis] = 0.0f;
        filterPass->tapOffsetsAndWeights[i][2] = 0.0f;
        filterPass->tapOffsetsAndWeights[i][3] = tapWeights[i];
    }
    filterPass->srcWidth = 1.0f;
    filterPass->srcHeight = 1.0f;
    filterPass->dstWidth = res[0];
    filterPass->dstHeight = res[1];
}

static void RB_GenerateGaussianFilter2D(float radius, int srcWidth, int srcHeight,
    int dstWidth, int dstHeight, GfxImageFilterPass *filterPass)
{
    float tapOffsetsX[2], tapOffsetsY[2], tapWeightsX[2], tapWeightsY[2];
    RB_GaussianFilterPoints1D(radius, srcWidth, dstWidth, 2, tapOffsetsX, tapWeightsX);
    RB_GaussianFilterPoints1D(radius, srcHeight, dstHeight, 2, tapOffsetsY, tapWeightsY);
    int tapEntryIdx = 0;
    for (int iy = 0; iy < 2; ++iy)
    {
        for (int ix = 0; ix < 2; ++ix)
        {
            Vector4Set(filterPass->tapOffsetsAndWeights[2 * tapEntryIdx],
                -tapOffsetsX[ix], tapOffsetsY[iy], 0.0f, tapWeightsX[ix] * tapWeightsY[iy]);
            Vector4Set(filterPass->tapOffsetsAndWeights[2 * tapEntryIdx + 1],
                tapOffsetsX[ix], tapOffsetsY[iy], 0.0f, tapWeightsX[ix] * tapWeightsY[iy]);
            ++tapEntryIdx;
        }
    }
    filterPass->material = rgp.symmetricFilterMaterial[2 * tapEntryIdx - 1];
    filterPass->tapHalfCount = 2 * tapEntryIdx;
    filterPass->srcWidth = 1.0f;
    filterPass->srcHeight = 1.0f;
    filterPass->dstWidth = dstWidth;
    filterPass->dstHeight = dstHeight;
}

int RB_GenerateGaussianFilterChain(float radiusX, float radiusY, int srcWidth,
    int srcHeight, int dstWidth, int dstHeight, GfxImageFilterPass *filterPass)
{
    int dstRes[2] = {dstWidth, dstHeight};
    int passCount = 0;
    float filterRadius;
    GfxImageFilterPass *curPass = filterPass;
    if (srcWidth != dstWidth || srcHeight != dstHeight)
    {
        filterRadius = I_fmin(radiusX, radiusY);
        if (filterRadius > 1.3895604610443115f)
            filterRadius = 1.3895604610443115f;
        float radiusSq = filterRadius * filterRadius;
        radiusX = sqrtf(radiusX * radiusX - radiusSq) * dstWidth / srcWidth;
        radiusY = sqrtf(radiusY * radiusY - radiusSq) * dstHeight / srcHeight;
        RB_GenerateGaussianFilter2D(filterRadius, srcWidth, srcHeight, dstWidth, dstHeight, curPass);
        passCount = 1;
    }
    curPass = &filterPass[passCount];
    do
    {
        int passAxis;
        if (!(radiusX >= 0.3295051157474518f) && !(radiusY >= 0.3295051157474518f))
            break;
        if (I_fabs(radiusX - radiusY) < 0.3295051157474518f)
        {
            filterRadius = (radiusX + radiusY) * 0.5f;
            if (filterRadius <= 1.3895604610443115f)
            {
                RB_GenerateGaussianFilter2D(filterRadius, dstWidth, dstHeight,
                    dstWidth, dstHeight, &filterPass[passCount]);
                ++passCount;
                break;
            }
        }
        if (radiusX > radiusY)
        {
            if (radiusX < 6.497750282287598f)
            {
                filterRadius = radiusX;
                radiusX = 0.0f;
            }
            else
            {
                filterRadius = 6.497750282287598f;
                radiusX = sqrtf(radiusX * radiusX - 42.220760345458984f);
            }
            passAxis = 0;
        }
        else
        {
            if (radiusY <= 6.497750282287598f)
            {
                filterRadius = radiusY;
                radiusY = 0.0f;
            }
            else
            {
                filterRadius = 6.497750282287598f;
                radiusY = sqrtf(radiusY * radiusY - 42.220760345458984f);
            }
            passAxis = 1;
        }
        RB_GenerateGaussianFilter1D(filterRadius, dstRes, passAxis, curPass);
        ++passCount;
        ++curPass;
    } while (passCount < 16);
    return passCount;
}
