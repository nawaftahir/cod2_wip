// lane g r23 draft: 0x406050 67% (396/409), 0x4064f0 96% (284/283); needs Cam_Draw 0x406610 caller
struct GfxPointVertex { float xyz[3]; unsigned char color[4]; };
int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);
extern void (*FUN_0059c468)(const float *inColor, unsigned int *outColor);
extern void (*R_AddCmd_Line3D)(int count, int width, const void *verts);

struct epair_t;
struct eclass_t { unsigned char pad00[0xc]; float mins[3]; unsigned char pad18[0x160 - 0x18]; unsigned char flags; };
struct entity_t { unsigned char pad00[0x50]; eclass_t *eclass; unsigned char pad54[4]; float origin[3]; epair_t *epairs; };
struct entityInst_t { unsigned char pad00[8]; entity_t *def; };
struct brushdef_t { unsigned char pad00[8]; entity_t *owner; };
struct brush_t { unsigned char pad00[8]; entityInst_t *owner; unsigned char pad0c[8]; brushdef_t *def; };
char *ValueForKey(epair_t *&e, const char *key);

void FUN_00406050(const float *origin, float radius, float height, int segments)
{
    float ring[256][3];
    GfxPointVertex verts[512];
    if (segments > 256)
        segments = 256;
    else if (segments < 3)
        segments = 3;
    int i;
    for (i = 0; i < segments; i++)
    {
        float c, s;
        FastSinCos((float)i * (6.2831855f / (float)segments), &s, &c);
        ring[i][0] = c * radius + origin[0];
        ring[i][1] = s * radius + origin[1];
        ring[i][2] = height + origin[2];
    }
    unsigned int color;
    FUN_0059c468(colorWhite, &color);
    int count = 0;
    for (i = 1; i < segments; i++)
        count = R_Add3DLine(verts, ring[i - 1], ring[i], &color, 1, count, 0x2000);
    count = R_Add3DLine(verts, ring[segments - 1], ring[0], &color, 1, count, 0x2000);
    if (count)
        R_AddCmd_Line3D(count / 2, 1, verts);
}

#line 1501
void FUN_004064f0(brush_t *brush, int unused)
{
    assert(brush->owner->def == brush->def->owner);
    float radius = (float)atof(ValueForKey(brush->owner->def->epairs, "radius"));
    if (!(radius <= 0))
    {
        float height;
        entity_t *e = brush->owner->def;
        if (!(e->eclass->flags & 0x80))
        {
            height = (float)atof(ValueForKey(e->epairs, "height"));
            if (height <= 0)
                height = 80.0f;
        }
        else
            height = 32.0f;
        e = brush->owner->def;
        vec3_t origin;
        origin[0] = e->origin[0];
        origin[1] = e->origin[1];
        origin[2] = e->origin[2];
        origin[2] += e->eclass->mins[2];
        FUN_00406050(origin, radius, height, 32);
        FUN_00406050(origin, radius, 0, 32);
    }
}

