// Fog settings.
#include "gfx.h"

// Name unconfirmed; PINNED 1000bae0/32. Uncalled retail copy, inlined in R_SetFog.
static __forceinline void R_PackFogColor(byte *dst, byte r, byte g, byte b, byte a)
{
    dst[2] = r;
    dst[1] = g;
    dst[0] = b;
    dst[3] = a;
}

typedef void (*ArchiveProc)(MemoryFile *, int, void *);

// Name unconfirmed; PINNED 1000bb00/16. Uncalled retail copy, inlined in R_ArchiveFogState.
static __forceinline void R_CallArchiveProc(MemoryFile *memFile, int len, void *data)
{
    ((ArchiveProc)memFile->archiveProc)(memFile, len, data);
}

void R_ClearFogs()
{
    memset(rg.fogSettings, 0, sizeof(rg.fogSettings));
    rg.fogIndex = 0;
}

void R_SetFog(int fogvar, float start, float end, int r, int g, int b, float density)
{
    R_PackFogColor(rg.fogSettings[fogvar].color.array, (byte)r, (byte)g, (byte)b, 0xff);
    rg.fogSettings[fogvar].fogStart = start;
    rg.fogSettings[fogvar].fogEnd = end;
    rg.fogSettings[fogvar].clearScreen = 0;
    if (density >= 1.0f)
    {
        rg.fogSettings[fogvar].techniqueOffset = (GfxFogOffset)1;
        rg.fogSettings[fogvar].drawSky = 1;
        rg.fogSettings[fogvar].density = 1.0f;
    }
    else
    {
        rg.fogSettings[fogvar].techniqueOffset = (GfxFogOffset)2;
        rg.fogSettings[fogvar].drawSky = 1;
        rg.fogSettings[fogvar].density = density;
    }
    rg.fogSettings[fogvar].registered = 1;
}

void R_SwitchFog(int fogvar, int startTime, int transitionTime)
{
    rg.fogIndex = fogvar;
    if (rg.fogSettings[2].registered)
    {
        rg.fogSettings[3] = rg.fogSettings[2];
    }
    else
    {
        rg.fogSettings[3] = rg.fogSettings[fogvar];
        transitionTime = 0;
    }
    rg.fogSettings[4] = rg.fogSettings[fogvar];
    if (!transitionTime)
    {
        rg.fogSettings[4].startTime = 0;
        rg.fogSettings[4].finishTime = 0;
    }
    else
    {
        rg.fogSettings[4].startTime = startTime;
        rg.fogSettings[4].finishTime = startTime + transitionTime;
    }
}

void R_ArchiveFogState(MemoryFile *memFile)
{
    R_CallArchiveProc(memFile, sizeof(rg.fogSettings), rg.fogSettings);
    R_CallArchiveProc(memFile, sizeof(rg.fogIndex), &rg.fogIndex);
}
