// lane f r23 drafts: 0x45b840, 0x45bfc0 (brush.cpp), 0x45d7f0 (brush.cpp), 0x467a70 (entity.cpp)

struct GfxPointVertex { float xyz[3]; unsigned char color[4]; };
int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);
extern void (*R_AddCmd_Line3D)(int count, int width, const void *verts);
bool FUN_0045d090(const brushdef_t *b, float *color, const float *defaultColor);

void FUN_0045b840(brush_t *b, const vec3_t origin, const vec3_t mins, const vec3_t maxs, int width)
{
    float color[4];
    float pts[8][4];
    unsigned int packed;
    GfxPointVertex verts[256];
    int vertCount;

    color[0] = 0.0f;
    color[1] = 0.0f;
    color[2] = 1.0f;
    color[3] = 1.0f;
    FUN_0045d090(b->def, color, color);
    (*FUN_0059c468)(color, &packed);

    pts[0][0] = mins[0];
    pts[0][1] = origin[1];
    pts[0][2] = origin[2];
    pts[1][0] = maxs[0];
    pts[1][1] = origin[1];
    pts[1][2] = origin[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, 0, 256);
    pts[0][0] = origin[0];
    pts[0][1] = mins[1];
    pts[0][2] = origin[2];
    pts[1][0] = origin[0];
    pts[1][1] = maxs[1];
    pts[1][2] = origin[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);
    pts[0][0] = origin[0];
    pts[0][1] = origin[1];
    pts[0][2] = mins[2];
    pts[1][0] = origin[0];
    pts[1][1] = origin[1];
    pts[1][2] = maxs[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);

    pts[0][0] = mins[0];
    pts[0][1] = mins[1];
    pts[0][2] = mins[2];
    pts[1][0] = maxs[0];
    pts[1][1] = mins[1];
    pts[1][2] = mins[2];
    pts[2][0] = mins[0];
    pts[2][1] = maxs[1];
    pts[2][2] = mins[2];
    pts[3][0] = maxs[0];
    pts[3][1] = maxs[1];
    pts[3][2] = mins[2];
    pts[4][0] = mins[0];
    pts[4][1] = mins[1];
    pts[4][2] = maxs[2];
    pts[5][0] = maxs[0];
    pts[5][1] = mins[1];
    pts[5][2] = maxs[2];
    pts[6][0] = mins[0];
    pts[6][1] = maxs[1];
    pts[6][2] = maxs[2];
    pts[7][0] = maxs[0];
    pts[7][1] = maxs[1];
    pts[7][2] = maxs[2];
    vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[0], pts[2], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[0], pts[4], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[1], pts[3], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[1], pts[5], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[2], pts[3], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[2], pts[6], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[3], pts[7], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[4], pts[5], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[4], pts[6], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[5], pts[7], &packed, width, vertCount, 256);
    vertCount = R_Add3DLine(verts, pts[6], pts[7], &packed, width, vertCount, 256);

#line 2919
    brush_assert1(b->owner->def == b->def->owner);
    entity_t *e = (entity_t *)b->owner->def;
    if ((*(int *)(dword_01233b64 + 0x2cc) & 0x1000) && !(e->eclass->flags_160 & 0x10))
    {
        (*FUN_0059c468)(e->eclass->color, &packed);
        const brushdef_t *def = b->def;
        pts[0][0] = def->mins[0];
        pts[0][1] = def->mins[1];
        pts[0][2] = def->mins[2];
        pts[1][0] = def->maxs[0];
        pts[1][1] = def->mins[1];
        pts[1][2] = def->mins[2];
        pts[2][0] = def->mins[0];
        pts[2][1] = def->maxs[1];
        pts[2][2] = def->mins[2];
        pts[3][0] = def->maxs[0];
        pts[3][1] = def->maxs[1];
        pts[3][2] = def->mins[2];
        pts[4][0] = def->mins[0];
        pts[4][1] = def->mins[1];
        pts[4][2] = def->maxs[2];
        pts[5][0] = def->maxs[0];
        pts[5][1] = def->mins[1];
        pts[5][2] = def->maxs[2];
        pts[6][0] = def->mins[0];
        pts[6][1] = def->maxs[1];
        pts[6][2] = def->maxs[2];
        pts[7][0] = def->maxs[0];
        pts[7][1] = def->maxs[1];
        pts[7][2] = def->maxs[2];
        vertCount = R_Add3DLine(verts, pts[0], pts[1], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[0], pts[2], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[0], pts[4], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[1], pts[3], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[1], pts[5], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[2], pts[3], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[2], pts[6], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[3], pts[7], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[4], pts[5], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[4], pts[6], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[5], pts[7], &packed, width, vertCount, 256);
        vertCount = R_Add3DLine(verts, pts[6], pts[7], &packed, width, vertCount, 256);
    }
    if (vertCount)
        R_AddCmd_Line3D(vertCount / 2, width, verts);
}

extern bool FUN_0045b420(brush_t *b);
extern void FUN_0045b660(entity_t *e, void *a2, int a3, int a4, int a5, int a6, bool a7);
struct entityInst_t;
extern void FUN_00467a70(entityInst_t *e);
extern void (*FUN_0059c49c)(void *model, int a2, int a3, int a4);
extern void (*FUN_0059c464)(void *material, int a2, int indexCount, const unsigned short *indices, int vertCount, const float (*xyz)[4], const vec3_t *normals, const unsigned int *colors, const vec2_t *st);
extern void *dword_011298c8;
extern float groupColors[16][4];
#define ARRAY_COUNT(a) (sizeof(a) / sizeof((a)[0]))

bool FUN_0045bfc0(brush_t *b, int a2, int a3, int a4, int a5, int width, int a7, bool a8)
{
    if (b->def->modelFailed)
        return false;
    if (!(((entity_t *)b->owner->def)->eclass->flags_160 & 0x10))
    {
        int mode = *(int *)(dword_01233b64 + 0x2cc);
        if (mode == 0x1000)
            return false;
        if ((mode & 0x100) && !FUN_0045b630(b))
            return false;
    }
    if (!FUN_0045b420(b))
    {
#line 2981
        assert(b->def->modelFailed);
        return false;
    }
    FUN_00467a70((entityInst_t *)b->owner);
    if (b->owner->model)
        (*FUN_0059c49c)(b->owner->model, a4, a5, a5 == 0x1e ? a7 : 0);
    if (b->owner->field_38)
        FUN_0045b660((entity_t *)b->owner->def, b->owner->field_38 + 0xc, a2, a3, a5, a7, a8);
#line 2996
    brush_assert1(b->owner->def == b->def->owner);
    entity_t *e = (entity_t *)b->owner->def;
    vec3_t mins, maxs, origin;
    if (e->eclass->flags_160 & 8)
    {
        int size = (int)*(float *)(dword_01233b64 + 0x2ac);
        mins[0] = mins[1] = mins[2] = (float)-size;
        maxs[0] = maxs[1] = maxs[2] = (float)size;
    }
    else
    {
        VectorCopy(e->eclass->mins, mins);
        VectorCopy(e->eclass->maxs, maxs);
    }
    VectorCopy(e->origin, origin);
    VectorAdd(origin, mins, mins);
    VectorAdd(origin, maxs, maxs);
    if (FUN_00465d80(e, *(const char **)(dword_01233b64 + 0x2ec)))
    {
        unsigned int packed;
        float xyz[8][4];
        vec3_t normals[4];
        vec2_t st[4];
        unsigned int colors[4];
        unsigned short indices[6];
        int colorIndex = atoi(ValueForKey(e->epairs, *(const char **)(dword_01233b64 + 0x2ec))) % ARRAY_COUNT(groupColors);
        if (colorIndex < 0)
            colorIndex += ARRAY_COUNT(groupColors);
#line 3023
        brush_assert1(colorIndex >= 0 && colorIndex < ARRAY_COUNT( groupColors ));
        (*FUN_0059c468)(groupColors[colorIndex], &packed);
        float midY = (maxs[1] + mins[1]) * 0.5f;
        float midX = (maxs[0] + mins[0]) * 0.5f;
        xyz[0][0] = mins[0] - 8.0f;
        xyz[0][1] = midY;
        xyz[0][2] = mins[2];
        xyz[0][3] = 1.0f;
        xyz[1][0] = midX;
        xyz[1][1] = maxs[1] + 8.0f;
        xyz[1][2] = mins[2];
        xyz[1][3] = 1.0f;
        xyz[2][0] = maxs[0] + 8.0f;
        xyz[2][1] = midY;
        xyz[2][2] = mins[2];
        xyz[2][3] = 1.0f;
        xyz[3][0] = midX;
        xyz[3][1] = mins[1] - 8.0f;
        xyz[3][2] = mins[2];
        xyz[3][3] = 1.0f;
        for (int i = 0; i < 4; i++)
        {
            normals[i][0] = 0.0f;
            normals[i][1] = 0.0f;
            normals[i][2] = 1.0f;
            st[i][0] = 0.0f;
            st[i][1] = 0.0f;
            colors[i] = packed;
        }
        indices[0] = 3;
        indices[1] = 0;
        indices[2] = 2;
        indices[3] = 2;
        indices[4] = 0;
        indices[5] = 1;
        (*FUN_0059c464)(dword_011298c8, 3, 6, indices, 4, xyz, normals, colors, st);
    }
    FUN_0045b840(b, origin, mins, maxs, width);
    return true;
}

// ---- 0x45d7f0

extern void FUN_0042e6c0(patch_t *p);
extern void FUN_0042e7b0(patch_t *p, int a2, int a3);
extern void FUN_0042e550(patch_t *p, int a2, bool a3);
extern void FUN_0045a830(brush_t *b);
extern void FUN_0045c420(brush_t *b, int a2, int a3);
extern void FUN_0045d450(brush_t *b, const vec3_t offset, int a3, int a4, int a5, int a6, int a7);
extern void FUN_00467640(entity_t *ent, float *vec);
extern int dword_01129888;
void MatrixTransformVectorCols(const vec3_t in, const vec3_t mat[3], vec3_t out);

void FUN_0045d7f0(brush_t *b, int viewType, int a3, int a4, int a5, int a6, int a7, int a8, bool a9)
{
    if (b->field_26)
        return;
    if (b->patch)
    {
        if (a6 == 0x1e)
        {
            if (viewType == 2 || viewType == 1 || viewType == 0)
                FUN_0042e7b0(b->patch, a7, a8);
            else
                FUN_0042e6c0(b->patch);
        }
        else
        {
            FUN_0042e550(b->patch, a5, a9);
        }
        return;
    }
    FUN_0045a830(b);
#line 3617
    assert(b->owner->def == b->def->owner);
    entity_t *e = (entity_t *)b->owner->def;
    vec3_t offset;
    if (e->eclass->fixedsize)
    {
        if (a9 || (!(dword_01129888 & 0x4000) && (e->eclass->flags_160 & 2)))
            FUN_0045c420(b, viewType, a7);
        if (!b->def->modelFailed)
        {
            if (FUN_0045bfc0(b, viewType, (*(int *)(dword_01233b64 + 0x2cc) & 1) ? 0x1e : a4, a5, a6, a8, a7, a9))
                return;
        }
        vec3_t angles, axis[3];
        FUN_00467640(e, angles);
        AnglesToAxis(angles, axis);
        MatrixTransformVectorCols(e->origin, axis, offset);
        VectorSubtract(e->origin, offset, offset);
    }
    FUN_0045d450(b, offset, viewType, a3, a4, a7, a8);
}

// ---- entity.cpp 0x467a70

extern void FUN_004651e0(float *mins, float *maxs);
extern void FUN_00464c80(entityInst_t *e, float *mins, float *maxs);

// 0x00467a70 (361 B)
void FUN_00467a70(entityInst_t *e)
{
	vec3_t mins;
	vec3_t maxs;

#line 1363
	assert(e);
	if (e->version == e->def->version)
		return;
	FUN_00464c20(e);
	FUN_00464c60(e);
	if (e->def->eclass->flags & 0x10)
		FUN_004651e0(mins, maxs);
	else
		FUN_00464c80(e, mins, maxs);
#line 1374
	assert(e->brushes.ownerNext != &e->brushes && e->brushes.ownerNext == e->brushes.ownerPrev);
	assert(e->brushes.ownerNext->def && e->brushes.ownerNext->def->refCount >= 2);
	FUN_0045b310(e->brushes.ownerNext->def, mins, maxs);
	e->version = e->def->version;
}
