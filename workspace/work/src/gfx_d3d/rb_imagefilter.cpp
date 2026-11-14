// PINNED PC filter generators 10034ca0--100353be.
#include "gfx.h"
#include <math.h>

extern r_backEndGlobals_t backEnd;
extern DxGlobals dx;
extern vidConfig_t vidConfig;

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
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx][0] = -tapOffsetsX[ix];
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx][1] = tapOffsetsY[iy];
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx][2] = 0.0f;
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx][3] = tapWeightsX[ix] * tapWeightsY[iy];
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx + 1][0] = tapOffsetsX[ix];
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx + 1][1] = tapOffsetsY[iy];
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx + 1][2] = 0.0f;
            filterPass->tapOffsetsAndWeights[2 * tapEntryIdx++ + 1][3] = tapWeightsX[ix] * tapWeightsY[iy];
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

// Filter application and glow images.

typedef char imageFilterLayoutCheck[(offsetof(GfxImageFilter, sourceImage) == 0x984
    && offsetof(GfxImageFilter, pingPongTargets) == 0x98c) ? 1 : -1];
void RB_SetRenderTarget(GfxRenderTargetId target);
void RB_DrawStretchPic(const Material *material, float x, float y, float width, float height,
    float s0, float t0, float s1, float t1, unsigned int color);
void RB_EndSurface();

// PINNED 100353c0: filter constants begin at slot33, not the Mac draft's35.
static void RB_SetFilterConstants(const GfxImageFilterPass *pass)
{
    for (int index = 0; index < pass->tapHalfCount; ++index)
        for (int component = 0; component < 4; ++component)
            backEnd.codeConsts[33 + index][component] = pass->tapOffsetsAndWeights[index][component];
}

// Pass target selection, shared by RB_ApplyFilterPasses and its uncalled retail copy.
#define RB_BIND_PASS_TARGET(filter, index) \
    do { \
        backEnd.currentFeedbackImage = (index) \
            ? dx.renderTargets[(filter)->pingPongTargets[1 - ((index) & 1)]].image : (filter)->sourceImage; \
        RB_SetRenderTarget((index) == (filter)->passCount - 1 ? (filter)->finalTarget \
            : (filter)->pingPongTargets[(index) & 1]); \
    } while (0)

// Name unconfirmed; PINNED 10035430/64: uncalled retail copy of the pass target selection.
void RB_BindFilterPassTarget(GfxImageFilter *filter, int index)
{
    RB_BIND_PASS_TARGET(filter, index);
}

// Name unconfirmed; PINNED 10035480/1: uncalled retail empty function.
void RB_FilterNoOp()
{
}

// PINNED 10035490: live count, source from the preceding ping-pong target.
static void RB_ApplyFilterPasses(GfxImageFilter *filter)
{
    for (int index = 0; index < filter->passCount; ++index)
    {
        GfxImageFilterPass *pass = &filter->passes[index];
        int pingPong = index & 1;
        (void)pingPong;
        RB_BIND_PASS_TARGET(filter, index);
        RB_SetFilterConstants(pass);
        RB_DrawStretchPic(pass->material, 0.0f, 0.0f, (float)pass->dstWidth,
            (float)pass->dstHeight, 0.0f, 0.0f, pass->srcWidth, pass->srcHeight, 0xffffffff);
        RB_EndSurface();
    }
}

// PINNED 10035560: scale radius by viewport height and the pixel aspect ratio.
void RB_GaussianFilterImage(float radius, GfxRenderTargetId target)
{
    float radiusY = (float)backEnd.viewParms->viewport.Height * radius * 0.0020833334f;
    float radiusX = vidConfig.aspectRatioPixel * radiusY;
    GfxImageFilter filter;
    filter.sourceImage = dx.renderTargets[R_RENDERTARGET_RESOLVED_SCENE].image;
    filter.finalTarget = target;
    filter.pingPongTargets[0] = R_RENDERTARGET_PINGPONG_0;
    filter.pingPongTargets[1] = R_RENDERTARGET_PINGPONG_1;
    filter.passCount = RB_GenerateGaussianFilterChain(radiusX, radiusY,
        vidConfig.width, vidConfig.height, dx.renderTargets[target].width,
        dx.renderTargets[target].height, filter.passes);
    RB_ApplyFilterPasses(&filter);
}

// PINNED 10035620: zero radius or an empty chain returns the SOURCE target.
static GfxRenderTargetId RB_ApplyGlowFilter(GfxRenderTargetId source, GfxRenderTargetId target, float radius)
{
    if (radius == 0.0f)
        return source;
    float radiusY = (float)backEnd.viewParms->viewport.Height * radius * 0.0020833334f;
    float radiusX = vidConfig.aspectRatioPixel * radiusY;
    int width = dx.renderTargets[target].width, height = dx.renderTargets[target].height;
    GfxImageFilter filter;
    filter.sourceImage = dx.renderTargets[source].image;
    filter.finalTarget = target;
    filter.pingPongTargets[0] = R_RENDERTARGET_PINGPONG_0;
    filter.pingPongTargets[1] = R_RENDERTARGET_PINGPONG_1;
    filter.passCount = 0;
    if (source == R_RENDERTARGET_RESOLVED_SCENE)
    {
        GfxImageFilterPass *pass = &filter.passes[0];
        pass->material = rgp.glowSetupMaterial;
        pass->srcWidth = pass->srcHeight = 1.0f;
        pass->dstWidth = width;
        pass->dstHeight = height;
        pass->tapHalfCount = 0;
        filter.passCount = 1;
    }
    filter.passCount += RB_GenerateGaussianFilterChain(radiusX, radiusY,
        width, height, width, height, &filter.passes[filter.passCount]);
    if (!filter.passCount)
        return source;
    RB_ApplyFilterPasses(&filter);
    return target;
}

// PINNED 10035740: the second blur adds variance to the already blurred first.
void RB_GlowFilterImage(float radius[2])
{
    if (radius[0] == 0.0f)
        return;
    float ratio = (float)dx.renderTargets[R_RENDERTARGET_GLOW_0].width
        / (float)dx.renderTargets[R_RENDERTARGET_RESOLVED_SCENE].width;
    radius[0] *= ratio;
    radius[1] *= ratio;
    GfxRenderTargetId source = RB_ApplyGlowFilter(backEnd.resolvedSceneTarget,
        R_RENDERTARGET_GLOW_0, radius[0]);
    backEnd.glowImage[0] = dx.renderTargets[source].image;
    if (radius[1] == 0.0f)
        backEnd.glowCount = 1;
    else
    {
        radius[1] = sqrtf(radius[1] * radius[1] - radius[0] * radius[0]);
        GfxRenderTargetId result = RB_ApplyGlowFilter(source, R_RENDERTARGET_GLOW_0, radius[1]);
        backEnd.glowImage[1] = dx.renderTargets[result].image;
        backEnd.glowCount = 2;
    }
}
