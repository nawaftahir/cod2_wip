#pragma once
#include <stddef.h>

struct PatchControl
{
    float xyz[3];
    unsigned char field_0c[0x34-12];
    unsigned int flags_34; // Retail 0x425840 tests bit 1 at control +0x34
};

struct patchMesh_t
{
    int width;
    int height;
    unsigned char field_08[0x24-8];
    PatchControl ctrl[16][16];
    unsigned char field_3824[8];
    short version;
    unsigned char field_382e;
    unsigned char flag_382f; // CoD2 0x425820 writes the byte on mode 1
    unsigned char field_3830[4];
    float value_3834; // CoD2 0x425820 stores the value when enabled
};

// Allocation, control stride and positions are pinned; other storage is undecoded.
typedef char PatchControlFlagsOffset[(offsetof(PatchControl,flags_34)==0x34)?1:-1];
typedef char PatchControlSize[(sizeof(PatchControl)==0x38)?1:-1];
typedef char PatchControlOffset[(offsetof(patchMesh_t,ctrl)==0x24)?1:-1];
typedef char PatchVersionOffset[(offsetof(patchMesh_t,version)==0x382c)?1:-1];
typedef char PatchFlagOffset[(offsetof(patchMesh_t,flag_382f)==0x382f)?1:-1];
typedef char PatchValueOffset[(offsetof(patchMesh_t,value_3834)==0x3834)?1:-1];
typedef char PatchMeshSize[(sizeof(patchMesh_t)==0x3838)?1:-1];

float Patch_WidthDistanceTo(patchMesh_t *patch, int count);
float Patch_HeightDistanceTo(patchMesh_t *patch, int count);
