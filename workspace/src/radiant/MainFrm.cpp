#include "stdafx.h"
#include "FindTextureDlg.h"

// Bodies sit in retail address order; FUN_ names and signatures are provisional.

void Pointfile_Next(void);
void Pointfile_Prev(void);
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
void FUN_00441460();
void FUN_004745d0();
}

void QE_CountBrushesAndUpdateStatusBar();
void QE_CheckAutoSave();

class CMainFrame : public CFrameWnd
{
public:
  virtual BOOL PreCreateWindow(CREATESTRUCT &cs);
  virtual BOOL PreTranslateMessage(MSG *pMsg);
  afx_msg void OnTimer(UINT nIDEvent);
  afx_msg void OnFileExit();
  char pad[0x798 - sizeof(CFrameWnd)];
  CWnd *field_0798;
};

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

extern "C" void FUN_00414c70() {}
void CMainFrame::OnFileExit()
{
  PostMessage(WM_CLOSE, 0, 0L);
}

extern "C" void FUN_00414d80() {}
extern "C" void FUN_00414d90() {}
extern "C" void FUN_00414df0() { FUN_00425260(&dword_010a4508); }
extern "C" void FUN_00414e00() { FUN_00425500(&dword_010a4508); }
extern "C" void FUN_00414e10() { FUN_004253d0(&dword_010a4508); }
extern "C" void FUN_00414e20() { FUN_00425630(&dword_010a4508); }
extern "C" void __stdcall FUN_00415320(int nID) { Texture_SetMode(nID); }
extern "C" void __stdcall FUN_00415330(int nID) { FUN_00441100(nID - 60000); }
extern "C" void __stdcall FUN_00415350(int nID) { FUN_00441200(nID - 60256); }
extern "C" void __stdcall FUN_00415370(int nID) { FUN_00441300(nID - 60512); }
extern "C" void FUN_00415690() {}
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
extern "C" void FUN_00417010() { FUN_00470ff0(); }
extern "C" void FUN_00417020() { FUN_00471530(); }
extern "C" void FUN_00417030() { FUN_00471270(); }
extern "C" void FUN_00417040() { FUN_004713e0(); }
extern "C" void FUN_00417050() { FUN_00471670(); }
extern "C" void FUN_00417080() { FUN_00471a90(); }
extern "C" void FUN_00417140() { dword_0123348c |= 1; }
extern "C" void FUN_00417e00(unsigned v) { dword_0123348c |= v; }
extern "C" void FUN_00417f00() {}
extern "C" void FUN_00417f10() {}
extern "C" void FUN_00419080() { FUN_004441b0(); }
extern "C" void FUN_00419090() { FUN_00444a00(); }
extern "C" void FUN_00419670() { CFindTextureDlg::show(); }
extern "C" void FUN_00419970() { FUN_0045c890(); }
extern "C" void FUN_00419980() { FUN_0045ca10(); }
extern "C" void FUN_00419c70() {}
extern "C" void FUN_00419c80() {}
extern "C" void FUN_00419f80() { FUN_0045c950(); }
extern "C" void FUN_00419f90() { FUN_00437400(); }
BOOL CMainFrame::PreTranslateMessage(MSG *pMsg)
{
  return CFrameWnd::PreTranslateMessage(pMsg);
}

extern "C" void FUN_0041a980() { FUN_00435d20(); }
extern "C" void FUN_0041ac10() {}
extern "C" void FUN_0041ac20() {}
extern "C" void FUN_0041af00() { FUN_00432bb0(); }
extern "C" void FUN_0041af10() { FUN_00432ca0(0); }
extern "C" void FUN_0041af20() { FUN_00432ca0(1); }
extern "C" void FUN_0041b0f0() {}
extern "C" void FUN_0041b6e0() { FUN_00437e50(); }
extern "C" void FUN_0041b700() { FUN_00438120(); }
extern "C" void FUN_0041b710() { FUN_00438ff0(); }
extern "C" void FUN_0041ba70() { FUN_00441460(); }
extern "C" void FUN_0041ba80() { DoPatchInspector(); }
extern "C" void FUN_0041bd20() { FUN_004745d0(); }
extern "C" void FUN_0041c0b0() {}
extern "C" void FUN_0041c0c0() {}
extern "C" void FUN_0041c0d0() {}

// Filter toggles: flip one exclude bit, sync the menu check, refresh the filter dialog (FUN_0040cf30).
struct qeglobals_t { unsigned char pad0[0x40]; HWND d_hwndMain; unsigned char pad1[0x6cb74 - 0x44]; unsigned d_exclude; unsigned d_exclude2; };
extern qeglobals_t g_qeglobals;
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

extern "C" void FUN_0041d560() { FUN_00472bd0(0); }
extern "C" void FUN_0041d570() { FUN_00472bd0(1); }
extern "C" void FUN_0041d580() { FUN_004733f0(90); }
extern "C" void FUN_0041d590() { FUN_0046b070(0); }
extern "C" int __fastcall FUN_0041e730(const int *value) { return value[16]; }
extern "C" int __fastcall FUN_0041e740(const int *value) { return value[1]; }
extern "C" int __fastcall FUN_0041e750(const int *value) { return *value; }
extern "C" void __stdcall FUN_0041eaa0(int a0) {  }
extern "C" int FUN_0041eee0() { return 2; }
extern "C" void __stdcall FUN_0041f150(int a0) {  }
extern "C" float __fastcall FUN_0041f200(const float *value) { return value[24]; }
extern "C" unsigned char __fastcall FUN_0041f210(const unsigned char *value) { return value[80]; }
extern "C" int __fastcall FUN_0041f240(const int *value) { return value[3] - value[1]; }
