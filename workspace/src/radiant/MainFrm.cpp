#include "stdafx.h"
#include "FindTextureDlg.h"
#include "PrefsDlg.h"
<<<<<<< HEAD
#include "../universal/assertive.h"
=======
#include <math.h>
>>>>>>> radiant/lane-a-r13

// Bodies sit in retail address order; FUN_ names and signatures are provisional.

void Pointfile_Next(void);
void Pointfile_Prev(void);
void Pointfile_Check(void);
void FUN_00441460(void);
void Dvar_SetStringByName(const char *dvarName, const char *value);
void FUN_0042beb0(void);
void DoPatchInspector();
void __fastcall Texture_SetMode(int iTexMenu);
void FUN_00441100(int index);
void FUN_00441200(int index);
void FUN_00441300(int index);

extern "C" {
extern unsigned dword_0123348c;
extern int dword_010a4508;
void FUN_00425260(int *);
void FUN_00425500(int *);
void FUN_004253d0(int *);
void FUN_00425630(int *);
void FUN_00432ca0(int);
void FUN_004733f0(int);
void FUN_0046b070(int);
void FUN_00472bd0(int);
void FUN_0043e440();
void FUN_00449800();
void FUN_00469950();
void FUN_00469140();
void FUN_004694d0();
void FUN_004692a0();
void FUN_00469420();
void FUN_00469350();
void FUN_004364b0();
void FUN_0046dfc0();
void FUN_0046dc40();
void FUN_00471dd0();
void FUN_00470ff0();
void FUN_00471530();
void FUN_00471270();
void FUN_004713e0();
void FUN_00471670();
void FUN_00471a90();
void FUN_004441b0();
void FUN_00444a00();
void FUN_0045c890();
void FUN_0045ca10();
void FUN_0045c950();
void FUN_00437400();
void FUN_00435d20();
void FUN_00432bb0();
void FUN_00437e50();
void FUN_00438120();
void FUN_00438ff0();
void FUN_004745d0();
}

void QE_CountBrushesAndUpdateStatusBar();
void QE_CheckAutoSave();

struct MRUMENU;
BOOL SaveMruInReg(MRUMENU *lpMruMenu, char *lpszKey);
void DeleteMruMenu(MRUMENU *lpMruMenu);
int SaveRegistryInfo(const char *name, void *data, long size);
void FUN_0046fbe0(int a);
char *va(const char *format, ...);
void FUN_0047a250(HWND hwnd, const char *name);
void FUN_004426e0(void);
void FUN_00443590(void);
void CleanUpEntities(void);

// partial views for the shutdown path; instance and entity lists link through prev/next
struct entity_t;
struct entityInst_t { entityInst_t *prev; entityInst_t *next; entity_t *def; };
struct brushdef_t { brushdef_t *oprev; brushdef_t *onext; entity_t *owner; unsigned char pad0c[0x10]; int refCount; };
struct brush_t { brush_t *prev; brush_t *next; entityInst_t *owner; unsigned char pad0c[8]; brushdef_t *def; };
struct entity_t { entity_t *prev; entity_t *next; };
void FUN_0041d930(entityInst_t *list, const char *msg);
void FUN_004678c0(entityInst_t *e);
void FUN_004661f0(entity_t *e);

// g_qeglobals at 0x10bcd14: field_20 = 0x10bcd34, mru menu = 0x11295fc, saved info = 0x1129600
struct qeglobals_t
{
  unsigned char pad0[0x20];
  entity_t *field_20;
  unsigned char pad24[0x40 - 0x24];
  HWND d_hwndMain;
  unsigned char pad44[0x6c8e8 - 0x44];
  MRUMENU *d_lpMruMenu;
  unsigned char d_savedinfo[0x6cb74 - 0x6c8ec]; // 0x294 B in total, the exclude flags sit inside it
  unsigned d_exclude;
  unsigned d_exclude2;
};
extern qeglobals_t g_qeglobals;
extern entityInst_t DAT_010a43d0;
extern brush_t active_brushes;
extern brush_t selected_brushes;
extern int DAT_012334ec;
extern CWnd *DAT_01233484;
extern CPrefsDlg *dword_01233b64;

class CMainFrame : public CFrameWnd
{
public:
  virtual BOOL PreCreateWindow(CREATESTRUCT &cs);
  virtual BOOL PreTranslateMessage(MSG *pMsg);
  afx_msg void OnTimer(UINT nIDEvent);
  afx_msg void OnDestroy();
  afx_msg void OnFileExit();
  // three CSplitterWnd at 0x500, 0x5d8, 0x6b0
  char pad[0x180 - sizeof(CFrameWnd)];
  HWND field_0180;
  char pad2[0x500 - 0x184];
  char wndSplit[0x788 - 0x500];
  CWnd *field_0788;
  CWnd *field_078c;
  CWnd *field_0790;
  CWnd *field_0794;
  CWnd *field_0798;
  CWnd *field_079c;
  int field_07a0;
  char pad_07a4[0x7e0 - 0x7a4];
  CWnd *field_07e0;
  bool field_07e4;
  // update handlers: the CCmdUI argument is enabled from view state
  void FUN_00417150(CCmdUI *pCmdUI);
  void FUN_004190e0(CCmdUI *pCmdUI);
  void FUN_00419ba0(CCmdUI *pCmdUI);
};

// partial view of the camera window object (CCamWnd 0x54 = camera state)
struct CamView
{
  char pad[0x60];
  float origin[3];
  float angles[3];
  int drawMode;
  float color[3];
  float forward[3];
  float right[3];
};

extern CMainFrame *g_pParentWnd;

// partial view of the XY window object
struct XYView
{
  char pad[0x60];
  float scale;
};
struct PatchView { char pad[0x70]; int org[3]; };
#define CAM ((CamView *)self->field_078c)

// CPrefsDlg field at a byte offset (header names for these slots are unconfirmed)
#define PFP(p, off) (*(int *)((char *)(p) + (off)))
#define PF(off) PFP(dword_01233b64, off)
#define PFB(off) (*(bool *)((char *)dword_01233b64 + (off)))

extern "C" int __stdcall FUN_00411230(int a0, int a1) { return 0; }
extern "C" void FUN_00411240() {}
extern "C" void __stdcall FUN_004115a0(int a0, int a1) {  }
BOOL CMainFrame::PreCreateWindow(CREATESTRUCT &cs)
{
  return CFrameWnd::PreCreateWindow(cs);
}

bool MouseDown()
{
  if (::GetAsyncKeyState(VK_LBUTTON))
    return true;
  if (::GetAsyncKeyState(VK_RBUTTON))
    return true;
  if (::GetAsyncKeyState(VK_MBUTTON))
    return true;
  return false;
}

void CMainFrame::OnTimer(UINT nIDEvent)
{
  if (!MouseDown())
  {
    QE_CountBrushesAndUpdateStatusBar();
    QE_CheckAutoSave();
  }
}

// 0x00413250 (1336 B)
void CMainFrame::OnDestroy()
{
  WINDOWPLACEMENT wp;
  int info[2];
  CSplitterWnd *split1 = (CSplitterWnd *)(wndSplit);
  CSplitterWnd *split2 = (CSplitterWnd *)(wndSplit + 0xd8);
  CSplitterWnd *split3 = (CSplitterWnd *)(wndSplit + 0x1b0);

  KillTimer(1);
  FUN_0046fbe0(1);
  SaveBarState("RadiantToolBars2");
  SaveMruInReg(g_qeglobals.d_lpMruMenu, "Software\\iw\\CoD2Radiant\\MRU");
  DeleteMruMenu(g_qeglobals.d_lpMruMenu);
  wp.length = sizeof(WINDOWPLACEMENT);
  if (::GetWindowPlacement(m_hWnd, &wp))
    SaveRegistryInfo("Radiant::MainWindowPlace", &wp, sizeof(wp));
  if (field_07a0 != 0 && field_07a0 != 3)
  {
    wp.length = sizeof(WINDOWPLACEMENT);
    if (::GetWindowPlacement(field_0788->GetSafeHwnd(), &wp))
      SaveRegistryInfo("xywindow", &wp, sizeof(wp));
    wp.length = sizeof(WINDOWPLACEMENT);
    if (::GetWindowPlacement(field_078c->GetSafeHwnd(), &wp))
      SaveRegistryInfo("camerawindow", &wp, sizeof(wp));
    wp.length = sizeof(WINDOWPLACEMENT);
    if (::GetWindowPlacement(field_0794->GetSafeHwnd(), &wp))
      SaveRegistryInfo("zwindow", &wp, sizeof(wp));
    FUN_0047a250(field_0790->GetSafeHwnd(), "texwindow");
    FUN_0047a250(field_079c->GetSafeHwnd(), "editwindow");
  }
  else
  {
    FUN_0047a250(split1->GetSafeHwnd(), "Radiant::Split");
    FUN_0047a250(split2->GetSafeHwnd(), "Radiant::Split2");
    FUN_0047a250(split3->GetSafeHwnd(), "Radiant::Split3");
    split1->GetRowInfo(0, info[1], info[0]);
    SaveRegistryInfo("Radiant::Split::Row_0", info, 8);
    split1->GetRowInfo(1, info[1], info[0]);
    SaveRegistryInfo("Radiant::Split::Row_1", info, 8);
    split2->GetColumnInfo(0, info[1], info[0]);
    SaveRegistryInfo("Radiant::Split2::Col_0", info, 8);
    split2->GetColumnInfo(1, info[1], info[0]);
    SaveRegistryInfo("Radiant::Split2::Col_1", info, 8);
    split2->GetColumnInfo(2, info[1], info[0]);
    SaveRegistryInfo("Radiant::Split2::Col_2", info, 8);
    split3->GetRowInfo(0, info[1], info[0]);
    SaveRegistryInfo("Radiant::Split3::Row_0", info, 8);
    split3->GetRowInfo(1, info[1], info[0]);
    SaveRegistryInfo("Radiant::Split3::Row_1", info, 8);
  }
  if (field_0788 && field_0788->m_hWnd)
    ::SendMessage(field_0788->m_hWnd, WM_DESTROY, 0, 0);
  delete field_0788;
  field_0788 = NULL;
  if (field_0794 && field_0794->m_hWnd)
    ::SendMessage(field_0794->m_hWnd, WM_DESTROY, 0, 0);
  delete field_0794;
  field_0794 = NULL;
  if (field_0790 && field_0790->m_hWnd)
    ::SendMessage(field_0790->m_hWnd, WM_DESTROY, 0, 0);
  delete field_0790;
  field_0790 = NULL;
  if (field_079c && field_079c->m_hWnd)
    ::SendMessage(field_079c->m_hWnd, WM_DESTROY, 0, 0);
  delete field_079c;
  field_079c = NULL;
  if (field_078c && field_078c->m_hWnd)
    ::SendMessage(field_078c->m_hWnd, WM_DESTROY, 0, 0);
  delete field_078c;
  field_078c = NULL;
  if (field_0798 && field_0798->m_hWnd)
    ::SendMessage(field_0798->m_hWnd, WM_DESTROY, 0, 0);
  delete field_0798;
  field_0798 = NULL;
  if (DAT_01233484)
  {
    if (DAT_01233484->m_hWnd)
      ::SendMessage(DAT_01233484->m_hWnd, WM_DESTROY, 0, 0);
    delete DAT_01233484;
  }
  DAT_01233484 = NULL;
  SaveRegistryInfo("SavedInfo", g_qeglobals.d_savedinfo, 0x294);
  if (_stricmp((const char *)&dword_010a4508, "unnamed.map") != 0)
  {
    dword_01233b64->m_strLastMap = (const char *)&dword_010a4508;
    dword_01233b64->SavePrefs();
  }
  while (DAT_010a43d0.next && DAT_010a43d0.next != &DAT_010a43d0)
    FUN_004678c0(DAT_010a43d0.next);
  DAT_012334ec = 0;
  for (entity_t *e = g_qeglobals.field_20->next; e && e != g_qeglobals.field_20; )
  {
    entity_t *next = e->next;
    FUN_004661f0(e);
    e = next;
  }
  FUN_004661f0(g_qeglobals.field_20);
  g_qeglobals.field_20 = NULL;
  FUN_00443590();
  CleanUpEntities();
  FUN_004426e0();
  CFrameWnd::OnDestroy();
}

extern "C" void __fastcall FUN_00414c50(CMainFrame *self) { self->field_07e4 = !self->field_07e4; }
extern "C" void FUN_00414c70() {}
void CMainFrame::OnFileExit()
{
  PostMessage(WM_CLOSE, 0, 0L);
}

extern int DAT_010a4910;
extern "C" void FUN_00414d60()
{
  if (DAT_010a4910)
    DAT_010a4910 = 0;
  else
    Pointfile_Check();
}
extern "C" void FUN_00414d80() {}
extern "C" void FUN_00414d90() {}
extern "C" void FUN_00414df0() { FUN_00425260(&dword_010a4508); }
extern "C" void FUN_00414e00() { FUN_00425500(&dword_010a4508); }
extern "C" void FUN_00414e10() { FUN_004253d0(&dword_010a4508); }
extern "C" void FUN_00414e20() { FUN_00425630(&dword_010a4508); }
extern "C" void __fastcall FUN_00414e30(CMainFrame *self)
{
  if (self->field_0788)
    ((XYView *)self->field_0788)->scale = 1.0f;
  dword_0123348c |= 6;
}
extern "C" void __fastcall FUN_00414e50(CMainFrame *self)
{
  CAM->angles[0] = 0;
  CAM->angles[2] = 0;
  CamView *cam = CAM;
  cam->angles[1] = floor((cam->angles[1] + 11.0f) / 22.5) * 22.5;
  dword_0123348c |= 5;
}
extern "C" void FUN_00415110()
{
  PF(0x22c) = !PF(0x22c);
  dword_01233b64->SavePrefs();
}
extern "C" void FUN_00415280() { Dvar_SetStringByName("r_textureMode", "nearest"); dword_0123348c |= 1; }
extern "C" void FUN_004152a0() { Dvar_SetStringByName("r_textureMode", "linear"); dword_0123348c |= 1; }
extern "C" void FUN_004152c0() { Dvar_SetStringByName("r_textureMode", "bilinear"); dword_0123348c |= 1; }
extern "C" void FUN_004152e0() { Dvar_SetStringByName("r_textureMode", "trilinear"); dword_0123348c |= 1; }
extern "C" void FUN_00415300() { Dvar_SetStringByName("r_textureMode", "anisotropic"); dword_0123348c |= 1; }
extern "C" void __stdcall FUN_00415320(int nID) { Texture_SetMode(nID); }
extern "C" void __stdcall FUN_00415330(int nID) { FUN_00441100(nID - 60000); }
extern "C" void __stdcall FUN_00415350(int nID) { FUN_00441200(nID - 60256); }
extern "C" void __stdcall FUN_00415370(int nID) { FUN_00441300(nID - 60512); }
extern "C" void FUN_00415690() {}
extern float DAT_01139e60;
extern "C" void FUN_00415960()
{
  DAT_01139e60 *= 1.25f;
  if (DAT_01139e60 > 160.0f)
    DAT_01139e60 = 160.0f;
  dword_0123348c |= 0x28;
}
extern "C" void FUN_004159a0()
{
  DAT_01139e60 *= 0.8f;
  if (DAT_01139e60 < 0.003125f)
    DAT_01139e60 = 0.003125f;
  dword_0123348c |= 0x28;
}
extern "C" void FUN_00415b90() { FUN_0043e440(); }
extern "C" void FUN_00415ba0() {}
extern "C" void FUN_00415bf0() { Pointfile_Next(); }
extern "C" void FUN_00415c00() { Pointfile_Prev(); }
extern "C" void FUN_00415c10() { FUN_00449800(); }
extern "C" void FUN_00415df0() { FUN_00469950(); }
extern "C" void FUN_00416270() { FUN_00469140(); }
extern "C" void FUN_00416280() { FUN_004694d0(); }
extern "C" void FUN_00416290() { FUN_004692a0(); }
extern "C" void FUN_004162a0() { FUN_00469420(); }
extern "C" void FUN_004162b0() { FUN_00469350(); }
extern "C" void FUN_00416480() { FUN_004364b0(); }
extern "C" void FUN_00416490() { FUN_0046dfc0(); }
extern "C" void FUN_004164c0() { FUN_0046dc40(); }
extern "C" void FUN_004164d0() { FUN_00471dd0(); }
extern int DAT_01129934;
extern int DAT_01129938;
extern "C" void FUN_004165a0() { DAT_01129934 ^= 1; dword_0123348c |= 0xffffffff; }
extern "C" void FUN_004165c0() { DAT_01129938 ^= 1; dword_0123348c |= 0xffffffff; }
extern "C" void __fastcall FUN_00416870(CMainFrame *self)
{
  PF(0x250) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x81ab, MAKELONG(PF(0x250) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void FUN_00417010() { FUN_00470ff0(); }
extern "C" void FUN_00417020() { FUN_00471530(); }
extern "C" void FUN_00417030() { FUN_00471270(); }
extern "C" void FUN_00417040() { FUN_004713e0(); }
extern "C" void FUN_00417050() { FUN_00471670(); }
extern "C" void FUN_00417080() { FUN_00471a90(); }
extern "C" void FUN_00417140() { dword_0123348c |= 1; }
void CMainFrame::FUN_00417150(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(!field_07e4);
}
extern "C" void __fastcall FUN_00417220(CMainFrame *self)
{
  CAM->angles[0] -= 22.5;
  if (CAM->angles[0] < -85.0f)
    CAM->angles[0] = -85.0f;
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_00417270(CMainFrame *self)
{
  CAM->angles[0] += 22.5;
  if (CAM->angles[0] > 85.0f)
    CAM->angles[0] = 85.0f;
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_00417340(CMainFrame *self)
{
  CamView *cam = CAM;
  cam->origin[2] -= 32.0f;
  dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
}
extern "C" void __fastcall FUN_004174a0(CMainFrame *self)
{
  CamView *cam = CAM;
  cam->origin[0] -= cam->right[0] * 32.0f;
  cam->origin[1] -= cam->right[1] * 32.0f;
  cam->origin[2] -= cam->right[2] * 32.0f;
  dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
}
extern "C" void __fastcall FUN_00417510(CMainFrame *self)
{
  CamView *cam = CAM;
  cam->origin[0] += cam->right[0] * 32.0f;
  cam->origin[1] += cam->right[1] * 32.0f;
  cam->origin[2] += cam->right[2] * 32.0f;
  dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
}
extern "C" void __fastcall FUN_00417600(CMainFrame *self)
{
  CamView *cam = CAM;
  cam->origin[2] += 32.0f;
  dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
}
extern int DAT_010bcd28;
extern "C" void FUN_00417640() { DAT_010bcd28 = !DAT_010bcd28; dword_0123348c |= 0xa; }
// show or hide one child window
extern "C" void __fastcall FUN_00417750(CMainFrame *self)
{
  if (self->field_07a0 > 0 && self->field_07a0 < 3 && self->field_078c && self->field_078c->GetSafeHwnd())
  {
    if (::IsWindowVisible(self->field_078c->GetSafeHwnd()))
      self->field_078c->ShowWindow(SW_HIDE);
    else
      self->field_078c->ShowWindow(SW_SHOW);
  }
}
extern "C" void __fastcall FUN_004177a0(CMainFrame *self)
{
  if (self->field_07a0 > 0 && self->field_07a0 < 3 && self->field_079c && self->field_079c->GetSafeHwnd())
  {
    if (::IsWindowVisible(self->field_079c->GetSafeHwnd()))
      self->field_079c->ShowWindow(SW_HIDE);
    else
      self->field_079c->ShowWindow(SW_SHOW);
  }
}
extern "C" void __fastcall FUN_004177f0(CMainFrame *self)
{
  if (self->field_07a0 == 1 && self->field_0788 && self->field_0788->GetSafeHwnd())
  {
    if (::IsWindowVisible(self->field_0788->GetSafeHwnd()))
      self->field_0788->ShowWindow(SW_HIDE);
    else
      self->field_0788->ShowWindow(SW_SHOW);
  }
}
extern "C" void FUN_00417e00(unsigned v) { dword_0123348c |= v; }
extern bool DAT_0109fe5c;
extern "C" void __fastcall FUN_00417e10(CMainFrame *self)
{
  if (self->field_07e0)
  {
    DAT_0109fe5c = !DAT_0109fe5c;
    dword_0123348c |= 0x102;
  }
}
extern "C" void FUN_00417f00() {}
extern "C" void FUN_00417f10() {}
extern bool DAT_0109fe5f;
extern "C" void FUN_00418fd0()
{
  CWnd *window = g_pParentWnd->field_07e0;
  if (window)
  {
    DAT_0109fe5f = false;
    ::RedrawWindow(window->m_hWnd, NULL, NULL, 0x105);
  }
}
extern "C" void __fastcall FUN_00418cf0(CMainFrame *self)
{
  CPrefsDlg *prefs = dword_01233b64;
  PFP(prefs, 0x248) ^= 1;
  prefs->SavePrefs();
  ::SendMessage(self->field_0180, 0x402, 0x8019, MAKELONG(PF(0x248) == 0, 0));
}
extern "C" void FUN_00419080() { FUN_004441b0(); }
extern "C" void FUN_00419090() { FUN_00444a00(); }
extern int DAT_0109fdc4;
void CMainFrame::FUN_004190e0(CCmdUI *pCmdUI)
{
  bool enable = DAT_0109fdc4 != 0;
  pCmdUI->Enable(enable);
}
extern "C" void FUN_00419670() { CFindTextureDlg::show(); }
extern void (*dword_0059c474)(void);
extern "C" void FUN_00419680() { dword_0059c474(); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00419970() { FUN_0045c890(); }
extern "C" void FUN_00419980() { FUN_0045ca10(); }
extern int DAT_0109fecc;
void CMainFrame::FUN_00419ba0(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(DAT_0109fecc);
}
extern "C" void FUN_00419c70() {}
extern "C" void FUN_00419c80() {}
extern "C" void FUN_00419f80() { FUN_0045c950(); }
extern "C" void FUN_00419f90() { FUN_00437400(); }
BOOL CMainFrame::PreTranslateMessage(MSG *pMsg)
{
  return CFrameWnd::PreTranslateMessage(pMsg);
}

extern "C" void __fastcall FUN_0041a2f0(CMainFrame *self)
{
  PF(0x2c8) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8054, MAKELONG(PF(0x2c8) == 0, 0));
  dword_01233b64->SavePrefs();
}
extern "C" void __fastcall FUN_0041a5c0(CMainFrame *self)
{
  if (++PF(0x1c8) > 2)
    PF(0x1c8) = 0;
  ::SendMessage(self->field_0180, 0x402, 0x80a8, MAKELONG(PF(0x1c8) != 0, 0));
  dword_01233b64->SavePrefs();
}
extern "C" void __fastcall FUN_0041a620(CMainFrame *self)
{
  PF(0x1cc) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8172, MAKELONG(PF(0x1cc) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_0041a670(CMainFrame *self)
{
  PF(0x1d0) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8176, MAKELONG(PF(0x1d0) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_0041a6c0(CMainFrame *self)
{
  PF(0x1d4) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8191, MAKELONG(PF(0x1d4) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_0041a710(CMainFrame *self)
{
  PF(0x2a8) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x81b6, MAKELONG(PF(0x2a8) != 0, 0));
  dword_01233b64->SavePrefs();
}
extern "C" void __fastcall FUN_0041a7f0(CMainFrame *self)
{
  PF(0x24c) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8187, MAKELONG(PF(0x24c) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a840(CMainFrame *self)
{
  PF(0x26c) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8183, MAKELONG(PF(0x26c) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a890(CMainFrame *self)
{
  PF(0x270) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x81b7, MAKELONG(PF(0x270) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a8e0(CMainFrame *self)
{
  PF(0x274) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x81b8, MAKELONG(PF(0x274) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a930(CMainFrame *self)
{
  PF(0x278) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x81b9, MAKELONG(PF(0x278) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}

extern "C" void FUN_0041a980() { FUN_00435d20(); }
extern "C" void __fastcall FUN_0041a990(CMainFrame *self)
{
  PF(0x27c) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8184, MAKELONG(PF(0x27c) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void FUN_0041a9e0()
{
  CMainFrame *frame = g_pParentWnd;
  PatchView *dialog = (PatchView *)frame->field_07e0;
  int *src = (int *)((CamView *)frame->field_078c)->origin;
  dialog->org[0] = src[0];
  dialog->org[1] = src[1];
  dialog->org[2] = src[2];
  dword_0123348c |= 2;
}
extern "C" void __fastcall FUN_0041aa10(CMainFrame *self)
{
  if (++PF(0x2e0) > 2)
    PF(0x2e0) = 0;
  ::SendMessage(self->field_0180, 0x402, 0x8059, MAKELONG(PF(0x2e0) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041ab20(CMainFrame *self)
{
  PFB(0x2e4) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x805a, MAKELONG(PFB(0x2e4) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void FUN_0041ac10() {}
extern "C" void FUN_0041ac20() {}
extern "C" void __fastcall FUN_0041ac30(CMainFrame *self)
{
  PFB(0x2e5) ^= 1;
  ::SendMessage(self->field_0180, 0x402, 0x8061, MAKELONG(PFB(0x2e5) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void FUN_0041af00() { FUN_00432bb0(); }
extern "C" void FUN_0041af10() { FUN_00432ca0(0); }
extern "C" void FUN_0041af20() { FUN_00432ca0(1); }
extern "C" void FUN_0041b0f0() {}

extern bool DAT_012334ba;
extern bool DAT_012334b9;
extern bool DAT_0112993e;
extern bool DAT_0112993f;
extern int DAT_011298b0;

// Sync four toolbar buttons and their menu checks with the mode flags.
extern "C" void FUN_0041b190(CMainFrame *self)
{
  ::SendMessage(self->field_0180, 0x402, 0x8072, MAKELONG(DAT_012334ba != 0, 0));
  ::SendMessage(self->field_0180, 0x402, 0x8068, MAKELONG(DAT_012334b9 != 0, 0));
  ::SendMessage(self->field_0180, 0x402, 0x8174, MAKELONG(DAT_0112993e != 0, 0));
  ::SendMessage(self->field_0180, 0x402, 0x8173, MAKELONG(DAT_0112993f != 0, 0));
  ::SendMessage(self->field_0180, 0x402, 0x8175, MAKELONG(DAT_011298b0 == 11, 0));
  ::CheckMenuItem(::GetMenu(g_qeglobals.d_hwndMain), 0x8174, DAT_0112993e ? MF_CHECKED : MF_UNCHECKED);
  ::CheckMenuItem(::GetMenu(g_qeglobals.d_hwndMain), 0x8173, DAT_0112993f ? MF_CHECKED : MF_UNCHECKED);
  ::CheckMenuItem(::GetMenu(g_qeglobals.d_hwndMain), 0x8175, DAT_011298b0 == 11 ? MF_CHECKED : MF_UNCHECKED);
}
extern "C" void FUN_0041b6e0() { FUN_00437e50(); }
extern "C" void FUN_0041b700() { FUN_00438120(); }
extern "C" void FUN_0041b710() { FUN_00438ff0(); }
extern "C" void FUN_0041ba70() { FUN_00441460(); }
extern "C" void FUN_0041ba80() { DoPatchInspector(); }
extern "C" void __fastcall FUN_0041bb10(CMainFrame *self)
{
  DAT_0112993e = !DAT_0112993e;
  DAT_0112993f = false;
  FUN_0041b190(self);
}
extern "C" void __fastcall FUN_0041bb30(CMainFrame *self)
{
  DAT_0112993e = false;
  DAT_0112993f = !DAT_0112993f;
  FUN_0041b190(self);
}
extern "C" void __fastcall FUN_0041bb50(CMainFrame *self)
{
  DAT_0112993e = false;
  DAT_0112993f = false;
  if (DAT_011298b0 != 11)
  {
    int previous = DAT_011298b0;
    DAT_011298b0 = 11;
    FUN_0041b190(g_pParentWnd);
    if (previous == 10)
      FUN_0042beb0();
  }
  else
  {
    DAT_011298b0 = 0;
    FUN_0041b190(g_pParentWnd);
  }
  FUN_0041b190(self);
}
extern bool DAT_012334d8;
extern "C" void FUN_0041bcb0() { DAT_012334d8 ^= 1; dword_0123348c |= 2; }
extern "C" void FUN_0041bd20() { FUN_004745d0(); }
extern "C" void FUN_0041c0b0() {}
extern "C" void FUN_0041c0c0() {}
extern "C" void FUN_0041c0d0() {}

// Filter toggles: flip one exclude bit, sync the menu check, refresh the filter dialog (FUN_0040cf30).
extern "C" void FUN_0040cf30(CWnd *filterSettings);
extern "C" void FUN_00467f00();
#define FILTER_TOGGLE(name, field, mask, menuId, redraw) \
extern "C" void __fastcall name(CMainFrame *self) \
{ \
  g_qeglobals.field ^= mask; \
  if (g_qeglobals.field & mask) \
    CheckMenuItem(::GetMenu(g_qeglobals.d_hwndMain), menuId, MF_UNCHECKED); \
  else \
    CheckMenuItem(::GetMenu(g_qeglobals.d_hwndMain), menuId, MF_CHECKED); \
  FUN_0040cf30(self->field_0798); \
  dword_0123348c |= redraw; \
}

FILTER_TOGGLE(FUN_0041c440, d_exclude, 0x10, 0x8155, 0xb)
FILTER_TOGGLE(FUN_0041c4a0, d_exclude, 0x2, 0x8156, 0xb)
FILTER_TOGGLE(FUN_0041c500, d_exclude, 0x80, 0x8157, 0xb)
FILTER_TOGGLE(FUN_0041c560, d_exclude, 0x10000000, 0x8158, 0xb)
FILTER_TOGGLE(FUN_0041c5c0, d_exclude, 0x8, 0x8159, 0xb)
FILTER_TOGGLE(FUN_0041c620, d_exclude, 0x2000, 0x815a, 0xb)
FILTER_TOGGLE(FUN_0041c680, d_exclude, 0x20, 0x815b, 0xb)
FILTER_TOGGLE(FUN_0041c6e0, d_exclude, 0x4, 0x815c, 0xb)
FILTER_TOGGLE(FUN_0041c740, d_exclude2, 0x1, 0x815d, 0xb)
FILTER_TOGGLE(FUN_0041c7a0, d_exclude2, 0x2, 0xc1, 0xb)
FILTER_TOGGLE(FUN_0041c800, d_exclude2, 0x4, 0xc2, 0xb)
FILTER_TOGGLE(FUN_0041c860, d_exclude2, 0x8, 0xcd, 0xb)
FILTER_TOGGLE(FUN_0041c8c0, d_exclude2, 0x400, 0xe3, 0xb)
FILTER_TOGGLE(FUN_0041c920, d_exclude, 0x1, 0x815e, 0xb)
FILTER_TOGGLE(FUN_0041c980, d_exclude, 0x40, 0x815f, 0xb)
FILTER_TOGGLE(FUN_0041c9e0, d_exclude, 0x2000000, 0xc7, 0xb)
FILTER_TOGGLE(FUN_0041ca40, d_exclude2, 0x10, 0xcf, 0xb)
FILTER_TOGGLE(FUN_0041caa0, d_exclude, 0x1000, 0x8160, 0xb)
FILTER_TOGGLE(FUN_0041cb00, d_exclude, 0x40000000, 0x8161, 0xb)
FILTER_TOGGLE(FUN_0041cb60, d_exclude, 0x800000, 0x8163, 0xb)
FILTER_TOGGLE(FUN_0041cbc0, d_exclude, 0x8000, 0x8164, 0xb)
FILTER_TOGGLE(FUN_0041cc20, d_exclude, 0x8000000, 0x8165, 0xb)
FILTER_TOGGLE(FUN_0041cc80, d_exclude, 0x80000000, 0x81b0, 0xb)
FILTER_TOGGLE(FUN_0041cce0, d_exclude2, 0x200, 0x81b5, 0xb)
FILTER_TOGGLE(FUN_0041cd40, d_exclude2, 0x800, 0x81d4, 0xb)
FILTER_TOGGLE(FUN_0041cda0, d_exclude2, 0x1000, 0x81dc, 0xb)
FILTER_TOGGLE(FUN_0041ce00, d_exclude2, 0x2000, 0x81d7, 0xb)
FILTER_TOGGLE(FUN_0041ce60, d_exclude2, 0x4000, 0x81d9, 0xb)
FILTER_TOGGLE(FUN_0041cec0, d_exclude2, 0x8000, 0x81da, 0xb)
FILTER_TOGGLE(FUN_0041cf20, d_exclude2, 0x10000, 0x81db, 0xb)
FILTER_TOGGLE(FUN_0041cf80, d_exclude, 0x80000, 0x8166, 0xb)
FILTER_TOGGLE(FUN_0041cfe0, d_exclude, 0x20000000, 0x8167, 0xb)
extern "C" void __fastcall FUN_0041d040(CMainFrame *self)
{
  g_qeglobals.d_exclude2 ^= 0x20;
  if (g_qeglobals.d_exclude2 & 0x20)
    CheckMenuItem(::GetMenu(g_qeglobals.d_hwndMain), 0x8169, MF_UNCHECKED);
  else
    CheckMenuItem(::GetMenu(g_qeglobals.d_hwndMain), 0x8169, MF_CHECKED);
  FUN_00467f00();
  FUN_0040cf30(self->field_0798);
  dword_0123348c |= 2;
}
FILTER_TOGGLE(FUN_0041d0a0, d_exclude, 0x20000, 0xd7, 0xb)
FILTER_TOGGLE(FUN_0041d100, d_exclude, 0x1000000, 0xdb, 0xb)
FILTER_TOGGLE(FUN_0041d160, d_exclude, 0x200000, 0xdc, 0xb)
FILTER_TOGGLE(FUN_0041d1c0, d_exclude, 0x40000, 0xdd, 0xb)
FILTER_TOGGLE(FUN_0041d220, d_exclude, 0x100000, 0xde, 0xb)
FILTER_TOGGLE(FUN_0041d280, d_exclude, 0x10000, 0xdf, 0xb)
FILTER_TOGGLE(FUN_0041d2e0, d_exclude, 0x4000, 0x8096, 3)
FILTER_TOGGLE(FUN_0041d340, d_exclude2, 0x40, 0x8115, 2)
FILTER_TOGGLE(FUN_0041d3a0, d_exclude2, 0x80, 0x80e5, 2)
FILTER_TOGGLE(FUN_0041d400, d_exclude2, 0x100, 0x81ae, 0xb)

extern CWnd DAT_01233b68;
extern CWnd DAT_01234040;
extern CWnd DAT_01234550;
extern "C" void FUN_0041d460()
{
  if (::IsWindowVisible(DAT_01233b68.m_hWnd))
    DAT_01233b68.ShowWindow(SW_HIDE);
  else
    DAT_01233b68.ShowWindow(SW_SHOW);
  dword_0123348c |= 1;
}
extern "C" void FUN_0041d4a0()
{
  if (::IsWindowVisible(DAT_01234040.m_hWnd))
    DAT_01234040.ShowWindow(SW_HIDE);
  else
    DAT_01234040.ShowWindow(SW_SHOW);
  dword_0123348c |= 1;
}
extern "C" void FUN_0041d520()
{
  if (::IsWindowVisible(DAT_01234550.m_hWnd))
    DAT_01234550.ShowWindow(SW_HIDE);
  else
    DAT_01234550.ShowWindow(SW_SHOW);
  dword_0123348c |= 1;
}

extern "C" void FUN_0041d560() { FUN_00472bd0(0); }
extern "C" void FUN_0041d570() { FUN_00472bd0(1); }
extern "C" void FUN_0041d580() { FUN_004733f0(90); }
extern "C" void FUN_0041d590() { FUN_0046b070(0); }

// 0x0041d5e0 (843 B)
void FUN_0041d5e0(brush_t *brushList, const char *msg)
{
#line 6398
  assert(brushList);
  for (brush_t *brush = brushList->next; brush != brushList; brush = brush->next)
  {
#line 6401
    assertMsg(brush, "%s", msg);
#line 6402
    assertMsg(brush->prev, "%s", msg);
#line 6403
    assertMsg(brush->next, "%s", msg);
#line 6404
    assertMsg(brush->prev->next == brush, "%s", msg);
#line 6405
    assertMsg(brush->next->prev == brush, "%s", msg);
#line 6407
    assertMsg(brush->def, "%s", msg);
#line 6408
    assertMsg(brush->owner, "%s", msg);
#line 6409
    assertMsg(brush->def->owner == brush->owner->def, "%s", msg);
#line 6410
    assertMsg(brush->def->refCount >= 1, "%s", msg);
  }
}
// 0x0041e160 (63 B)
void FUN_0041e160(const char *msg)
{
  FUN_0041d5e0(&active_brushes, va("%s - active_brushes", msg));
  FUN_0041d5e0(&selected_brushes, va("%s - active_brushes", msg));
  FUN_0041d930(&DAT_010a43d0, msg);
}

extern "C" int __fastcall FUN_0041e730(const int *value) { return value[16]; }
extern "C" int __fastcall FUN_0041e740(const int *value) { return value[1]; }
extern "C" int __fastcall FUN_0041e750(const int *value) { return *value; }
extern "C" void __stdcall FUN_0041eaa0(int a0) {  }
extern "C" int FUN_0041eee0() { return 2; }
extern "C" void __stdcall FUN_0041f150(int a0) {  }
extern "C" float __fastcall FUN_0041f200(const float *value) { return value[24]; }
extern "C" unsigned char __fastcall FUN_0041f210(const unsigned char *value) { return value[80]; }
extern "C" int __fastcall FUN_0041f240(const int *value) { return value[3] - value[1]; }
