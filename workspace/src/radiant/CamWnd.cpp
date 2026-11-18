#include "stdafx.h"
#include <stddef.h>
#include <string.h>
#include "radiant_wnd.h"
#include "../universal/com_math.h"
#include <afxtempl.h>
#include "../universal/assertive.h"
#include "PrefsDlg.h"
#include "../universal/splines/util_list.h"

// Cam_Draw context (layouts from retail accesses)
struct GfxPointVertex { float xyz[3]; unsigned char color[4]; };
int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);

struct epair_t;
struct eclass_t
{
    unsigned char pad00[4];
    char *name;
    unsigned char pad08[4];
    float mins[3];
    unsigned char pad18[0xc];
    float color[3];
    unsigned char pad30[0x160 - 0x30];
    unsigned char flags;
};
struct entity_t
{
    unsigned char pad00[0x50];
    eclass_t *eclass;
    unsigned char pad54[4];
    float origin[3];
    epair_t *epairs;
};
struct entityInst_t { unsigned char pad00[8]; entity_t *def; };
struct radMat_t { unsigned char pad00[0x1c]; int flags; };
struct texdef_t { radMat_t *radMat; float scale[2]; float shift[2]; float rotate; float crossterm; };
struct face_t { unsigned char pad00[0x24]; texdef_t texdef[2]; unsigned char pad5c[0x44]; int field_a0; unsigned char pada4[4]; };
struct brushdef_t
{
    unsigned char pad00[8];
    entity_t *owner;
    unsigned char pad0c[0x14];
    float mins[3];
    float maxs[3];
    unsigned char pad38[4];
    face_t *faces;
};
struct faceRender_t { void *matHandle; int vertCount; void *vertHandle; };
struct brush_t
{
    brush_t *prev;
    brush_t *next;
    entityInst_t *owner;
    unsigned char pad0c[8];
    brushdef_t *def;
    int faceCount;
    faceRender_t *faces;
    unsigned char pad20[6];
    unsigned char hiddenBrush;
};
struct selFace_t { brush_t *brush; faceRender_t *face; int index; };
struct CamWndKeyValue { int id; int pad; float value; unsigned char pad0c[0x14]; };

char *ValueForKey(epair_t *&e, const char *key);
bool FUN_00465d80(entity_t *e, const char *key);
bool FUN_0044f5d0(brush_t *b);
void FUN_0045d7f0(brush_t *b, int a, int c, int d, int e, int f, const unsigned int *color, int g, int h);
int FUN_0045d9a0(face_t *face, int a, const unsigned int *color, int width, int count, int max, GfxPointVertex *verts);
void FUN_0045def0(face_t *face, const unsigned int *color, int *indexCount, int maxIndices, unsigned short *indices,
                  int maxVerts, float (*xyzw)[4], float (*tex)[2], unsigned int *colors, float (*normals)[2], int *vertCount);
void FUN_0040bff0();
void FUN_0040c210();
void FUN_0040c4a0(float (*quad)[4]);
bool FUN_0042af90(const float *origin, const float *dir, float *hit, int flags);
void FUN_0042e290(float *hit);
void FUN_0045f7e0();
void FUN_00451c00(brush_t *b, unsigned char *color);

struct CAdvCurveEditDlg { int FUN_00401d90(); };
// view of splines.h idPointListInterface (splines.h does not build next to com_math.h)
class idPointListInterface
{
public:
    virtual ~idPointListInterface() {}
    virtual int numPoints() { return 0; }
    virtual void addPoint(const float x, const float y, const float z) {}
    virtual void addPoint(const float *v) {}
    virtual void removePoint(int index) {}
    virtual float *getPoint(int index) { return NULL; }
    idList<int> selectedPoints;
};

extern brush_t active_brushes;
extern brush_t selected_brushes;
extern brush_t *dword_01233464;
extern bool byte_0109fe5e;
extern int dword_01129934;
extern int dword_01129938;
extern float dword_011297b8[4];
extern float color_01129808[4];
extern void *dword_011298c8;
extern idPointListInterface *dword_011298b4;
extern int dword_011298b0;
extern void *dword_011298ec;
extern int dword_011298dc;
extern int dword_011298e0;
extern int dword_011298e4;
extern int dword_011298e8;
extern HWND dword_01233fb4;
extern HWND dword_01233b84;
extern CAdvCurveEditDlg DAT_01233b68;
extern CamWndKeyValue DAT_0058fb80[3];
extern CArray<selFace_t, selFace_t &> DAT_012485b4;
extern int dword_01128d90;
extern CPrefsDlg *dword_01233b64;
extern bool byte_0123353c;
extern bool byte_01233558;
extern bool byte_0109fe5c;
extern brush_t DAT_0109fe08;
extern brush_t DAT_0109fe30;
extern int dword_01233514;
extern int dword_01147dd0;
extern int dword_01147dd4;
extern float color_01129748[4];


class CXYWnd;
class CMainFrame
{
public:
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
};
void __stdcall FUN_004137d0(CMainFrame *self, UINT nChar);
struct orientation_t { float origin[3]; float axis[3][3]; };
extern orientation_t g_editorOrientation;
void OrientationPosToLocal(const orientation_t *orient, const float *pos, float *out);
void OrientationDirToLocal(const orientation_t *orient, const float *dir, float *out);
extern CMainFrame *g_pParentWnd;
extern HWND dword_010bcd58;

struct CCamWndMainProjection
{
    BOOL OnMouseWheel(UINT flags, short delta, CPoint point);
};

// renderer export table, base 0x59c300; only the slots used here are typed
struct CamWndRefExport
{
    unsigned char pad000[0x94];
    void (*field_94)(const float *color);
    unsigned char pad098[0x14];
    void (*field_ac)();
    void (*field_b0)();
    unsigned char pad0b4[0x10];
    void (*field_c4)(int a, const float *color, float b, int c);
    unsigned char pad0c8[0x78];
    bool (*field_140)(HWND window);
    void (*field_144)(HWND window);
    void (*ResizeWindow)(HWND window, int width, int height);
    unsigned char pad14c[0xc];
    void (*SetupCamera)(const float *origin, float (*axis)[3], float fovX, float fovY);
    unsigned char pad15c[4];
    void (*AddLines)(int count, int width, const GfxPointVertex *verts);
    void (*DrawTris)(void *material, int a, int indexCount, const unsigned short *indices, int vertCount,
                     float (*xyzw)[4], float (*tex)[2], const unsigned int *colors, float (*normals)[2]);
    void (*ColorToBytes)(const float *color, unsigned int *out);
    unsigned char pad16c[0xc];
    void (*BeginBrushes)();
    void (*EndBrushes)();
};
extern CamWndRefExport re;

class CCamWnd;
void __stdcall FUN_00405380(CCamWnd *camera);

struct plane_t
{
    float normal[3];
    double dist;
    int type;
};

struct CMainFrameCamView
{
    unsigned char pad[0x78c];
    CCamWnd *m_pCamWnd;
    unsigned char pad790[0x50];
    struct { unsigned char pad[0xf4]; int field_f4; } *field_7e0;
};


IMPLEMENT_DYNCREATE(CCamWnd, CWnd)

CCamWnd::CCamWnd()
{
    m_pXYFriend = NULL;
    memset(&m_Camera, 0, sizeof(m_Camera));
    m_bClipMode = false;
    field_120 = 0;
    field_124 = 0;
    field_128 = true;
    Cam_Init();
}

CCamWnd::~CCamWnd()
{
}

BEGIN_MESSAGE_MAP(CCamWnd, CWnd)
    ON_WM_KEYDOWN()
    ON_WM_PAINT()
    ON_WM_DESTROY()
    ON_WM_CLOSE()
    ON_WM_MOUSEMOVE()
    ON_WM_LBUTTONDOWN()
    ON_WM_LBUTTONUP()
    ON_WM_MBUTTONDOWN()
    ON_WM_MBUTTONUP()
    ON_WM_RBUTTONDOWN()
    ON_WM_RBUTTONUP()
    ON_WM_CREATE()
    ON_WM_SIZE()
    ON_WM_NCCALCSIZE()
    ON_WM_KILLFOCUS()
    ON_WM_SETFOCUS()
    ON_WM_KEYUP()
    ON_WM_MOUSEWHEEL()
    ON_WM_SYSKEYDOWN()
END_MESSAGE_MAP()

LRESULT CALLBACK CamWndProc(HWND window, UINT message, WPARAM wparam, LPARAM lparam)
{
    RECT rect;
    GetClientRect(window, &rect);
    switch (message)
    {
    case WM_KILLFOCUS:
    case WM_SETFOCUS:
        SendMessageA(window, WM_NCACTIVATE, message == WM_SETFOCUS, 0);
        return 0;
    case WM_NCCALCSIZE:
        DefWindowProcA(window, message, wparam, lparam);
        return WVR_REDRAW;
    }
    return DefWindowProcA(window, message, wparam, lparam);
}

void FUN_0047a760(const char *format, ...);

BOOL CCamWnd::PreCreateWindow(CREATESTRUCT &create)
{
    WNDCLASSA windowClass;
    HINSTANCE instance = AfxGetInstanceHandle();
    if (!::GetClassInfoA(instance, "QCamera", &windowClass))
    {
        memset(&windowClass, 0, sizeof(windowClass));
        windowClass.style = CS_NOCLOSE;
        windowClass.lpszClassName = "QCamera";
        windowClass.hCursor = LoadCursorA(NULL, IDC_ARROW);
        windowClass.lpfnWndProc = CamWndProc;
        if (!AfxRegisterClass(&windowClass))
            FUN_0047a760("CCamWnd RegisterClass: failed");
    }
    create.lpszClass = "QCamera";
    create.lpszName = "CAM";
    if (create.style != 0x56c70000)
        create.style = 0x56000000;
    return CWnd::PreCreateWindow(create);
}

void CCamWnd::OnKeyDown(UINT key, UINT repeat, UINT flags)
{
    g_pParentWnd->OnKeyDown(key, repeat, flags);
}

void __stdcall FUN_00406610(CCamWnd *camera);

void CCamWnd::OnPaint()
{
    PAINTSTRUCT ps;
    if (re.field_140 && re.field_140(dword_010bcd58))
    {
        BeginPaint(&ps);
        dword_01233464 = NULL;
        if (byte_0109fe5e && byte_0123353c && byte_01233558)
        {
            int state;
            if (reinterpret_cast<CMainFrameCamView *>(g_pParentWnd)->field_7e0->field_f4 == 1)
                state = !byte_0109fe5c;
            else
                state = byte_0109fe5c;
            dword_01233464 = &DAT_0109fe08;
            if (!state)
                dword_01233464 = &DAT_0109fe30;
        }
        re.field_ac();
        re.field_c4(7, color_01129748, 1.0f, 0);
        FUN_00406610(this);
        re.field_b0();
        re.field_144(dword_010bcd58);
        if (dword_01233514)
            dword_01147dd4 = dword_01147dd0;
        EndPaint(&ps);
    }
}

void CCamWnd::SetXYFriend(CXYWnd *window)
{
    m_pXYFriend = window;
}

void CCamWnd::OnClose()
{
    Default();
}

// Retail 0x004032a0: camera mouse movement and last-cursor tracking.
void CCamWnd::OnMouseMove(UINT flags, CPoint point)
{
    CRect rect;
    GetClientRect(rect);
    Cam_MouseMoved(point.x, rect.bottom - 1 - point.y, flags);
    m_ptLastCursor = point;
}



void CCamWnd::OnLButtonDown(UINT flags, CPoint point)
{
    m_ptLastCursor = point;
    OriginalMouseDown(flags, point);
}



void CCamWnd::OnLButtonUp(UINT flags, CPoint point)
{
    OriginalMouseUp(flags, point);
}

void CCamWnd::OnMButtonDown(UINT flags, CPoint point)
{
    OriginalMouseDown(flags, point);
}



void CCamWnd::OnMButtonUp(UINT flags, CPoint point)
{
    OriginalMouseUp(flags, point);
}

void CCamWnd::OnRButtonDown(UINT flags, CPoint point)
{
    OriginalMouseDown(flags, point);
}

void CCamWnd::OnRButtonUp(UINT flags, CPoint point)
{
    OriginalMouseUp(flags, point);
}

int CCamWnd::OnCreate(LPCREATESTRUCT create)
{
    if (Default() == -1)
        return -1;
    dword_010bcd58 = GetSafeHwnd();
    return 0;
}





// Retail 0x004034f0: shared release behavior behind three mouse-up handlers.
void CCamWnd::OriginalMouseUp(UINT flags, CPoint point)
{
    CRect rect;
    GetClientRect(rect);
    Cam_MouseUp(point.x, rect.bottom - 1 - point.y, flags);
    if (!(flags & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
        ReleaseCapture();
}

void CCamWnd::OriginalMouseDown(UINT flags, CPoint point)
{
    CRect rect;
    GetClientRect(rect);
    SetFocus();
    SetCapture();
    Cam_MouseDown(point.x, rect.bottom - 1 - point.y, flags);
}

void CCamWnd::Cam_Init()
{
    m_Camera.timing = 0;
    m_Camera.origin[0] = 0;
    m_Camera.origin[1] = 20;
    m_Camera.origin[2] = 46;
    m_Camera.color[0] = 0.3f;
    m_Camera.color[1] = 0.3f;
    m_Camera.color[2] = 0.3f;
}

void __stdcall FUN_004035a0(CCamWnd *camera)
{
    vec3_t angles;
    VectorCopy(camera->m_Camera.angles, angles);
    angles[0] = -angles[0];
    AngleVectors(angles, camera->m_Camera.vpn, camera->m_Camera.vright, camera->m_Camera.vup);
    YawVectors(camera->m_Camera.angles[1], camera->m_Camera.forward, camera->m_Camera.right);
}

void CCamWnd::FUN_00403ce0(int x, int y, float *dir)
{
    float scale;
    if (m_Camera.height > m_Camera.width)
        scale = 2.0f / m_Camera.height;
    else
        scale = 2.0f / m_Camera.width;
    int dy = y - m_Camera.height / 2;
    int dx = x - m_Camera.width / 2;
    float u = dy * scale;
    float r = dx * scale;
    dir[0] = r * m_Camera.vright[0] + u * m_Camera.vup[0] + m_Camera.vpn[0];
    dir[1] = r * m_Camera.vright[1] + u * m_Camera.vup[1] + m_Camera.vpn[1];
    dir[2] = r * m_Camera.vright[2] + u * m_Camera.vup[2] + m_Camera.vpn[2];
    Vec3Normalize(dir);
}


void FUN_00403dc0(int x1, int y1, int x2, int y2, plane_t *planes)
{
    int xmin = x1 < x2 ? x1 : x2;
    int xmax = x1 - xmin + x2;
    int ymin = y1 < y2 ? y1 : y2;
    int ymax = y1 - ymin + y2;

    CCamWnd *cam = reinterpret_cast<CMainFrameCamView *>(g_pParentWnd)->m_pCamWnd;
    float origin[3];
    float pts[4][3];
    cam->FUN_00403ce0(xmin, ymin, pts[0]);
    cam->FUN_00403ce0(xmin, ymax, pts[1]);
    cam->FUN_00403ce0(xmax, ymax, pts[2]);
    cam->FUN_00403ce0(xmax, ymin, pts[3]);

    VectorCopy(cam->m_Camera.origin, origin);

    for (int i = 0; i < 4; i++)
    {
        Vec3Cross(pts[i], pts[(i + 3) % 4], planes[i].normal);
        planes[i].dist = DotProduct(planes[i].normal, origin);
        planes[i].type = -1;
    }
}

void FUN_00462760(int buttons);

void CCamWnd::Cam_MouseUp(int x, int y, int buttons)
{
    m_nCambuttonstate = 0;
    FUN_00462760(buttons);
    field_120 = 0;
    field_124 = 0;
    field_128 = true;
    while (ShowCursor(TRUE) < 0)
        ;
}

void CCamWnd::InitCull()
{
    m_vCull1[0] = m_Camera.vpn[0] - m_Camera.vright[0];
    m_vCull1[1] = m_Camera.vpn[1] - m_Camera.vright[1];
    m_vCull1[2] = m_Camera.vpn[2] - m_Camera.vright[2];
    m_vCull2[0] = m_Camera.vpn[0] + m_Camera.vright[0];
    m_vCull2[1] = m_Camera.vpn[1] + m_Camera.vright[1];
    m_vCull2[2] = m_Camera.vpn[2] + m_Camera.vright[2];

    for (int i = 0; i < 3; i++)
    {
        if (m_vCull1[i] > 0)
            m_nCullv1[i] = 3 + i;
        else
            m_nCullv1[i] = i;
        if (m_vCull2[i] > 0)
            m_nCullv2[i] = 3 + i;
        else
            m_nCullv2[i] = i;
    }

    FUN_00405380(this);
}

void __stdcall FUN_00405380(CCamWnd *camera)
{
    OrientationPosToLocal(&g_editorOrientation, camera->m_Camera.origin, camera->field_12c);
    OrientationDirToLocal(&g_editorOrientation, camera->m_vCull1, camera->cullNormals[0]);
    OrientationDirToLocal(&g_editorOrientation, camera->m_vCull2, camera->cullNormals[1]);
    for (int k = 0; k < 2; k++)
    {
        for (int i = 0; i < 3; i++)
        {
            if (camera->cullNormals[k][i] > 0)
                camera->cullIndices[k][i] = 3 + i;
            else
                camera->cullIndices[k][i] = i;
        }
    }
}

bool FUN_00405450(CCamWnd *camera, brush_t *brush)
{
    int i;
    float point[3];
    float d;

    if (dword_01233b64->m_bCubicClipping)
    {
        if (!dword_01233b64->m_bCullSkies && (brush->def->faces->texdef[dword_01128d90].radMat->flags & 4))
            return false;
        float level = (float)(dword_01233b64->m_nCubicScale * 64);
        point[0] = camera->field_12c[0] - level;
        point[1] = camera->field_12c[1] - level;
        point[2] = camera->field_12c[2] - level;
        for (i = 0; i < 3; i++)
            if (brush->def->mins[i] < point[i] && brush->def->maxs[i] < point[i])
                return true;
        point[0] = level + camera->field_12c[0];
        point[1] = level + camera->field_12c[1];
        point[2] = level + camera->field_12c[2];
        for (i = 0; i < 3; i++)
            if (brush->def->mins[i] > point[i] && brush->def->maxs[i] > point[i])
                return true;
    }

    for (i = 0; i < 3; i++)
        point[i] = brush->def->mins[camera->cullIndices[0][i]] - camera->field_12c[i];
    d = DotProduct(point, camera->cullNormals[0]);
    if (d < -1)
        return true;

    for (i = 0; i < 3; i++)
        point[i] = brush->def->mins[camera->cullIndices[1][i]] - camera->field_12c[i];
    d = DotProduct(point, camera->cullNormals[1]);
    if (d < -1)
        return true;

    return false;
}

void __stdcall FUN_004061f0(brush_t *brush, CCamWnd *camera);
void __stdcall FUN_004063b0(brush_t *brush, CCamWnd *camera);

void __stdcall FUN_00406050(const float *origin, float radius, float height, int segments)
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
    re.ColorToBytes(colorWhite, &color);
    int count = 0;
    for (i = 1; i < segments; i++)
        count = R_Add3DLine(verts, ring[i - 1], ring[i], &color, 1, count, 0x2000);
    count = R_Add3DLine(verts, ring[segments - 1], ring[0], &color, 1, count, 0x2000);
    if (count)
        re.AddLines(count / 2, 1, verts);
}

#line 1501
void __stdcall FUN_004064f0(brush_t *brush, CCamWnd *camera)
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


void __stdcall FUN_00406610(CCamWnd *camera)
{
    float axis[3][3];
    float fovX, fovY;
    float width, height;
    unsigned int color;
    int mode;
    brush_t *brush;
    brush_t *list;
    int i;
    int count;
    unsigned short indices[2043];
    GfxPointVertex lineVerts[1362];
    unsigned int vertColors[1362];
    float vertNormals[1362][2];
    float vertXyzw[1362][4];
    float vertTex[2043][2];
    int indexCount;
    int vertCount;
    float dirs[4][3];
    float quad[4][4];
    RECT rect;
    POINT pt;
    float dir[3];
    float hit[3];

    if (active_brushes.next == NULL)
        return;

    FUN_004035a0(camera);

    axis[0][0] = camera->m_Camera.vpn[0];
    axis[0][1] = camera->m_Camera.vpn[1];
    axis[0][2] = camera->m_Camera.vpn[2];
    axis[1][0] = -camera->m_Camera.vright[0];
    axis[1][1] = -camera->m_Camera.vright[1];
    axis[1][2] = -camera->m_Camera.vright[2];
    axis[2][0] = camera->m_Camera.vup[0];
    axis[2][1] = camera->m_Camera.vup[1];
    axis[2][2] = camera->m_Camera.vup[2];

    width = (float)camera->m_Camera.width;
    height = (float)camera->m_Camera.height;
    float fov;
    if (width > height)
    {
        fovX = 90.0f;
        fov = atan2(height, width);
        fov = fov * 360.0f / 3.1415927f;
        fovY = fov;
    }
    else
    {
        fov = atan2(width, height);
        fovY = 90.0f;
        fov = fov * 360.0f / 3.1415927f;
        fovX = fov;
    }
    float *origin = camera->m_Camera.origin;
    re.SetupCamera(origin, axis, fovX, fovY);

    camera->InitCull();

    mode = 3;
    switch (camera->m_Camera.drawMode)
    {
    case 0:
        mode = 30;
        break;
    case 1:
        mode = 3;
        break;
    case 2:
        mode = 27;
        break;
    case 3:
        mode = 28;
        break;
    }

    re.BeginBrushes();
    for (brush = active_brushes.next; brush != &active_brushes; brush = brush->next)
    {
        if (FUN_00405450(camera, brush))
            continue;
        if (FUN_0044f5d0(brush))
            continue;
#line 1615
        assert(brush->owner->def == brush->def->owner);
        assert(brush->owner->def && brush->owner->def->eclass);
        re.ColorToBytes(brush->owner->def->eclass->color, &color);
        FUN_0045d7f0(brush, -1, 0, mode, 0, mode, &color, 1, 0);
    }
    FUN_0040bff0();
    re.EndBrushes();

    re.BeginBrushes();
    for (brush = active_brushes.next; brush != &active_brushes; brush = brush->next)
    {
        if (FUN_00405450(camera, brush))
            continue;
        if (FUN_0044f5d0(brush))
            continue;
        entity_t *e = brush->owner->def;
        if (!(e->eclass->flags & 0x20))
            continue;
        if (!strncmp(e->eclass->name, "node_scr", 8))
            continue;
        if (!FUN_00465d80(e, "targetname"))
            continue;
        if (!strncmp(ValueForKey(e->epairs, "targetname"), "auto", 4))
            continue;
        re.ColorToBytes(colorGreen, &color);
        FUN_0045d7f0(brush, -1, 0, 30, 0, 30, &color, 2, 1);
    }
    re.EndBrushes();

    if (!dword_01129938)
        re.field_94(dword_011297b8);

    re.BeginBrushes();
    if (byte_0109fe5e && dword_01233464)
        list = dword_01233464;
    else
        list = &selected_brushes;
    for (brush = list->next; brush != list; brush = brush->next)
    {
        if (FUN_00405450(camera, brush))
            continue;
#line 1661
        assert(brush->owner->def == brush->def->owner);
        re.ColorToBytes(brush->owner->def->eclass->color, &color);
        FUN_0045d7f0(brush, -1, 0, mode, 0, mode, &color, (dword_01233b64->m_bThickLines != 0) + 1, 1);
        if (brush->owner->def->eclass->flags & 0xc0)
            FUN_004064f0(brush, camera);
    }
    re.EndBrushes();

    if (!dword_01129938)
    {
        re.field_94(0);
        count = DAT_012485b4.GetSize();
        if (count > 0)
        {
            re.field_94(0);
            re.ColorToBytes(color_01129808, &color);
            indexCount = 0;
            vertCount = 0;
            for (i = 0; i < count; i++)
            {
                selFace_t selFace = DAT_012485b4[i];
#line 1685
                assert(selFace.face == &selFace.brush->faces[selFace.index]);
                FUN_0045def0(&selFace.brush->def->faces[selFace.index], &color, &indexCount, 2043, indices, 1362,
                             vertXyzw, vertTex, vertColors, vertNormals, &vertCount);
            }
            if (indexCount && vertCount)
                re.DrawTris(dword_011298c8, 3, indexCount, indices, vertCount, vertXyzw, vertTex, vertColors, vertNormals);
        }
    }

    for (brush = list->next; brush != list; brush = brush->next)
    {
#line 1696
        assert(brush->owner->def == brush->def->owner);
        if (brush->owner->def->eclass->flags & 1)
            FUN_004061f0(brush, camera);
        else
            FUN_004063b0(brush, camera);
    }

    for (brush = active_brushes.next; brush != &active_brushes; brush = brush->next)
    {
        if (FUN_00405450(camera, brush))
            continue;
        if (FUN_0044f5d0(brush))
            continue;
#line 1711
        assert(brush->owner->def == brush->def->owner);
        assert(brush->owner->def && brush->owner->def->eclass);
        if (brush->owner->def->eclass->flags & 0xc0)
            FUN_004063b0(brush, camera);
    }

    if (!dword_01129934)
    {
        re.field_c4(6, colorBlack, 1.0f, 0);
        re.ColorToBytes(colorWhite, &color);
        re.BeginBrushes();
        for (brush = list->next; brush != list; brush = brush->next)
            FUN_0045d7f0(brush, -1, 0, 30, 0, 30, &color, 1, 1);
        re.EndBrushes();
        count = DAT_012485b4.GetSize();
        if (count)
        {
            int lines = 0;
            for (i = 0; i < count; i++)
            {
                selFace_t selFace = DAT_012485b4[i];
#line 1734
                assert(selFace.face == &selFace.brush->faces[selFace.index]);
                face_t *face = &selFace.brush->def->faces[selFace.index];
                if (face->field_a0)
                    lines = FUN_0045d9a0(face, -1, &color, 1, lines, 1362, lineVerts);
            }
            if (lines)
                re.AddLines(lines / 2, 1, lineVerts);
        }
    }

    FUN_0040c210();

    idPointListInterface *selectObject = dword_011298b4;
    if (selectObject && (dword_011298b0 == 8 || dword_011298b0 == 9))
    {
        count = selectObject->selectedPoints.Num();
        for (i = 0; i < count; i++)
            selectObject->getPoint(selectObject->selectedPoints[i]);
    }

    if (dword_011298ec == (void *)FUN_00403dc0 && (dword_011298b0 == 5 || dword_011298b0 == 14 || dword_011298b0 == 15
        || dword_011298b0 == 16 || dword_011298b0 == 17 || dword_011298b0 == 12 || dword_011298b0 == 13))
    {
        int x1, x2, y1, y2;
        if (dword_011298dc < dword_011298e0)
        {
            x1 = dword_011298dc;
            x2 = dword_011298e0;
        }
        else
        {
            x1 = dword_011298e0;
            x2 = dword_011298dc;
        }
        if (dword_011298e4 < dword_011298e8)
        {
            y1 = dword_011298e4;
            y2 = dword_011298e8;
        }
        else
        {
            y1 = dword_011298e8;
            y2 = dword_011298e4;
        }
        camera->FUN_00403ce0(x1, y1, dirs[0]);
        camera->FUN_00403ce0(x1, y2, dirs[1]);
        camera->FUN_00403ce0(x2, y2, dirs[2]);
        camera->FUN_00403ce0(x2, y1, dirs[3]);
        for (i = 0; i < 4; i++)
        {
            float scale = 4.001f / DotProduct(dirs[i], camera->m_Camera.vpn);
            quad[i][0] = dirs[i][0] * scale + origin[0];
            quad[i][1] = dirs[i][1] * scale + origin[1];
            quad[i][2] = dirs[i][2] * scale + origin[2];
            quad[i][3] = 1.0f;
        }
        FUN_0040c4a0(quad);
    }

    if (camera->field_128)
    {
        if (!SendMessageA(dword_01233fb4, BM_GETCHECK, 0, 0) || IsWindowVisible(dword_01233b84))
        {
            if (DAT_01233b68.FUN_00401d90() != 6)
            {
                float minValue = 0;
                for (i = 0; i < 3; i++)
                {
                    if (DAT_0058fb80[i].id == 0x590)
                    {
                        minValue = DAT_0058fb80[i].value;
                        break;
                    }
                }
                float maxValue = 0;
                for (i = 0; i < 3; i++)
                {
                    if (DAT_0058fb80[i].id == 0x591)
                    {
                        maxValue = DAT_0058fb80[i].value;
                        break;
                    }
                }
                if (minValue < maxValue)
                {
                    GetCursorPos(&pt);
                    ScreenToClient(camera->m_hWnd, &pt);
                    GetClientRect(camera->m_hWnd, &rect);
                    if (pt.x >= rect.left && pt.x < rect.right && pt.y >= rect.top && pt.y < rect.bottom)
                    {
                        camera->FUN_00403ce0(pt.x, rect.bottom - pt.y, dir);
                        if (FUN_0042af90(origin, dir, hit, 0))
                            FUN_0042e290(hit);
                    }
                }
            }
        }
    }

    FUN_0045f7e0();
}

void CCamWnd::OnSize(UINT type, int cx, int cy)
{
    CWnd::OnSize(type, cx, cy);
    CRect rect;
    GetClientRect(rect);
    int width = rect.right;
    int height = rect.bottom;
    m_Camera.width = width;
    m_Camera.height = height;
    if (re.ResizeWindow)
        re.ResizeWindow(dword_010bcd58, width, height);
    Invalidate(FALSE);
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00407550() {}

void CCamWnd::OnKeyUp(UINT key, UINT repeat, UINT flags)
{
    FUN_004137d0(g_pParentWnd, key);
}

BOOL CCamWnd::OnMouseWheel(UINT flags, short delta, CPoint point)
{
    return reinterpret_cast<CCamWndMainProjection *>(g_pParentWnd)->OnMouseWheel(flags, delta, point);
}

void CCamWnd::OnSysKeyDown(UINT key, UINT repeat, UINT flags)
{
    g_pParentWnd->OnKeyDown(key, repeat, flags);
}

extern "C" void FUN_004077c0() {}
