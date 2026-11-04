/* Actual caller1000fc30. Helper bodies/custom ABI context remain unreconstructed. */
extern void (*image_renderer_free_temp)(void *pixels);

static __declspec(noinline) unsigned char Image_LoadRaw(GfxImagePrefix *image, const char *filepath)
{
    unsigned char *pixels;
    unsigned char *file;
    unsigned int width;
    unsigned int height;
    int format;

    pixels = NULL;
    R_LoadJpg(filepath, &file, &pixels, &width, &height, &format);
    if (pixels == NULL)
    {
        return 0;
    }
    Image_Setup(image, width, height, 1, 3, 0, format);
    if (image->mapType == 4)
    {
        Image_Upload3D_CopyData_PC(image, format, 0, pixels);
    }
    else
    {
        Image_Upload2D_CopyData_PC(image, format, 0, 0, pixels);
    }
    (*image_renderer_free_temp)(pixels);
    (*jpeg_renderer_free_file)(file);
    return 1;
}
