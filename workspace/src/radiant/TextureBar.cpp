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

extern int DAT_0112988c;
extern int g_nUpdateBits;
void FUN_00472860(float x, float y);
void FUN_00472ff0(int x, int y);
void FUN_004733f0(int);

BEGIN_MESSAGE_MAP(CTextureBar, CDialogBar)
    ON_NOTIFY(UDN_DELTAPOS, 1248, OnDeltaposSpinHshift)
    ON_NOTIFY(UDN_DELTAPOS, 1251, OnDeltaposSpinVshift)
    ON_NOTIFY(UDN_DELTAPOS, 1257, OnDeltaposSpinHScale)
    ON_NOTIFY(UDN_DELTAPOS, 1254, OnDeltaposSpinVScale)
    ON_NOTIFY(UDN_DELTAPOS, 1259, OnDeltaposSpinRotate)
    ON_COMMAND(33087, FUN_0043f420)
    ON_WM_CREATE()
    ON_COMMAND(1070, OnBtnApplytexturestuff)
END_MESSAGE_MAP()

void CTextureBar::OnDeltaposSpinHshift(NMHDR *pNMHDR, LRESULT *pResult)
{
    NM_UPDOWN *pNMUpDown = (NM_UPDOWN *)pNMHDR;
    *pResult = 0;
    if (pNMUpDown->iDelta < 0)
        FUN_00472860((float)abs(DAT_0112988c), 0);
    else
        FUN_00472860((float)-abs(DAT_0112988c), 0);
    FUN_0043f460();
}

void CTextureBar::OnDeltaposSpinVshift(NMHDR *pNMHDR, LRESULT *pResult)
{
    NM_UPDOWN *pNMUpDown = (NM_UPDOWN *)pNMHDR;
    *pResult = 0;
    if (pNMUpDown->iDelta < 0)
        FUN_00472860(0, (float)abs(DAT_0112988c));
    else
        FUN_00472860(0, (float)-abs(DAT_0112988c));
    FUN_0043f460();
}

void CTextureBar::OnDeltaposSpinHScale(NMHDR *pNMHDR, LRESULT *pResult)
{
    NM_UPDOWN *pNMUpDown = (NM_UPDOWN *)pNMHDR;
    *pResult = 0;
    if (pNMUpDown->iDelta < 0)
        FUN_00472ff0(abs(DAT_0112988c), 0);
    else
        FUN_00472ff0(-abs(DAT_0112988c), 0);
    FUN_0043f460();
}

void CTextureBar::OnDeltaposSpinVScale(NMHDR *pNMHDR, LRESULT *pResult)
{
    NM_UPDOWN *pNMUpDown = (NM_UPDOWN *)pNMHDR;
    *pResult = 0;
    if (pNMUpDown->iDelta < 0)
        FUN_00472ff0(0, abs(DAT_0112988c));
    else
        FUN_00472ff0(0, -abs(DAT_0112988c));
    FUN_0043f460();
}

void CTextureBar::OnDeltaposSpinRotate(NMHDR *pNMHDR, LRESULT *pResult)
{
    NM_UPDOWN *pNMUpDown = (NM_UPDOWN *)pNMHDR;
    *pResult = 0;
    UpdateData(TRUE);
    if (pNMUpDown->iDelta < 0)
        FUN_004733f0(abs(m_nRotateAmt));
    else
        FUN_004733f0(-abs(m_nRotateAmt));
    FUN_0043f460();
}

// One-byte retail handler
void CTextureBar::FUN_0043f420() {}

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

void CTextureBar::OnBtnApplytexturestuff()
{
    SetSurfaceAttributes();
}

void CTextureBar::SetSurfaceAttributes()
{
    if (DAT_012485b4.GetSize() != 0)
    {
        selFace_t selFace = DAT_012485b4[0];
#line 187
        assert( selFace.face == &selFace.brush->faces[selFace.index] );
#line 188
        assert( selFace.brush->version == selFace.brush->def->version );
        texdef_t *pt = &selFace.brush->def->faces[selFace.index].texdef[DAT_01128d94];
        UpdateData(TRUE);
        g_nUpdateBits |= 1;
        pt->shift[0] = (float)m_nHShift;
        pt->shift[1] = (float)m_nVShift;
        pt->scale[0] = (float)m_nHScale;
        pt->scale[1] = (float)m_nVScale;
        pt->rotate = (float)m_nRotate;
    }
}
