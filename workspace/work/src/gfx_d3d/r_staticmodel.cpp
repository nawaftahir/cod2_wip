// Static model runtime helpers. TU name from the Mac 1.3 build path.
#include "gfx.h"

// PINNED 100296a0/73.
int R_GetMaxModelSurfaceCount(const XModel *model)
{
    XSurface **surfaces;
    int *partBits;
    int maxSurfaces = 0;
    int lodCount = ri.XModelGetNumLods(model);
    for (int lod = 0; lod < lodCount; ++lod)
    {
        int surfaceCount = ri.XModelGetSurfaces(model, &surfaces, lod, &partBits);
        if (maxSurfaces < surfaceCount)
            maxSurfaces = surfaceCount;
    }
    return maxSurfaces;
}
