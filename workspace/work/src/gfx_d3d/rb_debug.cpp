// Debug drawing; PC instructions pinned in proof/nov02_debug_render_primary.asm.
#include "gfx.h"
#include "rb_tess.h"
#include <math.h>
#include <stddef.h>
#pragma intrinsic(sin)

extern r_backEndGlobals_t backEnd;
extern GfxBackEndData *backEndData;
extern const dvar_t *r_rendererInUse;
void RB_DrawLines3D(int count, int width, const GfxPointVertex *vertices, bool depthTest);
void RB_DrawTextInSpace(const char *text, Font_s *font, const float *origin,
    const float *xStep, const float *yStep, unsigned int color);
void RB_Set3D();
void RB_EndSurface();
void RB_BeginSurface(const Material *material, int technique, int lightmap);
void RB_TessOverflow();
void R_AddDebugString(DebugGlobals *debug, const float *origin, const float *color,
    float scale, const char *text);

typedef char debugDrawLayoutCheck[(sizeof(GfxPointVertex) == 16
    && sizeof(trDebugLine_t) == 44 && offsetof(trDebugLine_t, depthTest) == 40
    && sizeof(trDebugString_t) == 128 && offsetof(trDebugString_t, text) == 32
    && sizeof(GfxDebugPlume) == 40 && offsetof(GfxBackEndData, debugGlobals) == 0x249d18
    && sizeof(GfxVertex) == 64 && sizeof(GfxVertexDx7) == 36) ? 1 : -1];

// PINNED 10034010: null means white; non-null color truncates in BGRA order.
static int RB_AddDebugLine(const float *start, const float *end, const float *color,
    bool depthTest, int count, int limit, GfxPointVertex *vertices)
{
    if (count + 2 > limit)
    {
        RB_DrawLines3D(count / 2, 1, vertices, depthTest);
        count = 0;
    }
    GfxPointVertex *vertex = &vertices[count];
    if (!color)
        memset(vertex[0].color, 255, 4);
    else
    {
        vertex[0].color[0] = (byte)(int)(color[2] * 255.0f);
        vertex[0].color[1] = (byte)(int)(color[1] * 255.0f);
        vertex[0].color[2] = (byte)(int)(color[0] * 255.0f);
        vertex[0].color[3] = (byte)(int)(color[3] * 255.0f);
    }
    memcpy(vertex[1].color, vertex[0].color, 4);
    memcpy(vertex[0].xyz, start, 12);
    memcpy(vertex[1].xyz, end, 12);
    return count + 2;
}

// PINNED 100340f0: the two physical vertex formats keep the same debug frame.
static void RB_SetDebugVertex(int index, const float *xyz, unsigned int color)
{
    if (r_rendererInUse->current.integer == 2)
    {
        GfxVertexDx7 *vertex = (GfxVertexDx7 *)tess.vertexData + index;
        memcpy(vertex->xyz, xyz, 12);
        VectorSet(vertex->normal, 0.0f, 0.0f, 1.0f);
        vertex->color.packed = color;
        Vector2Set(vertex->texCoord, 0.0f, 0.0f);
    }
    else
    {
        GfxVertex *vertex = (GfxVertex *)tess.vertexData + index;
        memcpy(vertex->xyzw, xyz, 12);
        vertex->xyzw[3] = 1.0f;
        VectorSet(vertex->normal, 0.0f, 0.0f, 1.0f);
        vertex->color.packed = color;
        VectorSet(vertex->binormal, 0.0f, 1.0f, 0.0f);
        VectorSet(vertex->tangent, 1.0f, 0.0f, 0.0f);
        Vector2Set(vertex->texCoord, 0.0f, 0.0f);
    }
}

// PINNED 100341d0: fan winding is first/current/previous, with live counters.
static void RB_DrawPolyInteriors()
{
    RB_BeginSurface(rgp.whiteMaterial, 3, 0);
    for (int index = 0; index < backEndData->debugGlobals.polyCount; ++index)
    {
        GfxDebugPoly *poly = &backEndData->debugGlobals.polys[index];
        vec3_t *vertices = &backEndData->debugGlobals.verts[poly->firstVert];
        byte bytes[4];
        bytes[0] = (byte)(int)(poly->color[2] * 255.0f);
        bytes[1] = (byte)(int)(poly->color[1] * 255.0f);
        bytes[2] = (byte)(int)(poly->color[0] * 255.0f);
        bytes[3] = (byte)(int)(poly->color[3] * 255.0f);
        unsigned int color; memcpy(&color, bytes, 4);
        if (poly->vertCount + tess.vertexCount > 5450
            || tess.indexCount + (poly->vertCount - 2) * 3 > 0x100000)
            RB_TessOverflow();
        for (int vertex = 0; vertex < poly->vertCount; ++vertex)
            RB_SetDebugVertex(tess.vertexCount + vertex, vertices[vertex], color);
        for (int vertex = 2; vertex < poly->vertCount; ++vertex)
        {
            tess.indices[tess.indexCount] = (unsigned short)tess.vertexCount;
            tess.indices[tess.indexCount + 1] = (unsigned short)(vertex + tess.vertexCount);
            tess.indices[tess.indexCount + 2] = (unsigned short)(vertex + tess.vertexCount - 1);
            tess.indexCount += 3;
        }
        tess.vertexCount += poly->vertCount;
    }
    RB_EndSurface();
}

// PINNED 100343d0: outlines use white, not the polygon fill color.
static void RB_DrawPolyOutlines()
{
    GfxPointVertex *vertices = (GfxPointVertex *)ri.Z_MallocInternal(0xaa50);
    int count = 0;
    for (int index = 0; index < backEndData->debugGlobals.polyCount; ++index)
    {
        GfxDebugPoly *poly = &backEndData->debugGlobals.polys[index];
        vec3_t *points = &backEndData->debugGlobals.verts[poly->firstVert];
        int previous = poly->vertCount - 1;
        for (int vertex = 0; vertex < poly->vertCount; ++vertex)
        {
            count = RB_AddDebugLine(points[previous], points[vertex], 0, false, count, 2725, vertices);
            previous = vertex;
        }
    }
    if (count / 2)
        RB_DrawLines3D(count / 2, 1, vertices, false);
    ri.Z_FreeInternal(vertices);
}

// PINNED 10034500: flush whenever depth testing changes between lines.
static void RB_DrawDebugLines(trDebugLine_t *lines, int count)
{
    if (!count)
        return;
    if (backEnd.projection2D)
        RB_Set3D();
    GfxPointVertex *vertices = (GfxPointVertex *)ri.Z_MallocInternal(0xaa50);
    bool depthTest = lines[0].depthTest != 0;
    int vertexCount = 0;
    for (int index = 0; index < count; ++index)
    {
        bool nextDepthTest = lines[index].depthTest != 0;
        if (nextDepthTest != depthTest)
        {
            if (vertexCount / 2)
                RB_DrawLines3D(vertexCount / 2, 1, vertices, depthTest);
            depthTest = nextDepthTest;
            vertexCount = 0;
        }
        vertexCount = RB_AddDebugLine(lines[index].start, lines[index].end,
            lines[index].color, depthTest, vertexCount, 2725, vertices);
    }
    if (vertexCount / 2)
        RB_DrawLines3D(vertexCount / 2, 1, vertices, depthTest);
    ri.Z_FreeInternal(vertices);
}

// PINNED 100345e0: text uses the live backend camera, font and final counters.
static void RB_DrawDebugStrings(trDebugString_t *strings, int count)
{
    if (!count)
        return;
    if (backEnd.projection2D)
        RB_Set3D();
    for (int index = 0; index < count; ++index)
    {
        trDebugString_t *string = &strings[index];
        byte bytes[4];
        bytes[0] = (byte)(int)(string->color[2] * 255.0f);
        bytes[1] = (byte)(int)(string->color[1] * 255.0f);
        bytes[2] = (byte)(int)(string->color[0] * 255.0f);
        bytes[3] = (byte)(int)(string->color[3] * 255.0f);
        unsigned int color; memcpy(&color, bytes, 4);
        float scale = -string->scale;
        const GfxViewParms *view = backEnd.viewParms;
        vec3_t xStep, yStep;
        for (int axis = 0; axis < 3; ++axis)
        {
            xStep[axis] = scale * view->axis[1][axis];
            yStep[axis] = scale * view->axis[2][axis];
        }
        RB_DrawTextInSpace(string->text, (Font_s *)backEnd.debugFont, string->xyz, xStep, yStep, color);
    }
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
}

// PINNED 10034700: expiration is inclusive and position oscillates sideways.
static void RB_DrawDebugPlumes(const GfxViewParms *view)
{
    for (int index = 0; index < backEndData->debugGlobals.plumeCount; ++index)
    {
        GfxDebugPlume *plume = &backEndData->debugGlobals.plumes[index];
        int elapsed = backEnd.sceneDef.time - plume->startTime;
        if (elapsed < 0 || elapsed > plume->duration)
            continue;
        plume->color[3] = 1.0f;
        plume = &backEndData->debugGlobals.plumes[index];
        if (elapsed * 2 > plume->duration)
            plume->color[3] = 2.0f - (float)(elapsed * 2) / plume->duration;
        plume = &backEndData->debugGlobals.plumes[index];
        double shift = sin((double)elapsed * 0.012566371f + index) * 4.0f;
        vec3_t origin;
        origin[0] = (float)(shift * view->axis[1][0] + plume->origin[0]);
        origin[1] = (float)(shift * view->axis[1][1] + plume->origin[1]);
        origin[2] = (float)(shift * view->axis[1][2] + plume->origin[2] + (double)elapsed * 0.064f);
        const char *text = va("%i", plume->score);
        R_AddDebugString(&backEndData->debugGlobals, origin,
            backEndData->debugGlobals.plumes[index].color, 0.5f, text);
    }
}

// PINNED 10034840: reload frame ownership after each callback group.
void RB_DrawDebug(const GfxViewParms *view)
{
    RB_DrawDebugPlumes(view);
    if (backEndData->debugGlobals.polyCount)
    {
        if (backEnd.projection2D)
            RB_Set3D();
        RB_DrawPolyInteriors();
        RB_DrawPolyOutlines();
        backEndData->debugGlobals.polyCount = 0;
    }
    RB_DrawDebugLines(backEndData->debugGlobals.lines, backEndData->debugGlobals.lineCount);
    RB_DrawDebugLines(backEndData->debugGlobals.externLines, backEndData->debugGlobals.externLineCount);
    backEndData->debugGlobals.lineCount = 0;
    RB_DrawDebugStrings(backEndData->debugGlobals.strings, backEndData->debugGlobals.stringCount);
    RB_DrawDebugStrings(backEndData->debugGlobals.externStrings, backEndData->debugGlobals.externStringCount);
}
