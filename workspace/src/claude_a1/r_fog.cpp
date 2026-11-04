// Fog settings.
#include "a1.h"

void R_SetFog(int fogvar, float start, float end, int r, int g, int b, float density)
{
    rg.fogSettings[fogvar].color.array[2] = (byte)r;
    rg.fogSettings[fogvar].color.array[1] = (byte)g;
    rg.fogSettings[fogvar].color.array[0] = (byte)b;
    rg.fogSettings[fogvar].color.array[3] = 0xff;
    rg.fogSettings[fogvar].fogEnd = end;
    rg.fogSettings[fogvar].fogStart = start;
    if (density >= 1.0f)
    {
        rg.fogSettings[fogvar].techniqueOffset = (GfxFogOffset)1;
        rg.fogSettings[fogvar].drawSky = 1;
        rg.fogSettings[fogvar].clearScreen = 0;
        rg.fogSettings[fogvar].density = 1.0f;
    }
    else
    {
        rg.fogSettings[fogvar].techniqueOffset = (GfxFogOffset)2;
        rg.fogSettings[fogvar].drawSky = 1;
        rg.fogSettings[fogvar].clearScreen = 0;
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
