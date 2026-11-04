#define IMAGE_CREATE_SOURCE "scratch/wavelet_dxt_loader/j_wavelet.c"
#define IMAGE_DXT_SOURCE
#define ALL_UPLOAD_TEST_ENTRY all_upload_fixture_main
#include "test_image_all_upload.c"

static void *dxt_slots[21];
static void **dxt_vtable = dxt_slots;
static byte dxt_output[64];
static int dxt_face, dxt_mip, uploads;

static int __stdcall create_dxt(void *dev, unsigned int w, unsigned int h,
    unsigned int levels, unsigned int usage, int format, int pool, void **out, void *shared)
{
    assert(w == 8 && h == 8 && format == 0x31545844);
    *out = &dxt_vtable;
    return 0;
}

static int __stdcall create_dxt_cube(void *dev, unsigned int edge, unsigned int levels,
    unsigned int usage, int format, int pool, void **out, void *shared)
{
    return create_dxt(dev, edge, edge, levels, usage, format, pool, out, shared);
}

static int __stdcall dxt_lock(void *texture, unsigned int mip, ImageLockedRect *locked,
    const void *rect, unsigned int flags)
{
    int width;
    assert(!rect && !flags && mip < 4);
    dxt_mip = mip;
    width = image.width >> mip;
    if (width < 1) width = 1;
    locked->pitch = ((width + 3) >> 2) * 8;
    locked->bits = dxt_output;
    image_upload_retry = 0;
    return 0;
}

static int __stdcall dxt_unlock(void *texture, unsigned int mip)
{
    assert((int)mip == dxt_mip);
    assert(dxt_output[0] == (byte)(dxt_mip * 6 + dxt_face + 1));
    uploads += 1;
    return 0;
}

static int __stdcall dxt_cube_lock(void *t, int face, unsigned int mip,
    ImageLockedRect *r, const void *rect, unsigned int flags)
{
    dxt_face = face;
    return dxt_lock(t, mip, r, rect, flags);
}

static int __stdcall dxt_cube_unlock(void *t, int face, unsigned int mip)
{
    assert(face == dxt_face);
    return dxt_unlock(t, mip);
}

int main(void)
{
    GfxImageFileHeader header;
    byte data[336];
    int cube, mip, face, faces, amount, offset;

    assert(all_upload_fixture_main() == 0);
    slots[23] = (void *)create_dxt;
    slots[25] = (void *)create_dxt_cube;
    memset(&header, 0, sizeof(header));
    header.dimensions[0] = 8; header.dimensions[1] = 8; header.dimensions[2] = 1;
    image.semantic = 0;
    for (cube = 0; cube < 2; cube += 1)
    {
        faces = cube ? 6 : 1;
        header.flags = cube ? 4 : 0;
        offset = 0;
        for (mip = 3; mip >= 0; mip -= 1)
        {
            amount = Image_SourceSliceSize(0x31545844, 8 >> mip, 8 >> mip);
            for (face = 0; face < faces; face += 1)
            {
                memset(data + offset, mip * 6 + face + 1, amount);
                offset += amount;
            }
        }
        dxt_slots[19] = cube ? (void *)dxt_cube_lock : (void *)dxt_lock;
        dxt_slots[20] = cube ? (void *)dxt_cube_unlock : (void *)dxt_unlock;
        dxt_face = 0; uploads = 0; can_mip_cubemaps = 1;
        Image_LoadDxtc(&image, &header, data, 0x31545844, 8);
        assert(uploads == faces * 4);
        if (cube)
        {
            uploads = 0; can_mip_cubemaps = 0;
            Image_LoadDxtc(&image, &header, data, 0x31545844, 8);
            assert(uploads == 6);
        }
    }
    return 0;
}
