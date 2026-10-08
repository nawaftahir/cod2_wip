// Portal visibility (DPVS) helpers.
#include "gfx.h"

extern const dvar_t *r_zfar;

// PINNED 1.0: queue count 0x101ce5e0, queue base 0x101ce5e4, cullDist 0x101ce5f4.
int portalQueueCount;
PortalHeapNode *portalQueue;
float dpvsCullDist;
DpvsScene dpvsScene;

void R_ClearDpvsScene()
{
    int cellIndex;

    dpvsScene.modelRefCount = 0;
    if (rgp.world)
    {
        for (cellIndex = 0; cellIndex < rgp.world->cellCount; cellIndex++)
            rgp.world->cells[cellIndex].modelRefs = 0;
    }
}

float R_GetFarPlaneDist()
{
    float farDist;

    farDist = r_zfar->current.value;
    if (farDist == 0.0f && rg.fogIndex && rg.fogSettings[2].registered && rg.fogSettings[2].techniqueOffset == 1)
        farDist = rg.fogSettings[2].fogEnd;
    if (farDist < dpvsCullDist)
        farDist = dpvsCullDist;
    return farDist;
}

void R_SetCullDist(float dist)
{
    if (dist <= 0.0f)
        dpvsCullDist = 0.0f;
    else
        dpvsCullDist = dist;
}

GfxPortal *R_PortalQueuePopMin()
{
    GfxPortal *top;
    int count;
    int hole;
    int index;
    int child;

    top = portalQueue[0].portal;
    *(unsigned char *)top = 0;
    portalQueueCount--;
    count = portalQueueCount;
    hole = 0;
    index = 1;
    if (count > 0)
    {
        do
        {
            child = index;
            if (index < count && portalQueue[index + 1].dist < portalQueue[index].dist)
                child = index + 1;
            if (portalQueue[count].dist <= portalQueue[child].dist)
                break;
            portalQueue[hole] = portalQueue[child];
            index = child * 2 + 1;
            hole = child;
        } while (index <= count);
    }
    portalQueue[hole] = portalQueue[portalQueueCount];
    return top;
}
