// Candidate isolated /Op bounds calculation; historical TU grouping is unconfirmed.
#include "gfx.h"
void R_ConvertAnimMatToSkelMat(const DObjAnimMat *in, DObjSkelMat *out);
void XSurfaceGetVerts(const XSurface *surf, DObjSkelMat *boneMatrix, float *pVert, float *pTexCoord, float *pNormal);

void R_StaticModelBounds(XModel *model, const float *axis, float *mins, float *maxs)
{
    XSurface **surfaces;
    int *partBits;
    DObjSkelMat *matArray;
    float *verts;
    DObjSkelMat *mat;
    const DObjAnimMat *basePose;
    const float *vert;
    float dot;
    int surfaceCount;
    int numBones;
    int surfIndex;
    int vertCount;
    int i;

    mins[0] = FLT_MAX;
    mins[1] = FLT_MAX;
    mins[2] = FLT_MAX;
    maxs[0] = -FLT_MAX;
    maxs[1] = -FLT_MAX;
    maxs[2] = -FLT_MAX;
    surfaceCount = ri.XModelGetSurfaces(model, &surfaces, 0, &partBits);
    matArray = (DObjSkelMat *)ri.Hunk_AllocateTempMemoryInternal(0x2000);
    verts = (float *)ri.Hunk_AllocateTempMemoryInternal(0xff78);
    numBones = ri.XModelNumBones(model);
    basePose = (const DObjAnimMat *)ri.XModelGetBasePose(model);
    if (numBones > 0)
    {
        mat = matArray;
        do
        {
            R_ConvertAnimMatToSkelMat(basePose, mat);
            ++mat;
            ++basePose;
            --numBones;
        } while (numBones);
    }
    surfIndex = 0;
    if (surfaceCount > 0)
    do
    {
        vertCount = surfaces[surfIndex]->vertCount;
        XSurfaceGetVerts(surfaces[surfIndex], matArray, verts, 0, 0);
        if (vertCount > 0)
        {
            vert = verts;
            do
            {
                dot = vert[2] * axis[6] + vert[0] * axis[0] + axis[3] * vert[1];
                if (dot < mins[0])
                    mins[0] = dot;
                if (dot > maxs[0])
                    maxs[0] = dot;
                dot = vert[0] * axis[1] + axis[7] * vert[2] + vert[1] * axis[4];
                if (dot < mins[1])
                    mins[1] = dot;
                if (dot > maxs[1])
                    maxs[1] = dot;
                dot = vert[0] * axis[2] + vert[2] * axis[8] + axis[5] * vert[1];
                if (dot < mins[2])
                    mins[2] = dot;
                if (dot > maxs[2])
                    maxs[2] = dot;
                vert += 3;
                --vertCount;
            } while (vertCount);
        }
        ++surfIndex;
    } while (surfIndex < surfaceCount);
    ri.Hunk_FreeTempMemory(verts);
    ri.Hunk_FreeTempMemory(matArray);
}

