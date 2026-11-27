#include "stdafx.h"
#include "Pmesh.h"
#include "PatchDialog.h"
#include <malloc.h>
#include <string.h>
#include "../universal/com_math.h"
#include "../universal/assertive.h"

#define iassert(expr) \
    do { \
        static bool s_assertDisable; \
        if ( !(expr) && !s_assertDisable ) \
        { \
            switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 1, 1 ) ) \
            { \
            case 0: DebugBreak(); break; \
            case 2: s_assertDisable = true; break; \
            } \
        } \
    } while ( 0 )

struct material_t
{
    unsigned char field_00[4];
    const char *name;
    unsigned char field_08[0xc];
    int width;
    int height;
};

struct texdef_t
{
    material_t *mat;
    float scale[2];
    float shift[2];
    float rotate;
    float skew;
};

struct plane_t
{
    vec3_t normal;
    double dist;
    int type;
};

struct winding_t
{
    int numpoints;
    vec3_t p[1];
};

struct face_t
{
    vec3_t planepts[3];
    texdef_t texdef[2];
    unsigned char field_5c[0x1c];
    int field_78;
    int field_7c;
    plane_t plane;
    winding_t *w;
    int field_a4;
};

struct brushdef_t
{
    unsigned char field_00[0x20];
    vec3_t mins;
    vec3_t maxs;
    int faceCount;
    face_t *faces;
    short field_40;
    short version;
    patchMesh_t *patch;
};

struct drawVert_t
{
    float xyz[3];
    float st[2];
    float lightmap[2];
    float normal[3];
    unsigned char color[4];
};

struct mesh_t
{
    int width;
    int height;
    int field_08;
    drawVert_t *verts;
    int field_10;
};

extern int DAT_01128d90;
extern int DAT_01128d94;
extern float dword_1128DC4;

static int g_nFaceCycle = 0;

void BuildTextureVecs(const vec3_t normal, const vec2_t scale, const vec2_t shift, float rotate, float skew, vec4_t texVecs[2]);
void FUN_00421150(mesh_t *m);
int FUN_00421500(mesh_t *m, vec3_t normal);
void PutMeshOnCurve(mesh_t m);
mesh_t *FUN_00421980(mesh_t m, float style, float maxError, int *x, int *y);
mesh_t *FUN_00422370(mesh_t *m, int *x, int *y);
mesh_t *FUN_00422900(mesh_t *m, float scale, int maxSize, int *x2, int *y2, int *x1, int *y1);
void Face_FreeArray(face_t *faces, int faceCount);
struct eclass_t;
struct brush_t;
struct entity_t;
brushdef_t *Brush_CreateFromTexdef(eclass_t *eclass, const texdef_t *td);
void Brush_InitSolid(brushdef_t *b, const vec3_t mins, const vec3_t maxs, eclass_t *eclass);
void FUN_0045a220(brushdef_t *b, bool snap);
void FUN_004671b0(brushdef_t *b, entity_t *owner);
brush_t *FUN_00458440(brushdef_t *def, entity_t *owner);
void FUN_00459210(brush_t *b, brush_t *list);
void FUN_00475350();
void Sys_MarkMapModified();
void FUN_0047a760(const char *fmt, ...);
void FUN_00426e80(patchMesh_t *p, int layer, float scale);
void FUN_00426f20(patchMesh_t *p, int layer, float scale);

struct patch_eclass_t { unsigned char pad[4]; const char *name; int fixedsize; };
struct entity_brushes_proj;
struct epair_t;
struct entity_t { unsigned char pad[8]; entity_t *def; unsigned char pad0[0x2c]; entity_brushes_proj *field_38; unsigned char pad1[0x14]; patch_eclass_t *eclass; unsigned char pad2[4]; float origin[3]; unsigned char pad3[4]; epair_t *epairs; };
struct patch_t
{
    patchMesh_t *def;
    short version;
    unsigned char field_06;
    unsigned char pad07;
    void *matHandle;
    void *vertHandle;
    int vertCount;
    int indexCount;
    unsigned short *indices[2];
};
struct brush_t
{
    brush_t *prev;
    brush_t *next;
    entity_t *owner;
    unsigned char pad0[8];
    brushdef_t *def;
    int faceCount;
    unsigned char pad1[4];
    patch_t *patch;
    unsigned char pad2[2];
    unsigned char hiddenBrush;
};

struct entity_brushes_proj { unsigned char pad[0xc]; brush_t head; };
extern brush_t DAT_010a44dc;

//E-DECLS
// declarations for the bulk-drafted functions (addresses in the names)




extern int DAT_0123348c;
extern char DAT_012334b8;
extern char DAT_0112993e;
extern char DAT_0112993f;


class CSelectObject; struct qeglobals_t { unsigned char pad_00[0x18]; int d_gridsize; unsigned char pad_1c[0x5c - 0x1c]; HWND d_hwndStatus; unsigned char pad_60[0x68 - 0x60]; float d_points[2048][3]; int d_numpoints; unsigned char pad_606c[0x8070 - 0x606c]; int d_num_move_points; float *d_move_points[4096]; float field_c074[16384][3]; int field_3c074; float field_3c078[16384][3]; int field_6c078; unsigned char pad_6c07c[0x6cb84 - 0x6c07c]; int d_select_count; brush_t *d_select_order[2]; unsigned char pad_6cb90[0x6cb9c - 0x6cb90]; int d_select_mode; CSelectObject *selectObject; };
extern qeglobals_t g_qeglobals;
extern brush_t DAT_010a44b4;
extern brush_t selected_brushes;
int __fastcall FUN_00429df0(void *, int value);
void FUN_0042a0a0(patchMesh_t *p, PatchControl *c, bool weld);
void FUN_0042a3a0(patchMesh_t *p, int row, bool bMulti);
void FUN_0042a3f0(patchMesh_t *p, int col, bool bMulti);
void FUN_0042a440(patchMesh_t *p, int dx, int dy, bool bMulti, int x, int y);
void FUN_00429f40(const float *v);
void FUN_004269d0(patchMesh_t *p, bool bRebuildBrush);
float FUN_00401c20();
float FUN_00401b80();
float FUN_00401bd0();
void FUN_0042ab20(const float *delta);
void FUN_0042af50(float offset);
extern void Sys_Printf(const char *fmt, ...);
static bool QE_SingleBrush_Pmesh(bool bQuiet = false);
extern void *DAT_01128da8;
void FUN_0046fb30();
void FUN_0046f0b0(brush_t *b, bool a, bool b2, bool c);
struct orientation_t { vec3_t origin; vec3_t axis[3]; };
void OrientationPosToWorld(const orientation_t *orient, const float *pos, float *out);
extern orientation_t g_editorOrientation;
extern void *(*FUN_0059c4a8)(int mat, int vertCount, float *xyz, float *tangent, float *binormal, float *normal, float *st, unsigned int *color);
extern void (*FUN_0059c488)(void *mat, int arg, int vertCount, void *vertHandle, int indexCount, unsigned short *indices);
#define ARRAY_COUNT(a) (sizeof(a) / sizeof((a)[0]))
void FUN_0042ca80(patch_t *pm);
extern bool DAT_012334ba;
extern void *DAT_011298c8;
extern patchMesh_t DAT_0109c538;
class CMainFrame;
extern "C" void FUN_0041b190(CMainFrame *self);
extern CMainFrame *dword_01233488;
void FUN_0042beb0();
void FUN_0042d560(patch_t *pm);
void FUN_0042d5d0(void *mat, patch_t *pm, int face, int arg);
void FUN_00430220(patchMesh_t *p, int index);
void FUN_00430610(patchMesh_t *p, int index);
void FUN_004309e0(patchMesh_t *p, int index);
void FUN_00430b10(patchMesh_t *p, int index);
void FUN_00430370(patchMesh_t *p, bool bAdd);
void FUN_00430760(patchMesh_t *p, bool bAdd);
void FUN_00430a60(patchMesh_t *p, bool bFirst);
void FUN_00430b90(patchMesh_t *p, bool bFirst);
void FUN_00430c40(patchMesh_t *p, int nCols);
void FUN_00430e20(patchMesh_t *p, int nRows);
void FUN_0042ce10(patch_t *pm);
void FUN_00427160(patchMesh_t *p, int layer);
extern int DAT_01128d94;
extern float dword_1128DC4;
struct brushface_proj { unsigned char pad[0xa0]; struct { int numpoints; float points[1][3]; } *winding; unsigned char pad1[4]; };
class CPrefsDlg;
extern CPrefsDlg *dword_01233b64;
#define PREFS_INT(off) (*(int *)((char *)dword_01233b64 + (off)))
int FUN_0042efb0(brush_t *b);
int FUN_0042f1b0(brush_t *b);
int FUN_0042f2c0(brush_t *b);
int FUN_0042f4f0(brush_t *b);
bool FUN_0045b420(brush_t *b);
extern CPatchDialog g_PatchDialog;
bool FUN_00465d80(entity_t *e, const char *key);
extern int (*FUN_0059c4a0)(void *handle, float (*verts)[3], int maxVerts, unsigned short *indices, int maxIndices);
void MatrixTransformVectorCols(const vec3_t in, const vec3_t mat[3], vec3_t out);
char *ValueForKey(epair_t *&e, const char *key);
struct GfxPointVertex;
int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);
extern float DAT_01129878[4];
void FUN_0042d720(patch_t *pm);
void FUN_0042e7b0(const unsigned int *color, int width, patch_t *pm);
struct patchTexInfo_proj { unsigned char pad[4]; float scale[2]; float shift[2]; float rotate; };
struct selbrush_t;
void Undo_AddBrushList(selbrush_t *list);
void FUN_00443f80(selbrush_t *list);
void Undo_End();
void FUN_00435230(patchMesh_t *p);
void FUN_00432a60(patchMesh_t *p);
void FUN_00432430(patchMesh_t *p, float angle);
void FUN_00432800(patchMesh_t *p, float shiftS, float shiftT);
void FUN_004326b0(patchMesh_t *p, float scaleS, float scaleT);
void FUN_004270e0(patchMesh_t *p);
void Patch_CapTexture(patchMesh_t *p, bool bCycleCap, float fScaleS, float fScaleT);
void Patch_Naturalize(patchMesh_t *p);
struct PatchPair { int x[2]; int y[2]; };
void FUN_00432ca0(bool bFlipWidth); bool FUN_00429a00(patchMesh_t *patch, PatchPair *pPair);
bool FUN_00429a00(patchMesh_t *patch, PatchPair *pPair);
static inline int IndexOfMovePoint(const void *c)
{
    for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
        if (c == (const void *)g_qeglobals.d_move_points[i])
            return i;
    return -1;
}
struct hitplane_t { float n[3]; float pad_c; double d; double pad_18; };
bool FUN_00434690(const hitplane_t *pl, bool bRemove);
extern int DAT_0109c528[3];
extern float DAT_0109fdfc[3];
extern int DAT_012334c0;
extern bool DAT_00590a04;
extern bool DAT_00590a05;
extern int DAT_005909f8;
void FUN_00433ad0();
bool FUN_00434360(const float *planes, bool bRemove);
void FUN_00433f20();
void FUN_00434630(const float *planes, bool bAdd);
void FUN_00434810(const hitplane_t *planes, bool bAdd);
patchMesh_t *FUN_00434880(const patchMesh_t *src);
void FUN_00433ed0();
void FUN_00433da0();
extern int DAT_005909fc;
extern const char *DAT_00590a08[];
extern int DAT_012334bc;
extern "C" void FUN_00409690(const char *text);
extern int DAT_012335bc;
extern CWnd DAT_012335a0;
patchMesh_t *SinglePatchSelected();
bool FUN_00435760(brushdef_t *b, const char *oldName, char *newName, bool bForce);
void FUN_00433b90();
void Patch_SetBendRotateOrigin();
extern int DAT_0109fe60;
void FUN_00435d20();
void FUN_00435e40();
void FUN_00436000();
struct undo_proj { unsigned char pad[8]; int field_08; int field_0c; };
extern undo_proj *DAT_0109fdcc;
extern bool DAT_012334b9;
extern int DAT_00590a00;
extern const char *DAT_00590a1c[];
void FUN_00434040();
void FUN_0042ae30(patchMesh_t *p, float delta);
bool FUN_0042bde0(brush_t *list);
bool FUN_00437890(const float *a, float *out, const float *s, const float *t, const float *b);
extern int DAT_012485bc; void FUN_004364b0();
void FUN_00438de0(patchMesh_t *p, int x, int y, entity_t *owner);
void FUN_00438ff0();
struct brushowner_proj { unsigned char pad[8]; entity_t *owner; };
struct patchsym_proj { unsigned char pad[0x3828]; brushowner_proj *symbiot; };
void FUN_00436170();
void FUN_004369b0();
#define PREFS_BYTE(off) (*(unsigned char *)((char *)dword_01233b64 + (off)))

bool FUN_00436dc0(const float *origin, const float *dir, patch_t *pm, float *t, int *y, int *x, int a, int b);
void FUN_00437730(const float *origin, const float *dir);
void Undo_AddBrush(brushdef_t *brush);
struct trace_t { brush_t *brush; void *face; float dist; bool selected; int field_10[3]; };
trace_t FUN_0046ef10(const float *org, const float *dir, int flags);
void FUN_00435c00();
bool FUN_00466060(const char *classname);
bool FUN_004388b0(brush_t *a, brush_t *b);
bool FUN_00438ca0();
bool FUN_00465e10(entity_t *e, const char *key, const char *value);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
void DeleteKey(epair_t *&e, const char *key);
void FUN_004655f0(entity_t *e, const char *key);
void FUN_004657a0(entity_t *e, const char *key);
void FUN_00443fd0(entity_t *e);
void FUN_00443d90(brushdef_t *b);
extern entity_t *DAT_012334ec;
void FUN_00438120();
void FUN_00437400();
extern int DAT_010bcd2c;
void FUN_0045afc0(brushdef_t *b);
void FUN_004354b0();
extern int DAT_01128dc8, DAT_01128dcc, DAT_01128dd0;
extern float DAT_01128dd4[16][16][2];
void FUN_0042f970(patchMesh_t *p, const texdef_t *td, bool bApply, bool bKeepLayout);
bool FUN_0042fb50(const float *delta, patchMesh_t *p, const float *anchor);
extern const int DAT_0053da30[][2];
extern const int DAT_0053d9b8[][2];
extern const int DAT_0053dab8[][2];
extern const int DAT_0053dab0[][2];
brush_t *FUN_004275a0(patchMesh_t *pm, bool bByColumn, bool bFirst);
brush_t *FUN_00427ef0(patchMesh_t *pm, int nType, bool bFirst);
eclass_t *FUN_00464770(int a, const char *name);
entity_t *FUN_00466d80(eclass_t *ec);
void FUN_00444110(entity_t *e);
void FUN_00428b80();
int FUN_00439620(const vec3_t v1, const vec3_t v2);
void FUN_004348e0(int thickness, bool bSeam);
class CCapDialog : public CDialog
{
public:
    enum { IDD = 161 };
    CCapDialog(CWnd *pParent = NULL);
    int m_nCap;

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    DECLARE_MESSAGE_MAP()
};

void FUN_00428e20(bool bCone, bool bBevel, bool bEndcap, bool bSquare);
float FUN_00439600(float f);
bool FUN_00436bc0(const float *tri0, const float *org, int mode, const float *tri1, const float *pt, const float *nrm, float *outT, float *outU, float *outV);
void FUN_00436690();
void TextureAxisFromPlane(const vec3_t normal, vec3_t xv, vec3_t yv);
bool FUN_004379f0(patchMesh_t *p, float *out);
void FUN_00438510(brush_t *pb1, brush_t *pb0, const int *a3, const int *a4, const int *a5);
void Brush_Free(brush_t *b);
struct entityInst_t; void FUN_004678c0(entityInst_t *e);
void FUN_00432950(patchMesh_t *p);
bool FUN_00431570(const char **data_p, PatchControl *v, int nTexPairs);
brushdef_t *FUN_00431890(const char **data_p, int version, bool bTerrain);
extern int DAT_00596d48;
extern unsigned char DAT_00592788[];
struct ContentFlag_t { const char *name; int flags; };
extern ContentFlag_t DAT_0053d944[];
extern ContentFlag_t DAT_0053d964[];
int FUN_004209a0(const char **data_p, const char *name, const ContentFlag_t *table);
struct qtexture_s; qtexture_s *FUN_00440c10(char *name, int version);
char *Com_Parse(const char **data_p);
char *Com_ParseOnLine(const char **data_p);
void Com_UngetToken();
int Com_ParseInt(const char **data_p);
int Com_MatchToken(const char **buf_p, const char *match, int warning);
void FUN_0042d270(FILE *file, patch_t *pm, bool bBrush, bool bUV, bool bFacets);
extern int DAT_01129984;
extern int DAT_01129980;
void FUN_00432f60(float scaleS, float scaleT, int mode);
//E-DECLS-END

// Retail 0x00425770, 152 bytes; exact relocation-normalized MATCH
// in the isolated MSVC 7.1 trial 42070900634. Material lookup uses ECX
// argument, as established by retail disassembly.
// Retail 0x00425770 / 152 B -- unverified real initialization candidate.
// Class storage and string values come from retail disassembly. Material
// resolver 0x00440840 is a cross-lane dependency: the symbol name is provisional.
struct qtexture_s;
extern qtexture_s * __fastcall FUN_00440840(char *name);

patchMesh_t *MakeNewPatch()
{
    patchMesh_t *patch = new patchMesh_t;
    patch->width = 0;
    patch->height = 0;
    patch->field_08 = 0;
    patch->type_10 = 0;
    patch->value_3834 = 0.0f;
    patch->style_14 = 8;
    patch->image_18 = FUN_00440840("case");
    patch->lightmap_1c = FUN_00440840("lightmap_gray");

    memset(patch->ctrl, 0, sizeof(patch->ctrl));
    for (int w = 0; w < 16; ++w)
    {
        for (int h = 0; h < 16; ++h)
        {
            patch->ctrl[w][h].color_28[2] = 255;
            patch->ctrl[w][h].color_28[1] = 255;
            patch->ctrl[w][h].color_28[0] = 255;
            patch->ctrl[w][h].color_28[3] = 255;
        }
    }
    patch->cache_3824 = NULL;
    patch->cache_3828 = NULL;
    patch->version = 0;
    patch->field_382e = 0;
    return patch;
}

// Retail 0x00425810 (10 bytes); relocation-normalized MATCH in CI trial 42066152684.
int Patch_MemorySize(patchMesh_t *patch)
{
    return _msize(patch);
}

// Retail 0x00425820 (29 bytes); relocation-normalized MATCH in CI 42067258788.
// Original symbol name is unknown. No ABI annotations or artificial callers.
void FUN_00425820(patchMesh_t *patch, int mode, bool enabled, float value)
{
    if (mode == 1)
    {
        patch->flag_382f = enabled;
        if (enabled)
            patch->value_3834 = value;
    }
}

void InterpolateInteriorPoints(patchMesh_t *p)
{
    int i, j, next, prev;
    for (i = 0; i < p->width; i += 2)
    {
        next = (i == p->width - 1) ? 1 : (i + 1) % p->width;
        prev = (i == 0) ? p->width - 2 : i - 1;
        for (j = 0; j < p->height; j++)
        {
            if ((p->ctrl[i][j].flags_34 & 2) == 0)
            {
                Vec3Avg(p->ctrl[prev][j].xyz, p->ctrl[next][j].xyz, p->ctrl[i][j].xyz);
            }
        }
    }
}

static const int neighbors[8][2] = {
    { 0,  1 }, {  1,  1 }, {  1, 0 }, {  1, -1 },
    { 0, -1 }, { -1, -1 }, { -1, 0 }, { -1,  1 }
};

void Patch_MeshNormals(patchMesh_t *in)
{
    int i, j, k, dist;
    vec3_t normal;
    vec3_t sum;
    vec3_t base;
    vec3_t delta;
    int x, y;
    PatchControl *dv;
    vec3_t around[8], temp;
    int good[8];
    int wrapWidth, wrapHeight;
    float len;

    wrapWidth = 0;
    for (i = 0; i < in->height; i++)
    {
        VectorSubtract(in->ctrl[0][i].xyz, in->ctrl[in->width - 1][i].xyz, delta);
        len = VectorLength(delta);
        if (len > 1.0)
            break;
    }
    if (i == in->height)
        wrapWidth = 1;

    wrapHeight = 0;
    for (i = 0; i < in->width; i++)
    {
        VectorSubtract(in->ctrl[i][0].xyz, in->ctrl[i][in->height - 1].xyz, delta);
        len = VectorLength(delta);
        if (len > 1.0)
            break;
    }
    if (i == in->width)
        wrapHeight = 1;

    for (i = 0; i < in->width; i++)
    {
        for (j = 0; j < in->height; j++)
        {
            dv = &in->ctrl[i][j];
            VectorCopy(dv->xyz, base);
            for (k = 0; k < 8; k++)
            {
                VectorClear(around[k]);
                good[k] = 0;

                for (dist = 1; dist <= 3; dist++)
                {
                    x = i + neighbors[k][0] * dist;
                    y = j + neighbors[k][1] * dist;
                    if (wrapWidth)
                    {
                        if (x < 0)
                            x = in->width - 1 + x;
                        else if (x >= in->width)
                            x = 1 + x - in->width;
                    }
                    if (wrapHeight)
                    {
                        if (y < 0)
                            y = in->height - 1 + y;
                        else if (y >= in->height)
                            y = 1 + y - in->height;
                    }

                    if (x < 0 || x >= in->width || y < 0 || y >= in->height)
                        break;

                    VectorSubtract(in->ctrl[x][y].xyz, base, temp);
                    if (Vec3Normalize(temp) == 0.0f)
                        continue;
                    else
                    {
                        good[k] = 1;
                        VectorCopy(temp, around[k]);
                        break;
                    }
                }
            }

            VectorClear(sum);
            for (k = 0; k < 8; k++)
            {
                if (!good[k] || !good[(k + 1) & 7])
                    continue;
                int k1 = (k + 1) & 7;
                Vec3Cross(around[k1], around[k], normal);
                if (Vec3Normalize(normal) == 0.0f)
                    continue;
                VectorAdd(normal, sum, sum);
            }
            Vec3NormalizeTo(sum, dv->normal);
        }
    }
}

bool FUN_00425d10(patchMesh_t *p, int outY[3], int outX[3])
{
    struct CornerPt
    {
        int x;
        int y;
    };
    int w = p->width - 1;
    int h = p->height - 1;
    CornerPt tris[8][3] = {
        { { w, 0 }, { 0, 0 }, { 0, h } },
        { { 0, 0 }, { 0, h }, { w, h } },
        { { 0, h }, { w, h }, { w, 0 } },
        { { w, h }, { w, 0 }, { 0, 0 } },
        { { 1, 0 }, { 0, 0 }, { 0, 1 } },
        { { 0, h - 1 }, { 0, h }, { 1, h } },
        { { w - 1, h }, { w, h }, { w, h - 1 } },
        { { w, 1 }, { w, 0 }, { w - 1, 0 } }
    };

    for (unsigned int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            outX[j] = tris[i][j].x;
            outY[j] = tris[i][j].y;
        }
        vec3_t d1, d2, normal;
        VectorSubtract(p->ctrl[outX[0]][outY[0]].xyz, p->ctrl[outX[1]][outY[1]].xyz, d1);
        VectorSubtract(p->ctrl[outX[2]][outY[2]].xyz, p->ctrl[outX[1]][outY[1]].xyz, d2);
        Vec3Cross(d1, d2, normal);
        if (VectorLengthSquared(normal) > 0.001f)
            return true;
    }
    return false;
}

bool FUN_00425f40(patchMesh_t *p, plane_t *plane)
{
    mesh_t *m = (mesh_t *)p->cache_3824;
    vec3_t avgNorm;
    vec3_t avgPos;
    int count;
    VectorClear(avgNorm);
    VectorClear(avgPos);
    count = 0;

    for (int j = 0; j < m->height - 1; j++)
    {
        for (int i = 0; i < m->width - 1; i++)
        {
            vec3_t d1, d2, n;
            VectorSubtract(m->verts[j * m->width + i + 1].xyz, m->verts[j * m->width + i].xyz, d1);
            VectorSubtract(m->verts[(j + 1) * m->width + i].xyz, m->verts[j * m->width + i].xyz, d2);
            Vec3Cross(d1, d2, n);
            if (Vec3Normalize(n) > 0.001f)
            {
                VectorAdd(avgNorm, n, avgNorm);
                VectorAdd(avgPos, m->verts[j * m->width + i].xyz, avgPos);
                count++;
            }

            VectorSubtract(m->verts[(j + 1) * m->width + i].xyz, m->verts[(j + 1) * m->width + i + 1].xyz, d1);
            VectorSubtract(m->verts[j * m->width + i + 1].xyz, m->verts[(j + 1) * m->width + i + 1].xyz, d2);
            Vec3Cross(d1, d2, n);
            if (Vec3Normalize(n) > 0.001f)
            {
                VectorAdd(avgNorm, n, avgNorm);
                VectorAdd(avgPos, m->verts[(j + 1) * m->width + i + 1].xyz, avgPos);
                count++;
            }
        }
    }

    if (Vec3Normalize(avgNorm) < 0.001f)
        return false;

    float dist = DotProduct(avgPos, avgNorm) / (float)count;
    for (int i = 0; i < p->width - 1; i++)
    {
        for (int j = 0; j < p->height - 1; j++)
        {
            float d = DotProduct(avgNorm, p->ctrl[i][j].xyz) - dist;
            if (d > 1.0f || d < -1.0f)
                return false;
        }
    }

    plane->dist = dist;
    VectorCopy(avgNorm, plane->normal);
    return true;
}

void Patch_CalcBounds(patchMesh_t *patch, vec3_t &mins, vec3_t &maxs, bool enlarge)
{
    ClearBounds(mins, maxs);
    ++patch->version;
    for (int w = 0; w < patch->width; ++w)
    {
        for (int h = 0; h < patch->height; ++h)
        {
            AddPointToBounds(patch->ctrl[w][h].xyz, mins, maxs);
        }
    }
    if (enlarge)
    {
        for (int axis = 0; axis < 3; ++axis)
        {
            if (maxs[axis] - mins[axis] < 8.0f)
            {
                float minimum = (mins[axis] + maxs[axis]) * 0.5f - 4.0f;
                mins[axis] = minimum;
                maxs[axis] = minimum + 8.0f;
            }
        }
    }
}

void FUN_00426420(face_t *f, const texdef_t *td, int field78, int field7c,
                  const vec3_t p0, const vec3_t p1, const vec3_t p2)
{
    memcpy(f->texdef, td, sizeof(f->texdef));
    f->field_78 = field78;
    f->field_7c = field7c;
    VectorCopy(p0, f->planepts[0]);
    VectorCopy(p1, f->planepts[1]);
    VectorCopy(p2, f->planepts[2]);
}

void Brush_RebuildBrush(brushdef_t *b, vec3_t vMins, vec3_t vMaxs)
{
    int i, j;
    for (i = 0; i < 3; i++)
    {
        vMins[i] = floor(vMins[i] + 0.5f);
        vMaxs[i] = floor(vMaxs[i] + 0.5f);
        if ((int)vMins[i] == (int)vMaxs[i])
        {
            vMins[i] -= 4.0f;
            vMaxs[i] += 4.0f;
        }
    }

    if (!b->faces)
        return;

    texdef_t td[2];
    memcpy(td, b->faces->texdef, sizeof(td));
    int field78, field7c;
    if (b->patch)
    {
        field78 = b->patch->field_08;
        field7c = b->patch->field_0c;
    }
    else
    {
        field78 = b->faces->field_78;
        field7c = b->faces->field_7c;
    }
    Face_FreeArray(b->faces, b->faceCount);
    b->faces = NULL;

    for (i = 0; i < 3; i++)
    {
        if (vMaxs[i] < vMins[i])
            FUN_0047a760("Brush_RebuildBrush: backwards");
    }

    vec3_t pts[4][2];
    pts[0][0][0] = vMins[0];
    pts[0][0][1] = vMins[1];
    pts[1][0][0] = vMins[0];
    pts[1][0][1] = vMaxs[1];
    pts[2][0][0] = vMaxs[0];
    pts[2][0][1] = vMaxs[1];
    pts[3][0][0] = vMaxs[0];
    pts[3][0][1] = vMins[1];
    for (i = 0; i < 4; i++)
    {
        pts[i][0][2] = vMins[2];
        pts[i][1][0] = pts[i][0][0];
        pts[i][1][1] = pts[i][0][1];
        pts[i][1][2] = vMaxs[2];
    }

    face_t *faces = new face_t[6];
    memset(faces, 0, sizeof(face_t) * 6);
    b->faces = faces;

    face_t *f = faces;
    FUN_00426420(f++, td, field78, field7c, pts[0][1], pts[1][1], pts[2][1]);
    FUN_00426420(f++, td, field78, field7c, pts[2][0], pts[1][0], pts[0][0]);
    for (i = 0; i < 4; i++)
    {
        j = (i + 1) % 4;
        FUN_00426420(f++, td, field78, field7c, pts[j][1], pts[i][1], pts[i][0]);
    }

    FUN_0045a220(b, true);
    if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
        FUN_00475350();
    Sys_MarkMapModified();
    b->version++;
}

void FUN_00426780(drawVert_t *out, const PatchControl *in, int layer)
{
    VectorCopy(in->xyz, out->xyz);
    out->st[0] = in->st[layer][0];
    out->st[1] = in->st[layer][1];
    out->lightmap[0] = 0.0f;
    out->lightmap[1] = 0.0f;
    VectorCopy(in->normal, out->normal);
    *(unsigned int *)out->color = *(const unsigned int *)in->color_28;
}

mesh_t *FUN_004267d0(patchMesh_t *p, int layer, int *x, int *y)
{
    mesh_t inMesh;
    inMesh.verts = new drawVert_t[p->width * p->height];
    inMesh.width = p->width;
    inMesh.height = p->height;
    for (int j = 0; j < p->height; j++)
    {
        for (int i = 0; i < p->width; i++)
        {
            drawVert_t *v = &inMesh.verts[j * p->width + i];
            const PatchControl *in = &p->ctrl[i][j];
            VectorCopy(in->xyz, v->xyz);
            v->st[0] = in->st[layer][0];
            v->st[1] = p->ctrl[i][j].st[layer][1];
            v->lightmap[0] = 0.0f;
            v->lightmap[1] = 0.0f;
            VectorCopy(in->normal, v->normal);
            *(unsigned int *)v->color = *(const unsigned int *)in->color_28;
        }
    }

    mesh_t *result;
    if (p->type_10 & 0x40)
    {
        int size = inMesh.width * inMesh.height * sizeof(drawVert_t);
        result = (mesh_t *)malloc(sizeof(mesh_t) + size);
        result->width = inMesh.width;
        result->height = inMesh.height;
        result->verts = (drawVert_t *)(result + 1);
        memcpy(result->verts, inMesh.verts, size);
        FUN_00421150(result);
    }
    else
    {
        mesh_t *sub = FUN_00421980(inMesh, (float)p->style_14, 999.0f, x, y);
        PutMeshOnCurve(*sub);
        FUN_00421150(sub);
        result = FUN_00422370(sub, x, y);
        free(sub);
    }
    delete[] inMesh.verts;
    return result;
}

void FUN_004269a0(patchMesh_t *p)
{
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
}

void FUN_004269d0(patchMesh_t *p, bool bRebuildBrush)
{
    if (bRebuildBrush)
    {
        if (p->flag_382f)
        {
            float val = p->value_3834;
            if (p->type_10 & 0x40)
                FUN_00426e80(p, 1, val);
            else
                FUN_00426f20(p, 1, val);
            p->flag_382f = 1;
            p->value_3834 = val;
        }
        vec3_t mins, maxs;
        Patch_CalcBounds(p, mins, maxs, true);
        Brush_RebuildBrush((brushdef_t *)p->cache_3828, mins, maxs);
    }
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

brushdef_t *AddBrushForPatch(patchMesh_t *pm, entity_t *owner)
{
    vec3_t vMin, vMax;
    Patch_CalcBounds(pm, vMin, vMax, true);

    texdef_t td;
    memset(&td, 0, sizeof(td));
    material_t *mat = (material_t *)pm->image_18;
    td.mat = mat;
    td.scale[0] = (float)mat->width * 0.25f;
    td.scale[1] = (float)mat->height * 0.25f;

    brushdef_t *b = Brush_CreateFromTexdef(NULL, &td);
    Brush_InitSolid(b, vMin, vMax, NULL);
    for (int i = 0; i < b->faceCount; i++)
    {
        face_t *faces = b->faces;
        faces[i].field_78 = pm->field_08;
        faces = b->faces;
        faces[i].field_7c = pm->field_0c;
    }

    b->patch = pm;
    pm->version++;
    pm->cache_3828 = b;

    if (owner)
    {
        FUN_004671b0(b, owner);
        FUN_0045a220(b, true);
        if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        b->version++;
    }
    return b;
}

float Patch_WidthDistanceTo(patchMesh_t *patch, int count)
{
    float length = 0;
    for (int i = 0; i < count; ++i)
    {
        vec3_t delta;
        VectorSubtract(patch->ctrl[i+1][0].xyz, patch->ctrl[i][0].xyz, delta);
        // This component order preserves the retail floating-point result.
        length += I_sqrt(delta[1]*delta[1] + delta[0]*delta[0] + delta[2]*delta[2]);
    }
    return length;
}

float Patch_HeightDistanceTo(patchMesh_t *patch, int count)
{
    float length = 0;
    for (int i = 0; i < count; ++i)
    {
        vec3_t delta;
        VectorSubtract(patch->ctrl[0][i+1].xyz, patch->ctrl[0][i].xyz, delta);
        length += I_sqrt(delta[1]*delta[1] + delta[0]*delta[0] + delta[2]*delta[2]);
    }
    return length;
}

void FUN_00426c90(patchMesh_t *p, const vec3_t normal, int layer, const texdef_t *td)
{
    vec4_t texVecs[2];
    BuildTextureVecs(normal, td->scale, td->shift, td->rotate, td->skew, texVecs);

    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            float s = DotProduct(p->ctrl[i][j].xyz, texVecs[0]) + texVecs[0][3];
            float t = DotProduct(p->ctrl[i][j].xyz, texVecs[1]) + texVecs[1][3];

            unsigned int sBits = *(unsigned int *)&s;
            if ((sBits & 0xfff) <= 4)
                sBits -= (sBits & 0xfff);
            else if (0x1000 - (sBits & 0xfff) <= 4)
                sBits += 0x1000 - (sBits & 0xfff);
            *(unsigned int *)&p->ctrl[i][j].st[layer][0] = sBits;

            unsigned int tBits = *(unsigned int *)&t;
            if ((tBits & 0xfff) <= 4)
                tBits -= (tBits & 0xfff);
            else if (0x1000 - (tBits & 0xfff) <= 4)
                tBits += 0x1000 - (tBits & 0xfff);
            *(unsigned int *)&p->ctrl[i][j].st[layer][1] = tBits;
        }
    }
}

void FUN_00426dc0(patchMesh_t *p, const vec3_t normal, const texdef_t *td)
{
    FUN_00426c90(p, normal, DAT_01128d94, td);
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_00426e20(patchMesh_t *p, int layer, float scale, const vec3_t normal)
{
    material_t *mat = (material_t *)(&p->image_18)[layer];
    texdef_t td;
    td.mat = mat;
    td.scale[1] = (float)mat->height * scale;
    td.scale[0] = (float)mat->width * scale;
    td.shift[0] = 0.0f;
    td.shift[1] = 0.0f;
    td.rotate = 0.0f;
    td.skew = 0.0f;
    FUN_00426c90(p, normal, layer, &td);
}

void FUN_00426e80(patchMesh_t *p, int layer, float scale)
{
    vec3_t mins, maxs, size;
    Patch_CalcBounds(p, mins, maxs, false);
    VectorSubtract(maxs, mins, size);
    int axis = (size[1] < size[0]) ? 1 : 0;
    if (size[2] < size[axis])
        axis = 2;
    size[0] = 0.0f;
    size[1] = 0.0f;
    size[2] = 0.0f;
    size[axis] = 1.0f;
    FUN_00426e20(p, layer, scale, size);
}

void FUN_00426f20(patchMesh_t *p, int layer, float scale)
{
    int x2[512];
    int y2[512];
    int x1[512];
    int y1[512];
    vec3_t normal;

    mesh_t *m = FUN_004267d0(p, layer, x1, y1);
    mesh_t *m2 = FUN_00422900(m, scale, 512, x2, y2, x1, y1);
    free(m);
    if (FUN_00421500(m2, normal))
    {
        free(m2);
        FUN_00426e20(p, layer, scale, normal);
        return;
    }

    for (int i = 0; i < p->width; i++)
    {
        int sx = 0;
        while (sx < m2->width - 1 && x1[sx] < i)
            sx++;
        float s = ((float)sx + 0.5f) / 512.0f;
        for (int j = 0; j < p->height; j++)
        {
            int sy = 0;
            while (sy < m2->height - 1 && y1[sy] < j)
                sy++;
            float t = ((float)sy + 0.5f) / 512.0f;
            p->ctrl[i][j].st[layer][0] = s;
            p->ctrl[i][j].st[layer][1] = t;
        }
    }
    free(m2);
}

void FUN_004270a0(patchMesh_t *p, int layer, float scale)
{
    if (p->type_10 & 0x40)
        FUN_00426e80(p, layer, scale);
    else
        FUN_00426f20(p, layer, scale);
    if (layer == 1)
    {
        p->flag_382f = 1;
        p->value_3834 = scale;
    }
}

void FUN_004270e0(patchMesh_t *p)
{
    int layer = DAT_01128d94;
    if (p->type_10 & 0x40)
        FUN_00426e80(p, DAT_01128d94, 16.0f);
    else
        FUN_00426f20(p, DAT_01128d94, 16.0f);
    if (layer == 1)
    {
        p->flag_382f = 1;
        p->value_3834 = 16.0f;
    }
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_00427160(patchMesh_t *p, int layer)
{
    material_t *mat = (material_t *)(&p->image_18)[DAT_01128d90];
    float invW = 1.0f / ((float)mat->width * dword_1128DC4);
    float invH = 1.0f / ((float)mat->height * dword_1128DC4);
    float wDist = 0.0f;
    for (int i = 0; i < p->width; i++)
    {
        float hDist = 0.0f;
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[i][j].st[layer][0] = wDist * invW;
            p->ctrl[i][j].st[layer][1] = hDist * invH;
            hDist = Patch_HeightDistanceTo(p, j + 1);
        }
        wDist = Patch_WidthDistanceTo(p, i + 1);
    }
    if (layer == 1)
        p->flag_382f = 0;
}

void Patch_Naturalize(patchMesh_t *p)
{
    FUN_00427160(p, DAT_01128d94);
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

face_t *Patch_GetAxisFace(patchMesh_t *p)
{
#line 1009
    assert(p);
    brushdef_t *b = (brushdef_t *)p->cache_3828;
#line 1011
    assert(b);
    for (int i = 0; i < b->faceCount; i++)
    {
        face_t *faces = b->faces;
        winding_t *w = faces[i].w;
#line 1015
        assert(w);
        vec3_t vTemp;
        VectorSubtract(w->p[1], w->p[0], vTemp);
        int nScore = 0;
        if (vTemp[0] > 8.0f)
            nScore++;
        if (vTemp[1] > 8.0f)
            nScore++;
        if (vTemp[2] > 8.0f)
            nScore++;
        if (nScore > 0)
            return &b->faces[i];
    }
    return &b->faces[0];
}

face_t *nextFace(patchMesh_t *p)
{
    brushdef_t *b = (brushdef_t *)p->cache_3828;
    g_nFaceCycle++;
    if (g_nFaceCycle >= (b->faceCount > 6 ? 6 : b->faceCount))
        g_nFaceCycle = 0;
#line 1045
    iassert(g_nFaceCycle >= 0 && g_nFaceCycle < b->faceCount);
    return &b->faces[g_nFaceCycle];
}
#line 840

void Patch_CapTexture(patchMesh_t *p, bool bCycleCap, float fScaleS, float fScaleT)
{
    Patch_MeshNormals(p);
    face_t *f;
    if (bCycleCap)
        f = nextFace(p);
    else
        f = Patch_GetAxisFace(p);
    texdef_t td = f->texdef[DAT_01128d90];
    td.rotate = 0.0f;
    td.scale[0] = (float)td.mat->width * fScaleS;
    td.shift[0] = 0.0f;
    td.shift[1] = 0.0f;
    td.scale[1] = (float)td.mat->height * fScaleT;
    FUN_00426dc0(p, f->plane.normal, &td);
}

void FillPatch(patchMesh_t *p, vec3_t v)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            VectorCopy(v, p->ctrl[i][j].xyz);
        }
    }
}


// Retail 0x00429df0 / 34 B; MSVC 7.1 isolated referee MATCH
// in run 42071492272. The decompiler names identify two existing
// global objects: an index count and a contiguous 32-bit table.



// Retail 0x004293f0: build a generic patch mesh over the single selected brush.
brush_t *Patch_GenericMesh(int nWidth, int nHeight, int nOrientation, bool bDeleteSource, bool bOverride)
{
    if (nHeight < 3 || nHeight > 15 || nWidth < 3 || nWidth > 15)
    {
        Sys_Printf("Invalid patch width or height.\n");
        return NULL;
    }
    if (!bOverride && !QE_SingleBrush_Pmesh())
    {
        Sys_Printf("Cannot generate a patch from multiple selections.\n");
        return NULL;
    }
    patchMesh_t *p = MakeNewPatch();
    p->width = nWidth;
    p->height = nHeight;
    p->type_10 = 0;
    int nFirst = 0;
    int nSecond = 1;
    if (nOrientation == 0)
    {
        nFirst = 1;
        nSecond = 2;
    }
    else if (nOrientation == 1)
        nSecond = 2;
    brush_t *sel = DAT_010a44b4.next;
    brushdef_t *b = sel->def;
    entity_t *owner = sel->owner;
    int xStep = (int)b->mins[nFirst];
    float xAdj = fabs((b->maxs[nFirst] - b->mins[nFirst]) / (float)(nWidth - 1));
    float yAdj = fabs((b->maxs[nSecond] - b->mins[nSecond]) / (float)(nHeight - 1));
    for (int i = 0; i < nWidth; i++)
    {
        int yStep = (int)b->mins[nSecond];
        for (int j = 0; j < nHeight; j++)
        {
            p->ctrl[i][j].xyz[nFirst] = (float)xStep;
            p->ctrl[i][j].xyz[nSecond] = (float)yStep;
            p->ctrl[i][j].xyz[nOrientation] = b->maxs[nOrientation];
            yStep = (int)((float)yStep + yAdj);
        }
        xStep = (int)((float)xStep + xAdj);
    }
    void *curMat = DAT_01128da8; (&p->image_18)[DAT_01128d90] = curMat;
    FUN_00427160(p, 0);
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, 16.0f);
    else
        FUN_00426f20(p, 1, 16.0f);
    p->flag_382f = 1;
    p->value_3834 = 16.0f;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    brushdef_t *def = AddBrushForPatch(p, owner->def);
    brush_t *nb = FUN_00458440(def, owner);
    FUN_00459210(nb, &DAT_010a44dc);
    if (bDeleteSource)
    {
        FUN_0046fb30();
        FUN_0046f0b0(nb, 1, 1, 0);
    }
    return nb;
}

// Retail 0x004275a0: build a cap patch (3x3 or 5x5) over one edge of the patch.
brush_t *FUN_004275a0(patchMesh_t *pm, bool bByColumn, bool bFirst)
{
    int count;
    int edge;
    brush_t *b;
    bool bSmall;
    if (pm->width <= 9)
    {
        b = Patch_GenericMesh(3, 3, 2, false, false);
        bSmall = true;
    }
    else
    {
        b = Patch_GenericMesh(5, 5, 2, false, false);
        bSmall = false;
    }
    if (!b)
    {
        Sys_Printf("Unable to cap. You may need to ungroup the patch.\n");
        return NULL;
    }
#line 1107
    assert( b->patch->def == b->def->patch );
    patchMesh_t *def = b->patch->def;
    vec3_t maxs;
    vec3_t mins;
    mins[0] = 131072.0f;
    mins[1] = 131072.0f;
    mins[2] = 131072.0f;
    maxs[0] = -131072.0f;
    maxs[1] = -131072.0f;
    maxs[2] = -131072.0f;
    def->type_10 |= 0x1000;
    count = bByColumn ? pm->width : pm->height;
    if (bFirst)
        edge = 0;
    else
    {
        if (bByColumn)
            edge = pm->height - 1;
        else
            edge = pm->width - 1;
    }
    FillPatch(def, pm->ctrl[0][edge].xyz);
    for (int i = 0; i < count; i++)
    {
        if (bSmall)
        {
            if (bByColumn)
                VectorCopy(pm->ctrl[i][edge].xyz, def->ctrl[DAT_0053d9b8[i][0]][DAT_0053d9b8[i][1]].xyz);
            else
                VectorCopy(pm->ctrl[edge][i].xyz, def->ctrl[DAT_0053d9b8[i][0]][DAT_0053d9b8[i][1]].xyz);
            AddPointToBounds(def->ctrl[DAT_0053d9b8[i][0]][DAT_0053d9b8[i][1]].xyz, mins, maxs);
        }
        else
        {
            if (bByColumn)
                VectorCopy(pm->ctrl[i][edge].xyz, def->ctrl[DAT_0053da30[i][0]][DAT_0053da30[i][1]].xyz);
            else
                VectorCopy(pm->ctrl[edge][i].xyz, def->ctrl[DAT_0053da30[i][0]][DAT_0053da30[i][1]].xyz);
            AddPointToBounds(def->ctrl[DAT_0053da30[i][0]][DAT_0053da30[i][1]].xyz, mins, maxs);
        }
    }
    vec3_t mid = {(maxs[0] + mins[0]) * 0.5f, (maxs[1] + mins[1]) * 0.5f, (maxs[2] + mins[2]) * 0.5f};
    int nInner = bSmall ? 1 : 9;
    for (int i = 0; i < nInner; i++)
    {
        if (bSmall)
            VectorCopy(mid, def->ctrl[DAT_0053dab0[i][0]][DAT_0053dab0[i][1]].xyz);
        else
            VectorCopy(mid, def->ctrl[DAT_0053dab8[i][0]][DAT_0053dab8[i][1]].xyz);
    }
    if (bFirst)
    {
        for (int x = 0; x < def->width; x++)
        {
            for (int r = 0; r < def->height / 2; r++)
            {
                PatchControl tmp = def->ctrl[x][def->height - 1 - r];
                def->ctrl[x][def->height - 1 - r] = def->ctrl[x][r];
                def->ctrl[x][r] = tmp;
            }
        }
    }
    FUN_004269d0(def, true);
    Patch_CapTexture(def, false, dword_1128DC4, dword_1128DC4);
#line 1168
    assert( ((patchsym_proj *)def)->symbiot == (brushowner_proj *)b->def );
    assert( b->patch->def == def );
    assert( b->def->patch == def );
    return b;
}

// Retail 0x00427ef0: build a special cap (bevel, endcap or their inverses) over one edge.
brush_t *FUN_00427ef0(patchMesh_t *pm, int nType, bool bFirst)
{
    brush_t *b;
    if (nType == 3)
        b = Patch_GenericMesh(5, 3, 2, false, false);
    else
        b = Patch_GenericMesh(3, 3, 2, false, false);
    if (!b)
    {
        Sys_Printf("Unable to cap. Make sure you ungroup before re - capping.");
        return NULL;
    }
#line 1193
    assert( b->patch->def == b->def->patch );
    patchMesh_t *def = b->patch->def;
    def->type_10 |= 0x1000;
    int edge;
    if (bFirst)
        edge = 0;
    else
        edge = pm->height - 1;
    vec3_t mins, maxs;
    Patch_CalcBounds(pm, mins, maxs, false);
    if (nType == 2)
    {
        VectorCopy(pm->ctrl[0][edge].xyz, def->ctrl[0][0].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[0][2].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[0][1].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[2][2].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[1][0].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[1][1].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[1][2].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[2][0].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[2][1].xyz);
    }
    else if (nType == 0)
    {
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[0][0].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[0][1].xyz);
        VectorCopy(pm->ctrl[0][edge].xyz, def->ctrl[0][2].xyz);
        vec3_t d;
        VectorSubtract(pm->ctrl[0][edge].xyz, pm->ctrl[1][edge].xyz, d);
        VectorAdd(d, pm->ctrl[2][edge].xyz, d);
        VectorCopy(d, def->ctrl[2][2].xyz);
        VectorCopy(d, def->ctrl[1][0].xyz);
        VectorCopy(d, def->ctrl[1][1].xyz);
        VectorCopy(d, def->ctrl[1][2].xyz);
        VectorCopy(d, def->ctrl[2][0].xyz);
        VectorCopy(d, def->ctrl[2][1].xyz);
    }
    else if (nType == 1)
    {
        vec3_t mid;
        Vec3Avg(pm->ctrl[4][edge].xyz, pm->ctrl[0][edge].xyz, mid);
        VectorCopy(pm->ctrl[0][edge].xyz, def->ctrl[0][0].xyz);
        VectorCopy(mid, def->ctrl[1][0].xyz);
        VectorCopy(pm->ctrl[4][edge].xyz, def->ctrl[2][0].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[0][2].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[1][2].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[2][2].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[1][1].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[0][1].xyz);
        VectorCopy(pm->ctrl[3][edge].xyz, def->ctrl[2][1].xyz);
    }
    else
    {
        VectorCopy(pm->ctrl[0][edge].xyz, def->ctrl[0][0].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[1][0].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[2][0].xyz);
        VectorCopy(pm->ctrl[3][edge].xyz, def->ctrl[3][0].xyz);
        VectorCopy(pm->ctrl[4][edge].xyz, def->ctrl[4][0].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[0][1].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[1][1].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[2][1].xyz);
        VectorCopy(pm->ctrl[3][edge].xyz, def->ctrl[3][1].xyz);
        VectorCopy(pm->ctrl[3][edge].xyz, def->ctrl[4][1].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[0][2].xyz);
        VectorCopy(pm->ctrl[1][edge].xyz, def->ctrl[1][2].xyz);
        VectorCopy(pm->ctrl[2][edge].xyz, def->ctrl[2][2].xyz);
        VectorCopy(pm->ctrl[3][edge].xyz, def->ctrl[3][2].xyz);
        VectorCopy(pm->ctrl[3][edge].xyz, def->ctrl[4][2].xyz);
    }
    bool bFlip = (nType == 0 || nType == 3);
    if (bFirst == bFlip)
    {
        PatchControl tmp;
        for (int x = 0; x < def->width; x++)
        {
            for (int r = 0; r < def->height / 2; r++)
            {
                int h = def->height - r;
                tmp = def->ctrl[x][h - 1];
                def->ctrl[x][h - 1] = def->ctrl[x][r];
                def->ctrl[x][r] = tmp;
            }
        }
    }
    FUN_004269d0(def, true);
    Patch_CapTexture(def, false, dword_1128DC4, dword_1128DC4);
#line 1290
    assert( ((patchsym_proj *)def)->symbiot == (brushowner_proj *)b->def );
    assert( b->patch->def == def );
    assert( b->def->patch == def );
    return b;
}

// Retail 0x00428b80: cap the selected patch, or ask for a special cap when no edge is closed.
void FUN_00428b80()
{
    if (!QE_SingleBrush_Pmesh() || !selected_brushes.next->patch)
    {
        Sys_Printf("Cannot cap multiple selection. Please select a single patch.\n");
        return;
    }
    brush_t *pb = selected_brushes.next;
    int n = 0;
#line 1314
    assert( pb->patch->def == pb->def->patch );
    patchMesh_t *def = pb->patch->def;
    brush_t *caps[4];
    if (FUN_00439620(def->ctrl[0][0].xyz, def->ctrl[def->width - 1][0].xyz))
    {
        brush_t *c = FUN_004275a0(def, true, false);
        if (c)
            caps[n++] = c;
    }
    if (FUN_00439620(def->ctrl[0][def->height - 1].xyz, def->ctrl[def->width - 1][def->height - 1].xyz))
    {
        brush_t *c = FUN_004275a0(def, true, true);
        if (c)
            caps[n++] = c;
    }
    if (FUN_00439620(def->ctrl[0][0].xyz, def->ctrl[0][def->height - 1].xyz))
    {
        brush_t *c = FUN_004275a0(def, false, false);
        if (c)
            caps[n++] = c;
    }
    if (FUN_00439620(def->ctrl[def->width - 1][0].xyz, def->ctrl[def->width - 1][def->height - 1].xyz))
    {
        brush_t *c = FUN_004275a0(def, false, true);
        if (c)
            caps[n++] = c;
    }
    if (n == 0)
    {
        CCapDialog dlg;
        if (dlg.DoModal() == IDOK)
        {
            caps[0] = FUN_00427ef0(def, dlg.m_nCap, false);
            caps[1] = FUN_00427ef0(def, dlg.m_nCap, true);
            n = 2;
        }
    }
    if (n > 0)
    {
        while (n > 0)
        {
            brush_t *c = caps[--n];
            if (c)
                FUN_0046f0b0(c, 1, 1, 0);
        }
        if (pb->owner == DAT_012334ec)
        {
            eclass_t *ec = FUN_00464770(0, "func_group");
            if (ec)
            {
                entity_t *e = FUN_00466d80(ec);
                FUN_00465bf0(e->def, "type", "patchCapped");
                FUN_00444110(e->def);
            }
        }
    }
}

// Retail 0x00428e20 (split rows 0x428e20/0x428e70): build a patch from the selected brush.
void FUN_00428e20(bool bCone, bool bBevel, bool bEndcap, bool bSquare)
{
    if (!QE_SingleBrush_Pmesh())
        return;
    brush_t *sel = DAT_010a44b4.next;
    entity_t *owner = sel->owner;
    brushdef_t *b = sel->def;
    patchMesh_t *p = MakeNewPatch();
    p->height = 3;
    p->type_10 = 1;
    if (bBevel && !bSquare)
    {
        p->type_10 = 2;
        p->width = 3;
        int step = (int)((b->maxs[2] - b->mins[2]) / 2.0f);
        int z = (int)b->mins[2];
        for (int h = 0; h < p->height; h++)
        {
            p->ctrl[0][h].xyz[0] = b->mins[0];
            p->ctrl[0][h].xyz[1] = b->mins[1];
            p->ctrl[0][h].xyz[2] = (float)z;
            p->ctrl[1][h].xyz[0] = b->maxs[0];
            p->ctrl[1][h].xyz[1] = b->mins[1];
            p->ctrl[1][h].xyz[2] = (float)z;
            p->ctrl[2][h].xyz[0] = b->maxs[0];
            p->ctrl[2][h].xyz[1] = b->maxs[1];
            p->ctrl[2][h].xyz[2] = (float)z;
            z += step;
        }
    }
    else if (bEndcap && !bSquare)
    {
        p->type_10 = 4;
        p->width = 5;
        int step = (int)((b->maxs[2] - b->mins[2]) / 2.0f);
        int z = (int)b->mins[2];
        for (int h = 0; h < p->height; h++)
        {
            p->ctrl[0][h].xyz[0] = b->mins[0];
            p->ctrl[0][h].xyz[1] = b->mins[1];
            p->ctrl[0][h].xyz[2] = (float)z;
            p->ctrl[1][h].xyz[0] = b->mins[0];
            p->ctrl[1][h].xyz[1] = b->maxs[1];
            p->ctrl[1][h].xyz[2] = (float)z;
            p->ctrl[2][h].xyz[0] = (b->maxs[0] - b->mins[0]) * 0.5 + b->mins[0];
            p->ctrl[2][h].xyz[1] = b->maxs[1];
            p->ctrl[2][h].xyz[2] = (float)z;
            p->ctrl[3][h].xyz[0] = b->maxs[0];
            p->ctrl[3][h].xyz[1] = b->maxs[1];
            p->ctrl[3][h].xyz[2] = (float)z;
            p->ctrl[4][h].xyz[0] = b->maxs[0];
            p->ctrl[4][h].xyz[1] = b->mins[1];
            p->ctrl[4][h].xyz[2] = (float)z;
            z += step;
        }
    }
    else
    {
        p->width = 9;
        p->ctrl[1][0].xyz[0] = b->mins[0];
        p->ctrl[1][0].xyz[1] = b->mins[1];
        p->ctrl[3][0].xyz[0] = b->maxs[0];
        p->ctrl[3][0].xyz[1] = b->mins[1];
        p->ctrl[5][0].xyz[0] = b->maxs[0];
        p->ctrl[5][0].xyz[1] = b->maxs[1];
        p->ctrl[7][0].xyz[0] = b->mins[0];
        p->ctrl[7][0].xyz[1] = b->maxs[1];
        for (int c = 1; c < p->width - 1; c += 2)
        {
            p->ctrl[c][0].xyz[2] = b->mins[2];
            p->ctrl[c][2].xyz[0] = p->ctrl[c][0].xyz[0];
            p->ctrl[c][2].xyz[1] = p->ctrl[c][0].xyz[1];
            p->ctrl[c][2].xyz[2] = b->maxs[2];
            p->ctrl[c][1].xyz[0] = (p->ctrl[c][2].xyz[0] + p->ctrl[c][0].xyz[0]) * 0.5f;
            p->ctrl[c][1].xyz[1] = (p->ctrl[c][2].xyz[1] + p->ctrl[c][0].xyz[1]) * 0.5f;
            p->ctrl[c][1].xyz[2] = (p->ctrl[c][2].xyz[2] + p->ctrl[c][0].xyz[2]) * 0.5f;
        }
        InterpolateInteriorPoints(p);
        if (bSquare)
        {
            if (bBevel)
            {
                for (int h = 0; h < p->height; h++)
                {
                    VectorCopy(p->ctrl[1][h].xyz, p->ctrl[2][h].xyz);
                    VectorCopy(p->ctrl[7][h].xyz, p->ctrl[6][h].xyz);
                }
            }
            else if (bEndcap)
            {
                for (int h = 0; h < p->height; h++)
                {
                    VectorCopy(p->ctrl[5][h].xyz, p->ctrl[4][h].xyz);
                    VectorCopy(p->ctrl[1][h].xyz, p->ctrl[2][h].xyz);
                    VectorCopy(p->ctrl[7][h].xyz, p->ctrl[6][h].xyz);
                    VectorCopy(p->ctrl[8][h].xyz, p->ctrl[7][h].xyz);
                }
            }
            else
            {
                for (int c = 0; c < p->width - 1; c++)
                    for (int h = 0; h < p->height; h++)
                        VectorCopy(p->ctrl[c + 1][h].xyz, p->ctrl[c][h].xyz);
                for (int h = 0; h < p->height; h++)
                    VectorCopy(p->ctrl[0][h].xyz, p->ctrl[8][h].xyz);
            }
        }
    }
    for (int i = 0; i < 2; i++)
        (&p->image_18)[i] = *(void **)((char *)b->faces + i * 0x1c + 0x24);
    FUN_00427160(p, 0);
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, 16.0f);
    else
        FUN_00426f20(p, 1, 16.0f);
    p->flag_382f = 1;
    p->value_3834 = 16.0f;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    if (bCone)
    {
        p->type_10 = 0x10;
        float cx = (b->maxs[0] + b->mins[0]) * 0.5;
        float cy = (b->maxs[1] + b->mins[1]) * 0.5;
        for (int i = 0; i < p->width; i++)
        {
            p->ctrl[i][2].xyz[0] = cx;
            p->ctrl[i][2].xyz[1] = cy;
        }
    }
    brushdef_t *def = AddBrushForPatch(p, owner->def);
    brush_t *nb = FUN_00458440(def, owner);
    FUN_00459210(nb, &DAT_010a44dc);
    FUN_0046fb30();
    FUN_0046f0b0(nb, 1, 1, 0);
}

// Retail 0x004296f0: terrain variant of 0x004293f0.
brush_t *FUN_004296f0(int nWidth, int nHeight, int nOrientation, bool bDeleteSource, bool bOverride)
{
    if (nHeight < 2 || nHeight > 15 || nWidth < 2 || nWidth > 15)
    {
        Sys_Printf("Invalid terrain width or height.\n");
        return NULL;
    }
    if (!bOverride && !QE_SingleBrush_Pmesh())
    {
        Sys_Printf("Cannot generate a terrain from multiple selections.\n");
        return NULL;
    }
    patchMesh_t *p = MakeNewPatch();
    p->width = nWidth;
    p->height = nHeight;
    p->type_10 = 0x40;
    int nFirst = 0;
    int nSecond = 1;
    if (nOrientation == 0)
    {
        nFirst = 1;
        nSecond = 2;
    }
    else if (nOrientation == 1)
        nSecond = 2;
    brush_t *sel = DAT_010a44b4.next;
    brushdef_t *b = sel->def;
    entity_t *owner = sel->owner;
    int xStep = (int)b->mins[nFirst];
    float xAdj = fabs((b->maxs[nFirst] - b->mins[nFirst]) / (float)(nWidth - 1));
    float yAdj = fabs((b->maxs[nSecond] - b->mins[nSecond]) / (float)(nHeight - 1));
    for (int i = 0; i < nWidth; i++)
    {
        int yStep = (int)b->mins[nSecond];
        for (int j = 0; j < nHeight; j++)
        {
            p->ctrl[i][j].xyz[nFirst] = (float)xStep;
            p->ctrl[i][j].xyz[nSecond] = (float)yStep;
            p->ctrl[i][j].xyz[nOrientation] = b->maxs[nOrientation];
            yStep = (int)((float)yStep + yAdj);
        }
        xStep = (int)((float)xStep + xAdj);
    }
    void *curMat = DAT_01128da8;
    (&p->image_18)[DAT_01128d90] = curMat;
    FUN_00427160(p, 0);
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, 16.0f);
    else
        FUN_00426f20(p, 1, 16.0f);
    p->flag_382f = 1;
    p->value_3834 = 16.0f;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    brushdef_t *def = AddBrushForPatch(p, owner->def);
    brush_t *nb = FUN_00458440(def, owner);
    FUN_00459210(nb, &DAT_010a44dc);
    if (bDeleteSource)
    {
        FUN_0046fb30();
        FUN_0046f0b0(nb, 1, 1, 0);
    }
    return nb;
}

// Retail 0x00429a00: find the two selected control points of one patch and check they share a row or column.
bool FUN_00429a00(patchMesh_t *patch, PatchPair *pPair)
{
#line 1698
    assert( patch );
#line 1699
    assert( pPair );
    PatchControl *pdvFound[2];
    pdvFound[0] = NULL;
    pdvFound[1] = NULL;
    for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
    {
        PatchControl *c = (PatchControl *)g_qeglobals.d_move_points[i];
        if (c >= &patch->ctrl[0][0] && c <= &patch->ctrl[15][15])
        {
            if (!pdvFound[0])
                pdvFound[0] = c;
            else if (!pdvFound[1])
                pdvFound[1] = c;
            else
                return false;
        }
    }
    if (!pdvFound[1])
        return false;
    for (int i = 0; i < 2; i++)
    {
        int index = pdvFound[i] - &patch->ctrl[0][0];
        pPair->x[i] = index / 16;
        pPair->y[i] = index - pPair->x[i] * 16;
#line 1725
        assert( pdvFound[i] == &patch->ctrl[pPair->x[i]][pPair->y[i]] );
    }
    if (pPair->x[0] == pPair->x[1] || pPair->y[0] == pPair->y[1])
        return true;
    Sys_Printf("selected vertices must be on the same column or row\n");
    return false;
}





// Retail 0x00429bc0: the row or column shared by every selected control of a patch.
bool FUN_00429bc0(patchMesh_t *patch, int *px, int *py)
{
#line 1746
    assert(patch);
    assert(px);
    assert(py);
    *px = -1;
    *py = -1;
    bool found = false;
    for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
    {
        PatchControl *pdv = (PatchControl *)g_qeglobals.d_move_points[i];
        if (pdv < &patch->ctrl[0][0] || pdv > &patch->ctrl[15][15])
            continue;
        int idx = (int)(pdv - &patch->ctrl[0][0]);
        int x = idx / 16;
        int y = idx - x * 16;
#line 1762
        assert(pdv == &patch->ctrl[x][y]);
        if (!found)
        {
            *px = x;
            *py = y;
            found = true;
        }
        else
        {
            if (*px != x)
                *px = -1;
            if (*py != y)
                *py = -1;
        }
    }
    if (!found)
        return false;
    if (*px >= 0 && *py >= 0)
        return false;
    if (*px < 0 && *py < 0)
    {
        Sys_Printf("selected vertices must be on the same column or row\n");
        return false;
    }
    return true;
}

int __fastcall FUN_00429df0(void *, int value)
{
    for (int i = 0; i < g_qeglobals.d_num_move_points; ++i)
    {
        if (value == (int)g_qeglobals.d_move_points[i])
            return i;
    }
    return -1;
}

int FUN_00439620(const vec3_t v1, const vec3_t v2);

// Retail 0x00429e20: index of the point nearest enough to v in the 0x10f8d8c table, or -1.
int FUN_00429e20(const float *v)
{
    for (int i = 0; i < g_qeglobals.field_6c078; i++)
    {
        const float *t = g_qeglobals.field_3c078[i];
        float dx = t[0] - v[0];
        float dy = t[1] - v[1];
        float dz = t[2] - v[2];
        if (dz * dz + dy * dy + dx * dx < 0.01)
            return i;
    }
    return -1;
}

// Retail 0x00429e90: same search over the 0x10c8d88 table.
int FUN_00429e90(const float *v)
{
    for (int i = 0; i < g_qeglobals.field_3c074; i++)
    {
        const float *t = g_qeglobals.field_c074[i];
        float dx = t[0] - v[0];
        float dy = t[1] - v[1];
        float dz = t[2] - v[2];
        if (dz * dz + dy * dy + dx * dx < 0.01)
            return i;
    }
    return -1;
}

// index of the selected control point at v, or -1
int FUN_00429f00(const vec3_t v)
{
    for (int i = 0; i < g_qeglobals.d_num_move_points; ++i)
    {
        if (FUN_00439620(v, (const float *)g_qeglobals.d_move_points[i]))
            return i;
    }
    return -1;
}

void FUN_0042a0a0(patchMesh_t *p, PatchControl *c, bool weld);

// Retail 0x00429f40: remove the control point equal to v from the selection list.
void FUN_00429f40(const float *v)
{
    int i;
    while ((i = FUN_00429f00(v)) >= 0)
    {
        for (int j = i; j < g_qeglobals.d_num_move_points - 1; j++)
            g_qeglobals.d_move_points[j] = g_qeglobals.d_move_points[j + 1];
        g_qeglobals.d_num_move_points--;
    }
}

// Retail 0x00429fe0: true if every control of column col is flagged or in the selection list.
bool FUN_00429fe0(patchMesh_t *p, int col)
{
    for (int i = 0; i < p->height; i++)
    {
        PatchControl *c = &p->ctrl[col][i];
        if (!(c->flags_34 & 2) && FUN_00429df0(0, (int)c) == -1)
            return false;
    }
    return true;
}

// Retail 0x0042a040: add a control to the selection list (front if the patch is the first selected brush's).
void FUN_0042a040(patchMesh_t *p, PatchControl *c)
{
    if (g_qeglobals.d_num_move_points != 0 && p->cache_3828 == DAT_010a44b4.next->def && DAT_010a44b4.prev != DAT_010a44b4.next)
    {
        memmove(&g_qeglobals.d_move_points[1], &g_qeglobals.d_move_points[0], g_qeglobals.d_num_move_points * 4);
        g_qeglobals.d_move_points[0] = (float *)c;
        g_qeglobals.d_num_move_points++;
        return;
    }
    g_qeglobals.d_move_points[g_qeglobals.d_num_move_points++] = (float *)c;
}

// Retail 0x0042a0a0: add a control point to the move list, plus every coincident point of the selected patches.
void FUN_0042a0a0(patchMesh_t *p, PatchControl *pt, bool bWeld)
{
    const float *v = pt->xyz;
    int viewType = *(int *)(*(char **)((char *)dword_01233488 + 0x7e0) + 0xf4);
    int axis0 = viewType == 0;
    int axis1 = (viewType != 2) + 1;
    FUN_0042a040(p, pt);
    if ((!PREFS_BYTE(0x2e4) && !PREFS_BYTE(0x2e5)) || !bWeld)
        return;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 1908
        assert( b->patch->def == b->def->patch );
        patchMesh_t *pm = b->patch->def;
        for (int w = 0; w < pm->width; w++)
        {
            for (int h = 0; h < pm->height; h++)
            {
                PatchControl *c = &pm->ctrl[w][h];
                bool bDone = false;
                if (PREFS_BYTE(0x2e4))
                {
                    int k;
                    for (k = 0; k < 3; k++)
                    {
                        float d = v[k] - c->xyz[k];
                        if (d * d > 1.0000001e-06f)
                            break;
                    }
                    if (k == 3 && FUN_00429df0(0, (int)c) == -1)
                    {
                        FUN_0042a040(pm, c);
                        bDone = true;
                    }
                }
                if (!bDone && PREFS_BYTE(0x2e5) && DAT_005909f8 != 1)
                {
                    float d = (float)fabs(v[axis0] - c->xyz[axis0]);
                    if (!(d > 0.001f))
                        d = (float)fabs(v[axis1] - c->xyz[axis1]);
                    if (!(d > 0.001f) && FUN_00429df0(0, (int)c) == -1)
                        FUN_0042a040(pm, c);
                }
            }
        }
    }
}

// Retail 0x0042a3a0: select one row (every column's control) of a patch.
void FUN_0042a3a0(patchMesh_t *p, int row, bool bMulti)
{
    if (!bMulti)
        g_qeglobals.d_num_move_points = 0;
    for (int i = 0; i < p->width; i++)
    {
        if (!(p->ctrl[i][row].flags_34 & 2))
            FUN_0042a0a0(p, &p->ctrl[i][row], 0);
    }
}

// Retail 0x0042a3f0: select one column of a patch.
void FUN_0042a3f0(patchMesh_t *p, int col, bool bMulti)
{
    if (!bMulti)
        g_qeglobals.d_num_move_points = 0;
    for (int i = 0; i < p->height; i++)
    {
        if (!(p->ctrl[col][i].flags_34 & 2))
            FUN_0042a0a0(p, &p->ctrl[col][i], 0);
    }
}

// Retail 0x0042a440: select control (x, y) when its neighbour (x + dx, y + dy) is selected.
void FUN_0042a440(patchMesh_t *p, int dx, int dy, bool bMulti, int x, int y)
{
    int nx = x + dx;
    int ny = y + dy;
    if (nx >= 0 && nx < p->width && ny >= 0 && ny < p->height)
    {
        PatchControl *n = &p->ctrl[nx][ny];
        if (FUN_00429df0(0, (int)n) != -1 && !(p->ctrl[x][y].flags_34 & 2))
        {
            if (!bMulti)
                FUN_00429f40(n->xyz);
            FUN_0042a0a0(p, &p->ctrl[x][y], 0);
        }
    }
}

// Retail 0x0042a4b0: spread the selection by (dx, dy), sweeping away from the direction of travel.
void FUN_0042a4b0(patchMesh_t *p, int dx, int dy, bool bMulti)
{
    if (dx < 0)
    {
        for (int x = p->width - 1; x >= 0; x--)
            for (int y = 0; y < p->height; y++)
                FUN_0042a440(p, dx, dy, bMulti, x, y);
    }
    else if (dy < 0)
    {
        for (int x = 0; x < p->width; x++)
            for (int y = p->height - 1; y >= 0; y--)
                FUN_0042a440(p, dx, dy, bMulti, x, y);
    }
    else
    {
        for (int x = 0; x < p->width; x++)
            for (int y = 0; y < p->height; y++)
                FUN_0042a440(p, dx, dy, bMulti, x, y);
    }
    DAT_0123348c = -1;
}

// Retail 0x0042a7f0: spread the control selection of every selected patch (curve edit modes 1 and 4).
bool FUN_0042a7f0(int dx, int dy, bool bMulti)
{
    if (g_qeglobals.d_select_mode != 1 && g_qeglobals.d_select_mode != 4)
        return false;
    bool done = false;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch)
        {
#line 2041
            assert( b->patch->def == b->def->patch );
            FUN_0042a4b0(b->patch->def, dx, dy, bMulti);
            done = true;
        }
    }
    return done;
}

// Retail 0x0042a890: click-select the control at point (a single control, a row or a column).
void FUN_0042a890(const float *point, bool bMulti, bool bColumn)
{
    if (!DAT_012334b8 && !bMulti && !bColumn)
    {
        DAT_012334b8 = 1;
        return;
    }
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 2068
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        for (int x = 0; x < p->width; x++)
        {
            for (int y = 0; y < p->height; y++)
            {
                PatchControl *c = &p->ctrl[x][y];
                int k;
                for (k = 0; k < 3; k++)
                {
                    float d = point[k] - c->xyz[k];
                    if (d * d > 1.0000001e-06f)
                        break;
                }
                if (k < 3)
                    continue;
                if (DAT_0112993e)
                {
                    g_qeglobals.d_num_move_points = 0;
                    c->flags_34 |= 2;
                }
                else if (DAT_0112993f)
                {
                    g_qeglobals.d_num_move_points = 0;
                    c->flags_34 &= ~2;
                }
                else if (FUN_00429df0(0, (int)c) == -1)
                {
                    if (bColumn)
                    {
                        FUN_0042a3f0(p, x, bMulti);
                        return;
                    }
                    if (!bMulti)
                        g_qeglobals.d_num_move_points = 0;
                    if (!(c->flags_34 & 2))
                        FUN_0042a0a0(p, c, 1);
                    return;
                }
                else
                {
                    if (bColumn)
                    {
                        if (FUN_00429fe0(p, x))
                            FUN_0042a3a0(p, y, bMulti);
                        else
                            FUN_0042a3f0(p, x, bMulti);
                        return;
                    }
                    if (DAT_012334b8)
                    {
                        FUN_00429f40(point);
                        return;
                    }
                }
            }
        }
    }
}

// Retail 0x0042ab00: 2D cross-product term of three points (eax, ecx, edx).
float FUN_0042ab00(const vec2_t p0, const vec2_t p1, const vec2_t p2)
{
    return (p1[1] - p0[1]) * p2[0] + (p2[1] - p1[1]) * p0[0] + (p0[1] - p2[1]) * p1[0];
}

// Retail 0x0042ab20: move the selected controls by delta and rebuild their patches.
void FUN_0042ab20(const float *delta)
{
    for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
    {
        float *p = (float *)g_qeglobals.d_move_points[i];
        p[0] += delta[0];
        p[1] += delta[1];
        p[2] += delta[2];
    }
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 2153
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        g_qeglobals.d_numpoints = 0;
        for (int x = 0; x < p->width; x++)
        {
            for (int y = 0; y < p->height; y++)
            {
                g_qeglobals.d_points[g_qeglobals.d_numpoints][0] = p->ctrl[x][y].xyz[0];
                g_qeglobals.d_points[g_qeglobals.d_numpoints][1] = p->ctrl[x][y].xyz[1];
                g_qeglobals.d_points[g_qeglobals.d_numpoints][2] = p->ctrl[x][y].xyz[2];
                if (g_qeglobals.d_numpoints < 0x7ff)
                    g_qeglobals.d_numpoints++;
            }
        }
        FUN_004269d0(p, true);
    }
}

// Retail 0x0042ac60: soft-selection weight of a point by its distance to the nearest selected control.
float FUN_0042ac60(const float *xyz)
{
    float weight = FUN_00401c20();
    if (weight == 0.0f)
        return 0.0f;
    float inner = FUN_00401b80();
    float outer = FUN_00401bd0();
    float best = 3.4028235e38f;
    for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
    {
        const float *p = (const float *)g_qeglobals.d_move_points[i];
        float dx = xyz[0] - p[0];
        float dy = xyz[1] - p[1];
        float d = dy * dy + dx * dx;
        if (d <= inner * inner)
            return weight;
        if (!(best <= d))
            best = d;
    }
    if (best < outer * outer)
    {
        float t = (I_sqrt(best) - inner) / (outer - inner);
        t = 1.0f - (3.0f - (t + t)) * t * t;
        return t * weight;
    }
    return 0.0f;
}

// Retail 0x0042ad80: soft-selection weight of a control at xy distance from point.
float FUN_0042ad80(const float *xyz, const float *point, float inner, float outer, float strength)
{
    float dx = xyz[0] - point[0];
    float dy = xyz[1] - point[1];
    float distSq = dy * dy + dx * dx;
    if (distSq <= inner * inner)
        return strength;
    if (distSq >= outer * outer)
        return 0.0f;
    float t = (I_sqrt(distSq) - inner) / (outer - inner);
    t = 1.0f - (3.0f - (t + t)) * t * t;
    return t * strength;
}

extern HWND g_hwndCheck_01234004;
extern brush_t DAT_010a44b4;
extern brush_t selected_brushes;
void FUN_0042ae30(patchMesh_t *patch, float offset);

// Retail 0x0042ae30: raise every unlocked control point by its falloff weight times delta.
void FUN_0042ae30(patchMesh_t *p, float delta)
{
    for (int w = 0; w < p->width; w++)
    {
        for (int h = 0; h < p->height; h++)
        {
            PatchControl *c = &p->ctrl[w][h];
            if (c->flags_34 & 2)
                continue;
            float weight = FUN_0042ac60(c->xyz);
            if (weight != 0.0f)
                c->xyz[2] = weight * delta + c->xyz[2];
        }
    }
    FUN_004269d0(p, true);
}

void FUN_0042aed0(brush_t *list, float offset)
{
    for (brush_t *b = list->next; b != list; b = b->next)
    {
        if (b->patch)
        {
#line 2287
            assert( b->patch->def == b->def->patch );
            FUN_0042ae30(b->patch->def, offset);
        }
    }
}

void FUN_0042af50(float offset)
{
    if (SendMessageA(g_hwndCheck_01234004, 0xf0, 0, 0))
        FUN_0042aed0(&DAT_010a44dc, offset);
    FUN_0042aed0(&DAT_010a44b4, offset);
}

extern bool FUN_0044f630(brushdef_t *b);
extern bool FUN_00436dc0(const float *origin, const float *dir, patch_t *patch, float *frac, int a5, int a6,
                         unsigned char *hitInfo, int a8);

bool FUN_0042af90(const float *origin, unsigned char *hitInfo, const float *dir, float *hit)
{
    float frac;
    unsigned char info[4];
    float best = 3.4028235e38f;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch && !b->hiddenBrush && !FUN_0044f630(b->def)
            && FUN_00436dc0(origin, dir, b->patch, &frac, 0, 0, info, 0) && best > frac)
        {
            best = frac;
            if (hitInfo)
            {
                hitInfo[0] = info[0];
                hitInfo[1] = info[1];
                hitInfo[2] = info[2];
                hitInfo[3] = info[3];
            }
        }
    }
    for (brush_t *b = DAT_010a44dc.next; b && b != &DAT_010a44dc; b = b->next)
    {
        {
            if (b->patch && !b->hiddenBrush && !FUN_0044f630(b->def)
                && FUN_00436dc0(origin, dir, b->patch, &frac, 0, 0, info, 0) && best > frac)
            {
                best = frac;
                if (hitInfo)
                {
                    hitInfo[0] = info[0];
                    hitInfo[1] = info[1];
                    hitInfo[2] = info[2];
                    hitInfo[3] = info[3];
                }
            }
        }
    }
    if (best == 3.4028235e38f)
        return false;
    VectorMA(origin, best, dir, hit);
    return true;
}

// first arg is the PatchControl; 0x42b6d0/0x42b760 are matched with int
typedef float (*PatchPaintFunc)(int c, int component, float value, float delta, float weight);

float FUN_00401c20();
float FUN_00401b80();
float FUN_00401bd0();
float PointToBoxDistSq(const vec3_t point, const vec3_t mins, const vec3_t maxs);
bool FUN_0044f5d0(brush_t *b);
void Undo_AddBrush(brushdef_t *brush);
void FUN_004269d0(patchMesh_t *p, bool bRebuildBrush);

// Retail 0x0042b0f0: apply a soft-selection brush stroke to one patch (height and vertex colors).
void FUN_0042b0f0(brush_t *b, int flags, const float *point, float delta, PatchPaintFunc func)
{
    float strength = FUN_00401c20();
    if (strength == 0.0f)
        return;
    float inner = FUN_00401b80();
    float outer = FUN_00401bd0();
    if (PointToBoxDistSq(point, b->def->mins, b->def->maxs) > outer * outer)
        return;
    if (FUN_0044f5d0(b))
        return;
    bool changed = false;
#line 2390
    assert( b->patch->def == b->def->patch );
    patchMesh_t *p = b->patch->def;
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (p->ctrl[i][j].flags_34 & 2)
                continue;
            float weight = FUN_0042ad80(p->ctrl[i][j].xyz, point, inner, outer, strength);
            if (weight == 0.0f)
                continue;
            changed = true;
            if (!p->field_382e)
            {
                p->field_382e = 1;
                Undo_AddBrush((brushdef_t *)p->cache_3828);
            }
            if (flags & 1)
                p->ctrl[i][j].xyz[2] = func((int)&p->ctrl[i][j], 0, p->ctrl[i][j].xyz[2], delta, weight);
            if (flags & 8)
                p->ctrl[i][j].color_28[0] = I_fround(min(255.0f, max(0.0f, func((int)&p->ctrl[i][j], 3, p->ctrl[i][j].color_28[0], delta * 0.0625f, weight))));
            if (flags & 4)
                p->ctrl[i][j].color_28[1] = I_fround(min(255.0f, max(0.0f, func((int)&p->ctrl[i][j], 2, p->ctrl[i][j].color_28[1], delta * 0.0625f, weight))));
            if (flags & 2)
                p->ctrl[i][j].color_28[2] = I_fround(min(255.0f, max(0.0f, func((int)&p->ctrl[i][j], 1, p->ctrl[i][j].color_28[2], delta * 0.0625f, weight))));
            if (flags & 0x10)
                p->ctrl[i][j].color_28[3] = I_fround(min(255.0f, max(0.0f, func((int)&p->ctrl[i][j], 4, p->ctrl[i][j].color_28[3], delta * 0.0625f, weight))));
        }
    }
    if (changed)
        FUN_004269d0(p, true);
}

// Retail 0x0042b640
void FUN_0042b640(brush_t *list, int flags, const float *point, float delta, PatchPaintFunc func)
{
    for (brush_t *b = list->next; b != list; b = b->next)
    {
        if (b->patch)
            FUN_0042b0f0(b, flags, point, delta, func);
    }
}

// Retail 0x0042b680
void FUN_0042b680(int flags, const float *point, float delta, PatchPaintFunc func)
{
    if (SendMessageA(g_hwndCheck_01234004, 0xf0, 0, 0))
        FUN_0042b640(&DAT_010a44dc, flags, point, delta, func);
    FUN_0042b640(&DAT_010a44b4, flags, point, delta, func);
}

// Retail 0x0042b6d0, 14 B. Isolated exact MATCH in run 42070669799.
float FUN_0042b6d0(int unused1, int unused2,
                    float offset, float factor, float scale)
{
    return factor * scale + offset;
}

static float g_patchAccumWeights[5];
static float g_patchAccumVals[5];

// Retail 0x0042b6e0: blend a component toward its accumulated value.
float FUN_0042b6e0(int unused1, int index, float value, float delta, float weight)
{
    float f = delta * weight;
    float t = max(0.0f, min(1.0f, f));
    return (1.0f - t) * value + t * g_patchAccumVals[index];
}


// Retail 0x0042b760, 45 B: weighted control-point accumulator callback (5 components).
float FUN_0042b760(int unused1, int index, float value, int unused2, float weight)
{
    g_patchAccumVals[index] += value * weight;
    g_patchAccumWeights[index] += weight;
    return value;
}

// Retail 0x0042b790: twin of 0x0042b6e0.
float FUN_0042b790(int unused1, int index, float value, float delta, float weight)
{
    float f = delta * weight;
    float t = max(0.0f, min(1.0f, f));
    return (1.0f - t) * value + t * g_patchAccumVals[index];
}

extern int DAT_010bcd2c;
float FUN_00494530(float x, float y, float z, float w);

// Retail 0x0042b810: value-noise offset, seeded per component from the weights table.
float FUN_0042b810(int c, int index, float value, float delta, float weight)
{
    const float *xyz = (const float *)c;
    float scale = (float)(DAT_010bcd2c << 5);
    float x = xyz[0] / scale;
    float y = xyz[1] / scale;
    float z = xyz[2] / scale;
    float w = g_patchAccumWeights[index];
    return FUN_00494530(x, y, z, w) * delta * weight + value;
}

// Projection of CAdvCurveEditDlg (AdvCurveDlg.cpp) for the one global instance used here.
class CAdvCurveEditDlg : public CWnd
{
public:
    bool FUN_00401d30();
    int FUN_00401d90();
    void FUN_00401df0(int selected);
    void FUN_00402300(COLORREF value);
    COLORREF FUN_00402320();
    void FUN_00402330(BYTE value);
    BYTE FUN_00402350();
    void FUN_00402360(float value);
    float FUN_004023c0();
};
extern CAdvCurveEditDlg DAT_01233b68;
extern float DAT_0124a184;

// Retail 0x0042b870: patch paint at the picked point, by the curve dialog's paint mode.
void FUN_0042b870(int buttons, const float *origin, const float *dir)
{
    vec3_t hit;
    if ((buttons == 1 || buttons == 2) && FUN_0042af90(origin, NULL, dir, hit))
    {
    float scale = 1.0f;
    if (buttons != 1)
        scale = -1.0f;
    int flags = 0;
    if (((CButton *)DAT_01233b68.GetDlgItem(1469))->GetCheck())
        flags = 1;
    if (((CButton *)DAT_01233b68.GetDlgItem(1470))->GetCheck())
        flags |= 0xe;
    else
    {
        if (((CButton *)DAT_01233b68.GetDlgItem(1471))->GetCheck())
            flags |= 2;
        if (((CButton *)DAT_01233b68.GetDlgItem(1472))->GetCheck())
            flags |= 4;
        if (((CButton *)DAT_01233b68.GetDlgItem(1473))->GetCheck())
            flags |= 8;
    }
    if (((CButton *)DAT_01233b68.GetDlgItem(1474))->GetCheck())
        flags |= 0x10;
    switch (DAT_01233b68.FUN_00401d90())
    {
    case 0:
        FUN_0042b680(flags, hit, (float)DAT_010bcd2c * scale * 0.5f, FUN_0042b6d0);
        break;
    case 1:
        break;
    case 2:
        g_patchAccumVals[0] = DAT_01233b68.FUN_004023c0();
        if (scale < 0.0f)
        {
            g_patchAccumVals[1] = 255.0f;
            g_patchAccumVals[2] = 255.0f;
            g_patchAccumVals[3] = 255.0f;
            g_patchAccumVals[4] = 255.0f;
        }
        else
        {
            COLORREF color = DAT_01233b68.FUN_00402320();
            g_patchAccumVals[1] = GetRValue(color);
            g_patchAccumVals[2] = GetGValue(color);
            g_patchAccumVals[3] = GetBValue(color);
            g_patchAccumVals[4] = DAT_01233b68.FUN_00402350();
        }
        FUN_0042b680(flags, hit, 1.0f, FUN_0042b6e0);
        break;
    case 3:
        g_patchAccumWeights[0] = 0.0f;
        g_patchAccumVals[0] = 0.0f;
        g_patchAccumWeights[1] = 0.0f;
        g_patchAccumVals[1] = 0.0f;
        g_patchAccumWeights[2] = 0.0f;
        g_patchAccumVals[2] = 0.0f;
        g_patchAccumWeights[3] = 0.0f;
        g_patchAccumVals[3] = 0.0f;
        g_patchAccumWeights[4] = 0.0f;
        g_patchAccumVals[4] = 0.0f;
        FUN_0042b680(flags, hit, 0.0f, (PatchPaintFunc)FUN_0042b760);
        if (g_patchAccumWeights[0] != 0.0f)
            g_patchAccumVals[0] /= g_patchAccumWeights[0];
        else
            flags &= ~1;
        if (g_patchAccumWeights[1] != 0.0f)
            g_patchAccumVals[1] /= g_patchAccumWeights[1];
        else
            flags &= ~2;
        if (g_patchAccumWeights[2] != 0.0f)
            g_patchAccumVals[2] /= g_patchAccumWeights[2];
        else
            flags &= ~4;
        if (g_patchAccumWeights[3] != 0.0f)
            g_patchAccumVals[3] /= g_patchAccumWeights[3];
        else
            flags &= ~8;
        if (g_patchAccumWeights[4] != 0.0f)
            g_patchAccumVals[4] /= g_patchAccumWeights[4];
        else
            flags &= ~0x10;
        if (flags)
            FUN_0042b680(flags, hit, FUN_00401c20() * (float)DAT_010bcd2c * 0.01f, FUN_0042b790);
        break;
    case 4:
        g_patchAccumWeights[0] = DAT_0124a184;
        g_patchAccumWeights[1] = DAT_0124a184;
        g_patchAccumWeights[2] = DAT_0124a184;
        g_patchAccumWeights[3] = DAT_0124a184;
        g_patchAccumWeights[4] = DAT_0124a184;
        DAT_0124a184 += 1.0f;
        FUN_0042b680(flags, hit, FUN_00401c20(), FUN_0042b810);
        break;
    case 5:
    {
        unsigned char info[4];
        if (!FUN_0042af90(origin, info, dir, hit))
            return;
        g_patchAccumVals[0] = hit[2];
        g_patchAccumVals[1] = info[2];
        g_patchAccumVals[2] = info[1];
        g_patchAccumVals[3] = info[0];
        g_patchAccumVals[4] = info[3];
        DAT_01233b68.FUN_00402360(hit[2]);
        DAT_01233b68.FUN_00402300(RGB(info[2], info[1], info[0]));
        DAT_01233b68.FUN_00402330(info[3]);
        break;
    }
    }
    }
}

void FUN_0042bd10(brush_t *list)
{
    for (brush_t *b = list->next; b != list; b = b->next)
    {
        if (b->patch)
        {
#line 2640
            assert( b->patch->def == b->def->patch );
            b->patch->def->field_382e = 0;
        }
    }
}

void FUN_004433b0();
void Undo_GeneralStart(char *operation);

bool FUN_0042bd90()
{
    FUN_004433b0();
    Undo_GeneralStart("patch painting");
    if (SendMessageA(g_hwndCheck_01234004, 0xf0, 0, 0))
        FUN_0042bd10(&DAT_010a44dc);
    FUN_0042bd10(&DAT_010a44b4);
    return true;
}

bool FUN_0042bde0(brush_t *list);
void Undo_End();

// Retail 0x0042bde0: clear the hit flag on every patch in a brush list and restore its undo id.
bool FUN_0042bde0(brush_t *list)
{
    for (brush_t *b = list->next; b != list; b = b->next)
    {
        if (!b->patch)
            continue;
#line 2668
        assert( b->patch->def == b->def->patch );
        if (b->patch->def->field_382e)
        {
            b->def->patch->field_382e = 0;
            brushdef_t *def = b->def;
            undo_proj *u = DAT_0109fdcc;
            if (u && u->field_0c == 0)
            {
                *(int *)((char *)def + 0x10) = u->field_08;
                entity_t *e = *(entity_t **)((char *)def + 8);
                if (e->eclass->fixedsize)
                    *(int *)((char *)e + 0x6c) = u->field_08;
            }
        }
    }
    return true;
}

void FUN_0042beb0()
{
    if (DAT_01233b68.FUN_00401d90() == 5)
        DAT_01233b68.FUN_00401df0(2);
    if (SendMessageA(g_hwndCheck_01234004, 0xf0, 0, 0))
        FUN_0042bde0(&DAT_010a44dc);
    FUN_0042bde0(&DAT_010a44b4);
    Undo_End();
}

struct GfxPointVertex { float xyz[3]; unsigned char color[4]; };
float FUN_00401b80();
float FUN_00401bd0();
int FUN_0042c3f0(patchMesh_t *p, const float *center, float radius1, float radius2, vec3_t *inner, int innerCount,
                 vec3_t *outer, int outerCount, const unsigned int *color, int vertCount, int maxVerts, GfxPointVertex *verts);
int FUN_0042c790(patchMesh_t *p, const float *center, float radius1, float radius2, int vertCount, int maxVerts, GfxPointVertex *verts);
extern void (*FUN_0059c45c)(int count, int width, const GfxPointVertex *verts);
extern void (*FUN_0059c460)(int count, int width, const GfxPointVertex *verts);
extern void (*FUN_0059c468)(const float *inColor, unsigned int *outColor);
static const vec4_t flt_005471d0[2] = { { 1.0f, 1.0f, 0.0f, 1.0f }, { 1.0f, 0.25f, 0.25f, 1.0f } };


struct patchCacheVert_t { vec3_t xyz; unsigned char pad0c[0x2c - 0x0c]; };
struct patchCache_t { int width; int height; int pad08; patchCacheVert_t *verts; };
int FUN_0042bf50(const float *a, const float *b, const float *c, vec3_t *ring, int ringCount, const unsigned int *color,
                 int vertCount, int maxVerts, GfxPointVertex *verts);

int FUN_0042c3f0(patchMesh_t *p, const float *center, float radius1, float radius2, vec3_t *inner, int innerCount,
                 vec3_t *outer, int outerCount, const unsigned int *color, int vertCount, int maxVerts, GfxPointVertex *verts)
{
    patchCache_t *cache = (patchCache_t *)p->cache_3824;
    float radius1Sq = radius1 * radius1;
    float radius2Sq = radius2 * radius2;
#line 2877
    assert( radius1 < radius2 );
    float dist = 0;
    float delta;
    if (((float *)p->cache_3828)[8] > center[0])
    {
        delta = ((float *)p->cache_3828)[8] - center[0];
        dist += delta * delta;
    }
    else if (((float *)p->cache_3828)[11] < center[0])
    {
        delta = ((float *)p->cache_3828)[11] - center[0];
        dist += delta * delta;
    }
    if (((float *)p->cache_3828)[9] > center[1])
    {
        delta = ((float *)p->cache_3828)[9] - center[1];
        dist += delta * delta;
    }
    else if (((float *)p->cache_3828)[12] < center[1])
    {
        delta = ((float *)p->cache_3828)[12] - center[1];
        dist += delta * delta;
    }
    if (dist > radius1Sq && dist > radius2Sq)
        return vertCount;
    for (int i = 0; i < cache->height - 1; i++)
    {
        for (int j = 0; j < cache->width - 1; j++)
        {
            int idx = cache->width * i + j;
            int idx2 = idx + cache->width;
            const float *q[4];
            if (p->ctrl[j][i].flags_34 & 1)
            {
                q[0] = cache->verts[idx + 1].xyz;
                q[1] = cache->verts[idx2 + 1].xyz;
                q[2] = cache->verts[idx2].xyz;
                q[3] = cache->verts[idx].xyz;
            }
            else
            {
                q[0] = cache->verts[idx].xyz;
                q[1] = cache->verts[idx + 1].xyz;
                q[2] = cache->verts[idx2 + 1].xyz;
                q[3] = cache->verts[idx2].xyz;
            }
            float maxDist = 0;
            for (int k = 0; k < 4; k++)
            {
                float dx = q[k][0] - center[0];
                float dy = q[k][1] - center[1];
                float d = dy * dy + dx * dx;
                if (maxDist <= d)
                    maxDist = d;
            }
            if (maxDist > radius1Sq)
            {
                vertCount = FUN_0042bf50(q[3], q[1], q[0], inner, innerCount, color, vertCount, maxVerts, verts);
                vertCount = FUN_0042bf50(q[3], q[2], q[1], inner, innerCount, color, vertCount, maxVerts, verts);
            }
            if (maxDist > radius2Sq)
            {
                vertCount = FUN_0042bf50(q[3], q[1], q[0], outer, outerCount, color, vertCount, maxVerts, verts);
                vertCount = FUN_0042bf50(q[3], q[2], q[1], outer, outerCount, color, vertCount, maxVerts, verts);
            }
        }
    }
    return vertCount;
}

// Retail 0x0042bf10: apply a curve-edit move: patch paint for the detail drag mode, else move the selection.
void FUN_0042bf10(const float *v)
{
    if (DAT_01233b68.FUN_00401d30() && DAT_01233b68.FUN_00401d90() == 1)
        FUN_0042af50(v[2]);
    else
        FUN_0042ab20(v);
}

int FUN_0042c790(patchMesh_t *p, const float *center, float radius1, float radius2, int vertCount, int maxVerts, GfxPointVertex *verts)
{
    float radius1Sq = radius1 * radius1;
    float radius2Sq = radius2 * radius2;
#line 2963
    assert( radius1 < radius2 );
    float dist = 0;
    float delta;
    if (((float *)p->cache_3828)[8] > center[0])
    {
        delta = ((float *)p->cache_3828)[8] - center[0];
        dist += delta * delta;
    }
    else if (((float *)p->cache_3828)[11] < center[0])
    {
        delta = ((float *)p->cache_3828)[11] - center[0];
        dist += delta * delta;
    }
    if (((float *)p->cache_3828)[9] > center[1])
    {
        delta = ((float *)p->cache_3828)[9] - center[1];
        dist += delta * delta;
    }
    else if (((float *)p->cache_3828)[12] < center[1])
    {
        delta = ((float *)p->cache_3828)[12] - center[1];
        dist += delta * delta;
    }
    if (dist > radius1Sq && dist > radius2Sq)
        return vertCount;
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            PatchControl *ctrl = &p->ctrl[i][j];
            float dx = ctrl->xyz[0] - center[0];
            float dy = ctrl->xyz[1] - center[1];
            float d = dy * dy + dx * dx;
            if (d < radius2Sq)
            {
                float f;
                if (d > radius1Sq)
                {
                    float t = (I_sqrt(d) - radius1) / (radius2 - radius1);
                    f = 1.0f - (3.0f - 2.0f * t) * t * t;
                }
                else
                    f = 1.0f;
                int n = (int)f;
                float frac = f - (float)n;
                vec4_t color;
                color[0] = (flt_005471d0[n + 1][0] - flt_005471d0[n][0]) * frac + flt_005471d0[n][0];
                color[1] = (flt_005471d0[n + 1][1] - flt_005471d0[n][1]) * frac + flt_005471d0[n][1];
                color[2] = (flt_005471d0[n + 1][2] - flt_005471d0[n][2]) * frac + flt_005471d0[n][2];
                color[3] = (flt_005471d0[n + 1][3] - flt_005471d0[n][3]) * frac + flt_005471d0[n][3];
                unsigned int packed;
                (*FUN_0059c468)(color, &packed);
                OrientationPosToWorld(&g_editorOrientation, ctrl->xyz, verts[vertCount].xyz);
                *(unsigned int *)verts[vertCount].color = packed;
                vertCount++;
                if (vertCount == maxVerts)
                {
                    (*FUN_0059c45c)(vertCount, 6, verts);
                    vertCount = 0;
                }
            }
        }
    }
    return vertCount;
}

#define PM_FRONT_FACE 0
#define PM_BACK_FACE 1
extern void (*R_FreeStaticSurface)(void *matHandle, int vertCount, void *vertHandle);

void FUN_0042ca80(patch_t *pm)
{
#line 3018
    assert( pm );
    if (!pm->vertHandle)
    {
#line 3022
        assert( !pm->indices[PM_FRONT_FACE] );
#line 3023
        assert( !pm->indices[PM_BACK_FACE] );
#line 3024
        assert( !pm->indexCount );
#line 3025
        assert( !pm->vertCount );
        return;
    }
    (*R_FreeStaticSurface)(pm->matHandle, pm->vertCount, pm->vertHandle);
    pm->matHandle = NULL;
    pm->vertHandle = NULL;
#line 3032
    assert( pm->indices[PM_BACK_FACE] == pm->indices[PM_FRONT_FACE] + pm->indexCount );
    free(pm->indices[PM_FRONT_FACE]);
    pm->indices[PM_FRONT_FACE] = NULL;
    pm->indices[PM_BACK_FACE] = NULL;
    pm->indexCount = 0;
    pm->vertCount = 0;
}

class CMainFrame;
extern "C" void FUN_0041b190(CMainFrame *self);
extern CMainFrame *dword_01233488;
extern int DAT_011298b4;
extern bool DAT_012334b9;
extern bool DAT_012334ba;
void FUN_00433ad0();
void FUN_00434040();

// Retail 0x0042cc50: drop the render data of a patch instance and mark it stale.
void FUN_0042cc50(patch_t *pm)
{
#line 3043
    assert( pm );
    if (!pm->vertHandle)
    {
#line 3047
        assert( !pm->indices[PM_FRONT_FACE] );
#line 3048
        assert( !pm->indices[PM_BACK_FACE] );
#line 3049
        assert( !pm->indexCount );
#line 3050
        assert( !pm->vertCount );
        return;
    }
    pm->vertHandle = NULL;
#line 3055
    assert( pm->indices[PM_BACK_FACE] == pm->indices[PM_FRONT_FACE] + pm->indexCount );
    free(pm->indices[PM_FRONT_FACE]);
    pm->indices[PM_FRONT_FACE] = NULL;
    pm->indices[PM_BACK_FACE] = NULL;
    pm->indexCount = 0;
    pm->vertCount = 0;
    pm->version = pm->def->version - 1;
}

// Retail 0x0042ce10: build the render vertex and index data of a patch instance from its subdivided mesh.
void FUN_0042ce10(patch_t *pm)
{
    FUN_0042ca80(pm);
    patchMesh_t *def = pm->def;
    mesh_t *mesh = (mesh_t *)def->cache_3824;
    pm->vertCount = mesh->height * mesh->width;
    float *xyz = (float *)malloc(pm->vertCount * 12);
    float *tangent = (float *)malloc(pm->vertCount * 12);
    float *binormal = (float *)malloc(pm->vertCount * 12);
    float *normal = (float *)malloc(pm->vertCount * 12);
    float *st = (float *)malloc(pm->vertCount * 8);
    unsigned int *color = (unsigned int *)malloc(pm->vertCount * 4);
    for (int i = 0; i < pm->vertCount; i++)
    {
        drawVert_t *v = &mesh->verts[i];
        OrientationPosToWorld(&g_editorOrientation, v->xyz, &xyz[i * 3]);
        tangent[i * 3 + 0] = 1.0f;
        tangent[i * 3 + 1] = 0.0f;
        tangent[i * 3 + 2] = 0.0f;
        binormal[i * 3 + 0] = 0.0f;
        binormal[i * 3 + 1] = 1.0f;
        binormal[i * 3 + 2] = 0.0f;
        normal[i * 3 + 0] = v->normal[0];
        normal[i * 3 + 1] = v->normal[1];
        normal[i * 3 + 2] = v->normal[2];
        st[i * 2 + 0] = v->st[0];
        st[i * 2 + 1] = v->st[1];
        color[i] = *(unsigned int *)v->color;
    }
    int mat = *(int *)(&def->image_18)[DAT_01128d90];
    pm->matHandle = (void *)mat;
    pm->vertHandle = (*FUN_0059c4a8)(mat, pm->vertCount, xyz, tangent, binormal, normal, st, color);
    free(color);
    free(st);
    free(normal);
    free(binormal);
    free(tangent);
    free(xyz);
    pm->indexCount = (mesh->height * 6 - 6) * (mesh->width - 1);
    unsigned short *indices = (unsigned short *)malloc(pm->indexCount * 4);
    pm->indices[PM_FRONT_FACE] = indices;
    pm->indices[PM_BACK_FACE] = indices + pm->indexCount;
    int indexCount = 0;
    for (int y = 0; y < mesh->height - 1; y++)
    {
        for (int x = 0; x < mesh->width - 1; x++)
        {
            unsigned short *out = &pm->indices[PM_FRONT_FACE][indexCount];
            unsigned short row0 = (unsigned short)(mesh->width * y);
            unsigned short row1 = (unsigned short)(mesh->width * (y + 1));
            if (pm->def->type_10 == 0x40 && (pm->def->ctrl[x][y].flags_34 & 1))
            {
                out[0] = row0 + x;
                out[1] = row1 + x + 1;
                out[2] = row0 + x + 1;
                out[3] = row1 + x + 1;
                out[4] = row0 + x;
                out[5] = row1 + x;
            }
            else
            {
                out[0] = row0 + x;
                out[1] = row1 + x;
                out[2] = row0 + x + 1;
                out[3] = row0 + x + 1;
                out[4] = row1 + x;
                out[5] = row1 + x + 1;
            }
            indexCount += 6;
        }
    }
#line 3141
    assert( indexCount == pm->indexCount );
    for (int i = 0; i < pm->indexCount; i++)
        pm->indices[PM_BACK_FACE][i] = pm->indices[PM_FRONT_FACE][pm->indexCount - i - 1];
    pm->version = pm->def->version;
}

// Retail 0x0042d270: write one patch as Maya MEL (a polyPlane or a list of triangle facets).
void FUN_0042d270(FILE *file, patch_t *pm, bool bBrush, bool bUV, bool bFacets)
{
    fprintf(file, "\t{\r\n");
    if (bBrush)
    {
        fprintf(file, "\t\tstring $strPolyList[];\r\n");
        fprintf(file, "\t\tstring $strBrush[];\r\n\r\n");
    }
    fprintf(file, "\t\tstring $strPolyInfo[];\r\n");
    patchCache_t *mesh = (patchCache_t *)pm->def->cache_3824;
    if (bFacets)
    {
        for (int i = 0; i < pm->indexCount; i += 3)
        {
            fprintf(file, "\t\t$strPolyInfo = `polyCreateFacet -ch off -tx 1 -s 1");
            for (int k = 2; k >= 0; k--)
            {
                const float *v = mesh->verts[pm->indices[0][i + k]].xyz;
                fprintf(file, " -p %f %f %f", v[0], v[1], v[2]);
            }
            fprintf(file, "`;\r\n");
            fprintf(file, "\t$strPolyList[%d] = $strPolyInfo[0];\r\n", i / 3);
            if (bUV)
            {
                for (int k = 2; k >= 0; k--)
                {
                    const float *v = mesh->verts[pm->indices[0][i + k]].xyz;
                    fprintf(file, "\t\tpolyEditUV -r false -u %f -v %f ($strPolyInfo[0]).map[%d];\r\n", v[3], v[4], k);
                }
            }
        }
        if (bBrush)
        {
            fprintf(file, "\t\t$strBrush = `polyUnite -ch 0 ($strPolyList)`;\r\n");
            fprintf(file, "\t\tpolyMergeVertex -d 0.01 -ch 0 $strBrush[0];\r\n");
            fprintf(file, "\t\tpolySoftEdge -a 180 -ch 0 $strBrush[0];\r\n");
            fprintf(file, "\t\tparent $strBrush[0] $strGroups[$iCurGroup];\r\n");
        }
        else
            fprintf(file, "\t\tparent $strPolyList $strGroups[$iCurGroup];\r\n");
    }
    else
    {
        int count = mesh->width * mesh->height;
        fprintf(file, "\t\t$strPolyInfo = `polyPlane -ch off -sx %d -sy %d`;\r\n", mesh->width - 1, mesh->height - 1);
        for (int i = 0; i < count; i++)
        {
            const float *v = mesh->verts[i].xyz;
            fprintf(file, "\t\tmove -ws %f %f %f ($strPolyInfo[0] + \".vtx[%d]\");\r\n", v[0], v[1], v[2], i);
        }
        fprintf(file, "\t\tparent $strPolyInfo[0] $strGroups[$iCurGroup];\r\n");
    }
    DAT_01129984++;
    fprintf(file, "\t}\r\n");
    fprintf(file, "\tprogressWindow -edit -s 1;\r\n");
    fprintf(file, "\tprogressWindow -edit -st \"%d of %d objects\";\r\n", DAT_01129984, DAT_01129980);
}

// Retail 0x0042d560: rebuild the render data of a patch instance when it is stale.
void FUN_0042d560(patch_t *pm)
{
    if (!pm->vertHandle || pm->version != pm->def->version)
    {
        FUN_0042ce10(pm);
#line 3239
        assert( pm->version == pm->def->version );
    }
}

// Retail 0x0042d5d0: hand one face's index buffer of a patch instance to the renderer.
void FUN_0042d5d0(void *mat, patch_t *pm, int face, int arg)
{
#line 3247
    assert( pm );
#line 3248
    assert( pm->version == pm->def->version );
    if (!mat)
        mat = *(void **)(&pm->def->image_18)[DAT_01128d90];
#line 3255
    assert( face == PM_FRONT_FACE || face == PM_BACK_FACE );
#line 3256
    assert( face >= 0 && face < ARRAY_COUNT( pm->indices ) );
    (*FUN_0059c488)(mat, arg, pm->vertCount, pm->vertHandle, pm->indexCount, pm->indices[face]);
}

// Retail 0x0042e550: draw a patch instance in the given mode, with an optional wireframe overlay.
void FUN_0042e550(int mode, patch_t *pm, void *mat, int bFlag)
{
    FUN_0042d560(pm);
    bool bDrawn;
    if (PREFS_INT(0x2e0) == 0 || (PREFS_INT(0x2e0) == 2 && mode != 30))
    {
        FUN_0042d5d0(mat, pm, PM_FRONT_FACE, mode);
        bDrawn = true;
    }
    else
        bDrawn = false;
    if (bFlag)
    {
        if (!bDrawn)
            FUN_0042d5d0(DAT_011298c8, pm, PM_FRONT_FACE, mode);
    }
    else
    {
#line 3247
        assert( pm );
#line 3248
        assert( pm->version == pm->def->version );
        if (!mat)
            mat = *(void **)(&pm->def->image_18)[DAT_01128d90];
        (*FUN_0059c488)(mat, 30, pm->vertCount, pm->vertHandle, pm->indexCount, pm->indices[PM_BACK_FACE]);
        if (PREFS_INT(0x2e0))
        {
            (*FUN_0059c468)((const float *)&DAT_01129878, (unsigned int *)&bFlag);
            FUN_0042e7b0((unsigned int *)&bFlag, 2, pm);
        }
    }
    FUN_0042d720(pm);
}

// Retail 0x0042e6c0: draw both faces of a patch instance with draw mode 29.
void FUN_0042e6c0(patch_t *pm)
{
    FUN_0042d560(pm);
    FUN_0042d5d0(DAT_011298c8, pm, PM_FRONT_FACE, 29);
    FUN_0042d5d0(DAT_011298c8, pm, PM_BACK_FACE, 29);
}

// Retail 0x0042e7b0: draw the quad grid of a patch instance as 3D lines.
void FUN_0042e7b0(const unsigned int *color, int width, patch_t *pm)
{
    GfxPointVertex verts[1362];
#line 3524
    assert( pm );
    patchCache_t *mesh = (patchCache_t *)pm->def->cache_3824;
#line 3526
    assert( mesh );
    int count = 0;
    for (int r = 0; r < mesh->height - 1; r++)
    {
        for (int c = 0; c < mesh->width - 1; c++)
        {
            const float *a = mesh->verts[r * mesh->width + c].xyz;
            const float *b = a + 11;
            const float *cc = mesh->verts[(r + 1) * mesh->width + c].xyz;
            const float *d = cc + 11;
            if (c == 0)
                count = R_Add3DLine(verts, a, cc, color, width, count, 1362);
            if (r == 0)
                count = R_Add3DLine(verts, a, b, color, width, count, 1362);
            count = R_Add3DLine(verts, d, b, color, width, count, 1362);
            count = R_Add3DLine(verts, d, cc, color, width, count, 1362);
            if (pm->def->type_10 == 0x40 && (pm->def->ctrl[c][r].flags_34 & 1))
                count = R_Add3DLine(verts, a, d, color, width, count, 1362);
            else
                count = R_Add3DLine(verts, cc, b, color, width, count, 1362);
        }
    }
    if (count)
        (*FUN_0059c460)(count / 2, width, verts);
    FUN_0042d720(pm);
}

// Retail 0x0042eaf0: transform the selected controls of a patch about an origin by a 3x3 matrix.
void FUN_0042eaf0(patchMesh_t *p, const float *origin, const float *matrix, bool bSnap)
{
    DAT_0109c538.width = p->width;
    DAT_0109c538.height = p->height;
    DAT_0109c538.type_10 = p->type_10;
    memcpy(DAT_0109c538.ctrl, p->ctrl, sizeof(p->ctrl));
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (g_qeglobals.d_select_mode == 4 || DAT_012334ba)
            {
                if (FUN_00429df0(0, (int)&p->ctrl[i][j]) == -1)
                    continue;
            }
            PatchControl *c = &p->ctrl[i][j];
            float dx = c->xyz[0] - origin[0];
            float dy = c->xyz[1] - origin[1];
            float dz = c->xyz[2] - origin[2];
            for (int k = 0; k < 3; k++)
            {
                c->xyz[k] = dz * matrix[k * 3 + 2] + dx * matrix[k * 3] + origin[k] + dy * matrix[k * 3 + 1];
                if (bSnap)
                    c->xyz[k] = (float)floor(c->xyz[k] + 0.5);
            }
        }
    }
    FUN_004269d0(p, true);
}

// Retail 0x0042ec60: start vertex dragging: remember the position of every control of every selected patch.
void FUN_0042ec60()
{
    g_qeglobals.d_numpoints = 0;
    g_qeglobals.d_num_move_points = 0;
    g_qeglobals.field_3c074 = 0;
    g_qeglobals.field_6c078 = 0;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 3617
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        for (int w = 0; w < p->width; w++)
        {
            for (int h = 0; h < p->height; h++)
            {
                g_qeglobals.d_points[g_qeglobals.d_numpoints][0] = p->ctrl[w][h].xyz[0];
                g_qeglobals.d_points[g_qeglobals.d_numpoints][1] = p->ctrl[w][h].xyz[1];
                g_qeglobals.d_points[g_qeglobals.d_numpoints][2] = p->ctrl[w][h].xyz[2];
                if (g_qeglobals.d_numpoints < 0x7ff)
                    g_qeglobals.d_numpoints++;
            }
        }
    }
    int mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 4;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
}

// Retail 0x0042edc0: rebuild the drag point lists from the selection and start the current edit mode.
void FUN_0042edc0()
{
    g_qeglobals.d_numpoints = 0;
    g_qeglobals.d_num_move_points = 0;
    g_qeglobals.field_3c074 = 0;
    g_qeglobals.field_6c078 = 0;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch)
        {
#line 3668
            assert( b->patch->def == b->def->patch );
            patchMesh_t *p = b->patch->def;
            for (int w = 0; w < p->width; w++)
            {
                for (int h = 0; h < p->height; h++)
                {
                    VectorCopy(p->ctrl[w][h].xyz, g_qeglobals.d_points[g_qeglobals.d_numpoints]);
                    if (g_qeglobals.d_numpoints < 0x7ff)
                        g_qeglobals.d_numpoints++;
                }
            }
        }
        else if (g_qeglobals.field_3c074 < 0x4000)
        {
            if (b->owner->field_38)
                FUN_0042efb0(b);
            else if (FUN_0045b420(b))
            {
                if (!memcmp(b->owner->def->eclass->name, "misc_model", 11) && PREFS_INT(0x274))
                    FUN_0042f2c0(b);
                else if (!b->owner->def->eclass->fixedsize && PREFS_INT(0x274))
                    FUN_0042f4f0(b);
            }
            else if (!b->owner->def->eclass->fixedsize && PREFS_INT(0x274))
                FUN_0042f4f0(b);
        }
    }
    int mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 4;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
}

// Retail 0x0042efb0: add the points of every member of an entity group to the move-point list, rotated by its angles.
int FUN_0042efb0(brush_t *b)
{
    int added = 0;
    brush_t *head = &b->owner->field_38->head;
    for (brush_t *c = head->next; c != head; c = c->next)
    {
        if (g_qeglobals.field_3c074 >= 0x4000)
            continue;
        if (c->owner->field_38 && PREFS_INT(0x278))
            added += FUN_0042efb0(c);
        else if (c->patch)
            added += FUN_0042f1b0(c);
        else if (FUN_0045b420(c))
        {
            if (!memcmp(c->owner->def->eclass->name, "misc_model", 11) && PREFS_INT(0x270))
                added += FUN_0042f2c0(c);
            else if (!c->owner->def->eclass->fixedsize && PREFS_INT(0x274))
                added += FUN_0042f4f0(c);
        }
        else if (!c->owner->def->eclass->fixedsize && PREFS_INT(0x274))
            added += FUN_0042f4f0(c);
    }
    entity_t *e = b->owner->def;
    vec3_t angles;
    if (FUN_00465d80(e, "angles"))
        sscanf(ValueForKey(e->epairs, "angles"), "%f %f %f", &angles[0], &angles[1], &angles[2]);
    else
        angles[0] = angles[1] = angles[2] = 0;
    vec3_t mat[3], right;
    AngleVectors(angles, mat[0], right, mat[2]);
    mat[1][0] = 0.0f - right[0];
    mat[1][1] = 0.0f - right[1];
    mat[1][2] = 0.0f - right[2];
    for (int i = g_qeglobals.field_3c074 - added; i < g_qeglobals.field_3c074; i++)
    {
        vec3_t out;
        MatrixTransformVectorCols(g_qeglobals.field_c074[i], mat, out);
        out[0] += e->origin[0];
        out[1] += e->origin[1];
        out[2] += e->origin[2];
        VectorCopy(out, g_qeglobals.field_c074[i]);
    }
    return added;
}

// Retail 0x0042f1b0: add the control points of a patch brush to the unique move-point list.
int FUN_0042f1b0(brush_t *b)
{
#line 3739
    assert( b->patch->def == b->def->patch );
    patchMesh_t *p = b->patch->def;
    int added = 0;
    for (int w = 0; w < p->width; w++)
    {
        for (int h = 0; h < p->height; h++)
        {
            if (FUN_00429e90(p->ctrl[w][h].xyz) < 0 && g_qeglobals.field_3c074 < 0x4000)
            {
                VectorCopy(p->ctrl[w][h].xyz, g_qeglobals.field_c074[g_qeglobals.field_3c074]);
                g_qeglobals.field_3c074++;
                added++;
            }
        }
    }
    return added;
}

// Retail 0x0042f2c0: add the vertices of a model entity to the move-point list, rotated by its angles.
int FUN_0042f2c0(brush_t *b)
{
    float verts[0x4000][3];
    unsigned short indices[0x8000];
    entity_t *e = b->owner->def;
    int count = FUN_0059c4a0(*(void **)(*(char **)(*(char **)((char *)e + 0x54) + 0x154) + 4), verts, 0x4000, indices, 0x10000);
    if (!count)
        return 0;
    vec3_t angles;
    if (FUN_00465d80(e, "angles"))
        sscanf(ValueForKey(e->epairs, "angles"), "%f %f %f", &angles[0], &angles[1], &angles[2]);
    else
        angles[0] = angles[1] = angles[2] = 0;
    vec3_t mat[3], right;
    AngleVectors(angles, mat[0], right, mat[2]);
    mat[1][0] = 0.0f - right[0];
    mat[1][1] = 0.0f - right[1];
    mat[1][2] = 0.0f - right[2];
    int added = 0;
    for (int i = 0; i < count; i++)
    {
        vec3_t out;
        MatrixTransformVectorCols(verts[indices[i]], mat, out);
        out[0] += e->origin[0];
        out[1] += e->origin[1];
        out[2] += e->origin[2];
        if (FUN_00429e90(out) < 0 && g_qeglobals.field_3c074 < 0x4000)
        {
            VectorCopy(out, g_qeglobals.field_c074[g_qeglobals.field_3c074]);
            g_qeglobals.field_3c074++;
            added++;
        }
    }
    return added;
}

// Retail 0x0042f4f0: add the winding points of every face of a brush to the unique move-point list.
int FUN_0042f4f0(brush_t *b)
{
    int added = 0;
    for (int f = 0; f < b->faceCount; f++)
    {
        const brushface_proj *face = &(*(brushface_proj **)((char *)b->def + 0x3c))[f];
        for (int i = 0; i < face->winding->numpoints; i++)
        {
            const float *pt = face->winding->points[i];
            if (FUN_00429e90(pt) < 0 && g_qeglobals.field_3c074 < 0x4000)
            {
                VectorCopy(pt, g_qeglobals.field_c074[g_qeglobals.field_3c074]);
                g_qeglobals.field_3c074++;
                added++;
            }
        }
    }
    return added;
}

void FUN_0042f5d0()
{
    int mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 0;
    if (mode == 0xb)
        FUN_0041b190(dword_01233488);
    else if (mode == 0xa)
        FUN_0042beb0();
    DAT_011298b4 = 0;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch)
            b->patch->field_06 = 0;
    }
    if (DAT_012334ba)
        FUN_00433ad0();
    if (DAT_012334b9)
        FUN_00434040();
}

void FUN_0042f640(patch_t *p)
{
    p->field_06 = 1;
}

void FUN_0042f650(patch_t *p)
{
    p->field_06 = 0;
}

struct CPatchBendXYProjection
{
    unsigned char pad[0xf4];
    int m_nViewType;
};

struct CPatchBendMainProjection
{
    unsigned char pad[0x7e0];
    CPatchBendXYProjection *m_pActiveXY;
};


void FUN_0042e290(const float *center)
{
    vec3_t outer[16];
    vec3_t inner[16];
    float radius1 = FUN_00401b80();
    float radius2 = FUN_00401bd0();
    for (int i = 0; i < sizeof(inner) / sizeof(inner[0]); i++)
    {
        float angle = (float)i * 0.3926991f;
        float s = (float)sin(angle);
        float c = (float)cos(angle);
        inner[i][0] = c * radius1 + center[0];
        inner[i][1] = s * radius1 + center[1];
        outer[i][2] = inner[i][2] = center[2] + 1.0f;
        outer[i][0] = c * radius2 + center[0];
        outer[i][1] = s * radius2 + center[1];
    }
    unsigned int color;
    (*FUN_0059c468)(colorCyan, &color);
    GfxPointVertex verts[1362];
    int count = 0;
    brush_t *b;
    if (SendMessageA(g_hwndCheck_01234004, 0xf0, 0, 0))
    {
        for (b = DAT_010a44dc.next; b && b != &DAT_010a44dc; b = b->next)
        {
            if (b->patch)
                count = FUN_0042c3f0(b->patch->def, center, radius1, radius2, inner, 16, outer, 16, &color, count, 1362, verts);
        }
    }
    for (b = DAT_010a44b4.next; b && b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch)
            count = FUN_0042c3f0(b->patch->def, center, radius1, radius2, inner, 16, outer, 16, &color, count, 1362, verts);
    }
    if (count)
        (*FUN_0059c460)(count / 2, 1, verts);
    count = 0;
    for (b = DAT_010a44b4.next; b && b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch)
            count = FUN_0042c790(b->patch->def, center, radius1, radius2, count, 1362, verts);
    }
    if (count)
        (*FUN_0059c45c)(count, 6, verts);
}

class CMainFrame;
extern CMainFrame *g_pParentWnd;
extern brush_t selected_brushes;
extern CPtrArray g_ptrSelectedFaces;
void UpdatePatchInspector();

void FUN_0042ea50(patchMesh_t *p, const vec3_t v)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
            VectorAdd(p->ctrl[i][j].xyz, v, p->ctrl[i][j].xyz);
    }
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    UpdatePatchInspector();
}


extern vec3_t g_vRotateOrigin;
static vec3_t g_vBendOrigin;

extern int dword_5909F8;
extern bool byte_12334B8;

// Retail 0x0042f840: scale the (unselected-skipped) controls of a patch about a centre, per axis.
void FUN_0042f840(patchMesh_t *p, const float *center, const float *scale, bool bRebuild)
{
    for (int w = 0; w < p->width; w++)
    {
        for (int h = 0; h < p->height; h++)
        {
            if (g_qeglobals.d_select_mode == 4 && (g_qeglobals.d_num_move_points <= 0 || FUN_00429df0(0, (int)&p->ctrl[w][h]) == -1))
                continue;
            for (int k = 0; k < 3; k++)
                p->ctrl[w][h].xyz[k] = (p->ctrl[w][h].xyz[k] - center[k]) * scale[k] + center[k];
        }
    }
    if (bRebuild)
        FUN_004269d0(p, true);
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

void FUN_0042f950(int value)
{
    byte_12334B8 = (value == dword_5909F8);
    dword_5909F8 = value;
}

char *va(const char *format, ...);

// the brush def a patch hangs off; retail asserts call it p->symbiot
struct symbiot_t
{
    unsigned char pad00[0x1c];
    int refCount;
    unsigned char pad20[0x44 - 0x20];
    patchMesh_t *patch;
};

// asserts whose retail text is the field name, not the C++ spelling used here
#define assertText(cond, text) \
    do { \
        static bool s_assertDisable; \
        if ( !(cond) && !s_assertDisable ) \
        { \
            switch ( FUN_0047d980( text, __FILE__, __LINE__, 0, 1 ) ) \
            { \
            case 0: DebugBreak(); break; \
            case 2: s_assertDisable = true; break; \
            } \
        } \
    } while ( 0 )

#define assertMsgText(cond, text, fmt, a1) \
    do { \
        static bool s_assertDisable; \
        if ( !(cond) && !s_assertDisable ) \
        { \
            switch ( FUN_0047d980( va( "%s\n\t" fmt, text, a1 ), __FILE__, __LINE__, 0, 1 ) ) \
            { \
            case 0: DebugBreak(); break; \
            case 2: s_assertDisable = true; break; \
            } \
        } \
    } while ( 0 )

// 0x0042f660 (290 B), patch in esi
void FUN_0042f660(patchMesh_t *p)
{
#define SYMBIOT ((symbiot_t *)p->cache_3828)
#line 3857
    assertText(SYMBIOT, "p->symbiot");
    assertText(SYMBIOT->patch == p, "p->symbiot->patch == p");
    assertMsgText(SYMBIOT->refCount == 0, "(p->symbiot->refCount == 0)", "(p->symbiot->refCount) = %i", SYMBIOT->refCount);
    SYMBIOT->patch = NULL;
    if (p->cache_3824)
        free(p->cache_3824);
    delete p;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
#undef SYMBIOT
}

// 0x0042f790 (169 B), patch in eax
void FUN_0042f790(patch_t *p)
{
#line 3872
    assert( p );
    assert( p->def );
    FUN_0042ca80(p);
    delete p;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x0042f970: set one texture layer on a patch and refresh its coordinates.
void FUN_0042f970(patchMesh_t *p, const texdef_t *td, bool bApply, bool bKeepLayout)
{
    ((void **)&p->image_18)[DAT_01128d90] = td->mat;
    p->version++;
    if (bKeepLayout && DAT_01128dc8)
    {
        if (p->width == DAT_01128dcc && p->height == DAT_01128dd0)
        {
            for (int x = 0; x < p->width; x++)
            {
                for (int y = 0; y < p->height; y++)
                {
                    p->ctrl[x][y].st[DAT_01128d94][0] = DAT_01128dd4[x][y][0];
                    p->ctrl[x][y].st[DAT_01128d94][1] = DAT_01128dd4[x][y][1];
                }
            }
            if (DAT_01128d94 == 1)
                p->flag_382f = 0;
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
        }
    }
    else if (bApply)
    {
        plane_t pl;
        if (FUN_00425f40(p, &pl))
            FUN_00426dc0(p, pl.normal, td);
    }
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x0042fb50: scale a patch by a drag delta, then shift it so the opposite corner stays put.
bool FUN_0042fb50(const float *delta, patchMesh_t *p, const float *anchor)
{
    vec3_t mins, maxs;
    float oldExt[3], newExt[3], center[3], scale[3], shift[3];
    Patch_CalcBounds(p, mins, maxs, false);
    oldExt[0] = maxs[0] - mins[0];
    oldExt[1] = maxs[1] - mins[1];
    oldExt[2] = maxs[2] - mins[2];
    for (int i = 0; i < 3; i++)
    {
        if (oldExt[i] == 0.0f && anchor[i] != 0.0f)
            return false;
    }
    center[0] = oldExt[0] / 2.0f + mins[0];
    center[1] = oldExt[1] / 2.0f + mins[1];
    center[2] = oldExt[2] / 2.0f + mins[2];
    for (int i = 0; i < 3; i++)
        scale[i] = delta[i] == 0.0f ? 1.0f : (float)(delta[i] / oldExt[i] + 1.0);
    FUN_0042f840(p, center, scale, false);
    Patch_CalcBounds(p, mins, maxs, false);
    newExt[0] = maxs[0] - mins[0];
    newExt[1] = maxs[1] - mins[1];
    newExt[2] = maxs[2] - mins[2];
    shift[0] = (newExt[0] - oldExt[0]) * 0.5f;
    shift[1] = (newExt[1] - oldExt[1]) * 0.5f;
    shift[2] = (newExt[2] - oldExt[2]) * 0.5f;
    for (int i = 0; i < 3; i++)
    {
        float d = anchor[i] - delta[i];
        if (d * d > 1.0000001e-06f)
        {
            if (delta[0] != anchor[0])
                shift[0] = -shift[0];
            if (delta[1] != anchor[1])
                shift[1] = -shift[1];
            if (delta[2] != anchor[2])
                shift[2] = -shift[2];
            break;
        }
    }
    FUN_0042ea50(p, shift);
    return true;
}

// 0x0042fda0 (609 B): add one extrapolated control column at the nearer end
void FUN_0042fda0(patchMesh_t *p, int index)
{
    int w = p->width;
    if (w + 1 >= 16)
        return;
    float half = (float)w * 0.5f;
    if (!((float)index > half) && index != w - 1)
    {
        for (int i = w; i > 0; i--)
        {
            for (int j = 0; j < p->height; j++)
            {
                p->ctrl[i][j] = p->ctrl[i - 1][j];
                for (int k = 0; k < 3; k++)
                    p->ctrl[i][j].xyz[k] = p->ctrl[i - 1][j].xyz[k];
            }
        }
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[0][j] = p->ctrl[1][j];
            for (int k = 0; k < 3; k++)
                p->ctrl[0][j].xyz[k] = p->ctrl[1][j].xyz[k] - p->ctrl[2][j].xyz[k] + p->ctrl[1][j].xyz[k];
            for (int k = 0; k < 3; k++)
                g_qeglobals.d_points[g_qeglobals.d_numpoints][k] = p->ctrl[0][j].xyz[k];
            if (g_qeglobals.d_numpoints < 0x7ff)
                g_qeglobals.d_numpoints++;
        }
        p->width++;
    }
    else
    {
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[w][j] = p->ctrl[w - 1][j];
            for (int k = 0; k < 3; k++)
                p->ctrl[w][j].xyz[k] = p->ctrl[w - 1][j].xyz[k] - p->ctrl[w - 2][j].xyz[k] + p->ctrl[w - 1][j].xyz[k];
            for (int k = 0; k < 3; k++)
                g_qeglobals.d_points[g_qeglobals.d_numpoints][k] = p->ctrl[w][j].xyz[k];
            if (g_qeglobals.d_numpoints < 0x7ff)
                g_qeglobals.d_numpoints++;
        }
        p->width++;
    }
}

// 0x00430010 (526 B): add one extrapolated control row at the nearer end
void FUN_00430010(patchMesh_t *p, int index)
{
    int w = p->height;
    if (w + 1 >= 16)
        return;
    float half = (float)w * 0.5f;
    if (!((float)index > half) && index != w - 1)
    {
        for (int i = w; i > 0; i--)
        {
            for (int j = 0; j < p->width; j++)
            {
                p->ctrl[j][i] = p->ctrl[j][i - 1];
                for (int k = 0; k < 3; k++)
                    p->ctrl[j][i].xyz[k] = p->ctrl[j][i - 1].xyz[k];
            }
        }
        for (int j = 0; j < p->width; j++)
        {
            p->ctrl[j][0] = p->ctrl[j][1];
            for (int k = 0; k < 3; k++)
                p->ctrl[j][0].xyz[k] = p->ctrl[j][1].xyz[k] - p->ctrl[j][2].xyz[k] + p->ctrl[j][1].xyz[k];
            for (int k = 0; k < 3; k++)
                g_qeglobals.d_points[g_qeglobals.d_numpoints][k] = p->ctrl[j][0].xyz[k];
            if (g_qeglobals.d_numpoints < 0x7ff)
                g_qeglobals.d_numpoints++;
        }
        p->height++;
    }
    else
    {
        for (int j = 0; j < p->width; j++)
        {
            p->ctrl[j][w] = p->ctrl[j][w - 1];
            for (int k = 0; k < 3; k++)
                p->ctrl[j][w].xyz[k] = p->ctrl[j][w - 1].xyz[k] - p->ctrl[j][w - 2].xyz[k] + p->ctrl[j][w - 1].xyz[k];
            for (int k = 0; k < 3; k++)
                g_qeglobals.d_points[g_qeglobals.d_numpoints][k] = p->ctrl[j][w].xyz[k];
            if (g_qeglobals.d_numpoints < 0x7ff)
                g_qeglobals.d_numpoints++;
        }
        p->height++;
    }
}

// Retail 0x00430220: insert a control column at index, halfway between its neighbours.
void FUN_00430220(patchMesh_t *p, int index)
{
    if (p->width + 1 >= 16)
        return;
    for (int h = 0; h < p->height; h++)
    {
        for (int w = p->width - 1; w >= index; w--)
            p->ctrl[w + 1][h] = p->ctrl[w][h];
        PatchControl *c = &p->ctrl[index][h];
        const PatchControl *prev = &p->ctrl[index - 1][h];
        for (int k = 0; k < 3; k++)
            c->xyz[k] = (prev->xyz[k] + c->xyz[k]) * 0.5f;
        float *s = &c->st[0][0];
        const float *ps = &prev->st[0][0];
        for (int k = 0; k < 4; k++)
            s[k] = (ps[k] + s[k]) * 0.5f;
        g_qeglobals.d_points[g_qeglobals.d_numpoints][0] = c->xyz[0];
        g_qeglobals.d_points[g_qeglobals.d_numpoints][1] = c->xyz[1];
        g_qeglobals.d_points[g_qeglobals.d_numpoints][2] = c->xyz[2];
        if (g_qeglobals.d_numpoints < 0x7ff)
            g_qeglobals.d_numpoints++;
    }
    p->width++;
}

// Retail 0x00430370: insert two control columns at the start (bAdd false) or end (bAdd true) of a patch.
void FUN_00430370(patchMesh_t *p, bool bAdd)
{
    if (!(p->type_10 & 0x40))
    {
        if (p->width + 2 >= 16)
            return;
        if (!bAdd)
        {
            for (int h = 0; h < p->height; h++)
            {
                for (int w = p->width - 1; w >= 0; w--)
                    p->ctrl[w + 2][h] = p->ctrl[w][h];
                vec3_t d;
                VectorSubtract(p->ctrl[1][h].xyz, p->ctrl[0][h].xyz, d);
                for (int k = 0; k < 3; k++)
                    d[k] *= 0.33333334f;
                VectorCopy(p->ctrl[0][h].xyz, p->ctrl[1][h].xyz);
                VectorAdd(p->ctrl[1][h].xyz, d, p->ctrl[1][h].xyz);
                VectorCopy(p->ctrl[1][h].xyz, p->ctrl[2][h].xyz);
                VectorAdd(p->ctrl[2][h].xyz, d, p->ctrl[2][h].xyz);
            }
        }
        else
        {
            int w = p->width - 1;
            for (int h = 0; h < p->height; h++)
            {
                vec3_t d;
                VectorSubtract(p->ctrl[w][h].xyz, p->ctrl[w - 1][h].xyz, d);
                for (int k = 0; k < 3; k++)
                    d[k] *= 0.33333334f;
                p->ctrl[w + 2][h] = p->ctrl[w][h];
                p->ctrl[w][h] = p->ctrl[w - 1][h];
                VectorAdd(p->ctrl[w][h].xyz, d, p->ctrl[w][h].xyz);
                p->ctrl[w + 1][h] = p->ctrl[w][h];
                VectorAdd(p->ctrl[w + 1][h].xyz, d, p->ctrl[w + 1][h].xyz);
            }
        }
        p->width += 2;
    }
    else if (!bAdd)
        FUN_00430220(p, 1);
    else
        FUN_00430220(p, p->width - 1);
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x00430610: insert a control row at index, halfway between its neighbours.
void FUN_00430610(patchMesh_t *p, int index)
{
    if (p->height + 1 >= 16)
        return;
    for (int w = 0; w < p->width; w++)
    {
        for (int h = p->height - 1; h >= index; h--)
            p->ctrl[w][h + 1] = p->ctrl[w][h];
        PatchControl *c = &p->ctrl[w][index];
        const PatchControl *prev = &p->ctrl[w][index - 1];
        for (int k = 0; k < 3; k++)
            c->xyz[k] = (prev->xyz[k] + c->xyz[k]) * 0.5f;
        float *s = &c->st[0][0];
        const float *ps = &prev->st[0][0];
        for (int k = 0; k < 4; k++)
            s[k] = (ps[k] + s[k]) * 0.5f;
        g_qeglobals.d_points[g_qeglobals.d_numpoints][0] = c->xyz[0];
        g_qeglobals.d_points[g_qeglobals.d_numpoints][1] = c->xyz[1];
        g_qeglobals.d_points[g_qeglobals.d_numpoints][2] = c->xyz[2];
        if (g_qeglobals.d_numpoints < 0x7ff)
            g_qeglobals.d_numpoints++;
    }
    p->height++;
}

// Retail 0x00430760: insert two control rows at the start (bAdd false) or end (bAdd true) of a patch.
void FUN_00430760(patchMesh_t *p, bool bAdd)
{
    if (!(p->type_10 & 0x40))
    {
        if (p->height + 2 >= 16)
            return;
        if (!bAdd)
        {
            for (int w = 0; w < p->width; w++)
            {
                for (int h = p->height - 1; h >= 0; h--)
                    p->ctrl[w][h + 2] = p->ctrl[w][h];
                vec3_t d;
                VectorSubtract(p->ctrl[w][1].xyz, p->ctrl[w][0].xyz, d);
                for (int k = 0; k < 3; k++)
                    d[k] *= 0.33333334f;
                VectorCopy(p->ctrl[w][0].xyz, p->ctrl[w][1].xyz);
                VectorAdd(p->ctrl[w][1].xyz, d, p->ctrl[w][1].xyz);
                VectorCopy(p->ctrl[w][1].xyz, p->ctrl[w][2].xyz);
                VectorAdd(p->ctrl[w][2].xyz, d, p->ctrl[w][2].xyz);
            }
        }
        else
        {
            int h = p->height - 1;
            for (int w = 0; w < p->width; w++)
            {
                vec3_t d;
                VectorSubtract(p->ctrl[w][h].xyz, p->ctrl[w][h - 1].xyz, d);
                for (int k = 0; k < 3; k++)
                    d[k] *= 0.33333334f;
                p->ctrl[w][h + 2] = p->ctrl[w][h];
                p->ctrl[w][h] = p->ctrl[w][h - 1];
                VectorAdd(p->ctrl[w][h].xyz, d, p->ctrl[w][h].xyz);
                p->ctrl[w][h + 1] = p->ctrl[w][h];
                VectorAdd(p->ctrl[w][h + 1].xyz, d, p->ctrl[w][h + 1].xyz);
            }
        }
        p->height += 2;
    }
    else if (!bAdd)
        FUN_00430610(p, 1);
    else
        FUN_00430610(p, p->height - 1);
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x004309e0: remove the control row at index from a terrain patch.
void FUN_004309e0(patchMesh_t *p, int index)
{
    if (p->height > 2)
    {
        p->height--;
        if (index != p->height)
        {
            for (int w = 0; w < p->width; w++)
                for (int h = index; h < p->height; h++)
                    p->ctrl[w][h] = p->ctrl[w][h + 1];
        }
    }
}

// Retail 0x00430a60: remove two control rows from the start (bFirst) or end of a patch.
void FUN_00430a60(patchMesh_t *p, bool bFirst)
{
    if (!(p->type_10 & 0x40))
    {
        if (p->height < 4)
            return;
        p->height -= 2;
        if (bFirst)
        {
            for (int w = 0; w < p->width; w++)
                for (int h = 0; h < p->height; h++)
                    p->ctrl[w][h] = p->ctrl[w][h + 2];
        }
    }
    else if (!bFirst)
        FUN_004309e0(p, p->height - 1);
    else
        FUN_004309e0(p, 0);
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x00430b10: remove the control column at index from a terrain patch.
void FUN_00430b10(patchMesh_t *p, int index)
{
    if (p->width > 2)
    {
        p->width--;
        if (index != p->width && index < p->width)
        {
            for (int w = index; w < p->width; w++)
                for (int h = 0; h < p->height; h++)
                    p->ctrl[w][h] = p->ctrl[w + 1][h];
        }
    }
}

// Retail 0x00430b90: remove two control columns from the start (bFirst) or end of a patch.
void FUN_00430b90(patchMesh_t *p, bool bFirst)
{
    if (!(p->type_10 & 0x40))
    {
        if (p->width < 4)
            return;
        p->width -= 2;
        if (bFirst)
        {
            for (int h = 0; h < p->height; h++)
                for (int w = 0; w < p->width; w++)
                    p->ctrl[w][h] = p->ctrl[w + 2][h];
        }
    }
    else if (!bFirst)
        FUN_00430b10(p, p->width - 1);
    else
        FUN_00430b10(p, 0);
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x00430c40: add nCols columns to a patch, spreading the controls evenly over the old extent.
void FUN_00430c40(patchMesh_t *p, int nCols)
{
    if (p->type_10 & 0x40)
    {
        Sys_Printf("********* Patch_AdjustColumns not  implemented for terrain brushes, since it looked like dead code\n");
        return;
    }
    if (nCols & 1 || p->width + nCols < 3 || p->width + nCols > 16)
        return;
    p->width += nCols;
    for (int h = 0; h < p->height; h++)
    {
        vec3_t d;
        VectorSubtract(p->ctrl[p->width - 1 - nCols][h].xyz, p->ctrl[0][h].xyz, d);
        float d0 = d[0];
        float inv = 1.0f / (float)(p->width - 1);
        vec3_t step;
        step[0] = inv * d0;
        step[1] = inv * d[1];
        step[2] = inv * d[2];
        for (int w = 0; w < p->width - 1; w++)
            VectorAdd(p->ctrl[w][h].xyz, step, p->ctrl[w + 1][h].xyz);
    }
    for (int w = 0; w < p->width; w++)
    {
        for (int h = 0; h < p->height; h++)
        {
            p->ctrl[w][h].st[DAT_01128d94][0] = (float)w / ((float)(p->width - 1) * dword_1128DC4);
            p->ctrl[w][h].st[DAT_01128d94][1] = (float)h / ((float)(p->height - 1) * dword_1128DC4);
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x00430e20: add nRows rows to a patch, spreading the controls evenly over the old extent.
void FUN_00430e20(patchMesh_t *p, int nRows)
{
    if (p->type_10 & 0x40)
    {
        Sys_Printf("********* Patch_AdjustRows not implemented for terrain brushes, since it looked like dead code\n");
        return;
    }
    if (nRows & 1 || p->height + nRows < 3 || p->height + nRows > 16)
        return;
    p->height += nRows;
    int w;
    for (w = 0; w < p->width; w++)
    {
        vec3_t d;
        VectorSubtract(p->ctrl[w][p->height - 1 - nRows].xyz, p->ctrl[w][0].xyz, d);
        float d0 = d[0];
        float inv = 1.0f / (float)(p->height - 1);
        vec3_t step;
        step[0] = inv * d0;
        step[1] = inv * d[1];
        step[2] = inv * d[2];
        for (int h = 0; h < p->height - 1; h++)
            VectorAdd(p->ctrl[w][h].xyz, step, p->ctrl[w][h + 1].xyz);
    }
    for (w = 0; w < p->width; w++)
    {
        for (int h = 0; h < p->height; h++)
        {
            p->ctrl[w][h].st[DAT_01128d94][0] = (float)w / ((float)(p->width - 1) * dword_1128DC4);
            p->ctrl[w][h].st[DAT_01128d94][1] = (float)h / ((float)(p->height - 1) * dword_1128DC4);
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x00430ff0: spread the controls of every selected patch evenly along its rows.
void FUN_00430ff0()
{
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 4537
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        FUN_004269d0(p, true);
        for (int w = 0; w < p->width; w++)
        {
            vec3_t d;
            VectorSubtract(p->ctrl[w][p->height - 1].xyz, p->ctrl[w][0].xyz, d);
            float d0 = d[0];
            float inv = 1.0f / (float)(p->height - 1);
            vec3_t step;
            step[0] = inv * d0;
            step[1] = inv * d[1];
            step[2] = inv * d[2];
            for (int h = 0; h < p->height - 1; h++)
                VectorAdd(p->ctrl[w][h].xyz, step, p->ctrl[w][h + 1].xyz);
            FUN_00427160(p, DAT_01128d94);
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
        }
    }
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x004311a0: spread the controls of every selected patch evenly along its columns.
void FUN_004311a0()
{
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 4572
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        FUN_004269d0(p, true);
        for (int h = 0; h < p->height; h++)
        {
            vec3_t d;
            VectorSubtract(p->ctrl[p->width - 1][h].xyz, p->ctrl[0][h].xyz, d);
            float d0 = d[0];
            float inv = 1.0f / (float)(p->width - 1);
            vec3_t step;
            step[0] = inv * d0;
            step[1] = inv * d[1];
            step[2] = inv * d[2];
            for (int w = 0; w < p->width - 1; w++)
                VectorAdd(p->ctrl[w][h].xyz, step, p->ctrl[w + 1][h].xyz);
        }
        FUN_00427160(p, DAT_01128d94);
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
    }
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x00431360: insert or remove rows or columns at the start or end of every selected patch.
void FUN_00431360(bool bInsert, bool bColumn, bool bFirst)
{
    bool bUpdate = false;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 4605
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if (!bInsert)
        {
            if (!bColumn)
                FUN_00430a60(p, bFirst);
            else
                FUN_00430b90(p, bFirst);
        }
        else if (!bColumn)
            FUN_00430760(p, false);
        else
            FUN_00430370(p, false);
#line 4622
        assert( p == b->patch->def );
        FUN_004269d0(p, true);
        bUpdate = true;
    }
    if (bUpdate)
        DAT_0123348c = -1;
}

// Retail 0x00431490: grow every selected patch by whole rows and columns.
void FUN_00431490(int nCols, int nRows)
{
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 4641
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if (p->type_10 & 0x40)
            Sys_Printf("********* Patch_AdjustSelectedRowCols not implemented for terrain brushes, since it looked like dead code\n");
        else
        {
            FUN_00430370(p, false);
            if (nRows != 0)
                FUN_00430e20(p, nRows);
            if (nCols != 0)
                FUN_00430c40(p, nCols);
        }
    }
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Retail 0x00431570: parse one patch vertex "v x y z [c r g b a] t s t ... [f flags]".
bool FUN_00431570(const char **data_p, PatchControl *v, int nTexPairs)
{
#line 4664
    assert( v );
    const char *t0 = Com_Parse(data_p);
    if (strcmp(t0, "v"))
        return false;
    v->xyz[0] = (float)atof(Com_ParseOnLine(data_p));
    v->xyz[1] = (float)atof(Com_ParseOnLine(data_p));
    v->xyz[2] = (float)atof(Com_ParseOnLine(data_p));
    const char *tok = Com_Parse(data_p);
    if (!strcmp(tok, "c"))
    {
        v->color_28[2] = atol(Com_ParseOnLine(data_p));
        v->color_28[1] = atol(Com_ParseOnLine(data_p));
        v->color_28[0] = atol(Com_ParseOnLine(data_p));
        v->color_28[3] = atol(Com_ParseOnLine(data_p));
        tok = Com_Parse(data_p);
    }
    else
    {
        v->color_28[2] = 0xff;
        v->color_28[1] = 0xff;
        v->color_28[0] = 0xff;
        v->color_28[3] = 0xff;
    }
    if (strcmp(tok, "t"))
        return false;
    for (int i = 0; i < nTexPairs; i++)
    {
        v->st[i][0] = (float)atof(Com_ParseOnLine(data_p)) * 0.0009765625f;
        v->st[i][1] = (float)atof(Com_ParseOnLine(data_p)) * 0.0009765625f;
    }
    const char *t1 = Com_Parse(data_p);
    if (!strcmp(t1, "f"))
    {
        v->flags_34 = atol(Com_ParseOnLine(data_p));
        return true;
    }
    v->flags_34 = 0;
    Com_UngetToken();
    return true;
}

// Retail 0x00431890: parse a patch brush ("{ material ... }") from the map text.
brushdef_t *FUN_00431890(const char **data_p, int version, bool bTerrain)
{
    if (Com_Parse(data_p)[0] != '{')
        return NULL;
    patchMesh_t *p = MakeNewPatch();
    if (version >= 4)
    {
        p->field_08 = FUN_004209a0(data_p, "contents", DAT_0053d944);
        p->field_0c = FUN_004209a0(data_p, "toolFlags", DAT_0053d964);
    }
    DAT_00592788[DAT_00596d48 * 0x45c + 0x405] = 1;
    p->image_18 = FUN_00440c10(Com_Parse(data_p), version);
    if (version < 4)
    {
        Com_MatchToken(data_p, "(", 0);
        p->width = atol(Com_ParseOnLine(data_p));
    }
    else
    {
        p->lightmap_1c = FUN_00440c10(Com_Parse(data_p), version);
        DAT_00592788[DAT_00596d48 * 0x45c + 0x405] = 0;
        p->width = Com_ParseInt(data_p);
    }
    p->height = atol(Com_ParseOnLine(data_p));
    if (version <= 3)
    {
        p->field_08 = atol(Com_ParseOnLine(data_p));
        if (version == 3)
            p->field_0c = atol(Com_ParseOnLine(data_p));
    }
    if (version != 3)
    {
        if (version <= 1)
            Com_ParseOnLine(data_p);
    }
    if (version == 0)
        Com_ParseOnLine(data_p);
    if (bTerrain)
        p->type_10 = 0x40;
    const char *tok = Com_ParseOnLine(data_p);
    if (version > 3)
    {
        float v = (float)atof(tok);
        p->value_3834 = v;
        p->flag_382f = v != 0.0f;
    }
    else
    {
        p->value_3834 = (float)atol(tok);
        if (!(p->value_3834 > 0.0f))
            p->value_3834 = 16.0f;
        p->flag_382f = 1;
    }
    p->style_14 = atol(Com_ParseOnLine(data_p));
    if (p->style_14 < 1)
        p->style_14 = 1;
    if (version >= 4)
    {
        for (int x = 0; x < p->width; x++)
        {
            Com_MatchToken(data_p, "(", 0);
            for (int y = 0; y < p->height; y++)
                FUN_00431570(data_p, &p->ctrl[x][y], 2);
            Com_MatchToken(data_p, ")", 0);
        }
    }
    else
    {
        Com_MatchToken(data_p, ")", 0);
        Com_MatchToken(data_p, "(", 0);
        for (int x = 0; x < p->width; x++)
        {
            Com_MatchToken(data_p, "(", 0);
            for (int y = 0; y < p->height; y++)
            {
                Com_MatchToken(data_p, "(", 0);
                p->ctrl[x][y].xyz[0] = (float)atof(Com_ParseOnLine(data_p));
                p->ctrl[x][y].xyz[1] = (float)atof(Com_ParseOnLine(data_p));
                p->ctrl[x][y].xyz[2] = (float)atof(Com_ParseOnLine(data_p));
                p->ctrl[x][y].st[0][0] = (float)atof(Com_ParseOnLine(data_p));
                p->ctrl[x][y].st[0][1] = (float)atof(Com_ParseOnLine(data_p));
                p->ctrl[x][y].st[1][0] = 0.0f;
                p->ctrl[x][y].st[1][1] = 0.0f;
                p->ctrl[x][y].color_28[0] = atol(Com_ParseOnLine(data_p));
                p->ctrl[x][y].color_28[1] = atol(Com_ParseOnLine(data_p));
                p->ctrl[x][y].color_28[2] = atol(Com_ParseOnLine(data_p));
                p->ctrl[x][y].color_28[3] = atol(Com_ParseOnLine(data_p));
                p->ctrl[x][y].flags_34 = atol(Com_ParseOnLine(data_p));
                Com_MatchToken(data_p, ")", 0);
            }
            Com_MatchToken(data_p, ")", 0);
        }
        Com_MatchToken(data_p, ")", 0);
        p->lightmap_1c = FUN_00440840("lightmap_gray");
        float scale = p->value_3834;
        if (p->type_10 & 0x40)
            FUN_00426e80(p, 1, scale);
        else
            FUN_00426f20(p, 1, scale);
        p->flag_382f = 1;
        p->value_3834 = scale;
    }
    Com_MatchToken(data_p, "}", 0);
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    return AddBrushForPatch(p, NULL);
}

// Retail 0x00432430: rotate the texture coordinates of a patch (selected points only in vertex mode).
void FUN_00432430(patchMesh_t *p, float fAngle)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (g_qeglobals.d_select_mode == 4 && (g_qeglobals.d_num_move_points <= 0 || FUN_00429df0(0, (int)&p->ctrl[i][j]) == -1))
                continue;
            float x = p->ctrl[i][j].st[DAT_01128d94][0];
            float y = p->ctrl[i][j].st[DAT_01128d94][1];
            float a = fAngle * 3.1415927f / 180.0f;
            p->ctrl[i][j].st[DAT_01128d94][0] = (float)cos(a) * x - (float)sin(a) * y;
            p->ctrl[i][j].st[DAT_01128d94][1] = (float)cos(a) * y + (float)sin(a) * x;
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

// Retail 0x00432800: shift the texture coordinates of a patch (selected points only in vertex mode).
void FUN_00432800(patchMesh_t *p, float fx, float fy)
{
    if (fabs(fx) >= 1.0f)
        fx /= 10.0f;
    if (fabs(fy) >= 1.0f)
        fy /= 10.0f;
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (g_qeglobals.d_select_mode == 4 && (g_qeglobals.d_num_move_points <= 0 || FUN_00429df0(0, (int)&p->ctrl[i][j]) == -1))
                continue;
            p->ctrl[i][j].st[DAT_01128d94][0] += fx;
            p->ctrl[i][j].st[DAT_01128d94][1] += fy;
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}
#pragma auto_inline(off)
// Retail 0x00432bb0: invert (flip) every selected patch. Out of line: retail 0x41af00 calls it.
void FUN_00432bb0()
{
    bool bUpdate = false;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 5049
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        FUN_00432a60(p);
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
        bUpdate = true;
    }
    if (bUpdate)
        DAT_0123348c = -1;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}
#pragma auto_inline(on)
// Retail 0x00432ca0: mirror the texture coordinates of every selected patch along one axis.
void FUN_00432ca0(bool bFlipWidth)
{
    bool bUpdate = false;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 5076
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        bUpdate = true;
        if (!bFlipWidth)
        {
            for (int i = 0; i < p->width; i++)
            {
                for (int j = 0; j < p->height / 2; j++)
                {
                    float s = p->ctrl[i][p->height - 1 - j].st[DAT_01128d94][0];
                    float t = p->ctrl[i][p->height - 1 - j].st[DAT_01128d94][1];
                    p->ctrl[i][p->height - 1 - j].st[DAT_01128d94][0] = p->ctrl[i][j].st[DAT_01128d94][0];
                    p->ctrl[i][p->height - 1 - j].st[DAT_01128d94][1] = p->ctrl[i][j].st[DAT_01128d94][1];
                    p->ctrl[i][j].st[DAT_01128d94][0] = s;
                    p->ctrl[i][j].st[DAT_01128d94][1] = t;
                }
            }
        }
        else
        {
            for (int j = 0; j < p->height; j++)
            {
                for (int i = 0; i < p->width / 2; i++)
                {
                    float s = p->ctrl[p->width - 1 - i][j].st[DAT_01128d94][0];
                    float t = p->ctrl[p->width - 1 - i][j].st[DAT_01128d94][1];
                    p->ctrl[p->width - 1 - i][j].st[DAT_01128d94][0] = p->ctrl[i][j].st[DAT_01128d94][0];
                    p->ctrl[p->width - 1 - i][j].st[DAT_01128d94][1] = p->ctrl[i][j].st[DAT_01128d94][1];
                    p->ctrl[i][j].st[DAT_01128d94][0] = s;
                    p->ctrl[i][j].st[DAT_01128d94][1] = t;
                }
            }
        }
        if (DAT_01128d94 == 1)
            p->flag_382f = 0;
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
    }
    if (bUpdate)
        DAT_0123348c = -1;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
}

// Length of one grid step between two controls: along two chosen axes, or all three when ax < 0.
static float PatchStepLen(const PatchControl *a, const PatchControl *b, int ax, int ay)
{
    if (ax < 0)
    {
        float dx = b->xyz[0] - a->xyz[0];
        float dy = b->xyz[1] - a->xyz[1];
        float dz = b->xyz[2] - a->xyz[2];
        return (float)sqrt(dy * dy + dx * dx + dz * dz);
    }
    float d0 = b->xyz[ax] - a->xyz[ax];
    float d1 = b->xyz[ay] - a->xyz[ay];
    return (float)sqrt(d1 * d1 + d0 * d0);
}

// Retail 0x00432f60: set texture coordinates of every selected patch (mode 1 = by length, 2 = even grid).
void FUN_00432f60(float scaleS, float scaleT, int mode)
{
    brush_t *b = DAT_010a44b4.next;
    while (b != &DAT_010a44b4 && !b->patch)
        b = b->next;
    if (b == &DAT_010a44b4)
        return;
    FUN_004433b0();
    Undo_GeneralStart("Patch set texturing");
    Undo_AddBrushList((selbrush_t *)&DAT_010a44b4);
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 5156
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if (mode != 2 && (p->type_10 & 0x40))
        {
            int ax = -1, ay = -1;
            if (mode != 1)
            {
                brushdef_t *d = b->def;
                float dx = d->maxs[0] - d->mins[0];
                float dy = d->maxs[1] - d->mins[1];
                float dz = (d->maxs[2] - d->mins[2]) * 0.5f;
                if (!(dz >= dx) && !(dz >= dy))
                {
                    ay = 1;
                    ax = 0;
                }
                else
                {
                    ay = 2;
                    ax = 0;
                    if (!(dy < dx))
                        ax = 1;
                }
            }
            for (int y = 0; y < p->height; y++)
            {
                float total = 0.0f;
                if (p->width <= 1)
                    total = 1.0f;
                else
                {
                    for (int x = 1; x < p->width; x++)
                        total += PatchStepLen(&p->ctrl[x - 1][y], &p->ctrl[x][y], ax, ay);
                    if (total == 0.0f)
                        total = 1.0f;
                }
                float scale = scaleS / total;
                p->ctrl[0][y].st[DAT_01128d94][0] = 0.0f;
                total = 0.0f;
                for (int x = 1; x < p->width; x++)
                {
                    total += PatchStepLen(&p->ctrl[x - 1][y], &p->ctrl[x][y], ax, ay);
                    p->ctrl[x][y].st[DAT_01128d94][0] = scale * total;
                }
            }
            for (int x = 0; x < p->width; x++)
            {
                float total = 0.0f;
                if (p->height <= 1)
                    total = 1.0f;
                else
                {
                    for (int y = 1; y < p->height; y++)
                        total += PatchStepLen(&p->ctrl[x][y - 1], &p->ctrl[x][y], ax, ay);
                    if (total == 0.0f)
                        total = 1.0f;
                }
                float scale = scaleT / total;
                p->ctrl[x][0].st[DAT_01128d94][1] = 0.0f;
                total = 0.0f;
                for (int y = 1; y < p->height; y++)
                {
                    total += PatchStepLen(&p->ctrl[x][y - 1], &p->ctrl[x][y], ax, ay);
                    p->ctrl[x][y].st[DAT_01128d94][1] = scale * total;
                }
            }
        }
        else
        {
            for (int x = 0; x < p->width; x++)
            {
                for (int y = 0; y < p->height; y++)
                {
                    p->ctrl[x][y].st[DAT_01128d94][0] = (float)x * scaleS / (float)(p->width - 1);
                    p->ctrl[x][y].st[DAT_01128d94][1] = (float)y * scaleT / (float)(p->height - 1);
                }
            }
        }
        if (DAT_01128d94 == 1)
            p->flag_382f = 0;
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
    }
    FUN_00443f80((selbrush_t *)&DAT_010a44b4);
    Undo_End();
}

// Retail 0x00433910: apply a texture rotate, shift and scale to every selected patch.
void FUN_00433910(const patchTexInfo_proj *info)
{
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 5336
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if (info->rotate != 0.0f)
            FUN_00432430(p, info->rotate);
        if (info->shift[0] != 0.0f || info->shift[1] != 0.0f)
            FUN_00432800(p, info->shift[0], info->shift[1]);
        if (info->scale[0] != 0.0f || info->scale[1] != 0.0f)
            FUN_004326b0(p, info->scale[0], info->scale[1]);
    }
}

// Retail 0x00433ad0: toggle the patch bend tool on or off.
void FUN_00433ad0()
{
    if (DAT_012334ba)
    {
        DAT_012334ba = false;
        if (DAT_012335bc)
            DAT_012335a0.ShowWindow(SW_HIDE);
        FUN_0041b190(dword_01233488);
        return;
    }
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        Sys_Printf("Must bend a single patch");
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Patch_BendToggle: Bending of terrain curves not implemented\n");
        return;
    }
    DAT_0109c538.width = p->width;
    DAT_0109c538.height = p->height;
    DAT_0109c538.type_10 = p->type_10;
    memcpy(DAT_0109c538.ctrl, p->ctrl, sizeof(p->ctrl));
    DAT_012334ba = true;
    DAT_005909fc = 0;
    DAT_00590a04 = true;
    DAT_012334c0 = 1;
    FUN_00409690(DAT_00590a08[0]);
}

// Retail 0x00433da0: step the bend tool to its next state.
void FUN_00433da0()
{
    if (!DAT_012334ba)
        return;
    if (DAT_005909fc < 3)
    {
        DAT_005909fc++;
        FUN_00409690(DAT_00590a08[DAT_005909fc]);
        if (DAT_005909fc == 1)
        {
            DAT_0109c528[2] = 0;
            DAT_0109c528[1] = 0;
            DAT_0109c528[0] = 0;
            DAT_012334bc = 0;
            FUN_00433b90();
            DAT_0123348c = -1;
            return;
        }
        if (DAT_005909fc == 2)
        {
            DAT_00590a05 = 1;
            DAT_0123348c = -1;
            return;
        }
    }
    else
        FUN_00433ad0();
    DAT_0123348c = -1;
}

// Retail 0x00433ed0: select the bend axis row or column of the single selected patch.
void FUN_00433ed0()
{
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        FUN_00433ad0();
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Patch_SelectBendAxis: Bending of terrain curves not implemented\n");
        return;
    }
    if (DAT_00590a04)
        FUN_0042a3a0(p, DAT_012334c0, false);
    else
        FUN_0042a3f0(p, DAT_012334c0, false);
    Patch_SetBendRotateOrigin();
}

// Retail 0x00433f20: select the bend-normal side (rows or columns) of the single selected patch.
void FUN_00433f20()
{
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        FUN_00433ad0();
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Patch_SelectBendNormal: Bending of terrain curves not implemented\n");
        return;
    }
    g_qeglobals.d_num_move_points = 0;
    if (DAT_00590a04)
    {
        if (DAT_00590a05)
        {
            for (int i = 0; i < DAT_012334c0; i++)
                FUN_0042a3a0(p, i, true);
        }
        else
        {
            for (int i = p->height - 1; i > DAT_012334c0; i--)
                FUN_0042a3a0(p, i, true);
        }
    }
    else if (DAT_00590a05)
    {
        for (int i = 0; i < DAT_012334c0; i++)
            FUN_0042a3f0(p, i, true);
    }
    else
    {
        for (int i = p->width - 1; i > DAT_012334c0; i--)
            FUN_0042a3f0(p, i, true);
    }
    Patch_SetBendRotateOrigin();
}

// Retail 0x00434040: toggle the insert/delete patch tool on or off.
void FUN_00434040()
{
    if (DAT_012334b9)
    {
        DAT_012334b9 = false;
        if (DAT_012335bc)
            DAT_012335a0.ShowWindow(SW_HIDE);
        FUN_0041b190(dword_01233488);
        return;
    }
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        Sys_Printf("Must work with a single patch");
        return;
    }
    DAT_0109c538.width = p->width;
    DAT_0109c538.height = p->height;
    DAT_0109c538.type_10 = p->type_10;
    memcpy(DAT_0109c538.ctrl, p->ctrl, sizeof(p->ctrl));
    DAT_012334b9 = true;
    DAT_00590a00 = 0;
    DAT_00590a04 = true;
    DAT_012334c0 = 0;
    FUN_00409690(DAT_00590a1c[0]);
}

// Retail 0x00434190: natural or cap texturing on every selected patch, as one undo step.
void FUN_00434190(bool bCap, bool bCycle, float fScaleS, float fScaleT)
{
    brush_t *b = DAT_010a44b4.next;
    while (b != &DAT_010a44b4 && !b->patch)
        b = b->next;
    if (b == &DAT_010a44b4)
        return;
    FUN_004433b0();
    Undo_GeneralStart(bCycle ? "Patch cap texturing" : "Patch natural texturing");
    Undo_AddBrushList((selbrush_t *)&DAT_010a44b4);
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 5747
        assert( b->patch->def == b->def->patch );
        if (bCap)
            Patch_CapTexture(b->patch->def, bCycle, fScaleS, fScaleT);
        else
            Patch_Naturalize(b->patch->def);
    }
    FUN_00443f80((selbrush_t *)&DAT_010a44b4);
    Undo_End();
}

// Retail 0x00434290: lightmap texturing on every selected patch, as one undo step.
void FUN_00434290()
{
    brush_t *b; bool any = false;
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
        if (b->patch) { any = true; break; }
    if (!any)
        return;
    FUN_004433b0();
    Undo_GeneralStart("Patch lightmap texturing");
    Undo_AddBrushList((selbrush_t *)&DAT_010a44b4);
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 5773
        assert( b->patch->def == b->def->patch );
        FUN_004270e0(b->patch->def);
    }
    FUN_00443f80((selbrush_t *)&DAT_010a44b4);
    Undo_End();
}

// Retail 0x00434360: add (or remove) the control points inside a drag quad in the move list.
bool FUN_00434360(const float *planes, bool bRemove)
{
    const hitplane_t *pl = (const hitplane_t *)planes;
    bool bChanged = false;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 5796
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        for (int x = 0; x < p->width; x++)
        {
            for (int y = 0; y < p->height; y++)
            {
                PatchControl *c = &p->ctrl[x][y];
                int k;
                for (k = 0; k < 4; k++)
                    if (!(pl[k].n[0] * c->xyz[0] + pl[k].n[2] * c->xyz[2] + pl[k].n[1] * c->xyz[1] < pl[k].d))
                        break;
                if (k != 4)
                    continue;
                if (bRemove)
                {
#line 5812
                    assert( !DAT_0112993e && !DAT_0112993f );
                    int idx = IndexOfMovePoint(c);
                    if (idx >= 0)
                    {
                        int n = g_qeglobals.d_num_move_points - idx;
                        if (n - 1 > 0)
                            memmove(&g_qeglobals.d_move_points[idx], &g_qeglobals.d_move_points[idx + 1], (n - 1) * 4);
                        g_qeglobals.d_num_move_points--;
                    }
                }
                else if (DAT_0112993e)
                {
                    c->flags_34 |= 2;
                    bChanged = true;
                }
                else if (DAT_0112993f)
                {
                    c->flags_34 &= ~2;
                    bChanged = true;
                }
                else if (!(c->flags_34 & 2) && IndexOfMovePoint(c) < 0)
                {
                    bChanged = true;
                    FUN_0042a040(p, c);
                }
            }
        }
    }
    return bChanged;
}

// Retail 0x00434630: apply a drag quad to the selected patch points, retrying in add mode.
void FUN_00434630(const float *planes, bool bAdd)
{
    bool bRetry = true;
    if (!bAdd || DAT_0112993e || DAT_0112993f)
    {
        g_qeglobals.d_num_move_points = 0;
        bRetry = false;
    }
    DAT_005909f8 = -1;
    if (!FUN_00434360(planes, false) && bRetry)
        FUN_00434360(planes, true);
}

// Retail 0x00434690: add or remove the unique points that lie inside four planes (selection quad).
bool FUN_00434690(const hitplane_t *pl, bool bRemove)
{
    bool bChanged = false;
    if (DAT_0112993e || DAT_0112993f)
        return false;
    for (int i = 0; i < g_qeglobals.field_3c074; i++)
    {
        const float *pt = g_qeglobals.field_c074[i];
        int k;
        for (k = 0; k < 4; k++)
            if (!(pl[k].n[0] * pt[0] + pl[k].n[2] * pt[2] + pl[k].n[1] * pt[1] < pl[k].d))
                break;
        if (k != 4)
            continue;
        if (!bRemove)
        {
            if (FUN_00429e20(pt) < 0)
            {
                float *dst = g_qeglobals.field_3c078[g_qeglobals.field_6c078];
                dst[0] = pt[0];
                dst[1] = pt[1];
                dst[2] = pt[2];
                g_qeglobals.field_6c078++;
                bChanged = true;
            }
        }
        else
        {
#line 5891
            assert( !DAT_0112993e && !DAT_0112993f );
            int idx = FUN_00429e20(pt);
            if (idx >= 0)
            {
                int n = g_qeglobals.field_6c078 - idx;
                if (n - 1 > 0)
                    memmove(g_qeglobals.field_3c078[idx], g_qeglobals.field_3c078[idx + 1], (n - 1) * 12);
                g_qeglobals.field_6c078--;
            }
        }
    }
    return bChanged;
}

// Retail 0x00434810: apply a drag quad to the unique point list, retrying in add mode.
void FUN_00434810(const hitplane_t *planes, bool bAdd)
{
    bool bRetry = true;
    if (!bAdd)
    {
        g_qeglobals.field_6c078 = 0;
        bRetry = false;
    }
    DAT_005909f8 = -1;
    if (!FUN_00434690(planes, false) && bRetry)
        FUN_00434690(planes, true);
}

// Retail 0x00434880: duplicate a patch mesh with a fresh cache.
patchMesh_t *FUN_00434880(const patchMesh_t *src)
{
    patchMesh_t *p = MakeNewPatch();
    *p = *src;
    p->cache_3824 = NULL;
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    AddBrushForPatch(p, *(entity_t **)((char *)src->cache_3828 + 8));
    return p;
}

// Retail 0x004348e0: thicken the selected patch with an offset copy and optional seam strips.
void FUN_004348e0(int thickness, bool bSeam)
{
    thickness = -thickness;
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        Sys_Printf("Cannot thicken multiple patches. Please select a single patch.\n");
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Thickening of terrain patches not yet implemented.  Tell the coders if you need this feature.\n");
        return;
    }
    FUN_004433b0();
    Undo_GeneralStart("Patch thicken");
    Undo_AddBrushList((selbrush_t *)&DAT_010a44b4);
    Patch_MeshNormals(p);
    patchMesh_t *dup = FUN_00434880(p);
    for (int x = 0; x < p->width; x++)
    {
        for (int y = 0; y < p->height; y++)
        {
            float t = (float)thickness;
            dup->ctrl[x][y].xyz[0] = t * p->ctrl[x][y].normal[0] + p->ctrl[x][y].xyz[0];
            dup->ctrl[x][y].xyz[1] = t * p->ctrl[x][y].normal[1] + p->ctrl[x][y].xyz[1];
            dup->ctrl[x][y].xyz[2] = t * p->ctrl[x][y].normal[2] + p->ctrl[x][y].xyz[2];
        }
    }
    FUN_004269d0(dup, true);
    dup->type_10 |= 0x4000;
    brush_t *nb = FUN_00458440((brushdef_t *)dup->cache_3828, DAT_010a44b4.next->owner);
    FUN_00459210(nb, &DAT_010a44b4);
    if (bSeam)
    {
        vec3_t mins, maxs;
        if (!(p->type_10 & 1))
        {
            int lastCol = p->width - 1;
        {
            brush_t *bA = Patch_GenericMesh(3, p->height, 2, false, true);
    #line 6006
            assert( bA->patch->def == bA->def->patch );
            patchMesh_t *sd = bA->patch->def;
            sd->type_10 |= 0x2000;
            for (int r = 0; r < p->height; r++)
            {
                sd->ctrl[0][r].xyz[0] = p->ctrl[0][r].xyz[0];
                sd->ctrl[0][r].xyz[1] = p->ctrl[0][r].xyz[1];
                sd->ctrl[0][r].xyz[2] = p->ctrl[0][r].xyz[2];
                sd->ctrl[2][r].xyz[0] = dup->ctrl[0][r].xyz[0];
                sd->ctrl[2][r].xyz[1] = dup->ctrl[0][r].xyz[1];
                sd->ctrl[2][r].xyz[2] = dup->ctrl[0][r].xyz[2];
                sd->ctrl[1][r].xyz[0] = (sd->ctrl[0][r].xyz[0] + sd->ctrl[2][r].xyz[0]) * 0.5f;
                sd->ctrl[1][r].xyz[1] = (sd->ctrl[0][r].xyz[1] + sd->ctrl[2][r].xyz[1]) * 0.5f;
                sd->ctrl[1][r].xyz[2] = (sd->ctrl[0][r].xyz[2] + sd->ctrl[2][r].xyz[2]) * 0.5f;
            }
            Patch_CalcBounds(sd, mins, maxs, true);
            Brush_RebuildBrush((brushdef_t *)sd->cache_3828, mins, maxs);
            Patch_Naturalize(sd);
            FUN_00432a60(sd);
            if (sd->cache_3824)
                free(sd->cache_3824);
            sd->cache_3824 = FUN_004267d0(sd, DAT_01128d94, NULL, NULL);
            sd->version++;
            FUN_0046f0b0(bA, 1, 1, 0);
        }
        {
            brush_t *bB = Patch_GenericMesh(3, p->height, 2, false, true);
    #line 6025
            assert( bB->patch->def == bB->def->patch );
            patchMesh_t *sd = bB->patch->def;
            sd->type_10 |= 0x2000;
            for (int r = 0; r < p->height; r++)
            {
                sd->ctrl[0][r].xyz[0] = p->ctrl[lastCol][r].xyz[0];
                sd->ctrl[0][r].xyz[1] = p->ctrl[lastCol][r].xyz[1];
                sd->ctrl[0][r].xyz[2] = p->ctrl[lastCol][r].xyz[2];
                sd->ctrl[2][r].xyz[0] = dup->ctrl[lastCol][r].xyz[0];
                sd->ctrl[2][r].xyz[1] = dup->ctrl[lastCol][r].xyz[1];
                sd->ctrl[2][r].xyz[2] = dup->ctrl[lastCol][r].xyz[2];
                sd->ctrl[1][r].xyz[0] = (sd->ctrl[0][r].xyz[0] + sd->ctrl[2][r].xyz[0]) * 0.5f;
                sd->ctrl[1][r].xyz[1] = (sd->ctrl[0][r].xyz[1] + sd->ctrl[2][r].xyz[1]) * 0.5f;
                sd->ctrl[1][r].xyz[2] = (sd->ctrl[0][r].xyz[2] + sd->ctrl[2][r].xyz[2]) * 0.5f;
            }
            Patch_CalcBounds(sd, mins, maxs, true);
            Brush_RebuildBrush((brushdef_t *)sd->cache_3828, mins, maxs);
            Patch_Naturalize(sd);
            FUN_0046f0b0(bB, 1, 1, 0);
        }
        }
        int lastRow = p->height - 1;
        {
            brush_t *bC = Patch_GenericMesh(p->width, 3, 2, false, true);
    #line 6043
            assert( bC->patch->def == bC->def->patch );
            patchMesh_t *sd = bC->patch->def;
            sd->type_10 |= 0x2000;
            for (int c = 0; c < p->width; c++)
            {
                sd->ctrl[c][0].xyz[0] = p->ctrl[c][0].xyz[0];
                sd->ctrl[c][0].xyz[1] = p->ctrl[c][0].xyz[1];
                sd->ctrl[c][0].xyz[2] = p->ctrl[c][0].xyz[2];
                sd->ctrl[c][2].xyz[0] = dup->ctrl[c][0].xyz[0];
                sd->ctrl[c][2].xyz[1] = dup->ctrl[c][0].xyz[1];
                sd->ctrl[c][2].xyz[2] = dup->ctrl[c][0].xyz[2];
                sd->ctrl[c][1].xyz[0] = (sd->ctrl[c][0].xyz[0] + sd->ctrl[c][2].xyz[0]) * 0.5f;
                sd->ctrl[c][1].xyz[1] = (sd->ctrl[c][0].xyz[1] + sd->ctrl[c][2].xyz[1]) * 0.5f;
                sd->ctrl[c][1].xyz[2] = (sd->ctrl[c][0].xyz[2] + sd->ctrl[c][2].xyz[2]) * 0.5f;
            }
            Patch_CalcBounds(sd, mins, maxs, true);
            Brush_RebuildBrush((brushdef_t *)sd->cache_3828, mins, maxs);
            Patch_Naturalize(sd);
            FUN_00432a60(sd);
            if (sd->cache_3824)
                free(sd->cache_3824);
            sd->cache_3824 = FUN_004267d0(sd, DAT_01128d94, NULL, NULL);
            sd->version++;
            FUN_0046f0b0(bC, 1, 1, 0);
        }
        {
            brush_t *bD = Patch_GenericMesh(p->width, 3, 2, false, true);
    #line 6062
            assert( bD->patch->def == bD->def->patch );
            patchMesh_t *sd = bD->patch->def;
            sd->type_10 |= 0x2000;
            for (int c = 0; c < p->width; c++)
            {
                sd->ctrl[c][0].xyz[0] = p->ctrl[c][lastRow].xyz[0];
                sd->ctrl[c][0].xyz[1] = p->ctrl[c][lastRow].xyz[1];
                sd->ctrl[c][0].xyz[2] = p->ctrl[c][lastRow].xyz[2];
                sd->ctrl[c][2].xyz[0] = dup->ctrl[c][lastRow].xyz[0];
                sd->ctrl[c][2].xyz[1] = dup->ctrl[c][lastRow].xyz[1];
                sd->ctrl[c][2].xyz[2] = dup->ctrl[c][lastRow].xyz[2];
                sd->ctrl[c][1].xyz[0] = (sd->ctrl[c][0].xyz[0] + sd->ctrl[c][2].xyz[0]) * 0.5f;
                sd->ctrl[c][1].xyz[1] = (sd->ctrl[c][0].xyz[1] + sd->ctrl[c][2].xyz[1]) * 0.5f;
                sd->ctrl[c][1].xyz[2] = (sd->ctrl[c][0].xyz[2] + sd->ctrl[c][2].xyz[2]) * 0.5f;
            }
            Patch_CalcBounds(sd, mins, maxs, true);
            Brush_RebuildBrush((brushdef_t *)sd->cache_3828, mins, maxs);
            Patch_Naturalize(sd);
            FUN_0046f0b0(bD, 1, 1, 0);
        }
    }
    FUN_00432a60(dup);
    if (dup->cache_3824)
        free(dup->cache_3824);
    dup->cache_3824 = FUN_004267d0(dup, DAT_01128d94, NULL, NULL);
    dup->version++;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
    FUN_00443f80((selbrush_t *)&DAT_010a44b4);
    Undo_End();
}

// Retail 0x004353d0: transpose every selected patch (swap rows and columns, flip winding).
void FUN_004353d0()
{
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 6161
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        FUN_00435230(p);
        FUN_00432a60(p);
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
        FUN_004269d0(p, true);
    }
}

// Retail 0x004354b0: snap the selected control points, or the whole selection, to the grid.
void FUN_004354b0()
{
    float saved[1025][3];
    bool bWholeBrushes = false;
    brush_t *b = DAT_010a44b4.next;
    if (g_qeglobals.d_num_move_points > 0 && b != &DAT_010a44b4)
    {
        brush_t *c = b;
        while (c->patch)
        {
            c = c->next;
            if (c == &DAT_010a44b4)
            {
                bWholeBrushes = true;
                break;
            }
        }
    }
    if (!bWholeBrushes)
    {
        for (; b != &DAT_010a44b4; b = b->next)
        {
            if (b->patch)
            {
#line 6232
                assert( b->patch->def == b->def->patch );
                patchMesh_t *p = b->patch->def;
                for (int i = 0; i < p->width; i++)
                {
                    for (int j = 0; j < p->height; j++)
                    {
                        for (int k = 0; k < 3; k++)
                            p->ctrl[i][j].xyz[k] = floor(p->ctrl[i][j].xyz[k] / (float)DAT_010bcd2c + 0.5) * (double)DAT_010bcd2c;
                    }
                }
                FUN_004269d0(p, true);
            }
            else
                FUN_0045afc0(b->def);
        }
        return;
    }
    if (g_qeglobals.d_num_move_points > 1025)
    {
        Sys_Printf("Can only grid snap selected vertices if less than %i selected\n", 1025);
        return;
    }
    for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
    {
        float *pt = (float *)g_qeglobals.d_move_points[i];
        saved[i][0] = pt[0];
        saved[i][1] = pt[1];
        saved[i][2] = pt[2];
        for (int k = 0; k < 3; k++)
            pt[k] = (float)(floor(pt[k] / (float)DAT_010bcd2c + 0.5) * (double)DAT_010bcd2c);
    }
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch)
        {
#line 6215
            assert( b->patch->def == b->def->patch );
            FUN_004269d0(b->patch->def, true);
        }
    }
    DAT_0123348c = -1;
}

// Retail 0x00435760: swap the current layer material on a patch brush when its name matches (or when forced).
bool FUN_00435760(brushdef_t *b, const char *oldName, char *newName, bool bForce)
{
#line 6256
    assert( b );
#line 6257
    assert( b->patch );
    patchMesh_t *p = b->patch;
    if (!bForce)
    {
        material_t *mat = (material_t *)(&p->image_18)[DAT_01128d90];
        if (_stricmp(mat->name, oldName))
            return false;
    }
    (&p->image_18)[DAT_01128d90] = FUN_00440840(newName);
    p->version++;
    return true;
}

// Retail 0x00435900: spread the selected control points of one row evenly between the first two selected points.
void FUN_00435900(patchMesh_t *p, int row)
{
    bool bFirst = false, bSecond = false;
    int iFirst = 0, iSecond = 0;
    vec3_t first, second;
    for (int j = 0; j < p->height; j++)
    {
        if (IndexOfMovePoint(&p->ctrl[row][j]) == -1)
            continue;
        if (bFirst)
        {
            VectorCopy(p->ctrl[row][j].xyz, second);
            bSecond = true;
            iSecond = j;
        }
        else
        {
            VectorCopy(p->ctrl[row][j].xyz, first);
            bFirst = true;
            iFirst = j;
        }
    }
    if (!bFirst || !bSecond)
        return;
    for (int j = 0; j < p->height; j++)
    {
        if (IndexOfMovePoint(&p->ctrl[row][j]) == -1 || (p->ctrl[row][j].flags_34 & 2))
            continue;
        float t = (float)(j - iFirst) / (float)(iSecond - iFirst);
        p->ctrl[row][j].xyz[0] = (1.0f - t) * first[0] + second[0] * t;
        p->ctrl[row][j].xyz[1] = (1.0f - t) * first[1] + second[1] * t;
        p->ctrl[row][j].xyz[2] = (1.0f - t) * first[2] + second[2] * t;
    }
}

// Retail 0x00435a80: spread the selected control points of one column evenly between the first two selected points.
void FUN_00435a80(patchMesh_t *p, int col)
{
    bool bFirst = false, bSecond = false;
    int iFirst = 0, iSecond = 0;
    vec3_t first, second;
    for (int i = 0; i < p->width; i++)
    {
        PatchControl *c = &p->ctrl[i][col];
        if (IndexOfMovePoint(c) == -1)
            continue;
        if (bFirst)
        {
            VectorCopy(c->xyz, second);
            bSecond = true;
            iSecond = i;
        }
        else
        {
            VectorCopy(c->xyz, first);
            bFirst = true;
            iFirst = i;
        }
    }
    if (!bFirst || !bSecond)
        return;
    for (int i = 0; i < p->width; i++)
    {
        PatchControl *c = &p->ctrl[i][col];
        if (IndexOfMovePoint(c) == -1 || (c->flags_34 & 2))
            continue;
        float t = (float)(i - iFirst) / (float)(iSecond - iFirst);
        c->xyz[0] = (1.0f - t) * first[0] + second[0] * t;
        c->xyz[1] = (1.0f - t) * first[1] + second[1] * t;
        c->xyz[2] = (1.0f - t) * first[2] + second[2] * t;
    }
}

// Retail 0x00435c00: nudge each selected control point down onto the nearest surface.
void FUN_00435c00()
{
    if (g_qeglobals.d_select_mode != 1 && g_qeglobals.d_select_mode != 4)
        return;
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        Sys_Printf("must have a single patch selected to redistribute");
        return;
    }
    float dir[3] = {0.0f, 0.0f, -1.0f};
    for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
    {
        float *pt = (float *)g_qeglobals.d_move_points[i];
        float org[3] = {pt[0], pt[1], pt[2]};
        trace_t tr = FUN_0046ef10(org, dir, 0x200);
        if (tr.brush)
        {
            pt[0] = dir[0] * tr.dist + org[0];
            pt[1] = dir[1] * tr.dist + org[1];
            pt[2] = dir[2] * tr.dist + org[2];
        }
    }
    FUN_004269d0(p, true);
    DAT_0123348c = -1;
}

// Retail 0x00435d20: redistribute the selected control points between selected ends of each row and column.
void FUN_00435d20()
{
    if (g_qeglobals.d_select_mode != 1 && g_qeglobals.d_select_mode != 4)
        return;
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        Sys_Printf("must have a single patch selected to redistribute");
        return;
    }
    bool bAny = false;
    for (int i = 0; i < p->width; i++)
        for (int j = 0; j < p->height; j++)
            if (IndexOfMovePoint(&p->ctrl[i][j]) != -1)
            {
                bAny = true;
                break;
            }
    if (!bAny)
    {
        Sys_Printf("No vertices selected, can't redistribute.\n");
        return;
    }
    for (int j = 0; j < p->height; j++)
        FUN_00435a80(p, j);
    for (int i = 0; i < p->width; i++)
        FUN_00435900(p, i);
    Sys_Printf("Redistributing patch points.\n");
    DAT_0123348c = -1;
    FUN_004269d0(p, true);
}

// Retail 0x00435e40: weld the selected control points onto the nearest unique point within the tolerance.
void FUN_00435e40()
{
    float oldPos[0x1001][3];
    if (g_qeglobals.d_num_move_points < 1)
    {
        Sys_Printf("can only connect patch vertices if at least 1 vertices are selected\n");
        return;
    }
    if ((unsigned)g_qeglobals.d_num_move_points > 0x1001)
    {
        Sys_Printf("can only connect patch vertices if at most %i vertices are selected\n", 0x1001);
        return;
    }
    int tol = PREFS_INT(0x28c);
    float tol2 = (float)(tol * tol);
    int nMerged = 0;
    if (g_qeglobals.d_num_move_points > 0)
    {
        for (int i = 0; i < g_qeglobals.d_num_move_points; i++)
        {
            float best = tol2 + 1.0f;
            int idx = -1;
            for (int k = 0; k < g_qeglobals.field_6c078; k++)
            {
                float *sel = (float *)g_qeglobals.d_move_points[i];
                float dx = g_qeglobals.field_3c078[k][0] - sel[0];
                float dy = g_qeglobals.field_3c078[k][1] - sel[1];
                float d = dy * dy + dx * dx;
                if (!(d > tol2) && d < best)
                {
                    best = d;
                    idx = k;
                }
            }
            if (!(best > tol2))
            {
                float *sel = (float *)g_qeglobals.d_move_points[i];
                oldPos[nMerged][0] = sel[0];
                oldPos[nMerged][1] = sel[1];
                oldPos[nMerged][2] = sel[2];
                sel[0] = g_qeglobals.field_3c078[idx][0];
                sel[1] = g_qeglobals.field_3c078[idx][1];
                sel[2] = g_qeglobals.field_3c078[idx][2];
                nMerged++;
            }
        }
        if (nMerged == 0)
            Sys_Printf("No vertices are close enough to do Tolerant Weld\n");
        else if (nMerged == 1)
            Sys_Printf("Merged 1 vertex\n");
        else
            Sys_Printf("Merged %i vertices\n", nMerged);
    }
    else
        Sys_Printf("No vertices are close enough to do Tolerant Weld\n");
    g_qeglobals.d_num_move_points = 0;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
        if (b->patch)
            FUN_004269d0(b->patch->def, true);
    DAT_0123348c = -1;
}

// Retail 0x00436000: snap the selected control points onto the first unique point, per unlocked axis.
void FUN_00436000()
{
    float oldPos[0x401][3];
    if (g_qeglobals.d_num_move_points < 1)
    {
        Sys_Printf("can only connect patch vertices if at least 1 patch vertices are selected\n");
        return;
    }
    if ((unsigned)g_qeglobals.d_num_move_points > 0x401)
    {
        Sys_Printf("can only connect patch vertices if at most %i vertices are selected\n", 0x401);
        return;
    }
    int mask = DAT_0109fe60;
    int i = 0;
    do
    {
        float *c = (float *)g_qeglobals.d_move_points[i];
        if (!(mask & 1) && !(mask & 2) && !(mask & 4))
        {
            oldPos[i][0] = c[0];
            oldPos[i][1] = c[1];
            oldPos[i][2] = c[2];
            c[0] = g_qeglobals.field_3c078[0][0];
            c[1] = g_qeglobals.field_3c078[0][1];
            c[2] = g_qeglobals.field_3c078[0][2];
        }
        else
        {
            oldPos[i][0] = c[0];
            oldPos[i][1] = c[1];
            oldPos[i][2] = c[2];
            if (!(mask & 1))
                c[0] = g_qeglobals.field_3c078[0][0];
            if (!(mask & 2))
                c[1] = g_qeglobals.field_3c078[0][1];
            if (!(mask & 4))
                c[2] = g_qeglobals.field_3c078[0][2];
        }
    } while (++i < g_qeglobals.d_num_move_points);
    g_qeglobals.d_num_move_points = 0;
    g_qeglobals.field_6c078 = 0;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
        if (b->patch)
            FUN_004269d0(b->patch->def, true);
    DAT_0123348c = -1;
}

// Retail 0x00436170: tolerant weld of the selected control points onto each other.
void FUN_00436170()
{
    float oldPos[0x1000][3];
    if (DAT_012485bc > 0)
    {
        Sys_Printf("can only connect patch vertices if only patches are selected\n");
        return;
    }
    brush_t *b = DAT_010a44b4.next;
    if (b == &DAT_010a44b4)
    {
        Sys_Printf("can only connect patch vertices if only patches are selected\n");
        return;
    }
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
        {
            Sys_Printf("can only connect patch vertices if only patches are selected\n");
            return;
        }
    }
    if (g_qeglobals.d_num_move_points < 2)
    {
        Sys_Printf("can only connect patch vertices if at least 2 vertices are selected\n");
        return;
    }
    if ((unsigned)g_qeglobals.d_num_move_points > 0x1001)
    {
        Sys_Printf("can only connect patch vertices if at most %i vertices are selected\n", 0x1001);
        return;
    }
    int tol = PREFS_INT(0x28c);
    float tol2 = (float)(tol * tol);
    int nMerged = 0;
    float delta[2], d;
    if (g_qeglobals.d_num_move_points - 1 > 0)
    {
        for (int i = g_qeglobals.d_num_move_points - 1; i > 0; i--)
        {
            int k = i - 1;
            while (k >= 0)
            {
                float *a = (float *)g_qeglobals.d_move_points[k];
                float *c = (float *)g_qeglobals.d_move_points[i];
                delta[0] = a[0] - c[0];
                delta[1] = a[1] - c[1];
                d = delta[1] * delta[1] + delta[0] * delta[0];
                if (d <= tol2)
                {
                    float *o = oldPos[i - 1];
                    o[0] = c[0];
                    o[1] = c[1];
                    o[2] = c[2];
                    c[0] = a[0];
                    c[1] = a[1];
                    c[2] = a[2];
                    nMerged++;
                }
                k--;
            }
        }
        if (nMerged == 0)
            Sys_Printf("No vertices are close enough to do Tolerant Weld\n");
        else if (nMerged == 1)
            Sys_Printf("Merged 1 vertex\n");
        else
            Sys_Printf("Merged %i vertices\n", nMerged);
    }
    else
        Sys_Printf("No vertices are close enough to do Tolerant Weld\n");
    g_qeglobals.d_num_move_points = 0;
    for (brush_t *q = DAT_010a44b4.next; q != &DAT_010a44b4; q = q->next)
        if (q->patch)
            FUN_004269d0(q->patch->def, true);
    DAT_0123348c = -1;
}

// Retail 0x004364b0: push the selected patch points out to a circle around their centre.
void FUN_004364b0()
{
    float oldPos[0x401][3];
    if (DAT_012485bc > 0)
    {
        Sys_Printf("can only connect patch vertices if only patches are selected\n");
        return;
    }
    brush_t *b = DAT_010a44b4.next;
    if (b == &DAT_010a44b4)
    {
        Sys_Printf("can only connect patch vertices if only patches are selected\n");
        return;
    }
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
        {
            Sys_Printf("can only connect patch vertices if only patches are selected\n");
            return;
        }
    }
    int n = g_qeglobals.d_num_move_points;
    if (n < 2)
    {
        Sys_Printf("can only splay patch vertices if at least 2 vertices are selected\n");
        return;
    }
    if ((unsigned)n > 0x401)
    {
        Sys_Printf("can only splay patch vertices if at most %i vertices are selected\n", 0x401);
        return;
    }
    float *first = (float *)g_qeglobals.d_move_points[0];
    float minX = first[0], minY = first[1];
    float maxX = first[0], maxY = first[1];
    for (int i = n - 1; i > 0; i--)
    {
        float *pt = (float *)g_qeglobals.d_move_points[i];
        if (!(pt[0] >= minX))
            minX = pt[0];
        if (!(pt[0] <= maxX))
            maxX = pt[0];
        if (!(pt[1] >= minY))
            minY = pt[1];
        if (!(pt[1] <= maxY))
            maxY = pt[1];
    }
    float cx = (maxX + minX) * 0.5f;
    float cy = (maxY + minY) * 0.5f;
    float radius = (float)PREFS_INT(0x298);
    for (int i = 0; i < n; i++)
    {
        float *pt = (float *)g_qeglobals.d_move_points[i];
        float v[2];
        oldPos[i][0] = pt[0];
        v[0] = pt[0] - cx;
        oldPos[i][1] = pt[1];
        oldPos[i][2] = pt[2];
        v[1] = pt[1] - cy;
        Vec2Normalize(v);
        pt = (float *)g_qeglobals.d_move_points[i];
        pt[0] = v[0] * radius + cx;
        pt[1] = v[1] * radius + cy;
    }
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
        if (b->patch)
            FUN_004269d0(b->patch->def, true);
    DAT_0123348c = -1;
}

// Retail 0x00436690: draw lines between selected-patch control points that are close together.
void FUN_00436690()
{
    GfxPointVertex verts[1362];
    unsigned int packed;
    float color[4] = {0.3f, 0.8f, 0.6f, 1.0f};
    if (DAT_012485bc > 0)
        return;
    brush_t *b = DAT_010a44b4.next;
    if (b == &DAT_010a44b4)
        return;
    for (; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            return;
    }
    if (g_qeglobals.d_numpoints < 2)
        return;
    g_qeglobals.d_numpoints = 0;
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 6859
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        for (int x = 0; x < p->width; x++)
        {
            for (int y = 0; y < p->height; y++)
            {
                g_qeglobals.d_points[g_qeglobals.d_numpoints][0] = p->ctrl[x][y].xyz[0];
                g_qeglobals.d_points[g_qeglobals.d_numpoints][1] = p->ctrl[x][y].xyz[1];
                g_qeglobals.d_points[g_qeglobals.d_numpoints][2] = p->ctrl[x][y].xyz[2];
                if (g_qeglobals.d_numpoints < 0x7ff)
                    g_qeglobals.d_numpoints++;
            }
        }
    }
    int tol = PREFS_INT(0x28c);
    float radiusSq = (float)(tol * tol);
    (*FUN_0059c468)(color, &packed);
    int n = g_qeglobals.d_numpoints - 1;
    bool bAny = false;
    if (n <= 0)
        return;
    int count = 0;
    int lines = 0;
    for (int i = n; i > 0; i--)
    {
        for (int j = i - 1; j >= 0; j--)
        {
            float dx = g_qeglobals.d_points[j][0] - g_qeglobals.d_points[i][0];
            float dy = g_qeglobals.d_points[j][1] - g_qeglobals.d_points[i][1];
            float d = dy * dy + dx * dx;
            if (!(d > radiusSq) && !(d <= 0.1f))
            {
                count = R_Add3DLine(verts, g_qeglobals.d_points[j], g_qeglobals.d_points[i], &packed, 1, count, 1362);
                lines++;
                bAny = true;
                if (lines > 400)
                    break;
            }
        }
    }
    if (count)
        (*FUN_0059c460)(count / 2, 1, verts);
    if (bAny)
        DAT_0123348c |= 2;
}

// Retail 0x004369b0: connect the selected patch points or vertices depending on the selection.
void FUN_004369b0()
{
    float oldPos[0x401][3];
    if (PREFS_INT(0x26c) != 1)
    {
        brush_t *b = DAT_010a44b4.next;
        for (;;)
        {
            if (b == &DAT_010a44b4)
            {
                Sys_Printf("can only connect patch vertices if a patch selected\n");
                return;
            }
            if (b->patch)
                break;
            b = b->next;
        }
        if (g_qeglobals.field_6c078 > 0)
        {
            FUN_00436000();
            return;
        }
        int n = g_qeglobals.d_num_move_points;
        if (n < 2)
        {
            Sys_Printf("can only connect patch vertices if at least 2 vertices are selected\n");
            return;
        }
        if ((unsigned)n > 0x401)
        {
            Sys_Printf("can only connect patch vertices if at most %i vertices are selected\n", 0x401);
            return;
        }
        int mask = DAT_0109fe60;
        int i = 1;
        for (;;)
        {
            float *c = (float *)g_qeglobals.d_move_points[i];
            float *first = (float *)g_qeglobals.d_move_points[0];
            if (!(mask & 1) && !(mask & 2) && !(mask & 4))
            {
                oldPos[i - 1][0] = c[0];
                oldPos[i - 1][1] = c[1];
                oldPos[i - 1][2] = c[2];
                c[0] = first[0];
                c[1] = first[1];
                c[2] = first[2];
            }
            else
            {
                oldPos[i - 1][0] = c[0];
                oldPos[i - 1][1] = c[1];
                oldPos[i - 1][2] = c[2];
                if (!(mask & 1))
                    c[0] = first[0];
                if (!(mask & 2))
                    c[1] = first[1];
                if (!(mask & 4))
                    c[2] = first[2];
            }
            if (++i >= g_qeglobals.d_num_move_points)
                break;
        }
        b = DAT_010a44b4.next;
        g_qeglobals.d_num_move_points = 0;
        for (; b != &DAT_010a44b4; b = b->next)
            if (b->patch)
                FUN_004269d0(b->patch->def, true);
        DAT_0123348c = -1;
        return;
    }
    if (DAT_012485bc > 0)
    {
        FUN_00435e40();
        return;
    }
    brush_t *b = DAT_010a44b4.next;
    if (b != &DAT_010a44b4)
    {
        while (b->patch)
        {
            b = b->next;
            if (b == &DAT_010a44b4)
            {
                FUN_00436170();
                return;
            }
        }
    }
    FUN_00435e40();
}

// Retail 0x00436bc0: ray/triangle test against a plane normal; mode 1 flips the triangle winding.
bool FUN_00436bc0(const float *tri0, const float *org, int mode, const float *tri1, const float *pt, const float *nrm, float *outT, float *outU, float *outV)
{
    const float *a = tri1;
    const float *b = tri0;
    if (mode == 1)
    {
        a = tri0;
        b = tri1;
    }
    float e0[3] = {org[0] - a[0], org[1] - a[1], org[2] - a[2]};
    float e1[3] = {b[0] - a[0], b[1] - a[1], b[2] - a[2]};
    float c[3];
    c[0] = e1[2] * nrm[1] - e1[1] * nrm[2];
    c[1] = e1[0] * nrm[2] - e1[2] * nrm[0];
    c[2] = e1[1] * nrm[0] - e1[0] * nrm[1];
    float det = c[2] * e0[2] + c[1] * e0[1] + c[0] * e0[0];
    float sign;
    if (det >= 0.0001)
        sign = 1.0f;
    else if (mode == 0 && det <= -0.0001)
    {
        sign = -1.0f;
        det = -det;
    }
    else
        return false;
    float d[3] = {pt[0] - a[0], pt[1] - a[1], pt[2] - a[2]};
    float u = (d[2] * c[2] + d[1] * c[1] + d[0] * c[0]) * sign;
    if (u < 0.0f || u > det)
        return false;
    float q[3];
    q[0] = d[1] * e0[2] - d[2] * e0[1];
    q[1] = d[2] * e0[0] - e0[2] * d[0];
    q[2] = d[0] * e0[1] - d[1] * e0[0];
    float v = (q[0] * nrm[0] + q[2] * nrm[2] + q[1] * nrm[1]) * sign;
    if (v < 0.0f || v + u > det)
        return false;
    *outT = (q[2] * e1[0] + q[1] * e1[1] + q[0] * e1[2]) * sign / det;
    if (outU)
        *outU = u / det;
    if (outV)
        *outV = v / det;
    return true;
}

// Retail 0x00437390: distance between the positions of two control points (passed by value).
float FUN_00437390(PatchControl a, PatchControl b)
{
    vec3_t v;
    v[0] = a.xyz[0] - b.xyz[0];
    v[0] = v[0] * v[0];
    v[1] = a.xyz[1] - b.xyz[1];
    v[1] = v[1] * v[1];
    v[2] = a.xyz[2] - b.xyz[2];
    v[2] = v[2] * v[2];
    float len = v[2] + v[1] + v[0];
    return (float)sqrt(len);
}

// Retail 0x00437400: flip every terrain quad diagonal that is longer than the other one.
void FUN_00437400()
{
    int nFaces = 0;
    int nBrushes = 0;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch || b->patch->def->type_10 != 0x40)
            continue;
        patchMesh_t *p = b->patch->def;
        bool bFlipped = false;
        for (int x = 0; x < p->width - 1; x++)
        {
            for (int y = 0; y < p->height - 1; y++)
            {
                PatchControl a = p->ctrl[x + 1][y + 1];
                PatchControl a0 = p->ctrl[x][y];
                float d1 = sqrt((a0.xyz[0] - a.xyz[0]) * (a0.xyz[0] - a.xyz[0]) + (a0.xyz[1] - a.xyz[1]) * (a0.xyz[1] - a.xyz[1]) + (a0.xyz[2] - a.xyz[2]) * (a0.xyz[2] - a.xyz[2]));
                PatchControl c = p->ctrl[x][y + 1];
                PatchControl c0 = p->ctrl[x + 1][y];
                float d2 = sqrt((c0.xyz[0] - c.xyz[0]) * (c0.xyz[0] - c.xyz[0]) + (c0.xyz[1] - c.xyz[1]) * (c0.xyz[1] - c.xyz[1]) + (c0.xyz[2] - c.xyz[2]) * (c0.xyz[2] - c.xyz[2]));
                if (d1 == d2)
                    continue;
                if (p->ctrl[x][y].flags_34 & 1)
                {
                    if (d1 < d2)
                        continue;
                }
                else if (d1 > d2)
                    continue;
                if (!bFlipped)
                {
                    FUN_004433b0();
                    Undo_GeneralStart("Turn terrain edge");
                    Undo_AddBrush((brushdef_t *)p->cache_3828);
                }
                p->ctrl[x][y].flags_34 ^= 1;
                bFlipped = true;
                nFaces++;
            }
        }
        if (bFlipped)
        {
            nBrushes++;
            FUN_004269d0(p, true);
        }
        undo_proj *u = DAT_0109fdcc;
        if (u && u->field_0c == 0)
        {
            brushdef_t *def = (brushdef_t *)p->cache_3828;
            *(int *)((char *)def + 0x10) = u->field_08;
            entity_t *e = *(entity_t **)((char *)def + 8);
            if (e->eclass->fixedsize)
                *(int *)((char *)e + 0x6c) = u->field_08;
        }
        Undo_End();
    }
    Sys_Printf("Autofliped %i faces in %i brushes.\n", nFaces, nBrushes);
    DAT_0123348c = -1;
}

// Retail 0x00437730: pick the terrain patch edge under a ray and flip its diagonal.
void FUN_00437730(const float *origin, const float *dir)
{
    float t, bestT = 3.402823466e+38f;
    int bestY = 0, x, y;
    patchMesh_t *best = NULL;
    int bestX = 0;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch || b->patch->def->type_10 != 0x40)
            continue;
        if (FUN_00436dc0(origin, dir, b->patch, &t, &y, &x, 0, 0) && bestT > t)
        {
            bestT = t;
            bestY = y;
            bestX = x;
            best = b->patch->def;
        }
    }
    if (!best)
        return;
    FUN_004433b0();
    Undo_GeneralStart("Turn terrain edge");
    Undo_AddBrush((brushdef_t *)best->cache_3828);
    best->ctrl[bestX][bestY].flags_34 ^= 1;
    FUN_004269d0(best, true);
    brushdef_t *def = (brushdef_t *)best->cache_3828;
    DAT_0123348c = -1;
    undo_proj *u = DAT_0109fdcc;
    if (u && u->field_0c == 0)
    {
        *(int *)((char *)def + 0x10) = u->field_08;
        entity_t *e = *(entity_t **)((char *)def + 8);
        if (e->eclass->fixedsize)
            *(int *)((char *)e + 0x6c) = u->field_08;
    }
    Undo_End();
}

// Retail 0x00437890: build a 2x3 inverse basis matrix from two vectors and two axes (false when degenerate).
bool FUN_00437890(const float *a, float *out, const float *s, const float *t, const float *b)
{
    float det = (a[1] - a[2]) * b[0] + (b[2] - b[1]) * a[0] + a[2] * b[1] - b[2] * a[1];
    if (det <= -0.001f || det >= 0.001f)
    {
        det = 1.0f / det;
        out[0] = ((a[1] - a[2]) * t[0] + (a[2] - a[0]) * t[1] + (a[0] - a[1]) * t[2]) * det;
        out[3] = ((a[0] - a[1]) * s[2] + (a[2] - a[0]) * s[1] + (a[1] - a[2]) * s[0]) * det;
        out[1] = ((b[1] - b[0]) * t[2] + (b[2] - b[1]) * t[0] + (b[0] - b[2]) * t[1]) * det;
        out[4] = ((b[2] - b[1]) * s[0] + (b[1] - b[0]) * s[2] + (b[0] - b[2]) * s[1]) * det;
        out[2] = ((a[2] * b[1] - b[2] * a[1]) * t[0] + (b[0] * a[1] - a[0] * b[1]) * t[2] + (b[2] * a[0] - b[0] * a[2]) * t[1]) * det;
        out[5] = ((b[0] * a[1] - a[0] * b[1]) * s[2] + (a[2] * b[1] - b[2] * a[1]) * s[0] + (b[2] * a[0] - b[0] * a[2]) * s[1]) * det;
        return true;
    }
    return false;
}

// Retail 0x004379f0: derive scale, shift and rotation of a terrain patch texture mapping (false if not uniform).
bool FUN_004379f0(patchMesh_t *p, float *out)
{
    plane_t plane;
    int ix[3], iy[3];
    float xv[3], yv[3];
    if (!FUN_00425f40(p, &plane))
        return false;
    if (!FUN_00425d10(p, iy, ix))
        return false;
    TextureAxisFromPlane(plane.normal, xv, yv);
    float pa[3], pb[3], ps[3], pt[3];
    for (int k = 0; k < 3; k++)
    {
        PatchControl *c = &p->ctrl[ix[k]][iy[k]];
        pb[k] = yv[1] * c->xyz[1] + yv[2] * c->xyz[2] + yv[0] * c->xyz[0];
        pa[k] = xv[1] * c->xyz[1] + xv[2] * c->xyz[2] + xv[0] * c->xyz[0];
        pt[k] = c->st[DAT_01128d94][0];
        ps[k] = c->st[DAT_01128d94][1];
    }
    float m[6];
    if (!FUN_00437890(pa, m, ps, pt, pb))
        return false;
    if (m[0] == 0.0f && m[1] == 0.0f)
        return false;
    if (m[3] == 0.0f && m[4] == 0.0f)
        return false;
    const int *image = (const int *)(&p->image_18)[DAT_01128d90];
    for (int x = 0; x < p->width; x++)
    {
        for (int y = 0; y < p->height; y++)
        {
            PatchControl *c = &p->ctrl[x][y];
            float v1 = yv[1] * c->xyz[1] + yv[2] * c->xyz[2] + yv[0] * c->xyz[0];
            float v2 = xv[1] * c->xyz[1] + xv[2] * c->xyz[2] + xv[0] * c->xyz[0];
            float ds = (float)fabs(v2 * m[1] + v1 * m[0] + m[2] - c->st[DAT_01128d94][0]);
            float dt = (float)fabs(v2 * m[4] + v1 * m[3] + m[5] - c->st[DAT_01128d94][1]);
            if ((float)image[5] * ds > 0.001f)
                return false;
            if ((float)image[6] * dt > 0.001f)
                return false;
        }
    }
    for (int i = 0; i < 2; i++)
    {
        float *row = &m[i * 3];
        out[3 + i] = row[2];
        float len = (float)fabs(sqrt(row[1] * row[1] + row[0] * row[0]));
        out[1 + i] = len;
        if (len == 0.0f)
            return false;
        row[0] = row[0] / len;
        row[1] = row[1] / len;
        (void)(1.0f / len);
    }
    float angle = (float)atan2(m[3], m[4]) * 57.29578f;
    out[5] = angle;
    float rounded = (float)floor(angle + 0.5f);
    if ((float)fabs(rounded - angle) >= 0.001f)
        return false;
    out[5] = rounded;
    return true;
}

// Retail 0x00437e50: insert a row or column in a terrain patch between two adjacent selected points.
void FUN_00437e50()
{
    PatchPair pair;
    bool bUpdate = false;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 7449
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if (!(p->type_10 & 0x40))
            continue;
        if (!FUN_00429a00(p, &pair))
            continue;
        if (pair.x[0] == pair.x[1])
        {
            if (pair.y[0] == pair.y[1] + 1)
                FUN_00430610(p, pair.y[0]);
            else if (pair.y[1] == pair.y[0] + 1)
                FUN_00430610(p, pair.y[1]);
            else
                Sys_Printf("vertices must be adjacent to insert a row or column\n");
        }
        else
        {
#line 7467
            assert( pair.y[0] == pair.y[1] );
            if (pair.x[0] == pair.x[1] + 1)
                FUN_00430220(p, pair.x[0]);
            else if (pair.x[1] == pair.x[0] + 1)
                FUN_00430220(p, pair.x[1]);
            else
                Sys_Printf("vertices must be adjacent to insert a row or column\n");
        }
        bUpdate = true;
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
    }
    if (!bUpdate)
        return;
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
    DAT_0123348c = -1;
}

// 0x00438020 (241 B): add a control row or column next to the selected terrain vertices
void FUN_00438020()
{
    bool bChanged = false;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            continue;
#line 7505
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if (!(p->type_10 & 0x40))
            continue;
        int x, y;
        if (!FUN_00429bc0(p, &x, &y))
            continue;
        if (x >= 0)
            FUN_0042fda0(p, x);
        else
            FUN_00430010(p, y);
        bChanged = true;
        FUN_004269d0(p, bChanged);
    }
    if (bChanged)
    {
        if (g_PatchDialog.GetSafeHwnd())
            g_PatchDialog.GetPatchInfo();
        DAT_0123348c = -1;
    }
}


/* r21: retail convention test. Adding an unreferenced
   static void c_probe_unused(void (**out)(patchMesh_t *, int)) { out[0] = FUN_0042fda0; out[1] = FUN_00430010; }
   makes LTCG keep the stack convention (the probe itself is dropped from the exe) and 0x438020
   MATCHES 100%. Not landed: the retail image holds no pointer to either function, so the probe is
   invented code. 42fda0/430010 then sit at 39%/30%: p in ebx vs retail esi + reload from [ebp+8]. */

// Retail 0x00438120: delete the selection; patch rows/columns first, else the brush with its entity links.
void FUN_00438120()
{
    int x, y;
    bool bRemoved = false;
    brush_t *b;
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch && DAT_010a44b4.next->next == &DAT_010a44b4 && FUN_00465d80(b->owner->def, "targetname"))
            break;
#line 7604
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if ((p->type_10 & 0x40) && FUN_00429bc0(p, &x, &y))
        {
            if (x < 0)
                FUN_004309e0(p, y);
            else
                FUN_00430b10(p, x);
            bRemoved = true;
            FUN_004269d0(p, bRemoved);
        }
    }
    if (b == &DAT_010a44b4)
    {
        if (!bRemoved)
            return;
        if (g_PatchDialog.GetSafeHwnd())
            g_PatchDialog.GetPatchInfo();
        DAT_0123348c = -1;
        return;
    }
    entity_t *e = b->owner->def;
    const char *name = ValueForKey(*(epair_t **)((char *)e + 0x64), "targetname");
    const char *newTarget = NULL;
    if (FUN_00465d80(e, "target"))
    {
        newTarget = ValueForKey(*(epair_t **)((char *)e + 0x64), "target");
        for (brush_t *n = DAT_010a44dc.next; n != &DAT_010a44dc; n = n->next)
        {
            entity_t *o = n->owner->def;
            if (FUN_00465e10(o, "target", name))
                FUN_00465bf0(o, "target", newTarget);
        }
    }
    else
    {
        for (brush_t *n = DAT_010a44dc.next; n != &DAT_010a44dc; n = n->next)
        {
            entity_t *o = n->owner->def;
            if (FUN_00465e10(o, "target", name))
            {
                DeleteKey(*(epair_t **)((char *)o + 0x64), "target");
                FUN_004655f0(o, "target");
                FUN_004657a0(o, "target");
            }
        }
        newTarget = NULL;
    }
    FUN_004433b0();
    Undo_GeneralStart("delete");
    Undo_AddBrushList((selbrush_t *)&DAT_010a44b4);
    for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        entity_t *o = b->owner->def;
        if (DAT_0109fdcc)
        {
            FUN_00443fd0(o);
            if (o != DAT_012334ec->def)
            {
                brush_t *head = &((entity_brushes_proj *)o->field_38)->head;
                for (brush_t *eb = head->next; eb != head; eb = eb->next)
                    FUN_00443d90((brushdef_t *)eb);
            }
        }
        else
            Sys_Printf("Undo_AddEntity: no last undo.\n");
    }
    FUN_0046fb30();
    FUN_00443f80((selbrush_t *)&DAT_010a44b4);
    Undo_End();
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
    if (newTarget)
    {
        brush_t *n;
        while ((n = DAT_010a44dc.next) != &DAT_010a44dc)
        {
            while (!FUN_00465e10(n->owner->def, "targetname", newTarget))
            {
                n = n->next;
                if (n == &DAT_010a44dc)
                {
                    DAT_0123348c = -1;
                    return;
                }
            }
            FUN_0046f0b0(n, 1, 1, 0);
        }
    }
    DAT_0123348c = -1;
}

// Retail 0x00438430: start index and step of a walk over the control grid (regs: eax, edx, ecx, edi).
void FUN_00438430(int *startW, const patchMesh_t *p, int *stepW, int *startH, int a, int b, int c, int *stepH)
{
    if (!a)
    {
        if (!c)
        {
            *startW = c;
            *stepW = 1;
        }
        else
        {
            *startW = p->width - 1;
            *stepW = -1;
        }
        if (!b)
        {
            *startH = b;
            *stepH = b;
            return;
        }
        *startH = p->height - 1;
        *stepH = 0;
    }
    else
    {
        if (!b)
            *startW = b;
        else
            *startW = p->width - 1;
        *stepW = 0;
        if (!c)
        {
            *startH = c;
            *stepH = 1;
            return;
        }
        *startH = p->height - 1;
        *stepH = -1;
    }
}

// Retail 0x00438510: stitch brush pb0's patch onto the end of pb1's patch, then free pb0.
void FUN_00438510(brush_t *pb1, brush_t *pb0, const int *a3, const int *a4, const int *a5)
{
#line 7721
    assert( pb0->patch->def == pb0->def->patch );
#line 7722
    assert( pb1->patch->def == pb1->def->patch );
    patchMesh_t *pm0 = pb0->patch->def;
    patchMesh_t *pm1 = pb1->patch->def;
    int swapped = a5[0];
    int inv0 = 1 - a4[0];
    if (a3[0] != 1)
        FUN_00435230(pm0);
    if (inv0 != 1)
        FUN_00432950(pm0);
    if (swapped != 0)
        FUN_00432a60(pm0);
    int swapped1 = a5[1];
    int inv1 = a4[1];
    bool bToggled = false;
    bool bFlipped = false;
    if (a3[1] != 1)
    {
        bToggled = true;
        FUN_00435230(pm1);
    }
    if (inv1 != 1)
    {
        bFlipped = true;
        FUN_00432950(pm1);
    }
    if (swapped1 != 0)
    {
        bFlipped = !bFlipped;
        FUN_00432a60(pm1);
    }
#line 7729
    assert( pm0->height == pm1->height );
    for (int j = 0; j < pm0->height; j++)
    {
#line 7731
        assert( FUN_00439620(pm1->ctrl[pm1->width - 1][j].xyz, pm0->ctrl[0][j].xyz) );
    }
    for (int j = 0; j < pm0->height; j++)
    {
        PatchControl *edge = &pm1->ctrl[pm1->width - 1][j];
        edge->flags_34 &= ~1;
        edge->flags_34 |= pm0->ctrl[0][j].flags_34 & 1;
        for (int i = 1; i < pm0->width; i++)
            memcpy(&pm1->ctrl[pm1->width - 1 + i][j], &pm0->ctrl[i][j], sizeof(PatchControl));
    }
    pm1->width += pm0->width - 1;
    if (bToggled)
        FUN_00435230(pm1);
    if (bFlipped)
    {
        FUN_00432a60(pm1);
        if (pm1->cache_3824)
            free(pm1->cache_3824);
        pm1->cache_3824 = FUN_004267d0(pm1, DAT_01128d94, NULL, NULL);
        pm1->version++;
    }
    FUN_004269d0(pm1, true);
    entity_t *owner = pb0->owner;
    if (owner == DAT_012334ec || ((brush_t **)owner)[6] != pb0 || ((brush_t **)owner)[7] != pb0)
    {
        Brush_Free(pb0);
        return;
    }
    entity_t *def = owner->def;
    if (!DAT_0109fdcc)
    {
        Sys_Printf("Undo_AddEntity: no last undo.\n");
        FUN_004678c0((entityInst_t *)pb0->owner);
        return;
    }
    FUN_00443fd0(def);
    if (def != DAT_012334ec->def)
    {
        brush_t *head = (brush_t *)((char *)def + 8);
        for (brush_t *eb = ((brush_t **)((char *)def + 0xc))[0]; eb != head; eb = eb->next)
            FUN_00443d90((brushdef_t *)eb);
    }
    FUN_004678c0((entityInst_t *)pb0->owner);
}

// Retail 0x004388b0: weld two selected patches that share one edge. Returns true when welded.
bool FUN_004388b0(brush_t *pb0, brush_t *pb1)
{
#line 7767
    assert( pb0 );
#line 7768
    assert( pb1 );
#line 7769
    assert( pb0 != pb1 );
#line 7797
    assert( pb0->patch->def == pb0->def->patch );
#line 7798
    assert( pb1->patch->def == pb1->def->patch );
    patchMesh_t *pm0 = pb0->patch->def;
    patchMesh_t *pm1 = pb1->patch->def;
    bool bFound = false;
    int m0[2], m1[2], m2[2];
    for (int e0 = 0; e0 < 2; e0++)
    {
        int len0 = e0 ? pm0->height : pm0->width;
        for (int e1 = 0; e1 < 2; e1++)
        {
            int len1 = e1 ? pm1->height : pm1->width;
            if (len0 != len1)
                continue;
            for (int f0 = 0; f0 < 2; f0++)
            {
                int startCol0, stepCol0, startRow0, stepRow0;
                FUN_00438430(&startCol0, pm0, &stepCol0, &startRow0, e0, f0, 0, &stepRow0);
                for (int f1 = 0; f1 < 2; f1++)
                {
                    for (int rev = 0; rev < 2; rev++)
                    {
                        int startCol1, stepCol1, startRow1, stepRow1;
                        FUN_00438430(&startCol1, pm1, &stepCol1, &startRow1, e1, f1, rev, &stepRow1);
                        int c0 = startCol0, r0 = startRow0;
                        int c1 = startCol1, r1 = startRow1;
                        int n = 0;
                        for (; n < len0; n++)
                        {
                            int k = 0;
                            for (; k < 3; k++)
                            {
                                float d = pm1->ctrl[c1][r1].xyz[k] - pm0->ctrl[c0][r0].xyz[k];
                                if (d * d > 1.0000001e-06f)
                                    break;
                            }
                            if (k < 3)
                                break;
                            c0 += stepCol0;
                            r0 += stepRow0;
                            c1 += stepCol1;
                            r1 += stepRow1;
                        }
                        if (n != len0)
                            continue;
                        if (bFound)
                        {
                            Sys_Printf("Cannot weld patches; more than one edge matches\n");
                            return false;
                        }
                        int newEdge = pm1->height + pm1->width + pm0->width + pm0->height - len0 * 2 - 1;
                        if (newEdge > 16)
                        {
                            Sys_Printf("Cannot weld patches; new edge size of %i is bigger than %i\n", newEdge, 16);
                            return false;
                        }
                        m0[0] = e0;
                        m0[1] = e1;
                        m1[0] = f0;
                        m1[1] = f1;
                        m2[0] = 0;
                        m2[1] = rev;
                        bFound = true;
                    }
                }
            }
        }
    }
    if (!bFound)
        return false;
    FUN_00438510(pb1, pb0, m0, m1, m2);
    return true;
}

// Retail 0x00438ca0: weld the selected patches that share an entity, as one undo step.
bool FUN_00438ca0()
{
    bool bWorld = false;
    bool bOther = false;
    entity_t *prev = NULL;
    for (brush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (!b->patch)
            return false;
        entity_t *owner = b->owner;
        if (FUN_00466060(ValueForKey(*(epair_t **)((char *)owner->def + 0x64), "classname")))
        {
            if (bOther)
                return false;
            bWorld = true;
        }
        else
        {
            if (bWorld)
                return false;
            if (prev && prev != owner)
                return false;
            bOther = true;
        }
        prev = owner;
    }
    FUN_004433b0();
    Undo_GeneralStart("weld meshes");
    Undo_AddBrushList((selbrush_t *)&DAT_010a44b4);
    for (;;)
    {
        brush_t *a = DAT_010a44b4.next;
        for (; a != &DAT_010a44b4; a = a->next)
        {
            brush_t *b;
            for (b = a->next; b != &DAT_010a44b4; b = b->next)
            {
                if (!((b->def->patch->type_10 ^ a->def->patch->type_10) & 0x40) && FUN_004388b0(b, a))
                    break;
            }
            if (b != &DAT_010a44b4)
                break;
        }
        if (a == &DAT_010a44b4)
            break;
    }
    FUN_00443f80((selbrush_t *)&DAT_010a44b4);
    Undo_End();
    if (g_PatchDialog.GetSafeHwnd())
        g_PatchDialog.GetPatchInfo();
    DAT_0123348c = -1;
    return true;
}

// Retail 0x00438de0: copy the part of a patch past a row or column into a new patch brush and trim the original.
void FUN_00438de0(patchMesh_t *p, int col, int row, entity_t *owner)
{
#line 7942
    assert( col == 0 || row == 0 );
    patchMesh_t *np = MakeNewPatch();
    np->image_18 = p->image_18;
    np->lightmap_1c = p->lightmap_1c;
    np->width = p->width - col;
    np->height = p->height - row;
    np->field_08 = p->field_08;
    np->type_10 = p->type_10;
    np->style_14 = p->style_14;
    np->value_3834 = p->value_3834;
    np->flag_382f = p->flag_382f;
    for (int i = col; i < p->width; i++)
        for (int j = row; j < p->height; j++)
            memcpy(&np->ctrl[i - col][j - row], &p->ctrl[i][j], sizeof(PatchControl));
    brushowner_proj *pNewBrush = (brushowner_proj *)AddBrushForPatch(np, owner->def);
    FUN_004269d0(np, true);
    patchsym_proj *pm = (patchsym_proj *)p;
#line 7961
    assert( pNewBrush->owner == pm->symbiot->owner );
#line 7962
    assert( pNewBrush->owner == owner->def );
    FUN_00459210(FUN_00458440((brushdef_t *)pNewBrush, owner), &DAT_010a44b4);
    if (col)
        p->width = col + 1;
    else
        p->height = row + 1;
    FUN_004269d0(p, true);
}

// Retail 0x00438ff0: split each selected patch at the selected control row or column.
void FUN_00438ff0()
{
    FUN_004433b0();
    Undo_GeneralStart("split patches");
    Undo_AddBrushList((selbrush_t *)&DAT_010a44b4);
    bool bSplit = false;
    for (;;)
    {
        brush_t *b;
        for (b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
        {
            if (!b->patch)
                continue;
#line 7995
            assert( b->patch->def == b->def->patch );
            patchMesh_t *p = b->patch->def;
            int x, y;
            if (!FUN_00429bc0(p, &x, &y))
                continue;
            if (x < 0)
            {
                if (y != 0 && y != p->height - 1)
                {
                    if ((p->type_10 & 0x40) || !(y & 1))
                    {
                        FUN_00438de0(p, 0, y, b->owner);
                        bSplit = true;
                        break;
                    }
                    Sys_Printf("can only split curves on odd rows and columns");
                }
            }
            else if (x != 0 && x != p->width - 1)
            {
                if ((p->type_10 & 0x40) || !(x & 1))
                {
                    FUN_00438de0(p, x, 0, b->owner);
                    bSplit = true;
                    break;
                }
                Sys_Printf("can only split curves on odd rows and columns");
            }
        }
        if (b == &DAT_010a44b4)
            break;
    }
    FUN_00443f80((selbrush_t *)&DAT_010a44b4);
    Undo_End();
    if (bSplit)
    {
        if (g_PatchDialog.GetSafeHwnd())
            g_PatchDialog.GetPatchInfo();
        DAT_0123348c = -1;
    }
}

// 0x004393c0 (142 B), p in edx
void FUN_004393c0(patchMesh_t *p)
{
    p->field_20 = ((int *)&p->image_18)[DAT_01128d90];
    p->field_3830[0] = p->flag_382f;
    const int *pLayer = &DAT_01128d94;
    for (int j = 0; j < p->height; j++)
    {
        for (int i = 0; i < p->width; i++)
        {
            int *dst = (int *)p->ctrl[i][j].field_2c;
            const int *src = (const int *)p->ctrl[i][j].st[*pLayer];
            dst[0] = src[0];
            dst[1] = src[1];
        }
    }
}

// 0x00439450 (147 B), p in ecx: undo of 0x4393c0
void FUN_00439450(patchMesh_t *p)
{
    ((int *)&p->image_18)[DAT_01128d90] = p->field_20;
    p->flag_382f = p->field_3830[0];
    for (int j = 0; j < p->height; j++)
    {
        for (int i = 0; i < p->width; i++)
        {
            int *dst = (int *)p->ctrl[i][j].st[DAT_01128d94];
            const int *src = (const int *)p->ctrl[i][j].field_2c;
            dst[0] = src[0];
            dst[1] = src[1];
        }
    }
    FUN_004269d0(p, true);
}

void FUN_0042fad0(patchMesh_t *p, int amount)
{
    float scale = (float)amount;
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, scale);
    else
        FUN_00426f20(p, 1, scale);
    p->value_3834 = scale;
    p->flag_382f = 1;
    if (DAT_01128d90 == 1)
    {
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
    }
}

// RTTI .?AVAbstractFileWrapper@@; the slot 0 name is unknown, it is named after its first body 0x00467df0
class AbstractFileWrapper
{
public:
    virtual void FUN_00467df0(const char *fmt, ...) = 0;
};
// defined as UNKNOWN_0054ebb0 in UNKNOWN_00420930.cpp
class UNKNOWN_0054ebb0;
void FUN_00420b30(UNKNOWN_0054ebb0 *f, int contents);
void FUN_00420b50(UNKNOWN_0054ebb0 *f, int toolFlags);

// 0x004321c0 (282 B), vert in eax, stream in esi
void FUN_004321c0(PatchControl *patchVert, AbstractFileWrapper *f, int stCount)
{
#line 4834
    assert( patchVert );
    f->FUN_00467df0("\tv %.8g %.8g %.8g", patchVert->xyz[0], patchVert->xyz[1], patchVert->xyz[2]);
    if (patchVert->color_28[0] != 0xff || patchVert->color_28[1] != 0xff || patchVert->color_28[2] != 0xff || patchVert->color_28[3] != 0xff)
        f->FUN_00467df0(" c %i %i %i %i", patchVert->color_28[2], patchVert->color_28[1], patchVert->color_28[0], patchVert->color_28[3]);
    f->FUN_00467df0(" t");
    for (int i = 0; i < stCount; i++)
        f->FUN_00467df0(" %.8g %.8g", patchVert->st[i][0] * 1024.0f, patchVert->st[i][1] * 1024.0f);
    if (patchVert->flags_34)
        f->FUN_00467df0(" f %i", patchVert->flags_34);
    f->FUN_00467df0("\n");
}

// 0x004322e0 (324 B), patch in edi, stream in eax
void FUN_004322e0(patchMesh_t *p, AbstractFileWrapper *f)
{
    if (p->type_10 & 0x40)
        f->FUN_00467df0(" {\n  mesh\n  {\n");
    else
        f->FUN_00467df0(" {\n  curve\n  {\n");
    FUN_00420b30((UNKNOWN_0054ebb0 *)f, p->field_08);
    FUN_00420b50((UNKNOWN_0054ebb0 *)f, p->field_0c);
    f->FUN_00467df0("   %s\n", ((material_t *)p->image_18)->name);
    f->FUN_00467df0("   %s\n", ((material_t *)p->lightmap_1c)->name);
    f->FUN_00467df0("   %i %i %g %i\n", p->width, p->height, p->flag_382f ? p->value_3834 : 0.0f, p->style_14);
    for (int i = 0; i < p->width; i++)
    {
        f->FUN_00467df0("   (\n");
        for (int j = 0; j < p->height; j++)
            FUN_004321c0(&p->ctrl[i][j], f, 2);
        f->FUN_00467df0("   )\n");
    }
    f->FUN_00467df0("  }\n }\n");
}

void FUN_004325d0(patchMesh_t *p, int c)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (g_qeglobals.d_select_mode == 4 && FUN_00429df0(NULL, (int)&p->ctrl[i][j]) == -1)
                continue;
            float *st = &p->ctrl[i][j].st[DAT_01128d94][c];
            *st = 1.0f - *st;
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_004326b0(patchMesh_t *p, float scaleS, float scaleT)
{
    if (scaleS == 0.0f)
        scaleS = 1.0f;
    if (scaleT == 0.0f)
        scaleT = 1.0f;
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (g_qeglobals.d_select_mode == 4 && FUN_00429df0(NULL, (int)&p->ctrl[i][j]) == -1)
                continue;
            p->ctrl[i][j].st[DAT_01128d94][0] *= scaleS;
            p->ctrl[i][j].st[DAT_01128d94][1] *= scaleT;
        }
    }
    if (scaleS == scaleT)
    {
        scaleS *= p->value_3834;
        if (DAT_01128d94 == 1)
        {
            p->flag_382f = 1;
            p->value_3834 = scaleS;
        }
    }
    else if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_00433830(patchMesh_t *p)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[i][j].st[DAT_01128d94][0] = (float)i / (float)(p->width - 1);
            p->ctrl[i][j].st[DAT_01128d94][1] = (float)j / (float)(p->height - 1);
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}


// same flip across the rows
void FUN_00432950(patchMesh_t *p)
{
    PatchControl tmp;
    for (int j = 0; j < p->height; j++)
    {
        for (int i = 0; i < p->width / 2; i++)
        {
            tmp = p->ctrl[p->width - 1 - i][j];
            p->ctrl[p->width - 1 - i][j] = p->ctrl[i][j];
            p->ctrl[i][j] = tmp;
        }
        if (p->type_10 & 0x40)
        {
            for (int i = 1; i < p->width; i++)
                p->ctrl[i - 1][j].flags_34 = (p->ctrl[i - 1][j].flags_34 & ~1) | (p->ctrl[i][j].flags_34 & 1);
        }
    }
}

// Q3 Patch_InvertTexture shape: flip each column, keep the seam bit with it
void FUN_00432a60(patchMesh_t *p)
{
    PatchControl tmp;
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height / 2; j++)
        {
            tmp = p->ctrl[i][p->height - 1 - j];
            p->ctrl[i][p->height - 1 - j] = p->ctrl[i][j];
            p->ctrl[i][j] = tmp;
        }
        if (p->type_10 & 0x40)
        {
            for (int j = 1; j < p->height; j++)
                p->ctrl[i][j - 1].flags_34 = (p->ctrl[i][j - 1].flags_34 & ~1) | (p->ctrl[i][j].flags_34 & 1);
        }
    }
}

void FUN_00432b70(patchMesh_t *p)
{
    FUN_00432a60(p);
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

extern patchMesh_t DAT_0109c538;

void FUN_00432f00(patchMesh_t *p)
{
    DAT_0109c538.width = p->width;
    DAT_0109c538.height = p->height;
    DAT_0109c538.type_10 = p->type_10;
    memcpy(DAT_0109c538.ctrl, p->ctrl, sizeof(p->ctrl));
}

void FUN_00432f30(patchMesh_t *p)
{
    p->width = DAT_0109c538.width;
    p->height = DAT_0109c538.height;
    p->type_10 = DAT_0109c538.type_10;
    memcpy(p->ctrl, DAT_0109c538.ctrl, sizeof(p->ctrl));
}

bool OnlyPatchesSelected()
{
    if (g_ptrSelectedFaces.GetSize() > 0 || selected_brushes.next == &selected_brushes)
        return false;
    for (brush_t *pb = selected_brushes.next; pb != &selected_brushes; pb = pb->next)
    {
        if (!pb->patch)
            return false;
    }
    return true;
}

bool AnyPatchesSelected()
{
    for (brush_t *pb = selected_brushes.next; pb != &selected_brushes; pb = pb->next)
    {
        if (pb->patch)
            return true;
    }
    return false;
}

extern void Sys_Printf(const char *fmt, ...);

static bool QE_SingleBrush_Pmesh(bool bQuiet)
{
    if (selected_brushes.next == &selected_brushes || selected_brushes.next->next != &selected_brushes)
    {
        if (!bQuiet)
            Sys_Printf("Error: you must have a single brush selected\n");
        return false;
    }
    if (selected_brushes.next->owner->def->eclass->fixedsize)
    {
        if (!bQuiet)
            Sys_Printf("Error: you cannot manipulate fixed size entities\n");
        return false;
    }
    return true;
}

patchMesh_t *SinglePatchSelected()
{
    if (QE_SingleBrush_Pmesh(false))
    {
        brush_t *b = selected_brushes.next;
        if (b->patch)
            return b->patch->def;
    }
    return NULL;
}

extern patchMesh_t DAT_0109c538;
extern int DAT_0123348c;
extern CWnd DAT_012335a0;
extern int DAT_005909fc;
extern bool DAT_00590a04;
extern bool DAT_00590a05;
extern const char *DAT_00590a08[];
extern int DAT_012334bc;
extern int DAT_012334c0;
extern "C" void FUN_00409690(const char *text);

void FUN_00433b90()
{
    if (!DAT_012334ba)
        return;
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        FUN_00433ad0();
        Sys_Printf("No patch to bend!");
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Patch_BendHandleTAB: Bending of terrain curves not implemented\n");
        return;
    }
    bool bShift = ((unsigned)GetKeyState(VK_SHIFT) >> 15) & 1;
    if (DAT_005909fc == 0)
    {
        DAT_012334c0 += bShift ? -2 : 2;
        if (DAT_00590a04)
        {
            if (bShift ? DAT_012334c0 <= 0 : DAT_012334c0 >= p->height)
            {
                DAT_00590a04 = false;
                DAT_012334c0 = bShift ? p->width - 1 : 1;
            }
        }
        else if (bShift ? DAT_012334c0 <= 0 : DAT_012334c0 >= p->width)
        {
            DAT_00590a04 = true;
            DAT_012334c0 = bShift ? p->height - 1 : 1;
        }
    }
    else if (DAT_005909fc == 1)
    {
        DAT_012334bc += bShift ? -1 : 1;
        if (DAT_00590a04)
        {
            if (bShift)
            {
                if (DAT_012334bc < 0)
                    DAT_012334bc = p->width - 1;
            }
            else if (DAT_012334bc > p->width - 1)
                DAT_012334bc = 0;
            const float *xyz = p->ctrl[DAT_012334bc][DAT_012334c0].xyz;
            g_vBendOrigin[0] = xyz[0];
            g_vBendOrigin[1] = xyz[1];
            g_vBendOrigin[2] = xyz[2];
        }
        else
        {
            if (bShift)
            {
                if (DAT_012334bc < 0)
                    DAT_012334bc = p->height - 1;
            }
            else if (DAT_012334bc > p->height - 1)
                DAT_012334bc = 0;
            const float *xyz = p->ctrl[DAT_012334c0][DAT_012334bc].xyz;
            g_vBendOrigin[0] = xyz[0];
            g_vBendOrigin[1] = xyz[1];
            g_vBendOrigin[2] = xyz[2];
        }
    }
    else if (DAT_005909fc == 2)
        DAT_00590a05 ^= 1;
    DAT_0123348c = -1;
}

void FUN_00433e30()
{
    if (DAT_012334ba)
    {
        FUN_00433ad0();
        patchMesh_t *p = SinglePatchSelected();
        if (p)
        {
            p->width = DAT_0109c538.width;
            p->height = DAT_0109c538.height;
            p->type_10 = DAT_0109c538.type_10;
            memcpy(p->ctrl, DAT_0109c538.ctrl, sizeof(p->ctrl));
        }
        DAT_0123348c = -1;
    }
}

void Patch_SetBendRotateOrigin()
{
    int nType = reinterpret_cast<const CPatchBendMainProjection *>(g_pParentWnd)->m_pActiveXY->m_nViewType;
    int nDim3 = (nType == 2) ? 2 : (nType == 0) ? 0 : 1;
    g_vBendOrigin[nDim3] = 0.0f;
    g_vRotateOrigin[0] = g_vBendOrigin[0];
    g_vRotateOrigin[1] = g_vBendOrigin[1];
    g_vRotateOrigin[2] = g_vBendOrigin[2];
}

void FUN_004340e0()
{
    if (DAT_012334b9)
    {
        FUN_00434040();
        DAT_0123348c = -1;
    }
}

extern const char *DAT_00590a1c[];
extern int DAT_00590a00;

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00434100() {}

void FUN_00434110()
{
    if (!DAT_012334b9)
    {
        FUN_00434040();
        return;
    }
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        FUN_00433ad0();
        Sys_Printf("No patch to bend!");
        return;
    }
    DAT_012334c0 += 2;
    if (DAT_00590a04)
    {
        if (DAT_012334c0 >= p->height - 1)
        {
            DAT_00590a04 = false;
            DAT_012334c0 = 0;
        }
    }
    else if (DAT_012334c0 >= p->width - 1)
    {
        DAT_00590a04 = true;
        DAT_012334c0 = 0;
    }
    DAT_0123348c = -1;
}

// Q3 Patch_GetTextureName
const char *FUN_00434850()
{
    patch_t *pp = DAT_010a44b4.next->patch;
    if (pp)
        return ((material_t *)(&pp->def->image_18)[DAT_01128d90])->name;
    return "";
}

// Q3 Patch_Transpose
void FUN_00435230(patchMesh_t *p)
{
    int i, j, w;
    PatchControl tmp;

    if (p->type_10 & 0x40)
    {
        for (i = 0; i < p->width; i++)
        {
            for (j = 0; j < p->height; j++)
                p->ctrl[i][j].flags_34 ^= 1;
        }
    }

    if (p->width > p->height)
    {
        for (i = 0; i < p->height; i++)
        {
            for (j = i + 1; j < p->width; j++)
            {
                if (j < p->height)
                {
                    tmp = p->ctrl[j][i];
                    p->ctrl[j][i] = p->ctrl[i][j];
                    p->ctrl[i][j] = tmp;
                }
                else
                {
                    p->ctrl[i][j] = p->ctrl[j][i];
                }
            }
        }
    }
    else
    {
        for (i = 0; i < p->width; i++)
        {
            for (j = i + 1; j < p->height; j++)
            {
                if (j < p->width)
                {
                    tmp = p->ctrl[i][j];
                    p->ctrl[i][j] = p->ctrl[j][i];
                    p->ctrl[j][i] = tmp;
                }
                else
                {
                    p->ctrl[j][i] = p->ctrl[i][j];
                }
            }
        }
    }

    w = p->width;
    p->width = p->height;
    p->height = w;
}

void FUN_00435840()
{
    for (brush_t *b = DAT_010a44dc.next; b && b != &DAT_010a44dc; b = b->next)
    {
        if (b->patch)
        {
#line 6282
            assert( b->patch->def == b->def->patch );
            patchMesh_t *p = b->patch->def;
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
        }
    }
}

void FUN_00439160(int amount)
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->patch)
            continue;
        patchMesh_t *p = b->patch->def;
        if (p->type_10 & 0x40)
            continue;
#line 8062
        assert( p == b->def->patch );
        if (amount < 0 && p->style_14 == 1)
            continue;
        if (amount > 0)
        {
            mesh_t *m = (mesh_t *)p->cache_3824;
            if (m->width <= p->width && m->height <= p->height)
                continue;
        }
        mesh_t *m = (mesh_t *)p->cache_3824;
        int oldCount = m->height * m->width;
        p->style_14 += amount;
        for (;;)
        {
            if (p->style_14 < 1)
            {
                p->style_14 = 1;
                break;
            }
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
            m = (mesh_t *)p->cache_3824;
            if (m->height * m->width != oldCount)
                break;
            p->style_14 += amount;
        }
    }
    DAT_0123348c = -1;
}


// 0x004392a0 (275 B), def in esi
void FUN_004384c0(patchMesh_t *p, bool *transposed, bool *inverted, int a, int b, int c)
{
    *transposed = false;
    *inverted = false;
    if (a != 1)
    {
        *transposed = true;
        FUN_00435230(p);
    }
    if (b != 1)
    {
        *inverted = !*inverted;
        FUN_00432950(p);
    }
    if (c)
    {
        *inverted = !*inverted;
        FUN_00432a60(p);
    }
}

patch_t *FUN_004392a0(patchMesh_t *def)
{
#define SYMBIOT ((symbiot_t *)def->cache_3828)
#line 8097
    assert( def );
    assertText(SYMBIOT, "def->symbiot");
    assertMsgText(SYMBIOT->refCount >= 0, "(def->symbiot->refCount >= 0)", "(def->symbiot->refCount) = %i", SYMBIOT->refCount);
    patch_t *p = new patch_t;
    memset(p, 0, sizeof(patch_t));
    p->def = def;
    p->version = def->version - 1;
    return p;
#undef SYMBIOT
}


void FUN_004394f0(const vec2_t a, const vec2_t b, vec2_t out)
{
    out[0] = a[0] - b[0];
    out[1] = a[1] - b[1];
}

void FUN_00439500(const vec2_t a, const vec2_t b, vec2_t out)
{
    out[0] = (a[0] + b[0]) * 0.5f;
    out[1] = (a[1] + b[1]) * 0.5f;
}

// Retail 0x00439520: float wrapper over the CRT cos().
float FUN_00439520(float x)
{
    return (float)cos(x);
}

// Retail 0x00439540: second copy of the float cos() wrapper.
float FUN_00439540(float x)
{
    return (float)cos(x);
}

// Retail 0x00439560: float wrapper over the CRT sin().
float FUN_00439560(float x)
{
    return (float)sin(x);
}

// Retail 0x00439580: second copy of the float sin() wrapper.
float FUN_00439580(float x)
{
    return (float)sin(x);
}

// Retail 0x004395a0: per-component lerp of two 4-vectors, a + (b - a) * t.
void FUN_004395a0(const float *a, const float *b, float *out, float t)
{
    out[0] = (b[0] - a[0]) * t + a[0];
    out[1] = (b[1] - a[1]) * t + a[1];
    out[2] = (b[2] - a[2]) * t + a[2];
    out[3] = (b[3] - a[3]) * t + a[3];
}

// Retail 0x004395e0: float to int with a tiny bias (0x556b28 = 9.313225746154785e-10).
int FUN_004395e0(float x)
{
    double bias = 9.313225746154785e-10;
    return (int)(x + bias);
}

// Retail 0x00439600: float wrapper around fabs.
float FUN_00439600(float f)
{
    return (float)fabs(f);
}

// 0x00439620 (69 B), v1 in eax, v2 in ecx
int FUN_00439620(const vec3_t v1, const vec3_t v2)
{
    int i;
    float d;

    for (i = 0; i < 3; i++)
    {
        d = v1[i] - v2[i];
        if (d * d > 0.001f * 0.001f)
            return 0;
    }
    return 1;
}

void FUN_00439670(vec2_t v)
{
    v[0] = 0.0f;
    v[1] = 0.0f;
}

void FUN_00439680(const vec2_t src, vec2_t dst)
{
    dst[0] = src[0];
    dst[1] = src[1];
}

float FUN_00439690(const vec3_t v)
{
    return v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
}

// Retail 0x004396d0: length of a vec3 (v in eax).
float FUN_004396d0(const vec3_t v)
{
    float z = v[2], y = v[1], x = v[0];
    float sum = x * x + y * y + z * z;
    return (float)sqrt(sum);
}

void FUN_00439720(unsigned char *p, unsigned char a, unsigned char b, unsigned char c, unsigned char d)
{
    p[2] = b;
    p[1] = a;
    p[0] = c;
    p[3] = d;
}
