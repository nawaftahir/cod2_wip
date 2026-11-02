// Mac STABS owner; PC field addresses agree at 101ce588..101ce5f3.
#pragma once
#include <stddef.h>

union GfxHullPointsPool;

struct PortalQueueState
{
    int count;
    PortalHeapNode *nodes;
};

struct ActiveOccluders
{
    int count;
    GfxOccluder **list;
};

struct ActiveOccluderPlanes
{
    int count;
    DpvsPlane *planes;
};

struct PortalProjectionState
{
    const D3DMATRIX *viewProjectionMatrix;
    const D3DMATRIX *inverseViewProjectionMatrix;
};

#ifndef GFX_OC_TYPES
struct DpvsDebug
{
    Bool drawWorld;
    Bool drawEntities;
    Bool drawSModels;
    Bool drawXModels;
    Bool drawBModels;
};
#endif

struct DpvsState
{
    DpvsPlane viewPlane;
    DpvsPlane fogPlane;
    const DpvsPlane *nearPlane;
    const DpvsPlane *farPlane;
    PortalProjectionState projection;
    ActiveOccluders occluders;
    ActiveOccluderPlanes occluderPlanes;
    vec4_t viewOrg;
    PortalQueueState queue;
    GfxHullPointsPool *freeHullPoints;
    DpvsDebug debug;
};

struct DpvsConfig
{
    float cullDist;
};

typedef char dpvsStateLayoutCheck[(sizeof(DpvsState) == 108 &&
    sizeof(DpvsConfig) == 4 && sizeof(DpvsDebug) == 5 &&
    offsetof(DpvsState, fogPlane) == 20 &&
    offsetof(DpvsState, nearPlane) == 40 &&
    offsetof(DpvsState, farPlane) == 44 &&
    offsetof(DpvsState, projection) == 48 &&
    offsetof(DpvsState, occluders) == 56 &&
    offsetof(DpvsState, occluderPlanes) == 64 &&
    offsetof(DpvsState, viewOrg) == 72 &&
    offsetof(DpvsState, queue) == 88 &&
    offsetof(DpvsState, freeHullPoints) == 96 &&
    offsetof(DpvsState, debug) == 100) ? 1 : -1];
