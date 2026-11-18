#include "stdafx.h"
#include <afxtempl.h>
#include "../universal/assertive.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct radMat_t { unsigned char pad[4]; char *name; unsigned char pad2[0xc]; int size[2]; };
struct texdef_t { radMat_t *radMat; float scale[2]; float shift[2]; float rotate; float crossterm; };
struct face_t { unsigned char pad[0x24]; texdef_t texdef[2]; unsigned char pad_5c[0xa8 - 0x24 - 2 * sizeof(texdef_t)]; };
struct faceRender_t { void *matHandle; int vertCount; void *vertHandle; };
struct patchInfo_t { unsigned char pad[0x382f]; unsigned char flag; unsigned char pad2[4]; float value; };
struct brushdef_t
{
    unsigned char pad0[0x38];
    int faceCount;
    face_t *faces;
    short pad40;
    short version;
    patchInfo_t *patch;
};
struct eclass_t { unsigned char pad[8]; int fixedsize; };
struct entityDef_t { unsigned char pad[0x50]; eclass_t *eclass; };
struct entity_t { unsigned char pad[8]; entityDef_t *def; };
struct patchImage_t { unsigned char pad[4]; char *name; };
struct patchMesh_t { unsigned char pad[0x18]; patchImage_t *images[2]; };
struct patch_t { patchMesh_t *def; };
struct brush_t
{
    brush_t *prev;
    brush_t *next;
    entity_t *owner;
    unsigned char pad0c[8];
    brushdef_t *def;
    int faceCount;
    faceRender_t *faces;
    patch_t *patch;
    short version;
};
struct selFace_t { brush_t *brush; faceRender_t *face; int index; };
struct surfDlgGlob_t
{
    bool field_00;
    bool field_01;
    bool pending;
    unsigned char pad03;
    texdef_t texdef;
    texdef_t patchTexdef;
    unsigned char pad_ac[4];
    float field_40;
    HWND hwnd;
};

extern surfDlgGlob_t surfDlgGlob;
extern texdef_t DAT_01128da8;
extern brush_t selected_brushes;
extern CArray<selFace_t, selFace_t &> DAT_012485b4;
extern int DAT_01128d90;
extern int DAT_01128d94;
extern bool DAT_0109fd70;
extern radMat_t * __fastcall FUN_00440840(const char *name);
extern void Sys_Printf(const char *fmt, ...);
void FUN_0045efb0(face_t *f);
extern void __stdcall FUN_0043cf80(void *dlg);
void FUN_0045f070(brushdef_t *b);

// Layout from the retail ctor/dtor 0x43c880 / 0x43c7c0: eight spin controls at 0x8c + n * 0x50, then four floats.
// The five named spins reuse the CTextureBar control ids; the other three are named by their dialog id.
class CSurfaceDlg : public CDialog
{
public:
	unsigned char pad70;
	bool field_71;
	bool field_72;
	unsigned char pad73[0x8c - 0x73];
	CSpinButtonCtrl m_spinVShift;     // 0x8c, id 1251
	CSpinButtonCtrl m_spinVScale;     // 0xdc, id 1254
	CSpinButtonCtrl m_spinRotate;     // 0x12c, id 1259
	CSpinButtonCtrl m_spinHShift;     // 0x17c, id 1248
	CSpinButtonCtrl m_spinHScale;     // 0x1cc, id 1257
	CSpinButtonCtrl m_spinId1260;     // 0x21c
	CSpinButtonCtrl m_spinId1453;     // 0x26c
	CSpinButtonCtrl m_spinId1455;     // 0x2bc
	float m_f30c;
	float m_f310;
	float m_f314;
	float m_f318;
protected:
	virtual void DoDataExchange(CDataExchange *pDX);
	virtual BOOL OnInitDialog();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	DECLARE_MESSAGE_MAP()
};

// Message map entries are not reconstructed yet; the retail map is at 0x548690.
BEGIN_MESSAGE_MAP(CSurfaceDlg, CDialog)
END_MESSAGE_MAP()

// Retail 0x0043c9d0
void CSurfaceDlg::DoDataExchange(CDataExchange *pDX)
{
	DDX_Control(pDX, 1251, m_spinVShift);
	DDX_Control(pDX, 1254, m_spinVScale);
	DDX_Control(pDX, 1259, m_spinRotate);
	DDX_Control(pDX, 1248, m_spinHShift);
	DDX_Control(pDX, 1257, m_spinHScale);
	DDX_Control(pDX, 1453, m_spinId1453);
	DDX_Control(pDX, 1455, m_spinId1455);
	DDX_Control(pDX, 1260, m_spinId1260);
	DDX_Text(pDX, 1089, m_f30c);
	DDX_Text(pDX, 1142, m_f310);
	DDV_MinMaxFloat(pDX, m_f318, 1.0f, 32.0f);
	DDV_MinMaxFloat(pDX, m_f314, 1.0f, 32.0f);
	DDV_MinMaxFloat(pDX, m_f30c, -1000.0f, 1000.0f);
	DDV_MinMaxFloat(pDX, m_f310, -1000.0f, 1000.0f);
}

// Retail 0x0043cb00: set a control's text only when it changed.
void FUN_0043cb00(HWND hwnd, const char *text)
{
    char buf[1024];
    GetWindowText(hwnd, buf, 1024);
    if (strcmp(text, buf))
        SetWindowText(hwnd, text);
}

// Retail 0x0043cb80: uniform texture scale of one face, 0 when it is not square-scaled.
float FUN_0043cb80(face_t *f)
{
#line 130
    assert( f );
    texdef_t *td = &f->texdef[1];
    if ((float)td->radMat->size[1] * td->scale[0] != (float)td->radMat->size[0] * td->scale[1])
        return 0.0f;
#line 136
    assert( td->radMat->size[0] );
    return td->scale[0] / (float)td->radMat->size[0];
}

// Retail 0x0043cc70: the scale shared by every face of a brush, 0 when they differ.
float FUN_0043cc70(brushdef_t *b)
{
#line 146
    assert( b );
    if (b->patch)
    {
        if (!b->patch->flag)
            return 0.0f;
        return b->patch->value;
    }
    float v = FUN_0043cb80(&b->faces[0]);
    if (v == 0.0f)
        return 0.0f;
    for (int i = 1; i < b->faceCount; i++)
    {
        if (FUN_0043cb80(&b->faces[i]) != v)
            return 0.0f;
    }
    return v;
}

// Retail 0x0043cd60: the scale shared by every selected brush.
float FUN_0043cd60()
{
    if (selected_brushes.next == &selected_brushes)
        return 0.0f;
    float v = FUN_0043cc70(selected_brushes.next->def);
    if (v == 0.0f)
        return 0.0f;
    for (brush_t *b = selected_brushes.next->next; b != &selected_brushes; b = b->next)
    {
        if (FUN_0043cc70(b->def) != v)
            return 0.0f;
    }
    return v;
}

// Retail 0x0043cdf0: scale of one selected face.
float FUN_0043cdf0(selFace_t *sf)
{
    brush_t *b = sf->brush;
    if (b->patch)
        return FUN_0043cc70(b->def);
    return FUN_0043cb80(&b->def->faces[sf->index]);
}

// Retail 0x0043ce20: the scale shared by every selected face.
float FUN_0043ce20()
{
    int count = DAT_012485b4.GetSize();
    selFace_t first = DAT_012485b4[0];
    float v = FUN_0043cdf0(&first);
    if (v == 0.0f)
        return 0.0f;
    for (int i = 1; i < count; i++)
    {
        selFace_t sf = DAT_012485b4[i];
        if (v != FUN_0043cdf0(&sf))
            return 0.0f;
    }
    return v;
}

// 0x0043dff0 (509 B)
void FUN_0043dff0()
{
#line 620
    assert( surfDlgGlob.hwnd );
    surfDlgGlob.texdef = DAT_01128da8;
    surfDlgGlob.pending = false;
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        FUN_0045f070(b->def);
    int count = DAT_012485b4.GetSize();
    for (int i = 0; i < count; i++)
    {
        selFace_t selFace = DAT_012485b4[i];
#line 632
        assert( selFace.face == &selFace.brush->faces[selFace.index] );
#line 633
        assert( selFace.brush->version == selFace.brush->def->version );
        FUN_0045efb0(&selFace.brush->def->faces[selFace.index]);
    }
}

extern int g_nUpdateBits;
extern CSurfaceDlg DAT_01234a38;
struct surfPrefs_t
{
    unsigned char pad[0x1e4];
    int field_1e4;
    unsigned char pad_1e8[8];
    int field_1f0;
    unsigned char pad_1f4[0x258 - 0x1f4];
    int field_258;
};
extern surfPrefs_t *dword_01233b64;
BOOL LoadRegistryInfo(const char *pszName, void *pvBuf, long *plSize);

// Retail 0x0043e440 (247 B): open the surface inspector, creating it on first use.
void FUN_0043e440()
{
    surfDlgGlob.field_00 = dword_01233b64->field_1e4 != 0;
    surfDlgGlob.field_01 = dword_01233b64->field_1f0 != 0;
    if (surfDlgGlob.hwnd == NULL && DAT_01234a38.GetSafeHwnd() == NULL)
    {
        surfDlgGlob.patchTexdef.scale[0] = 0.05f;
        surfDlgGlob.patchTexdef.scale[1] = 0.05f;
        surfDlgGlob.patchTexdef.shift[0] = 0.05f;
        surfDlgGlob.patchTexdef.shift[1] = 0.05f;
        surfDlgGlob.patchTexdef.rotate = (float)dword_01233b64->field_258;
        DAT_01234a38.Create(0x74, NULL);
        CRect rct;
        long lSize = sizeof(rct);
        if (LoadRegistryInfo("Radiant::SurfaceWindow", &rct, &lSize))
            DAT_01234a38.SetWindowPos(NULL, rct.left, rct.top, 0, 0, SWP_NOSIZE | SWP_SHOWWINDOW);
        g_nUpdateBits = -1;
    }
    else
    {
        surfDlgGlob.hwnd = DAT_01234a38.GetSafeHwnd();
        FUN_0043cf80(&DAT_01234a38);
        DAT_01234a38.ShowWindow(SW_SHOW);
    }
    FUN_0043dff0();
}

extern int DAT_011298b8;
extern int DAT_011298bc;
extern int DAT_011298c0;

// Retail 0x0043e560 (473 B)
BOOL CSurfaceDlg::OnInitDialog()
{
    CDialog::OnInitDialog();
    surfDlgGlob.hwnd = GetSafeHwnd();
    FUN_0043cf80(this);
    m_spinHScale.SetRange(0, 1000);
    m_spinVScale.SetRange(0, 1000);
    m_spinHShift.SetRange(0, 1000);
    m_spinVShift.SetRange(0, 1000);
    m_spinRotate.SetRange(0, 1000);
    m_spinId1453.SetRange(-1000, 1000);
    m_spinId1455.SetRange(-1000, 1000);
    m_spinId1260.SetRange(0, 1024);
    CheckDlgButton(0x5c5, 0);
    CheckDlgButton(0x5c6, 0);
    CheckDlgButton(0x5c7, 0);
    if (!DAT_011298bc)
        DAT_011298bc = 1;
    if (!DAT_011298c0)
        DAT_011298c0 = 1;
    char sz[32];
    itoa(DAT_011298bc, sz, 32);
    GetDlgItem(0x441)->SetWindowText(sz);
    itoa(DAT_011298c0, sz, 32);
    GetDlgItem(0x476)->SetWindowText(sz);
    int selected = DAT_011298b8;
    if (!selected)
    {
        selected = 0x5c5;
        DAT_011298b8 = selected;
    }
    if (selected == 0x5c5 || selected == 0x5c6 || selected == 0x5c7)
        CheckDlgButton(selected, 1);
    field_71 = false;
    field_72 = false;
    return TRUE;
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_0043e910() {}

int CSurfaceDlg::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CDialog::OnCreate(lpCreateStruct) == -1)
		return -1;

	return 0;
}
