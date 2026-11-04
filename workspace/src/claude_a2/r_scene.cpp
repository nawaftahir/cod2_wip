// Scene setup.
#include "a2.h"

GfxScene scene;

void R_UpdateFrameFog()
{
    int fadeTime;
    float lerpPos;

    if (scene.def.time >= rg.fogSettings[4].finishTime)
    {
        rg.fogSettings[2] = rg.fogSettings[4];
    }
    else if (rg.fogSettings[3].techniqueOffset != rg.fogSettings[4].techniqueOffset)
    {
        rg.fogSettings[2] = rg.fogSettings[4];
        rg.fogSettings[4].finishTime = 0;
    }
    else
    {
        fadeTime = rg.fogSettings[4].finishTime - rg.fogSettings[4].startTime;
        if (fadeTime <= 0)
            fadeTime = 1;
        lerpPos = (float)(scene.def.time - rg.fogSettings[4].startTime) / fadeTime;
        if (lerpPos > 1.0f)
            lerpPos = 1.0f;
        rg.fogSettings[2].fogStart = (rg.fogSettings[4].fogStart - rg.fogSettings[3].fogStart) * lerpPos + rg.fogSettings[3].fogStart;
        rg.fogSettings[2].fogEnd = (rg.fogSettings[4].fogEnd - rg.fogSettings[3].fogEnd) * lerpPos + rg.fogSettings[3].fogEnd;
        rg.fogSettings[2].density = (rg.fogSettings[4].density - rg.fogSettings[3].density) * lerpPos + rg.fogSettings[3].density;
        rg.fogSettings[2].color.array[0] = (byte)((rg.fogSettings[4].color.array[0] - rg.fogSettings[3].color.array[0]) * lerpPos + rg.fogSettings[3].color.array[0]);
        rg.fogSettings[2].color.array[1] = (byte)((rg.fogSettings[4].color.array[1] - rg.fogSettings[3].color.array[1]) * lerpPos + rg.fogSettings[3].color.array[1]);
        rg.fogSettings[2].color.array[2] = (byte)((rg.fogSettings[4].color.array[2] - rg.fogSettings[3].color.array[2]) * lerpPos + rg.fogSettings[3].color.array[2]);
        rg.fogSettings[2].color.array[3] = (byte)((rg.fogSettings[4].color.array[3] - rg.fogSettings[3].color.array[3]) * lerpPos + rg.fogSettings[3].color.array[3]);
        rg.fogSettings[2].techniqueOffset = rg.fogSettings[4].techniqueOffset;
        rg.fogSettings[2].registered = 1;
        rg.fogSettings[2].clearScreen = rg.fogSettings[4].clearScreen || rg.fogSettings[3].clearScreen;
    }
    if (rg.fogIndex)
        frontEndDataOut->fogSettings = rg.fogSettings[2];
    else
        frontEndDataOut->fogSettings.techniqueOffset = FOG_OFFSET_NONE;
}

static int R_AllocSceneEntity()
{
    static int warnCount;
    int entIndex;

    if (r_drawEntities->current.enabled)
    {
        entIndex = scene.def.entityCount;
        if ((unsigned int)entIndex < 2046)
        {
            if ((unsigned int)frontEndDataOut->entityCount < 8184)
            {
                ++frontEndDataOut->entityCount;
                ++scene.def.entityCount;
                return entIndex;
            }
            if (warnCount != frontEndDataOut->frameCount)
            {
                warnCount = frontEndDataOut->frameCount;
                ri.Printf(2, "too many visible models (more than %i)\n", 8184);
                return -1;
            }
        }
        else if (warnCount != frontEndDataOut->frameCount)
        {
            warnCount = frontEndDataOut->frameCount;
            ri.Printf(2, "too many scene entities (more than %i)\n", 2046);
        }
    }
    return -1;
}

int R_AddStaticModelToScene(int smodelIndex)
{
    int entIndex;
    GfxEntity *ent;
    GfxStaticModelInstance *smodelInst;
    GfxSceneEntity *sceneEnt;

    entIndex = R_AllocSceneEntity();
    if (entIndex < 0)
        return -1;
    ent = &scene.def.entities[entIndex];
    smodelInst = &rgp.world->smodelInsts[smodelIndex];
    memset(ent, 0, sizeof(*ent));
    ent->reType = (refEntityType_t)2;
    VectorCopy(smodelInst->origin, ent->origin);
    AxisCopy(smodelInst->axis, ent->axis);
    ent->scale = smodelInst->scale;
    if (r_rendererInUse->current.integer == 2)
    {
        ent->lighting.dx7.colorForDir = (FxMemMgr_Emitter *(*)[2])&rgp.world->smodelLightingColorTable[smodelIndex];
        ent->lighting.dx7.sunVisibility = rgp.world->smodelLightingSunVisTable[smodelIndex];
    }
    else
    {
        VectorCopy(smodelInst->baseLightingCoords, ent->lighting.baseCoords);
    }
    sceneEnt = &scene.sceneEnts[entIndex];
    memset(sceneEnt, 0, sizeof(*sceneEnt));
    sceneEnt->cullState = 2;
    sceneEnt->u.model = smodelInst->model;
    VectorCopy(smodelInst->mins, sceneEnt->curMins);
    VectorCopy(smodelInst->maxs, sceneEnt->curMaxs);
    return entIndex;
}
