// Filter dialog code; names and signatures provisional (FUN_ = unconfirmed). Handlers sit in retail address order.
#include "stdafx.h"
#include "../universal/assertive.h"

struct qeglobals_t { unsigned char pad0[0x6cb74]; int d_exclude; unsigned d_exclude2; };
extern qeglobals_t g_qeglobals;

extern CString DAT_012345c4;
extern unsigned dword_0123348c;

extern "C" {
void __fastcall FUN_0041c440(CWnd *mainWnd);
void __fastcall FUN_0041c500(CWnd *mainWnd);
void __fastcall FUN_0041cbc0(CWnd *mainWnd);
void __fastcall FUN_0041cc20(CWnd *mainWnd);
void __fastcall FUN_0041c5c0(CWnd *mainWnd);
void __fastcall FUN_0041cb60(CWnd *mainWnd);
void __fastcall FUN_0041cfe0(CWnd *mainWnd);
void __fastcall FUN_0041c980(CWnd *mainWnd);
void __fastcall FUN_0041c9e0(CWnd *mainWnd);
void __fastcall FUN_0041ca40(CWnd *mainWnd);
void __fastcall FUN_0041c560(CWnd *mainWnd);
void __fastcall FUN_0041c620(CWnd *mainWnd);
void __fastcall FUN_0041c680(CWnd *mainWnd);
void __fastcall FUN_0041caa0(CWnd *mainWnd);
void __fastcall FUN_0041c7a0(CWnd *mainWnd);
void __fastcall FUN_0041c860(CWnd *mainWnd);
void __fastcall FUN_0041c8c0(CWnd *mainWnd);
void __fastcall FUN_0041c4a0(CWnd *mainWnd);
void __fastcall FUN_0041c920(CWnd *mainWnd);
void __fastcall FUN_0041cb00(CWnd *mainWnd);
void __fastcall FUN_0041cf80(CWnd *mainWnd);
void __fastcall FUN_0041d0a0(CWnd *mainWnd);
void __fastcall FUN_0041c740(CWnd *mainWnd);
void __fastcall FUN_0041c800(CWnd *mainWnd);
void __fastcall FUN_0041d100(CWnd *mainWnd);
void __fastcall FUN_0041d160(CWnd *mainWnd);
void __fastcall FUN_0041d1c0(CWnd *mainWnd);
void __fastcall FUN_0041d220(CWnd *mainWnd);
void __fastcall FUN_0041d280(CWnd *mainWnd);
void __fastcall FUN_0041d040(CWnd *mainWnd);
void __fastcall FUN_0041d2e0(CWnd *mainWnd);
void __fastcall FUN_0041c6e0(CWnd *mainWnd);
void __fastcall FUN_0041d340(CWnd *mainWnd);
void __fastcall FUN_0041d3a0(CWnd *mainWnd);
void __fastcall FUN_0041d400(CWnd *mainWnd);
void __fastcall FUN_0041cc80(CWnd *mainWnd);
void __fastcall FUN_0041cce0(CWnd *mainWnd);
void __fastcall FUN_0041cd40(CWnd *mainWnd);
void __fastcall FUN_0041cda0(CWnd *mainWnd);
void __fastcall FUN_0041ce00(CWnd *mainWnd);
void __fastcall FUN_0041ce60(CWnd *mainWnd);
void __fastcall FUN_0041cec0(CWnd *mainWnd);
void __fastcall FUN_0041cf20(CWnd *mainWnd);
}

/* CFilterSettings is the retail class name (RTTI); only the members written here are declared. */
class CFilterSettings : public CDialog
{
public:
  CString m_text470; // offset 0x70, bound to edit 0x470
  CFilterSettings(CWnd *pParent);
  virtual void DoDataExchange(CDataExchange *pDX);
  virtual BOOL OnInitDialog();
  void OnShowWindow(BOOL bShow, UINT nStatus);
  virtual void OnOK();
  void FUN_0040e4f0();
  void FUN_0040e660();
  virtual BOOL OnCommand(WPARAM wParam, LPARAM lParam);
};

CFilterSettings::CFilterSettings(CWnd *pParent) : CDialog(0xb4, pParent)
{
  m_text470 = "";
}

// Refresh the filter dialog check boxes from the exclude bits (a set bit means unchecked).
#define SET_CHECK(id, expr) dlg->GetDlgItem(id)->SendMessage(BM_SETCHECK, !(expr), 0)
extern "C" void FUN_0040cf30(CWnd *dlg)
{
  SET_CHECK(0x56e, g_qeglobals.d_exclude & 0x2);
  SET_CHECK(0x578, g_qeglobals.d_exclude & 1);
  SET_CHECK(0x57c, g_qeglobals.d_exclude & 0x8);
  SET_CHECK(0x568, g_qeglobals.d_exclude & 0x20);
  SET_CHECK(0x587, g_qeglobals.d_exclude & 0x10);
  SET_CHECK(0x579, g_qeglobals.d_exclude & 0x40);
  SET_CHECK(0x56a, g_qeglobals.d_exclude & 0x20000000);
  SET_CHECK(0x57e, g_qeglobals.d_exclude & 0x10000000);
  SET_CHECK(0x57f, g_qeglobals.d_exclude2 & 0x2);
  SET_CHECK(0x575, g_qeglobals.d_exclude & 0x2000000);
  SET_CHECK(0x57d, g_qeglobals.d_exclude2 & 0x10);
  SET_CHECK(0x57b, g_qeglobals.d_exclude & 0x8000000);
  SET_CHECK(0x581, g_qeglobals.d_exclude & (int)0x80000000);
  SET_CHECK(0x603, g_qeglobals.d_exclude2 & 0x200);
  SET_CHECK(0x605, g_qeglobals.d_exclude2 & 0x800);
  SET_CHECK(0x60b, g_qeglobals.d_exclude2 & 0x1000);
  SET_CHECK(0x658, g_qeglobals.d_exclude2 & 0x2000);
  SET_CHECK(0x608, g_qeglobals.d_exclude2 & 0x4000);
  SET_CHECK(0x659, g_qeglobals.d_exclude2 & 0x8000);
  SET_CHECK(0x657, *((unsigned short *)&g_qeglobals.d_exclude2 + 1) & 1);
  SET_CHECK(0x574, g_qeglobals.d_exclude & 0x1000);
  SET_CHECK(0x567, g_qeglobals.d_exclude & 0x80);
  SET_CHECK(0x586, g_qeglobals.d_exclude & 0x8000);
  SET_CHECK(0x565, g_qeglobals.d_exclude & 0x4000);
  SET_CHECK(0x5cf, g_qeglobals.d_exclude & 0x800000);
  SET_CHECK(0x5d0, *((unsigned short *)&g_qeglobals.d_exclude + 1) & 1);
  SET_CHECK(0x56f, g_qeglobals.d_exclude & 0x20000);
  SET_CHECK(0x584, g_qeglobals.d_exclude & 0x40000);
  SET_CHECK(0x570, g_qeglobals.d_exclude & 0x80000);
  SET_CHECK(0x576, g_qeglobals.d_exclude & 0x100000);
  SET_CHECK(0x571, g_qeglobals.d_exclude & 0x200000);
  SET_CHECK(0x56c, *((unsigned char *)&g_qeglobals.d_exclude + 3) & 1);
  SET_CHECK(0x577, g_qeglobals.d_exclude & 0x4);
  SET_CHECK(0x573, g_qeglobals.d_exclude & 0x2000);
  SET_CHECK(0x57b, g_qeglobals.d_exclude & 0x8000000);
  SET_CHECK(0x572, g_qeglobals.d_exclude & 0x40000000);
  SET_CHECK(0x585, g_qeglobals.d_exclude2 & 1);
  SET_CHECK(0x580, g_qeglobals.d_exclude2 & 0x8);
  SET_CHECK(0x582, g_qeglobals.d_exclude2 & 0x400);
  SET_CHECK(0x56d, g_qeglobals.d_exclude2 & 0x4);
  SET_CHECK(0x56b, g_qeglobals.d_exclude2 & 0x20);
  SET_CHECK(0x566, g_qeglobals.d_exclude2 & 0x40);
  SET_CHECK(0x588, g_qeglobals.d_exclude2 & 0x80);
  SET_CHECK(0x5f3, g_qeglobals.d_exclude2 & 0x100);
}

void CFilterSettings::DoDataExchange(CDataExchange *pDX)
{
  DDX_Text(pDX, 0x470, m_text470);
}

// Fill list 0x511 from the comma/semicolon separated filter string.
void CFilterSettings::OnShowWindow(BOOL bShow, UINT nStatus)
{
  char buffer[1024];
  Default();
  if (bShow == 1)
  {
    FUN_0040cf30(this);
    GetDlgItem(0x470)->SetWindowText("");
    CListBox *list = (CListBox *)GetDlgItem(0x511);
    while (list->DeleteString(0) > 0)
      ;
    const char *src = DAT_012345c4;
    char *dst = buffer;
    while ((*dst++ = *src++))
      ;
    if (DAT_012345c4.GetLength() > 0)
    {
      char *token = strtok(buffer, ",;");
      if (token)
      {
        while (*token == ' ')
          token++;
        do
        {
          list->AddString(token);
          token = strtok(NULL, ",;");
        } while (token);
      }
    }
  }
}

BOOL CFilterSettings::OnInitDialog()
{
  CDialog::OnInitDialog();
  GetDlgItem(0x578)->SetWindowText("Lights");
  GetDlgItem(0x56e)->SetWindowText("Entities");
  GetDlgItem(0x577)->SetWindowText("Connections");
  GetDlgItem(0x585)->SetWindowText("Path Nodes");
  GetDlgItem(0x57c)->SetWindowText("Water");
  GetDlgItem(0x587)->SetWindowText("World");
  GetDlgItem(0x568)->SetWindowText("Clip");
  GetDlgItem(0x579)->SetWindowText("Detail");
  GetDlgItem(0x56a)->SetWindowText("Structural");
  GetDlgItem(0x57e)->SetWindowText("Translucent");
  GetDlgItem(0x57f)->SetWindowText("Portals");
  GetDlgItem(0x567)->SetWindowText("Curves");
  GetDlgItem(0x586)->SetWindowText("Terrain");
  GetDlgItem(0x574)->SetWindowText("Hint/Skip");
  GetDlgItem(0x573)->SetWindowText("Caulk");
  GetDlgItem(0x56b)->SetWindowText("Names");
  GetDlgItem(0x566)->SetWindowText("Blocks");
  GetDlgItem(0x588)->SetWindowText("Coordinates");
  GetDlgItem(0x565)->SetWindowText("Angles");
  GetDlgItem(0x5cf)->SetWindowText("Triggers");
  GetDlgItem(0x5d0)->SetWindowText("Ammo/Items");
  GetDlgItem(0x56f)->SetWindowText("AI/Spawners");
  GetDlgItem(0x584)->SetWindowText("Info");
  GetDlgItem(0x570)->SetWindowText("Static Models");
  GetDlgItem(0x576)->SetWindowText("Weapons");
  GetDlgItem(0x571)->SetWindowText("Funcs");
  GetDlgItem(0x575)->SetWindowText("Weapon Clip");
  GetDlgItem(0x57d)->SetWindowText("Non-Colliding");
  GetDlgItem(0x57b)->SetWindowText("Sky");
  GetDlgItem(0x56c)->SetWindowText("Misc");
  GetDlgItem(0x580)->SetWindowText("Decals");
  GetDlgItem(0x56d)->SetWindowText("Action Nodes");
  GetDlgItem(0x572)->SetWindowText("Entity Models");
  GetDlgItem(0x5f3)->SetWindowText("Goal Volumes");
  GetDlgItem(0x581)->SetWindowText("Mantle");
  GetDlgItem(0x603)->SetWindowText("BCS");
  GetDlgItem(0x605)->SetWindowText("Escort");
  GetDlgItem(0x60b)->SetWindowText("Kill");
  GetDlgItem(0x658)->SetWindowText("Spawner");
  GetDlgItem(0x608)->SetWindowText("Stop Spawner");
  GetDlgItem(0x659)->SetWindowText("Friendly Chain");
  GetDlgItem(0x657)->SetWindowText("Ambient");
  GetDlgItem(0x582)->SetWindowText("NonDecals");
  return TRUE;
}

// Store the check boxes back into the exclude bits (checked = bit clear) and the list into the filter string.
#define CHECK(id, field, mask) \
  if (!GetDlgItem(id)->SendMessage(BM_GETCHECK, 0, 0)) \
    g_qeglobals.field |= (mask); \
  else \
    g_qeglobals.field &= ~(mask)
void CFilterSettings::OnOK()
{
  CString text;
  CListBox *list = (CListBox *)GetDlgItem(0x511);
  int count = list->GetCount();
  DAT_012345c4.Empty();
  for (int i = 0; i < count; i++)
  {
    list->GetText(i, text);
    DAT_012345c4 += text;
    DAT_012345c4 += ",";
  }
  CHECK(0x573, d_exclude, 0x2000);
  CHECK(0x56e, d_exclude, 2);
  CHECK(0x577, d_exclude, 4);
  CHECK(0x575, d_exclude, 0x2000000);
  CHECK(0x57b, d_exclude, 0x8000000);
  CHECK(0x581, d_exclude, 0x80000000);
  CHECK(0x603, d_exclude, 0x200);
  CHECK(0x605, d_exclude, 0x800);
  CHECK(0x60b, d_exclude, 0x1000);
  CHECK(0x658, d_exclude, 0x2000);
  CHECK(0x608, d_exclude, 0x4000);
  CHECK(0x659, d_exclude, 0x8000);
  CHECK(0x657, d_exclude, 0x10000);
  CHECK(0x578, d_exclude, 1);
  CHECK(0x57c, d_exclude, 8);
  CHECK(0x568, d_exclude, 0x20);
  CHECK(0x587, d_exclude, 0x10);
  CHECK(0x579, d_exclude, 0x40);
  CHECK(0x56a, d_exclude, 0x20000000);
  CHECK(0x57e, d_exclude, 0x10000000);
  CHECK(0x574, d_exclude, 0x1000);
  CHECK(0x567, d_exclude, 0x80);
  CHECK(0x586, d_exclude, 0x8000);
  CHECK(0x565, d_exclude, 0x4000);
  CHECK(0x5cf, d_exclude, 0x800000);
  CHECK(0x5d0, d_exclude, 0x10000);
  CHECK(0x56f, d_exclude, 0x20000);
  CHECK(0x584, d_exclude, 0x40000);
  CHECK(0x570, d_exclude, 0x80000);
  CHECK(0x576, d_exclude, 0x100000);
  CHECK(0x571, d_exclude, 0x200000);
  CHECK(0x56c, d_exclude, 0x1000000);
  CHECK(0x572, d_exclude, 0x40000000);
  CHECK(0x585, d_exclude2, 1);
  CHECK(0x57d, d_exclude2, 0x10);
  CHECK(0x57f, d_exclude2, 2);
  CHECK(0x580, d_exclude2, 8);
  CHECK(0x582, d_exclude2, 0x400);
  CHECK(0x56d, d_exclude2, 4);
  CHECK(0x56b, d_exclude2, 0x20);
  CHECK(0x566, d_exclude2, 0x40);
  CHECK(0x588, d_exclude2, 0x80);
  CHECK(0x5f3, d_exclude2, 0x100);
  dword_0123348c |= 0xb;
}

extern "C" void FUN_0040e4e0() {}

// Add the text of edit 0x470 to list 0x511, or remove it when already listed.
void CFilterSettings::FUN_0040e4f0()
{
  CString text;
  CListBox *list = (CListBox *)GetDlgItem(0x511);
  if (!list)
    return;
  CEdit *edit = (CEdit *)GetDlgItem(0x470);
  if (edit)
  {
    edit->GetWindowText(text);
    if (text.GetLength() < 1)
      return;
    int found = list->FindStringExact(-1, text);
    if (found != -1)
    {
      list->DeleteString(found);
      list->SetCurSel(-1);
      edit->SetWindowText("");
    }
    else
    {
      int added = list->AddString(text);
      if (added >= 0)
        list->SetCurSel(added);
      edit->SetSel(0, -1);
    }
  }
}

void CFilterSettings::FUN_0040e660()
{
  SetDefID(0x564);
}

BOOL CFilterSettings::OnCommand(WPARAM wParam, LPARAM lParam)
{
  char buffer[256];
  if (HIWORD(wParam) == 1 && LOWORD(wParam) == 0x511)
  {
    CListBox *list = (CListBox *)GetDlgItem(0x511);
    CEdit *edit = (CEdit *)GetDlgItem(0x470);
    if (list && edit)
    {
      list->GetText(list->GetCurSel(), buffer);
      edit->SetWindowText(buffer);
      edit->SetSel(0, -1);
    }
  }
  return CDialog::OnCommand(wParam, lParam);
}
extern "C" void FUN_0040e760() {}
extern "C" void FUN_0040e770() {}

extern "C" void FUN_0040e780()
{
#line 406
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c440(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040e7f0()
{
#line 412
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c500(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040e860()
{
#line 418
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cbc0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040e8d0()
{
#line 424
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cc20(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040e940()
{
#line 430
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c5c0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040e9b0()
{
#line 436
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cb60(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ea20()
{
#line 442
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cfe0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ea90()
{
#line 448
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c980(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040eb00()
{
#line 454
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c9e0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040eb70()
{
#line 460
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041ca40(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ebe0()
{
#line 466
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c560(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ec50()
{
#line 472
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c620(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ecc0()
{
#line 478
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c680(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ed30()
{
#line 484
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041caa0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040eda0()
{
#line 490
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c7a0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ee10()
{
#line 496
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c860(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ee80()
{
#line 502
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c8c0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040eef0()
{
#line 509
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c4a0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040ef60()
{
#line 515
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c920(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040efd0()
{
#line 521
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cb00(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f040()
{
#line 527
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cf80(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f0b0()
{
#line 533
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d0a0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f120()
{
#line 539
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c740(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f190()
{
#line 545
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c800(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f200()
{
#line 551
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d100(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f270()
{
#line 557
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d160(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f2e0()
{
#line 563
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d1c0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f350()
{
#line 569
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d220(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f3c0()
{
#line 575
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d280(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f430()
{
#line 581
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d040(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f4a0()
{
#line 587
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d2e0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f510()
{
#line 593
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041c6e0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f580()
{
#line 599
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d340(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f5f0()
{
#line 605
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d3a0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f660()
{
#line 611
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041d400(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f6d0()
{
#line 617
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cc80(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f740()
{
#line 623
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cce0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f7b0()
{
#line 629
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cd40(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f820()
{
#line 635
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cda0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f890()
{
#line 641
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041ce00(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f900()
{
#line 647
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041ce60(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f970()
{
#line 653
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cec0(AfxGetApp()->m_pMainWnd);
}

extern "C" void FUN_0040f9e0()
{
#line 659
    assert(AfxGetApp()->m_pMainWnd);
    FUN_0041cf20(AfxGetApp()->m_pMainWnd);
}

