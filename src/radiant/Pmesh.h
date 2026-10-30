#pragma once
#include <stddef.h>

struct PatchControl
{
    float xyz[3];
    unsigned char field_0c[0x38-12];
};

struct patchMesh_t
{
    int width;
    int height;
    unsigned char field_08[0x24-8];
    PatchControl ctrl[16][16];
    unsigned char field_3824[0x3838-0x3824];
};

// Allocation, control stride and positions are pinned; other storage is undecoded.
typedef char PatchControlSize[(sizeof(PatchControl)==0x38)?1:-1];
typedef char PatchControlOffset[(offsetof(patchMesh_t,ctrl)==0x24)?1:-1];
typedef char PatchMeshSize[(sizeof(patchMesh_t)==0x3838)?1:-1];

float Patch_WidthDistanceTo(patchMesh_t *patch, int count);
float Patch_HeightDistanceTo(patchMesh_t *patch, int count);
