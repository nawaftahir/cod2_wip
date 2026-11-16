#include "stdafx.h"
#include "FindTextureDlg.h"

// Bodies sit in retail address order; FUN_ names and signatures are provisional.

void Pointfile_Next(void);
void Pointfile_Prev(void);
void DoPatchInspector();

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
