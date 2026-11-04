/* Actual caller1000fc30. Helper bodies/custom ABI context remain unreconstructed. */
extern void Image_Setup(void *image, unsigned int width, unsigned int height,
                        int depth, int flags, int usage, int format);
extern void Image_Upload2D(void *image, int format, int face, int mip,
                          const unsigned char *pixels);
extern void Image_Upload3D(void *image, int format, int mip,
                          const unsigned char *pixels);
extern void (*image_renderer_free_temp)(void *pixels);

unsigned char Image_LoadRaw(void *image, const char *filepath)
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
    if (*(int *)image == 4)
    {
        Image_Upload3D(image, format, 0, pixels);
    }
    else
    {
        Image_Upload2D(image, format, 0, 0, pixels);
    }
    (*image_renderer_free_temp)(pixels);
    (*jpeg_renderer_free_file)(file);
    return 1;
}
