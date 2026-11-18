// CTextureBar reconstruction grounded in CoD2Radiant 1.0 retail layout and DDX IDs.
// The implemented methods below are hosted-CI byte-identical; remaining handlers stay pending.
#include "stdafx.h"
#include <afxtempl.h>
#include "../universal/assertive.h"

struct texdef_t { void *radMat; float scale[2]; float shift[2]; float rotate; float crossterm; };
struct face_t { unsigned char pad0[0x24]; texdef_t texdef[2]; unsigned char pad[0xa8 - 0x24 - 2 * sizeof(texdef_t)]; };
struct faceRender_t { void *matHandle; int vertCount; void *vertHandle; };
struct brushdef_t { unsigned char pad0[0x3c]; face_t *faces; short pad40; short version; };
struct brush_t
{
    unsigned char pad00[0x14];
    brushdef_t *def;
    int faceCount;
    faceRender_t *faces;
    void *patch;
    short version;
};
struct selFace_t { brush_t *brush; faceRender_t *face; int index; };

extern int DAT_01128d94;
extern texdef_t DAT_01128da8;
extern CArray<selFace_t, selFace_t &> DAT_012485b4;

#include "TextureBar.h"

CTextureBar::CTextureBar()
    : CDialogBar()
{
    m_nHShift = 0;
    m_nHScale = 0;
    m_nRotate = 0;
    m_nVShift = 0;
    m_nVScale = 0;
    m_nRotateAmt = 45;
}

void CTextureBar::DoDataExchange(CDataExchange *pDX)
{
    CDialogBar::DoDataExchange(pDX);
    DDX_Control(pDX, 0x4eb, m_spinRotate);
    DDX_Control(pDX, 0x4e6, m_spinVScale);
    DDX_Control(pDX, 0x4e3, m_spinVShift);
    DDX_Control(pDX, 0x4e9, m_spinHScale);
    DDX_Control(pDX, 0x4e0, m_spinHShift);
    DDX_Text(pDX, 0x4ab, m_nHShift);
    DDX_Text(pDX, 0x4bb, m_nHScale);
    DDX_Text(pDX, 0x4c1, m_nRotate);
    DDX_Text(pDX, 0x4ac, m_nVShift);
    DDX_Text(pDX, 0x4bd, m_nVScale);
    DDX_Text(pDX, 0x4ee, m_nRotateAmt);
}

// Preserve the already accepted one-byte retail body until its class-method
// identity can be promoted without rewriting an existing ledger row.
extern "C" void FUN_0043f420() {}

int CTextureBar::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
    if (CDialogBar::OnCreate(lpCreateStruct) == -1)
        return -1;
    return 0;
}


// 0x0043f460 (353 B), this in ebx
void CTextureBar::FUN_0043f460()
{
    texdef_t *pt;
    if (DAT_012485b4.GetSize() > 0)
    {
        selFace_t selFace = DAT_012485b4[0];
#line 160
        assert( selFace.face == &selFace.brush->faces[selFace.index] );
#line 161
        assert( selFace.brush->version == selFace.brush->def->version );
        pt = &selFace.brush->def->faces[selFace.index].texdef[DAT_01128d94];
    }
    else
    {
        pt = &DAT_01128da8;
    }
#line 169
    assert( pt );
    m_nHShift = (int)pt->shift[0];
    m_nVShift = (int)pt->shift[1];
    m_nHScale = (int)pt->scale[0];
    m_nVScale = (int)pt->scale[1];
    m_nRotate = (int)pt->rotate;
    UpdateData(FALSE);
}
