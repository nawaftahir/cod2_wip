// Image registry and Direct3D texture creation.
#include "r_local.h"
#include <string.h>
#include <dxerr9.h>
#include "universal/com_math.h"

// Field names KisakCOD; PINNED on PC 1.0: imageHashTable 0x101cea68, picmip 0x101d0a68, picmipBump 0x101d0a6c,
// picmipSpec 0x101d0a70, totalMemory 0x101d0a74 (Image_PicmipForSemantic, Image_TrackTexture). Later fields not reconstructed.
struct ImageGlobals
{
    GfxImage *imageHashTable[2048];
    int picmip;
    int picmipBump;
    int picmipSpec;
    int totalMemory[2];
};

extern ImageGlobals imageGlobals;

extern const dvar_t *r_picmip_manual;
extern const dvar_t *r_picmip;
extern const dvar_t *r_picmip_bump;
extern const dvar_t *r_picmip_spec;
unsigned int R_AvailableTextureMemory();

void R_SetPicmip()
{
    unsigned int texMemInMegs;
    unsigned int sysMemInMegs;
    int minPicmip;
    int picmip, picmipBump, picmipSpec;
    bool changed;

    texMemInMegs = R_AvailableTextureMemory();
    sysMemInMegs = ri.Dvar_GetInt("sys_sysMB");
    if (r_picmip_manual->current.enabled)
    {
        ri.Printf(0, "Picmip is set manually.\n");
        imageGlobals.picmip = r_picmip->current.integer;
        imageGlobals.picmipBump = r_picmip_bump->current.integer;
        imageGlobals.picmipSpec = r_picmip_spec->current.integer;
    }
    else
    {
        minPicmip = 2;
        if (r_rendererInUse->current.integer == 2)
        {
            ri.Printf(0, "Texture detail is set automatically for DirectX 7.\n");
            if (texMemInMegs >= 100)
            {
                picmip = 0;
                picmipBump = 0;
                picmipSpec = 0;
            }
            else if (texMemInMegs >= 28)
            {
                picmip = 1;
                picmipBump = 1;
                picmipSpec = 1;
            }
            else
            {
                picmip = 2;
                picmipBump = 2;
                picmipSpec = 2;
            }
            imageGlobals.picmip = picmip;
            imageGlobals.picmipBump = picmipBump;
            imageGlobals.picmipSpec = picmipSpec;
            minPicmip = 0;
            if (sysMemInMegs < 384)
                minPicmip = 1;
        }
        else
        {
            ri.Printf(0, "Texture detail is set automatically.\n");
            if (texMemInMegs >= 300)
            {
                picmip = 0;
                picmipBump = 0;
                picmipSpec = 0;
            }
            else if (texMemInMegs >= 240)
            {
                picmip = 0;
                picmipBump = 0;
                picmipSpec = 1;
            }
            else if (texMemInMegs >= 190)
            {
                picmip = 0;
                picmipBump = 1;
                picmipSpec = 1;
            }
            else
            {
                picmip = 1;
                if (texMemInMegs >= 150)
                {
                    picmipBump = 1;
                    picmipSpec = 1;
                }
                else
                {
                    if (texMemInMegs >= 130)
                        picmipBump = 1;
                    else
                    {
                        picmipBump = 2;
                        if (texMemInMegs < 120)
                            picmip = 2;
                    }
                    picmipSpec = 2;
                }
            }
            imageGlobals.picmip = picmip;
            imageGlobals.picmipBump = picmipBump;
            imageGlobals.picmipSpec = picmipSpec;
            if (sysMemInMegs >= 384)
            {
                minPicmip = 0;
                if (sysMemInMegs < 480)
                    minPicmip = 1;
            }
        }
        if (minPicmip)
        {
            changed = false;
            if (imageGlobals.picmip < minPicmip)
            {
                imageGlobals.picmip = minPicmip;
                changed = true;
            }
            if (imageGlobals.picmipBump < minPicmip)
            {
                imageGlobals.picmipBump = minPicmip;
                changed = true;
            }
            if (imageGlobals.picmipSpec < minPicmip)
            {
                imageGlobals.picmipSpec = minPicmip;
                changed = true;
            }
            if (changed)
                ri.Printf(0, "Reducing texture detail based on total system memory of %i MB to improve load times.\n", sysMemInMegs);
        }
    }
    ri.Dvar_SetInt(r_picmip, imageGlobals.picmip);
    ri.Dvar_SetInt(r_picmip_bump, imageGlobals.picmipBump);
    ri.Dvar_SetInt(r_picmip_spec, imageGlobals.picmipSpec);
    ri.Printf(0, "Using picmip %i on most textures, %i on normal maps, and %i on specular maps\n", imageGlobals.picmip, imageGlobals.picmipBump, imageGlobals.picmipSpec);
}

