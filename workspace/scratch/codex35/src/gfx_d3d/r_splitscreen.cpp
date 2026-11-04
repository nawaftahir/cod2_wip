// Delayed draw groups.
#include "gfx.h"

struct GfxDrawGroupState
{
    bool isIssuingGlue;
    int begin;
    int perView[4];
    int end;
};

GfxDrawGroupState delayedGroup[5];

int R_BeginDelayedDrawing();
void R_EndDelayedDrawing(int marker);
void R_IssueDelayedDrawing(int marker);

void R_InitDrawGroups()
{
    int group;
    int view;

    for (group = 0; group != 5; ++group)
    {
        delayedGroup[group].isIssuingGlue = false;
        delayedGroup[group].begin = -1;
        for (view = 0; view < 4; ++view)
            delayedGroup[group].perView[view] = -1;
        delayedGroup[group].end = -1;
    }
}

int R_BeginDrawGroupSection(int group)
{
    if (delayedGroup[group].begin != -1)
        return 1;
    delayedGroup[group].isIssuingGlue = true;
    delayedGroup[group].begin = R_BeginDelayedDrawing();
    return 0;
}

void R_BeginDrawGroupLoop(int group, int view)
{
    if (delayedGroup[group].isIssuingGlue)
    {
        R_EndDelayedDrawing(delayedGroup[group].begin);
        delayedGroup[group].isIssuingGlue = false;
    }
    delayedGroup[group].perView[view] = R_BeginDelayedDrawing();
}

int R_EndDrawGroupLoop(int group, int view)
{
    if (delayedGroup[group].perView[view] != -1)
        R_EndDelayedDrawing(delayedGroup[group].perView[view]);
    if (delayedGroup[group].end != -1)
        return 1;
    delayedGroup[group].isIssuingGlue = true;
    delayedGroup[group].end = R_BeginDelayedDrawing();
    return 0;
}

void R_EndDrawGroupSection(int group)
{
    if (delayedGroup[group].isIssuingGlue)
    {
        R_EndDelayedDrawing(delayedGroup[group].end);
        delayedGroup[group].isIssuingGlue = false;
    }
}

void R_IssueDrawGroups()
{
    int group;
    int view;

    for (group = 0; group != 5; ++group)
    {
        if (delayedGroup[group].begin != -1)
        {
            R_IssueDelayedDrawing(delayedGroup[group].begin);
            delayedGroup[group].begin = -1;
        }
        for (view = 0; view != 4; ++view)
        {
            if (delayedGroup[group].perView[view] != -1)
            {
                R_IssueDelayedDrawing(delayedGroup[group].perView[view]);
                delayedGroup[group].perView[view] = -1;
            }
        }
        if (delayedGroup[group].end != -1)
        {
            R_IssueDelayedDrawing(delayedGroup[group].end);
            delayedGroup[group].end = -1;
        }
    }
}
