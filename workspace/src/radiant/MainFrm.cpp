#include "stdafx.h"
#include "FindTextureDlg.h"
#include "radiant_wnd.h"
#include "PrefsDlg.h"
#include "FilterSettings.h"
#include "../universal/assertive.h"
#include <math.h>

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
bool FUN_00425260(int *);
bool FUN_00425500(int *);
bool FUN_004253d0(int *);
bool FUN_00425630(int *);

extern "C" {
extern unsigned dword_0123348c;
extern int dword_010a4508;
void FUN_00432ca0(int);
void FUN_004733f0(int);
void FUN_0046b070(int);
void FUN_00472bd0(int);
void FUN_0043e440();
void FUN_00469950();
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
void WXY_Print();
void Map_RemoveRegion();

void Undo_Undo();
void Undo_Redo();
void QE_CountBrushesAndUpdateStatusBar();
void QE_CheckAutoSave();

struct MRUMENU;
const int RAD_SHIFT = 0x01;
const int RAD_ALT = 0x02;
const int RAD_CONTROL = 0x04;
const int RAD_PRESS = 0x08;
struct SCommandInfo
{
  char *m_strCommand;
  unsigned int m_nKey;
  unsigned int m_nModifiers;
  unsigned int m_nCommand;
};
extern SCommandInfo g_Commands[];
extern int g_nCommandCount;
BOOL LoadRegistryInfo(const char *pszName, void *pvBuf, long *plSize);
BOOL SaveMruInReg(MRUMENU *lpMruMenu, char *lpszKey);
void DeleteMruMenu(MRUMENU *lpMruMenu);
int SaveRegistryInfo(const char *name, void *data, long size);
void FUN_0046fbe0(int a);
BOOL DoColor(int iIndex);
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
  unsigned char pad24[0x3c - 0x24];
  HINSTANCE d_hInstance;
  HWND d_hwndMain;
  unsigned char pad44[0x48 - 0x44];
  HWND d_hwndEdit;
  HWND field_4c;
  unsigned char pad50[0x5c - 0x50];
  HWND d_hwndStatus;
  HWND field_60;
  unsigned char pad64[0x6c8e8 - 0x64];
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

typedef char MainFrameSplitSize[(sizeof(CSplitterWnd) == 0xd8) ? 1 : -1];

#include "TextureBar.h"

class CMainFrame : public CFrameWnd
{
public:
  virtual BOOL PreCreateWindow(CREATESTRUCT &cs);
  virtual BOOL PreTranslateMessage(MSG *pMsg);
  virtual BOOL OnCommand(WPARAM wParam, LPARAM lParam);
  virtual LRESULT WindowProc(UINT message, WPARAM wParam, LPARAM lParam);
  virtual ~CMainFrame();
  afx_msg void OnClose();
  afx_msg void OnTimer(UINT nIDEvent);
  afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
  afx_msg void OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
  afx_msg void OnDestroy();
  afx_msg void OnFileExit();
  CStatusBar m_wndStatusBar;
  CLstToolBar m_wndToolBar;
  CDialogBar m_wndDialogBar;
  CTextureBar m_wndTextureBar;
  CSplitterWnd m_wndSplit1;
  CSplitterWnd m_wndSplit2;
  CSplitterWnd m_wndSplit3;
  CXYWnd *field_0788;
  CCamWnd *field_078c;
  CTexWnd *field_0790;
  CZWnd *field_0794;
  CWnd *field_0798;
  CEditWnd *field_079c;
  int field_07a0;
  CString field_07a4[15];
  CWnd *field_07e0;
  bool field_07e4;
  bool field_07e5;
  bool field_07e6;
  virtual BOOL OnCreateClient(LPCREATESTRUCT lpcs, CCreateContext *pContext);
  // update handlers: the CCmdUI argument is enabled from view state
  void FUN_00417150(CCmdUI *pCmdUI);
  void FUN_004190e0(CCmdUI *pCmdUI);
  void FUN_00419ba0(CCmdUI *pCmdUI);
};

typedef char MainFrameBaseSize[(sizeof(CFrameWnd) == 0xd0) ? 1 : -1];
typedef char MainFrameStatusOffset[(offsetof(CMainFrame, m_wndStatusBar) == 0xd0) ? 1 : -1];
typedef char MainFrameToolOffset[(offsetof(CMainFrame, m_wndToolBar) == 0x164) ? 1 : -1];
typedef char MainFrameDialogOffset[(offsetof(CMainFrame, m_wndDialogBar) == 0x218) ? 1 : -1];
typedef char MainFrameTextureOffset[(offsetof(CMainFrame, m_wndTextureBar) == 0x2b8) ? 1 : -1];
typedef char MainFrameStringsOffset[(offsetof(CMainFrame, field_07a4) == 0x7a4) ? 1 : -1];
typedef char MainFrameSplit1Offset[(offsetof(CMainFrame, m_wndSplit1) == 0x500) ? 1 : -1];
typedef char MainFrameSplit3Offset[(offsetof(CMainFrame, m_wndSplit3) == 0x6b0) ? 1 : -1];
typedef char MainFrameXYOffset[(offsetof(CMainFrame, field_0788) == 0x788) ? 1 : -1];

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

CMainFrame::~CMainFrame()
{
}

extern "C" void __stdcall FUN_004115a0(int a0, int a1) {  }
BOOL CMainFrame::PreCreateWindow(CREATESTRUCT &cs)
{
  return CFrameWnd::PreCreateWindow(cs);
}

BOOL CMainFrame::OnCommand(WPARAM wParam, LPARAM lParam)
{
  return CFrameWnd::OnCommand(wParam, lParam);
}

LRESULT CMainFrame::WindowProc(UINT message, WPARAM wParam, LPARAM lParam)
{
  return CFrameWnd::WindowProc(message, wParam, lParam);
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

// Q3Radiant LoadWindowPlacement
bool FUN_004131d0(const char *pszName, HWND hwnd)
{
  WINDOWPLACEMENT wp;
  wp.length = sizeof(wp);
  long lSize = sizeof(wp);
  if (LoadRegistryInfo(pszName, &wp, &lSize))
  {
    SetWindowPlacement(hwnd, &wp);
    return true;
  }
  return false;
}

// Q3Radiant SaveWindowPlacement
void FUN_00413210(HWND hwnd, const char *pszName)
{
  WINDOWPLACEMENT wp;
  wp.length = sizeof(wp);
  if (GetWindowPlacement(hwnd, &wp))
    SaveRegistryInfo(pszName, &wp, sizeof(wp));
}

// 0x00413250 (1336 B)
void CMainFrame::OnDestroy()
{
  WINDOWPLACEMENT wp;
  int info[2];
  CSplitterWnd *split1 = &m_wndSplit1;
  CSplitterWnd *split2 = &m_wndSplit2;
  CSplitterWnd *split3 = &m_wndSplit3;

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

bool FUN_0046ba10();
void FUN_0046b9b0();

// Q3Radiant CMainFrame::OnClose with ConfirmModified
void CMainFrame::OnClose()
{
  if (FUN_0046ba10())
  {
    if (::MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
      return;
  }
  FUN_0046b9b0();
  CFrameWnd::OnClose();
}

// Q3Radiant CMainFrame::OnKeyUp: runs the command bound to a released key
void __stdcall FUN_004137d0(CMainFrame *self, UINT nChar)
{
  for (int i = 0; i < g_nCommandCount; i++)
  {
    if (g_Commands[i].m_nKey == nChar)
    {
      bool bGo = true;
      if (g_Commands[i].m_nModifiers & RAD_PRESS)
      {
        int nModifiers = g_Commands[i].m_nModifiers & ~RAD_PRESS;
        if (nModifiers)
        {
          if (nModifiers & RAD_ALT)
            if (!(GetKeyState(VK_MENU) & 0x8000))
              bGo = false;
          if (nModifiers & RAD_CONTROL)
            if (!(GetKeyState(VK_CONTROL) & 0x8000))
              bGo = false;
          if (nModifiers & RAD_SHIFT)
            if (!(GetKeyState(VK_SHIFT) & 0x8000))
              bGo = false;
        }
        else
        {
          if (GetKeyState(VK_MENU) & 0x8000)
            bGo = false;
          if (GetKeyState(VK_CONTROL) & 0x8000)
            bGo = false;
          if (GetKeyState(VK_SHIFT) & 0x8000)
            bGo = false;
        }
        if (bGo)
        {
          ::SendMessage(self->m_hWnd, WM_COMMAND, g_Commands[i].m_nCommand, 0);
          break;
        }
      }
    }
  }
}

void CMainFrame::OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
  OnKeyDown(nChar, nRepCnt, nFlags);
}

// Q3Radiant CMainFrame::OnKeyDown: runs the command bound to a pressed key
void CMainFrame::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
  if (nChar == 0)
    return;
  for (int i = 0; i < g_nCommandCount; i++)
  {
    if (g_Commands[i].m_nKey == nChar)
    {
      unsigned int nState = 0;
      if (GetKeyState(VK_MENU) & 0x8000)
        nState |= RAD_ALT;
      if (GetKeyState(VK_CONTROL) & 0x8000)
        nState |= RAD_CONTROL;
      if (GetKeyState(VK_SHIFT) & 0x8000)
        nState |= RAD_SHIFT;
      if ((g_Commands[i].m_nModifiers & 0x7) == nState)
      {
        SendMessage(WM_COMMAND, g_Commands[i].m_nCommand, 0);
        if (nRepCnt == 0 && nFlags == 0)
          SendMessage(WM_COMMAND, g_Commands[i].m_nCommand, 0);
        return;
      }
    }
  }
  Default();
}

extern "C" void FUN_0040cf30(CWnd *filterSettings);
BOOL FUN_00477390(HINSTANCE hInstance);
BOOL FUN_0047a2b0(const char *pszName, HWND hWnd);
void __stdcall CreateQEChildren(CMainFrame *self);
extern CWnd DAT_01233b68;
extern CWnd DAT_01234040;
extern CWnd DAT_01234300;
extern CWnd DAT_01234550;
struct SplitInfo { int m_nMin; int m_nCur; };

// Q3Radiant CMainFrame::OnCreateClient: three layouts (3 splitters, QE4 floating, 4 pane)
BOOL CMainFrame::OnCreateClient(LPCREATESTRUCT lpcs, CCreateContext *pContext)
{
  g_qeglobals.d_hwndMain = GetSafeHwnd();
  g_qeglobals.d_hwndStatus = GetMessageBar()->GetSafeHwnd();

  field_07a0 = PF(0x1b4);

  FUN_00477390(AfxGetInstanceHandle());

  field_0798 = new CFilterSettings(NULL);
  ((CFilterSettings *)field_0798)->Create(0xb4, this);
  g_qeglobals.field_60 = field_0798->GetSafeHwnd();
  ::SetParent(g_qeglobals.field_60, g_qeglobals.field_4c);
  field_0798->ShowWindow(SW_SHOW);
  FUN_0040cf30(field_0798);

  if (!FUN_004131d0("Radiant::MainWindowPlace", GetSafeHwnd()))
    FUN_0047a2b0("Radiant::MainWindow", GetSafeHwnd());

  ((CDialog *)&DAT_01233b68)->Create(MAKEINTRESOURCE(0xbb));
  DAT_01233b68.ShowWindow(SW_HIDE);
  ((CDialog *)&DAT_01234040)->Create(MAKEINTRESOURCE(0xe2));
  DAT_01234040.ShowWindow(SW_HIDE);
  ((CDialog *)&DAT_01234300)->Create(MAKEINTRESOURCE(0xe4));
  DAT_01234300.ShowWindow(SW_HIDE);
  ((CDialog *)&DAT_01234550)->Create(MAKEINTRESOURCE(0xe5));
  DAT_01234550.ShowWindow(SW_HIDE);

  CRect rect(5, 25, 100, 100);
  CRect rctParent;
  GetClientRect(rctParent);

  if (PF(0x1b4) == 0 || PF(0x1b4) == 3)
  {
    m_wndSplit1.CreateStatic(this, 2, 1);
    m_wndSplit2.CreateStatic(&m_wndSplit1, 1, 3);
    m_wndSplit3.CreateStatic(&m_wndSplit2, 2, 1);

    m_wndSplit1.CreateView(1, 0, RUNTIME_CLASS(CEditWnd), CSize(25, 100), pContext);
    DAT_01233484 = dynamic_cast<CEdit *>(m_wndSplit1.GetPane(1, 0));
    if (DAT_01233484)
      g_qeglobals.d_hwndEdit = DAT_01233484->GetSafeHwnd();

    m_wndSplit3.CreateView(0, 0, RUNTIME_CLASS(CCamWnd), CSize(25, 100), pContext);
    field_078c = dynamic_cast<CCamWnd *>(m_wndSplit3.GetPane(0, 0));

    m_wndSplit2.CreateView(0, 1, RUNTIME_CLASS(CXYWnd), CSize(25, 100), pContext);
    field_0788 = dynamic_cast<CXYWnd *>(m_wndSplit2.GetPane(0, 1));
    field_0788->SetViewType(2);

    field_078c->SetXYFriend(field_0788);

    m_wndSplit2.CreateView(0, 2, RUNTIME_CLASS(CZWnd), CSize(25, 100), pContext);
    field_0794 = dynamic_cast<CZWnd *>(m_wndSplit2.GetPane(0, 2));

    m_wndSplit3.CreateView(1, 0, RUNTIME_CLASS(CTexWnd), CSize(25, 100), pContext);
    field_0790 = dynamic_cast<CTexWnd *>(m_wndSplit3.GetPane(1, 0));

    CreateQEChildren(this);

    if (PF(0x1b4) == 0)
    {
      // swap the left and right views
      CWnd *pRight = m_wndSplit2.GetPane(0, 2);
      long lRightID = ::GetWindowLong(pRight->GetSafeHwnd(), GWL_ID);
      long lLeftID = ::GetWindowLong(m_wndSplit3.GetSafeHwnd(), GWL_ID);
      ::SetWindowLong(pRight->GetSafeHwnd(), GWL_ID, lLeftID);
      ::SetWindowLong(m_wndSplit3.GetSafeHwnd(), GWL_ID, lRightID);
    }

    m_wndSplit1.SetRowInfo(0, rctParent.Height() * .85, 50);
    m_wndSplit1.SetRowInfo(1, rctParent.Height() * .15, 5);

    float fLeft = (PF(0x1b4) == 0) ? .05 : .25;
    float fRight = (PF(0x1b4) == 0) ? .25 : .05;
    int nMin1 = (PF(0x1b4) == 0) ? 10 : 25;
    int nMin2 = (nMin1 == 10) ? 25 : 10;

    m_wndSplit2.SetColumnInfo(0, rctParent.Width() * fLeft, nMin1);
    m_wndSplit2.SetColumnInfo(1, rctParent.Width() * .70, 100);
    m_wndSplit2.SetColumnInfo(2, rctParent.Width() * fRight, nMin2);

    m_wndSplit3.SetRowInfo(1, (rctParent.Height() * .85) * .40, 15);
    m_wndSplit3.SetRowInfo(0, (rctParent.Height() * .85) * .60, 15);

    FUN_0047a2b0("Radiant::Split", m_wndSplit1.GetSafeHwnd());
    FUN_0047a2b0("Radiant::Split2", m_wndSplit2.GetSafeHwnd());
    FUN_0047a2b0("Radiant::Split3", m_wndSplit3.GetSafeHwnd());
    ::ShowWindow(g_qeglobals.field_4c, SW_HIDE);

    SplitInfo spinfo;
    long lSize = sizeof(spinfo);
    if (LoadRegistryInfo("Radiant::Split::Row_0", &spinfo, &lSize))
      m_wndSplit1.SetRowInfo(0, spinfo.m_nCur, spinfo.m_nMin);
    if (LoadRegistryInfo("Radiant::Split::Row_1", &spinfo, &lSize))
      m_wndSplit1.SetRowInfo(1, spinfo.m_nCur, spinfo.m_nMin);

    if (LoadRegistryInfo("Radiant::Split2::Col_0", &spinfo, &lSize))
      m_wndSplit2.SetColumnInfo(0, spinfo.m_nCur, spinfo.m_nMin);
    if (LoadRegistryInfo("Radiant::Split2::Col_1", &spinfo, &lSize))
      m_wndSplit2.SetColumnInfo(1, spinfo.m_nCur, spinfo.m_nMin);
    if (LoadRegistryInfo("Radiant::Split2::Col_2", &spinfo, &lSize))
      m_wndSplit2.SetColumnInfo(2, spinfo.m_nCur, spinfo.m_nMin);

    if (LoadRegistryInfo("Radiant::Split3::Row_0", &spinfo, &lSize))
      m_wndSplit3.SetRowInfo(0, spinfo.m_nCur, spinfo.m_nMin);
    if (LoadRegistryInfo("Radiant::Split3::Row_1", &spinfo, &lSize))
      m_wndSplit3.SetRowInfo(1, spinfo.m_nCur, spinfo.m_nMin);

    m_wndSplit1.RecalcLayout();
    m_wndSplit2.RecalcLayout();
    m_wndSplit3.RecalcLayout();
  }
  else if (PF(0x1b4) == 1)
  {
    field_078c = new CCamWnd();
    field_078c->Create("QCamera", "", 0x56c70000, rect, this, 1234);

    field_0794 = new CZWnd();
    field_0794->Create("QZ", "", 0x56c70000, rect, this, 1238);

    field_0788 = new CXYWnd();
    field_0788->Create("QXY", "", 0x56c70000, rect, this, 1235);
    field_0788->SetViewType(2);

    field_078c->SetXYFriend(field_0788);

    field_0790 = new CTexWnd();
    field_0790->Create("QTEX", "", 0x56000000, rect, this, 1239);
    ::SetParent(field_0790->GetSafeHwnd(), g_qeglobals.field_4c);

    FUN_004131d0("xywindow", field_0788->GetSafeHwnd());
    FUN_004131d0("camerawindow", field_078c->GetSafeHwnd());
    FUN_004131d0("zwindow", field_0794->GetSafeHwnd());

    if (!PF(0x238))
      field_0794->ShowWindow(SW_HIDE);

    CreateQEChildren(this);
  }
  else
  {
    m_wndSplit1.CreateStatic(this, 2, 2);

    m_wndSplit1.CreateView(0, 0, RUNTIME_CLASS(CCamWnd), CSize(25, 100), pContext);
    field_078c = dynamic_cast<CCamWnd *>(m_wndSplit1.GetPane(0, 0));

    m_wndSplit1.CreateView(0, 1, RUNTIME_CLASS(CXYWnd), CSize(25, 100), pContext);
    field_0788 = dynamic_cast<CXYWnd *>(m_wndSplit1.GetPane(0, 1));
    field_0788->SetViewType(2);

    m_wndSplit1.CreateView(1, 0, RUNTIME_CLASS(CXYWnd), CSize(25, 100), pContext);
    m_wndSplit1.CreateView(1, 1, RUNTIME_CLASS(CXYWnd), CSize(25, 100), pContext);

    field_078c->SetXYFriend(field_0788);

    field_0790 = new CTexWnd();
    field_0790->Create("QTEX", "", 0x56000000, rect, this, 1237);
    ::SetParent(field_0790->GetSafeHwnd(), g_qeglobals.field_4c);

    field_0794 = new CZWnd();
    field_0794->Create("QZ", "", 0x56c70000, rect, this, 1236);
    field_0794->ShowWindow(SW_HIDE);

    FUN_0047a2b0("texwindow", field_0790->GetSafeHwnd());
    FUN_0047a2b0("editwindow", field_079c->GetSafeHwnd());
    ::ShowWindow(g_qeglobals.field_4c, SW_HIDE);

    CreateQEChildren(this);

    CRect rctParent;
    GetClientRect(rctParent);

    m_wndSplit1.SetRowInfo(0, rctParent.Height() * .5, 50);
    m_wndSplit1.SetRowInfo(1, rctParent.Height() * .5, 50);

    m_wndSplit1.SetColumnInfo(0, rctParent.Width() * .5, 50);
    m_wndSplit1.SetColumnInfo(1, rctParent.Width() * .5, 50);

    FUN_0047a2b0("Radiant::SplitSPLIT", m_wndSplit1.GetSafeHwnd());

    m_wndSplit1.RecalcLayout();
  }

  if (DAT_01233484)
    DAT_01233484->SendMessage(WM_SETFONT, (WPARAM)::GetStockObject(DEFAULT_GUI_FONT), TRUE);

  if (field_0788)
    field_0788->m_bActive = true;
  field_07e6 = true;
  Texture_SetMode(*(int *)(g_qeglobals.d_savedinfo + 4));

  return TRUE;
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
void DoFind(void);
extern "C" void FUN_00415bb0() { DoFind(); }
void FUN_004763c0(void);
extern "C" void FUN_00415bd0() { FUN_004763c0(); }
extern "C" void FUN_00415bf0() { Pointfile_Next(); }
extern "C" void FUN_00415c00() { Pointfile_Prev(); }
extern "C" void FUN_00415c10() { WXY_Print(); }
BOOL CALLBACK FUN_00476840(HWND, UINT, WPARAM, LPARAM);
extern "C" void FUN_00415dd0() { DialogBox(g_qeglobals.d_hInstance, (LPCSTR)217, g_qeglobals.d_hwndMain, FUN_00476840); }
extern "C" void FUN_00415df0() { FUN_00469950(); }
extern "C" void FUN_00415e00() { DoColor(0); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e20() { DoColor(4); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e40() { DoColor(3); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e60() { DoColor(2); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e80() { DoColor(1); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00416270() { Map_RemoveRegion(); }
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
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x81ab, MAKELONG(PF(0x250) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void FUN_00417010() { FUN_00470ff0(); }
extern "C" void FUN_00417020() { FUN_00471530(); }
extern "C" void FUN_00417030() { FUN_00471270(); }
extern "C" void FUN_00417040() { FUN_004713e0(); }
extern "C" void FUN_00417050() { FUN_00471670(); }
extern "C" void FUN_00417080() { FUN_00471a90(); }
void FUN_00476ce0(void);
extern "C" void FUN_00417090() { FUN_00476ce0(); }
extern "C" void FUN_00417140() { dword_0123348c |= 1; }
void CMainFrame::FUN_00417150(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(!field_07e4);
}
void DoAbout(void);
extern "C" void FUN_00417190() { DoAbout(); }
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
extern "C" void FUN_00417f20() { DoColor(9); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00417f40() { DoColor(12); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00417f60() { DoColor(23); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00417f80() { DoColor(8); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00417fa0() { DoColor(10); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00417fc0() { DoColor(11); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00417fe0() { DoColor(7); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00418000() { DoColor(13); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00418020() { DoColor(14); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00418040() { DoColor(15); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00418060() { DoColor(19); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00418080() { DoColor(22); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_004180a0() { DoColor(16); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_004180c0() { DoColor(17); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_004180e0() { DoColor(18); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00418100() { DoColor(20); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00418120() { DoColor(21); dword_0123348c |= 0xffffffff; }
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
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8019, MAKELONG(PF(0x248) == 0, 0));
}
extern "C" void FUN_00419080() { Undo_Undo(); }
extern "C" void FUN_00419090() { Undo_Redo(); }
extern int DAT_0109fdc4;
void CMainFrame::FUN_004190e0(CCmdUI *pCmdUI)
{
  bool enable = DAT_0109fdc4 != 0;
  pCmdUI->Enable(enable);
}
extern "C" void FUN_00419670() { CFindTextureDlg::show(); }
extern void (*dword_0059c474)(void);
extern "C" void FUN_00419680() { dword_0059c474(); dword_0123348c |= 0xffffffff; }
void DoProjectSettings(void);
extern "C" void FUN_00419930() { DoProjectSettings(); }
extern "C" void FUN_00419950() { DialogBox(g_qeglobals.d_hInstance, (LPCSTR)217, g_qeglobals.d_hwndMain, FUN_00476840); }
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
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8054, MAKELONG(PF(0x2c8) == 0, 0));
  dword_01233b64->SavePrefs();
}
extern "C" void __fastcall FUN_0041a5c0(CMainFrame *self)
{
  if (++PF(0x1c8) > 2)
    PF(0x1c8) = 0;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x80a8, MAKELONG(PF(0x1c8) != 0, 0));
  dword_01233b64->SavePrefs();
}
extern "C" void __fastcall FUN_0041a620(CMainFrame *self)
{
  PF(0x1cc) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8172, MAKELONG(PF(0x1cc) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_0041a670(CMainFrame *self)
{
  PF(0x1d0) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8176, MAKELONG(PF(0x1d0) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_0041a6c0(CMainFrame *self)
{
  PF(0x1d4) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8191, MAKELONG(PF(0x1d4) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 1;
}
extern "C" void __fastcall FUN_0041a710(CMainFrame *self)
{
  PF(0x2a8) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x81b6, MAKELONG(PF(0x2a8) != 0, 0));
  dword_01233b64->SavePrefs();
}
extern "C" void __fastcall FUN_0041a7f0(CMainFrame *self)
{
  PF(0x24c) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8187, MAKELONG(PF(0x24c) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a840(CMainFrame *self)
{
  PF(0x26c) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8183, MAKELONG(PF(0x26c) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a890(CMainFrame *self)
{
  PF(0x270) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x81b7, MAKELONG(PF(0x270) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a8e0(CMainFrame *self)
{
  PF(0x274) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x81b8, MAKELONG(PF(0x274) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041a930(CMainFrame *self)
{
  PF(0x278) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x81b9, MAKELONG(PF(0x278) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}

extern "C" void FUN_0041a980() { FUN_00435d20(); }
extern "C" void __fastcall FUN_0041a990(CMainFrame *self)
{
  PF(0x27c) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8184, MAKELONG(PF(0x27c) != 0, 0));
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
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8059, MAKELONG(PF(0x2e0) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void __fastcall FUN_0041ab20(CMainFrame *self)
{
  PFB(0x2e4) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x805a, MAKELONG(PFB(0x2e4) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
extern "C" void FUN_0041ac10() {}
extern "C" void FUN_0041ac20() {}
extern "C" void __fastcall FUN_0041ac30(CMainFrame *self)
{
  PFB(0x2e5) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8061, MAKELONG(PFB(0x2e5) != 0, 0));
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
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8072, MAKELONG(DAT_012334ba != 0, 0));
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8068, MAKELONG(DAT_012334b9 != 0, 0));
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8174, MAKELONG(DAT_0112993e != 0, 0));
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8173, MAKELONG(DAT_0112993f != 0, 0));
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8175, MAKELONG(DAT_011298b0 == 11, 0));
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
extern CWnd DAT_01234300;
extern "C" void FUN_0041d4e0()
{
  if (::IsWindowVisible(DAT_01234300.m_hWnd))
    DAT_01234300.ShowWindow(SW_HIDE);
  else
  {
    ::ShowWindow(g_qeglobals.field_4c, SW_HIDE);
    DAT_01234300.ShowWindow(SW_SHOW);
  }
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
