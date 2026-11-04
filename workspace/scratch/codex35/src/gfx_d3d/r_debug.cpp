// Debug primitive buffers.
#include "gfx.h"
#include <string.h>

DebugGlobals debugGlobals;

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
