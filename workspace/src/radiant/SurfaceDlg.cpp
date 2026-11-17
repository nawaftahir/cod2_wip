#include "stdafx.h"
#include <afxtempl.h>
#include "../universal/assertive.h"

struct texdef_t { void *radMat; float scale[2]; float shift[2]; float rotate; float crossterm; };
struct face_t { unsigned char pad[0xa8]; };
struct faceRender_t { void *matHandle; int vertCount; void *vertHandle; };
struct brushdef_t { unsigned char pad0[0x3c]; face_t *faces; short pad40; short version; };
struct brush_t
{
    brush_t *prev;
    brush_t *next;
    unsigned char pad08[0xc];
    brushdef_t *def;
    int faceCount;
    faceRender_t *faces;
    void *patch;
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
void FUN_0045efb0(face_t *f);
void FUN_0045f070(brushdef_t *b);

class CSurfaceDlg : public CDialog
{
protected:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	DECLARE_MESSAGE_MAP()
};

// Message map entries are not reconstructed yet; the retail map is at 0x548690.
BEGIN_MESSAGE_MAP(CSurfaceDlg, CDialog)
END_MESSAGE_MAP()

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
