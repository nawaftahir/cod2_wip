// Draw eligible registry images through the existing feedback material.
#include "r_local.h"
#include "rb_backend.h"
#include "r_permanent.h"
#include "r_image_registry.h"
#include <stdlib.h>

void RB_DrawStretchPic(const Material *material, float x, float y, float w, float h,
    float s0, float t0, float s1, float t1, unsigned int color);
void RB_EndSurface();

// Draw one image through the feedback material so the driver keeps it resident.
#define RB_TOUCH_IMAGE(image) \
    do { \
        if ((image)->mapType == 3) \
        { \
            backEnd.currentFeedbackImage = (image); \
            RB_DrawStretchPic(rgp.feedbackReplaceMaterial, 0.0f, 0.0f, 8.0f, 8.0f, \
                0.0f, 0.0f, 1.0f, 1.0f, 0xffffffff); \
            RB_EndSurface(); \
        } \
    } while (0)

// Name unconfirmed; PINNED 10035830/32: uncalled retail copy of the per-image touch.
void RB_TouchImage(GfxImage *image)
{
    RB_TOUCH_IMAGE(image);
}

// PINNED 10035850: the original second-zero-semantic branch comes first.
static int RB_CompareTouchImages(const void *first, const void *second)
{
    const GfxImage *image0 = *(GfxImage *const *)first;
    const GfxImage *image1 = *(GfxImage *const *)second;
    if (!image1->semantic)
        return -1;
    if (!image0->semantic)
        return 1;
    int difference = image1->cardMemory.platform[0] - image0->cardMemory.platform[0];
    if (difference)
        return difference;
    return image0->semantic - image1->semantic;
}

// PINNED 10035890: use the actual registry and clear feedback after all images.
void RB_TouchAllImages()
{
    ImageList list;
    R_GetImageList(&list);
    qsort(list.image, list.count, sizeof(list.image[0]), RB_CompareTouchImages);
    for (int index = 0; index < list.count; ++index)
    {
        GfxImage *image = list.image[index];
        if (!image->semantic)
            break;
        RB_TOUCH_IMAGE(image);
    }
    backEnd.currentFeedbackImage = 0;
}

typedef char imageResidencyLayoutCheck[(sizeof(ImageList) == 0x2004
    && offsetof(GfxImage, semantic) == 10 && offsetof(GfxImage, cardMemory) == 16
    && offsetof(r_global_permanent_t, feedbackReplaceMaterial) == 0x10a8) ? 1 : -1];
