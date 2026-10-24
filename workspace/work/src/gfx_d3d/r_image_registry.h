// Image-list ABI shared by the registry and image-residency traversal.
#pragma once
struct GfxImage;
struct ImageList
{
    int count;
    GfxImage *image[2048];
};
void R_GetImageList(ImageList *list);
