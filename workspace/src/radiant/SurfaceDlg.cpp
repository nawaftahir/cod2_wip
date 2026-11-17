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
void FUN_0045f070(brushdef_t *b);

class CSurfaceDlg : public CDialog
{
public:
	bool m_bPatchMode;
protected:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	DECLARE_MESSAGE_MAP()
};

// Message map entries are not reconstructed yet; the retail map is at 0x548690.
BEGIN_MESSAGE_MAP(CSurfaceDlg, CDialog)
END_MESSAGE_MAP()

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

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_0043e910() {}

int CSurfaceDlg::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CDialog::OnCreate(lpCreateStruct) == -1)
		return -1;

	return 0;
}
