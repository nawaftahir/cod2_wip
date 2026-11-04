/* Target171f0: opaque material comparison words, not a complete allocation type. */
typedef struct RawMaterialBindings
{
    unsigned char unknown[0x38];
    unsigned int binding_38;
    unsigned int binding_3c;
    unsigned int binding_40;
} RawMaterialBindings;

extern RawMaterialBindings *image_raw_material;
extern RawMaterialBindings *image_default_material;
extern GfxImagePrefix *image_raw_image;

RawMaterialBindings *R_RegisterRawImage(const char *filepath)
{
    if (image_raw_material->binding_3c != image_default_material->binding_3c ||
        image_raw_material->binding_40 != image_default_material->binding_40 ||
        image_raw_material->binding_38 != image_default_material->binding_38)
    {
        Image_Release(image_raw_image);
        if (!Image_LoadRaw(image_raw_image, filepath))
        {
            return image_default_material;
        }
    }
    return image_raw_material;
}
