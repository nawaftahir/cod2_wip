// Debug primitive buffers.
#include "gfx.h"
#include <string.h>

DebugGlobals debugGlobals;

// PINNED 10005440 through RET10005504.
void R_AddDebugPolygon(DebugGlobals *debug, const float *color, int pointCount,
    const vec3_t *points)
{
    if (debug->vertCount + pointCount > debug->vertLimit
        || debug->polyCount + 1 > debug->polyLimit)
        return;
    if (!debug->polys)
    {
        debug->polys = (GfxDebugPoly *)ri.Z_MallocInternal(debug->polyLimit * sizeof(GfxDebugPoly));
        debug->verts = (vec3_t *)ri.Z_MallocInternal(debug->vertLimit * sizeof(vec3_t));
    }
    debug->polys[debug->polyCount].firstVert = debug->vertCount;
    debug->polys[debug->polyCount].vertCount = pointCount;
    GfxDebugPoly *poly = &debug->polys[debug->polyCount];
    poly->color[0] = color[0];
    poly->color[1] = color[1];
    poly->color[2] = color[2];
    poly->color[3] = color[3];
    ++debug->polyCount;
    memcpy(&debug->verts[debug->vertCount], points, pointCount * sizeof(vec3_t));
    debug->vertCount += pointCount;
}

void R_AddDebugLine(DebugGlobals *debug, const float *start,
    const float *end, const float *color)
{
    if (debug->lineCount + 1 > debug->lineLimit)
        return;
    if (!debug->lines)
        debug->lines = (trDebugLine_t *)ri.Z_MallocInternal(debug->lineLimit * sizeof(trDebugLine_t));
    trDebugLine_t *line = &debug->lines[debug->lineCount];
    VectorCopy(start, line->start);
    VectorCopy(end, line->end);
    VectorCopy4(color, line->color);
    line->depthTest = 0;
    ++debug->lineCount;
}

// PINNED 101924c8: twelve box edges, distinct from model-bound endpoint tables.
static const int iEdgePairs[12][2] = {
    {0,1}, {0,2}, {0,4}, {1,3}, {1,5}, {2,3},
    {2,6}, {3,7}, {4,5}, {4,6}, {5,7}, {6,7}
};

// PINNED 10005590; eight corner choices and twelve capacity-checked line appends.
void R_AddDebugBox(DebugGlobals *debug, const float *mins, const float *maxs,
    const float *color)
{
    vec3_t vertices[8];
    for (int corner = 0; corner < 8; ++corner)
        for (int axis = 0; axis < 3; ++axis)
            vertices[corner][axis] = ((corner >> axis) & 1) ? maxs[axis] : mins[axis];
    for (unsigned int edge = 0; edge < 12; ++edge)
        R_AddDebugLine(debug, vertices[iEdgePairs[edge][0]], vertices[iEdgePairs[edge][1]], color);
}

// PINNED 10005680: 128-byte records and a 95-byte bounded text copy.
void R_AddDebugString(DebugGlobals *debug, const float *origin, const float *color,
    float scale, const char *text)
{
    if (debug->stringCount + 1 > debug->stringLimit)
        return;
    if (!debug->strings)
        debug->strings = (trDebugString_t *)ri.Z_MallocInternal(debug->stringLimit * sizeof(trDebugString_t));
    trDebugString_t *entry = &debug->strings[debug->stringCount];
    VectorCopy(origin, entry->xyz);
    VectorCopy4(color, entry->color);
    entry->scale = scale;
    strncpy(entry->text, text, 95);
    entry->text[95] = '\0';
    ++debug->stringCount;
}

// PINNED 10005710 through RET100057a0.
void R_AddScaledDebugString(DebugGlobals *debug, const GfxViewParms *viewParms,
    const float *origin, const float *color, const char *text)
{
    vec3_t delta;
    VectorSubtract(origin, viewParms->origin, delta);
    float distance = Vec3Normalize(delta);
    float dot = DotProduct(delta, viewParms->axis[0]);
    float scale = distance * (dot - 0.995f);
    if (scale < 1.0f)
        scale = 1.0f;
    R_AddDebugString(debug, origin, color, scale, text);
}

// Retail 100057b0 / 100057e0 (names from opencod2 r_debug.c): clear and set capacities.
void R_InitDebugEntry(DebugGlobals *debugGlobalsEntry)
{
    memset(debugGlobalsEntry, 0, sizeof(DebugGlobals));
    debugGlobalsEntry->vertLimit = 4096;
    debugGlobalsEntry->polyLimit = 512;
    debugGlobalsEntry->stringLimit = 4096;
    debugGlobalsEntry->lineLimit = 16384;
    debugGlobalsEntry->plumeLimit = 4096;
}

void R_InitDebug()
{
    R_InitDebugEntry(&debugGlobals);
}

void R_ShutdownDebugEntry(DebugGlobals *debugGlobalsEntry)
{
    if (debugGlobalsEntry->polys)
    {
        ri.Z_FreeInternal(debugGlobalsEntry->polys);
        debugGlobalsEntry->polys = NULL;
    }
    if (debugGlobalsEntry->verts)
    {
        ri.Z_FreeInternal(debugGlobalsEntry->verts);
        debugGlobalsEntry->verts = NULL;
    }
    if (debugGlobalsEntry->strings)
    {
        ri.Z_FreeInternal(debugGlobalsEntry->strings);
        debugGlobalsEntry->strings = NULL;
    }
    if (debugGlobalsEntry->externStrings)
    {
        ri.Z_FreeInternal(debugGlobalsEntry->externStrings);
        debugGlobalsEntry->externStrings = NULL;
    }
    if (debugGlobalsEntry->lines)
    {
        ri.Z_FreeInternal(debugGlobalsEntry->lines);
        debugGlobalsEntry->lines = NULL;
    }
    if (debugGlobalsEntry->externLines)
    {
        ri.Z_FreeInternal(debugGlobalsEntry->externLines);
        debugGlobalsEntry->externLines = NULL;
    }
    if (debugGlobalsEntry->plumes)
    {
        ri.Z_FreeInternal(debugGlobalsEntry->plumes);
        debugGlobalsEntry->plumes = NULL;
    }
}

void R_ShutdownDebug()
{
    R_ShutdownDebugEntry(&debugGlobals);
}

void R_LocateDebugStrings(trDebugString_t *strings, int stringCount, int maxStringCount)
{
    DebugGlobals *debugGlobalsEntry;

    debugGlobalsEntry = &frontEndDataOut->debugGlobals;
    if (strings)
    {
        if (!debugGlobalsEntry->externStrings)
            debugGlobalsEntry->externStrings = (trDebugString_t *)ri.Z_MallocInternal(maxStringCount * sizeof(trDebugString_t));
        memcpy(debugGlobalsEntry->externStrings, strings, stringCount * sizeof(trDebugString_t));
    }
    debugGlobalsEntry->externStringCount = stringCount;
}

void R_LocateDebugLines(trDebugLine_t *lines, int lineCount, int maxLineCount)
{
    DebugGlobals *debugGlobalsEntry;

    debugGlobalsEntry = &frontEndDataOut->debugGlobals;
    if (lines)
    {
        if (!debugGlobalsEntry->externLines)
            debugGlobalsEntry->externLines = (trDebugLine_t *)ri.Z_MallocInternal(maxLineCount * sizeof(trDebugLine_t));
        memcpy(debugGlobalsEntry->externLines, lines, lineCount * sizeof(trDebugLine_t));
    }
    debugGlobalsEntry->externLineCount = lineCount;
}

void R_AddPlume(const vec_t *origin, int score, const vec_t *color, int duration)
{
    if (!debugGlobals.plumes)
    {
        debugGlobals.plumes = (GfxDebugPlume *)ri.Z_MallocInternal(debugGlobals.plumeLimit * sizeof(GfxDebugPlume));
        debugGlobals.plumeCount = 0;
    }
    if (debugGlobals.plumeCount == debugGlobals.plumeLimit)
        return;
    VectorCopy(origin, debugGlobals.plumes[debugGlobals.plumeCount].origin);
    VectorCopy(color, debugGlobals.plumes[debugGlobals.plumeCount].color);
    debugGlobals.plumes[debugGlobals.plumeCount].score = score;
    debugGlobals.plumes[debugGlobals.plumeCount].startTime = scene.def.time;
    debugGlobals.plumes[debugGlobals.plumeCount].duration = duration;
    debugGlobals.plumeCount++;
}

void R_TransferDebugGlobals(DebugGlobals *debugGlobalsEntry)
{
    int plumeIndex;
    int elapsed;

    plumeIndex = 0;
    while (plumeIndex < debugGlobals.plumeCount)
    {
        elapsed = scene.def.time - debugGlobals.plumes[plumeIndex].startTime;
        if (elapsed < 0 || elapsed > debugGlobals.plumes[plumeIndex].duration)
        {
            debugGlobals.plumeCount--;
            debugGlobals.plumes[plumeIndex] = debugGlobals.plumes[debugGlobals.plumeCount];
        }
        else
        {
            plumeIndex++;
        }
    }
    if (debugGlobals.plumes)
    {
        if (!debugGlobalsEntry->plumes)
            debugGlobalsEntry->plumes = (GfxDebugPlume *)ri.Z_MallocInternal(debugGlobals.plumeLimit * sizeof(GfxDebugPlume));
        memcpy(debugGlobalsEntry->plumes, debugGlobals.plumes, debugGlobals.plumeCount * sizeof(GfxDebugPlume));
    }
    debugGlobalsEntry->plumeCount = debugGlobals.plumeCount;
}
