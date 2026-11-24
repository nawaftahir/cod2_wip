#include "stdafx.h"
#include "FindTextureDlg.h"
#include "radiant_wnd.h"
#include "PrefsDlg.h"
#include "FilterSettings.h"
#include "entityw.h"
#include "RotateDlg.h"
#include "MapInfo.h"
#include "EntityListDlg.h"
#include "CommandsDlg.h"
#include "NewProjDlg.h"
#include "ScaleDialog.h"
#include "PatchDensityDlg.h"
#include "TerrainDensityDlg.h"
#include "DialogThick.h"
#include "../universal/assertive.h"
#include <math.h>
#include <time.h>
#include <stdio.h>

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

void FUN_00437e50();
void FUN_00438120();
void FUN_00438ff0();
void FUN_004745d0();
}
void WXY_Print();
void Map_RemoveRegion();
void FUN_00432bb0();
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
struct epair_t;
struct entity_t;
struct entityInst_t;
struct brush_t;
int SaveRegistryInfo(const char *name, void *data, long size);
void FUN_0046fbe0(bool a);
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);
void FUN_00433b90();
void FUN_00442140(int pos);
void FUN_00434110();
BOOL DoColor(int iIndex);
char *va(const char *format, ...);
char *ValueForKey(epair_t *&e, const char *key);
void FUN_00477e80();
void Sys_Printf(const char *text, ...);
extern entity_t *edit_entity;
void Com_StripExtension(const char *in, char *out);
extern CString DAT_012345c0;
BOOL CALLBACK ProjectDlgProc(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);
void FUN_00470d80(float x, float y, float z);
void FUN_004348e0(int thickness, bool bSeam);
void FUN_0047a250(HWND hwnd, const char *name);
void FUN_004426e0(void);
void FUN_00443590(void);
void CleanUpEntities(void);

// partial views for the shutdown path; instance and entity lists link through prev/next
struct entity_t;
struct entityInst_t;
struct brushdef_t { brushdef_t *oprev; brushdef_t *onext; entity_t *owner; unsigned char pad0c[0x10]; int refCount; };
struct brush_t { brush_t *prev; brush_t *next; entityInst_t *owner; brush_t *ownerNext; brush_t *ownerPrev; brushdef_t *def; unsigned char pad18[14]; bool field_26; };
struct entityInst_t { entityInst_t *prev; entityInst_t *next; entity_t *def; brush_t brushes; };
struct epair_t;
struct eclass_t { unsigned char pad00[4]; char *name; unsigned char pad08[0x158]; unsigned flags; };
struct entity_t { entity_t *prev; entity_t *next; unsigned char pad08[0x48]; eclass_t *eclass; unsigned char pad54[0x10]; epair_t *epairs; };
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
  union
  {
    unsigned char d_savedinfo[0x6cb74 - 0x6c8ec]; // 0x294 B in total, the exclude flags sit inside it
    struct { unsigned char pad[0x108]; float colors[32][3]; } sv; // 0x1129708..0x1129888
  };
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

#include "MainFrm.h"

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

// 0x00411000
void FUN_0047aa30();
void FUN_00468d10();
void FUN_0047a8d0();
void FUN_0047ab50(bool);
void FUN_00468910(const char *name, bool use_region);
void FUN_004749a0();
void FUN_00474b70();
void FUN_00403610(CCamWnd *cam, int a);
void FUN_00452ca0(CXYWnd *xy, int type);
void FUN_00452b00(CXYWnd *xy);
void FUN_00479c00(int a);
void FUN_004416b0(int a);
void FUN_004433b0();
void Undo_GeneralStart(char *operation);
struct selbrush_t { selbrush_t *prev; selbrush_t *next; unsigned char pad08[0x0c]; brushdef_t *def; int field_18; int field_1c; int field_20; };
void Undo_AddBrushList(selbrush_t *list);
void FUN_00443f80(selbrush_t *list);
void Undo_End();
extern selbrush_t selected_selbrushes;
void FUN_004721a0(int a, int b);
void FUN_00472280(int a, int b);
void FUN_004718b0(const char *key);
void FUN_00428e20(int a, int b, int c, int d);
void FUN_00431360(int a, int b, int c);
void FUN_004311a0();
void FUN_00430ff0();
void FUN_00435c00();
void FUN_00434190(int a, int b, int c, int d);
void FUN_004354b0();
void FUN_004353d0();
void FUN_00428b80();
void FUN_00474230(float a, float b, int c);
void FUN_00472860(float a, float b);
void FUN_0046fd50(float *vec, int a);
bool FUN_0042a7f0(int a, int b, bool c);
void FUN_00415ef0(const char *name, int axis);
void FUN_00440fa0();
BOOL LoadMruInReg(MRUMENU *lpMruMenu, char *lpszKey);
void PlaceMenuMRUItem(MRUMENU *lpMruMenu, HMENU hMenu, UINT uiItem);
struct SKeyInfo { char *m_strName; unsigned int m_nVKKey; };
extern SKeyInfo g_Keys[];
extern int g_nKeyCount;
extern int DAT_01128d90;
void FUN_00470c50(float *mid);
void SinCosDegrees(float angle, float *sinOut, float *cosOut);
void AxisClear(float axis[3][3]);
void FUN_00470ce0(float *origin, float *matrix, int bSnap, int nAxis, float fDeg, bool bFlip);
void FUN_0046fe50();
void FUN_0045e0b0(brushdef_t *b);
extern selbrush_t DAT_010a44dc;
void FUN_0045f8b0();
void Undo_AddEntity(entity_t *ent);
void FUN_0046fb30();
extern HWND DAT_0109fdb4;
extern bool DAT_0109fe64;
extern int DAT_010c4d84;
extern int DAT_010c2d7c;
void FUN_00475350();
bool OnlyPatchesSelected();
bool AnyPatchesSelected();
void FUN_0042ec60();
void FUN_0042edc0();
void FUN_00435840();
extern RECT DAT_01234668;
void FUN_00442e60();
void FUN_00452f50(CXYWnd *xy);
void FUN_0046ab20(const char *filename);
void FUN_0046ad90(const char *filename);
extern "C" void __fastcall FUN_00419860(CMainFrame *self);
extern "C" void FUN_0041b190(CMainFrame *self);
void FUN_004369b0();
bool FUN_00438ca0();
void FUN_0046ddc0();
void FUN_0045ff30();
void FUN_00460700();
extern int DAT_010bcd2c;
extern int DAT_01128dc4;

// 0x00411001
class idCameraDef { public: bool load(const char *filename); void save(const char *filename); void buildCamera(); };
void FUN_00444a00();
void FUN_00452a60(CWnd *w);
void FUN_00452e30(CWnd *w);
void FUN_00439160(int a);
void FUN_00473f50();
void FUN_00473c70(int a);
void FUN_0045e2c0(brushdef_t *b);
void FUN_0041a010(int dir, int grid);
void FUN_00433ad0();
void FUN_00434040();
void FUN_0041b820(CMainFrame *self);
void FUN_00438020();
extern idCameraDef *DAT_00597154;
void FUN_00409930();
int __fastcall FUN_0041e540(int type, idCameraDef *cam);
extern int DAT_011298b4;
bool FUN_0046b550();
void FUN_0046b5b0();
extern int DAT_010a4908;
int FUN_00449760();
void FUN_0045cc90(float a);
extern bool DAT_0109fe5f;
extern bool DAT_012334ba;
extern bool DAT_012334b9;
void FUN_004114f0(CWnd *pWnd, UINT nID);

// 0x00411002
void FUN_00477580(int a);
bool FUN_00452d90(CWnd *w);
void FUN_00452990();
extern "C" void FUN_00467f00();
void FUN_00433da0();
extern bool DAT_0109fe5e;
extern int DAT_011299a8;
extern int DAT_0112988c;
extern HCURSOR DAT_01129e28;
void FUN_00441600();
extern float DAT_012334a8;
extern "C" void __fastcall FUN_00418ec0(CMainFrame *self);
extern "C" void __fastcall FUN_004171b0(CMainFrame *self);

// 0x00411003
BOOL CALLBACK FUN_004766d0(HWND, UINT, WPARAM, LPARAM);
extern int DAT_0109fe60;
extern bool DAT_012334f5;
extern bool DAT_012334f6;



// 0x00411004
void FUN_00441f80(int y, int x);
extern int DAT_01128da0;

// 0x00411210
IMPLEMENT_DYNAMIC(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
  ON_WM_SIZE()
  ON_COMMAND(0xe103, FUN_00414da0)
  ON_COMMAND(0x80b8, FUN_00414de0)
  ON_COMMAND(0x80f8, FUN_00414ec0)
  ON_COMMAND(0x80bb, FUN_00415100)
  ON_COMMAND(0x80f9, FUN_00415140)
  ON_COMMAND(0x8006, FUN_004151e0)
  ON_COMMAND(0x80fa, FUN_00415390)
  ON_COMMAND(0x80ba, FUN_00415650)
  ON_COMMAND(0x8004, FUN_00415660)
  ON_COMMAND(0x80e3, FUN_004156a0)
  ON_COMMAND(0x80e4, FUN_00415750)
  ON_COMMAND(0x8005, FUN_004159e0)
  ON_COMMAND(0x80ce, FUN_00415b50)
  ON_COMMAND(0x810c, FUN_00415c20)
  ON_COMMAND(0x80bc, FUN_00416030)
  ON_COMMAND(0x80bd, FUN_00416050)
  ON_COMMAND(0x80be, FUN_00416070)
  ON_COMMAND(0x8109, FUN_004162c0)
  ON_COMMAND(0x80ea, FUN_00416680)
  ON_COMMAND(0x8112, FUN_00416e90)
  ON_COMMAND(0x8113, FUN_00416ed0)
  ON_COMMAND(0xc4, FUN_00416f10)
  ON_COMMAND(0xc5, FUN_00416f50)
  ON_COMMAND(0x81c7, FUN_00416f90)
  ON_COMMAND(0x81c8, FUN_00416fd0)
  ON_COMMAND(0x800b, FUN_004170b0)
  ON_COMMAND(0x8152, FUN_004170c0)
  ON_COMMAND(0x800c, FUN_004170e0)
  ON_COMMAND(0x800d, FUN_004170f0)
  ON_COMMAND(0x800f, FUN_004171b0)
  ON_COMMAND(0x8121, FUN_00417400)
  ON_COMMAND(0x8122, FUN_00417450)
  ON_COMMAND(0x8010, FUN_00417660)
  ON_COMMAND(0x812e, FUN_00417840)
  ON_COMMAND(0x8012, FUN_00417970)
  ON_COMMAND(0x8013, FUN_00417a30)
  ON_COMMAND(0x8015, FUN_00417a90)
  ON_COMMAND(0x8016, FUN_00417ae0)
  ON_COMMAND(0x8017, FUN_00417b50)
  ON_COMMAND(0x801b, FUN_00417e40)
  ON_COMMAND(0x801a, FUN_00417ea0)
  ON_COMMAND(0x8027, FUN_004185d0)
  ON_COMMAND(0x8177, FUN_00418820)
  ON_COMMAND(0xd2, FUN_00418a70)
  ON_COMMAND(0x8029, FUN_00418d40)
  ON_COMMAND(0x802a, FUN_00418ec0)
  ON_COMMAND(0x810f, FUN_00419000)
  ON_COMMAND(0x8110, FUN_00419020)
  ON_UPDATE_COMMAND_UI(0xe12b, FUN_004190a0)
  ON_COMMAND(0x813b, FUN_00419260)
  ON_COMMAND(0x813c, FUN_004193e0)
  ON_COMMAND(0x802e, FUN_004196a0)
  ON_COMMAND(0x802f, FUN_00419720)
  ON_COMMAND(0x802d, FUN_00419860)
  ON_COMMAND(0x8034, FUN_00419a60)
  ON_COMMAND(0x8033, FUN_00419ab0)
  ON_COMMAND(0x803b, FUN_00419b90)
  ON_COMMAND(0x8043, FUN_00419d40)
  ON_COMMAND(0x804c, FUN_00419da0)
  ON_COMMAND(0x804d, FUN_00419e90)
  ON_COMMAND(0x8052, FUN_00419fa0)
  ON_COMMAND(0x804f, FUN_00419fc0)
  ON_COMMAND(0x8050, FUN_00419fd0)
  ON_COMMAND(0x8051, FUN_00419ff0)
  ON_COMMAND(0x8056, FUN_0041a330)
  ON_COMMAND(0x8058, FUN_0041a3e0)
  ON_COMMAND(0x80ab, FUN_0041a4d0)
  ON_COMMAND(0x8072, FUN_0041b070)
  ON_COMMAND(0x8068, FUN_0041b0b0)
  ON_COMMAND(0x8141, FUN_0041b100)
  ON_COMMAND(0x8082, FUN_0041b640)
  ON_COMMAND(0x807f, FUN_0041b660)
  ON_COMMAND(0x807e, FUN_0041b680)
  ON_COMMAND(0x8081, FUN_0041b6a0)
  ON_COMMAND(0x8080, FUN_0041b6c0)
  ON_COMMAND(0x8088, FUN_0041b720)
  ON_COMMAND(0x8093, FUN_0041b930)
  ON_COMMAND(0x808d, FUN_0041b950)
  ON_COMMAND(0x8090, FUN_0041b980)
  ON_COMMAND(0x808f, FUN_0041b9b0)
  ON_COMMAND(0x8091, FUN_0041b9e0)
  ON_COMMAND(0x8092, FUN_0041ba10)
  ON_COMMAND(0x8094, FUN_0041ba40)
  ON_COMMAND(0x8150, FUN_0041c1d0)
  ON_COMMAND(0x80ad, FUN_0041be80)
  ON_WM_MOUSEWHEEL()
  ON_COMMAND(0x81d6, FUN_00415240)
  ON_COMMAND(0x81d0, FUN_00415260)
  ON_COMMAND(0x81d1, FUN_00415270)
  ON_COMMAND_RANGE(0x8116, 0x811e, FUN_00415a10)
END_MESSAGE_MAP()

extern "C" int __stdcall FUN_00411230(int a0, int a1) { return 0; }
extern "C" void FUN_00411240() {}

CMainFrame::~CMainFrame()
{
}

CMainFrame::CMainFrame()
{
  field_07e5 = false;
  field_07e6 = false;
  field_0788 = NULL;
  field_078c = NULL;
  field_0790 = NULL;
  field_0794 = NULL;
  field_079c = NULL;
  field_07e0 = NULL;
  field_07e4 = true;
  g_pParentWnd = this;
}

// 0x004114f0
// Q3Radiant HandlePopup
void FUN_004114f0(CWnd *pWnd, UINT nID)
{
  CPoint ptMouse;
  ::GetCursorPos(&ptMouse);
  CMenu menu;
  menu.LoadMenu(nID);
  CMenu *pMenu = menu.GetSubMenu(0);
  pMenu->TrackPopupMenu(TPM_RIGHTBUTTON, ptMouse.x, ptMouse.y, pWnd);
  menu.DestroyMenu();
  pWnd->SetFocus();
}

extern "C" void __stdcall FUN_004115a0(int a0, int a1) {  }

// Q3Radiant SetButtonMenuStates (this in eax)
void CMainFrame::FUN_004115b0()
{
#define UNCHECK_EXCLUDE(var, mask, id) if (g_qeglobals.var & (mask)) pMenu->CheckMenuItem(id, MF_BYCOMMAND | MF_UNCHECKED)
  CMenu *pMenu = GetMenu();
  if (pMenu)
  {
    UNCHECK_EXCLUDE(d_exclude, 0x10, 0x8155);
    UNCHECK_EXCLUDE(d_exclude, 0x2, 0x80f9);
    UNCHECK_EXCLUDE(d_exclude, 0x80, 0x8157);
    UNCHECK_EXCLUDE(d_exclude, 0x10000000, 0x8158);
    UNCHECK_EXCLUDE(d_exclude, 0x8, 0x8159);
    UNCHECK_EXCLUDE(d_exclude, 0x2000, 0x815a);
    UNCHECK_EXCLUDE(d_exclude, 0x20, 0x815b);
    UNCHECK_EXCLUDE(d_exclude, 0x4, 0x815c);
    UNCHECK_EXCLUDE(d_exclude, 0x1, 0x815e);
    UNCHECK_EXCLUDE(d_exclude, 0x40, 0x815f);
    UNCHECK_EXCLUDE(d_exclude, 0x1000, 0x8160);
    UNCHECK_EXCLUDE(d_exclude, 0x40000000, 0x8161);
    UNCHECK_EXCLUDE(d_exclude, 0x800000, 0x8163);
    UNCHECK_EXCLUDE(d_exclude, 0x8000, 0x8164);
    UNCHECK_EXCLUDE(d_exclude, 0x8000000, 0x8165);
    UNCHECK_EXCLUDE(d_exclude, 0x80000000, 0x81b0);
    UNCHECK_EXCLUDE(d_exclude2, 0x200, 0x81b5);
    UNCHECK_EXCLUDE(d_exclude2, 0x800, 0x81d4);
    UNCHECK_EXCLUDE(d_exclude2, 0x1000, 0x81dc);
    UNCHECK_EXCLUDE(d_exclude2, 0x2000, 0x81d7);
    UNCHECK_EXCLUDE(d_exclude2, 0x4000, 0x81d9);
    UNCHECK_EXCLUDE(d_exclude2, 0x8000, 0x81da);
    UNCHECK_EXCLUDE(d_exclude2, 0x10000, 0x81db);
    UNCHECK_EXCLUDE(d_exclude, 0x80000, 0x8166);
    UNCHECK_EXCLUDE(d_exclude, 0x20000000, 0x8167);
    UNCHECK_EXCLUDE(d_exclude, 0x2000000, 0xc7);
    UNCHECK_EXCLUDE(d_exclude, 0x4000, 0x8096);
    UNCHECK_EXCLUDE(d_exclude, 0x20000, 0xd7);
    UNCHECK_EXCLUDE(d_exclude, 0x1000000, 0xdb);
    UNCHECK_EXCLUDE(d_exclude, 0x200000, 0xdc);
    UNCHECK_EXCLUDE(d_exclude, 0x40000, 0xdd);
    UNCHECK_EXCLUDE(d_exclude, 0x100000, 0xde);
    UNCHECK_EXCLUDE(d_exclude, 0x10000, 0xdf);
    UNCHECK_EXCLUDE(d_exclude2, 0x10, 0xcf);
    UNCHECK_EXCLUDE(d_exclude2, 0x1, 0x815d);
    UNCHECK_EXCLUDE(d_exclude2, 0x2, 0xc1);
    UNCHECK_EXCLUDE(d_exclude2, 0x4, 0xc2);
    UNCHECK_EXCLUDE(d_exclude2, 0x8, 0xcd);
    UNCHECK_EXCLUDE(d_exclude2, 0x400, 0xe3);
    UNCHECK_EXCLUDE(d_exclude2, 0x20, 0x8169);
    UNCHECK_EXCLUDE(d_exclude2, 0x40, 0x8115);
    UNCHECK_EXCLUDE(d_exclude2, 0x80, 0x80e5);
    UNCHECK_EXCLUDE(d_exclude2, 0x100, 0x81ae);
    pMenu->CheckMenuItem(0x8011, MF_BYCOMMAND | (PF(0x1b8) ? MF_CHECKED : MF_UNCHECKED));
    pMenu->CheckMenuItem(0x8043, MF_BYCOMMAND | (PF(0x244) ? MF_CHECKED : MF_UNCHECKED));
    pMenu->CheckMenuItem(0x81d5, MF_BYCOMMAND | (PF(0x1bc) ? MF_CHECKED : MF_UNCHECKED));
    pMenu->CheckMenuItem(0x8031, MF_BYCOMMAND | (PFB(0x2c0) ? MF_CHECKED : MF_UNCHECKED));
    pMenu->CheckMenuItem(0x8019, MF_BYCOMMAND | (PF(0x248) ? MF_UNCHECKED : MF_CHECKED));
    CToolBarCtrl *bar = &m_wndToolBar.GetToolBarCtrl();
    if (bar && bar->m_hWnd)
    {
      bar->CheckButton(0x8031, PFB(0x2c0));
      bar->CheckButton(0x8059, PF(0x2e0));
      bar->CheckButton(0x805a, PFB(0x2e4));
      bar->CheckButton(0x8061, PFB(0x2e5));
      bar->CheckButton(0x8178, PF(0x1d8));
      bar->CheckButton(0x8183, PF(0x26c));
      bar->CheckButton(0x8187, PF(0x24c));
      bar->CheckButton(0x81ab, PF(0x250));
      bar->CheckButton(0x8184, PF(0x27c));
      bar->CheckButton(0x8176, PF(0x1d0));
      bar->CheckButton(0x8191, PF(0x1d4));
      bar->CheckButton(0x81b6, PF(0x2a8));
    }
    int id;
    switch (PF(0x2d0))
    {
    case 10:
      id = 0x8082;
      break;
    case 25:
      id = 0x8081;
      break;
    case 50:
      id = 0x8080;
      break;
    case 200:
      id = 0x807e;
      break;
    default:
      id = 0x807f;
      break;
    }
    FUN_0041b590(id);
  }
  if (g_qeglobals.field_20)
  {
    FUN_00440fa0();
    LoadMruInReg(g_qeglobals.d_lpMruMenu, "Software\\iw\\CoD2Radiant\\MRU");
    PlaceMenuMRUItem(g_qeglobals.d_lpMruMenu, ::GetSubMenu(::GetMenu(m_hWnd), 0), 0x80b7);
  }
#undef UNCHECK_EXCLUDE
}

// Q3Radiant ShowMenuItemKeyBindings: appends the bound key to each menu item text
void __stdcall FUN_00411de0(HMENU hMenu)
{
  char text[0x400];
  MENUITEMINFO mii;
  for (int i = 0; i < g_nCommandCount; i++)
  {
    memset(&mii, 0, sizeof(mii));
    mii.cbSize = sizeof(mii);
    mii.fMask = MIIM_TYPE;
    mii.dwTypeData = text;
    mii.cch = sizeof(text);
    if (GetMenuItemInfo(hMenu, g_Commands[i].m_nCommand, FALSE, &mii) && mii.fType == MFT_STRING)
    {
      char *tab = strchr(text, '\t');
      if (tab)
        *tab = 0;
      strcat(text, "\t");
      if (g_Commands[i].m_nModifiers & RAD_SHIFT)
        strcat(text, "Shift-");
      if (g_Commands[i].m_nModifiers & RAD_ALT)
        strcat(text, "Alt-");
      if (g_Commands[i].m_nModifiers & RAD_CONTROL)
        strcat(text, "Ctrl-");
      int k;
      for (k = 0; k < g_nKeyCount; k++)
        if (g_Keys[k].m_nVKKey == g_Commands[i].m_nKey)
          break;
      if (k < g_nKeyCount)
        strcat(text, g_Keys[k].m_strName);
      else
        sprintf(&text[strlen(text)], "%c", g_Commands[i].m_nKey);
      memset(&mii, 0, sizeof(mii));
      mii.cbSize = sizeof(mii);
      mii.fMask = MIIM_TYPE;
      mii.dwTypeData = text;
      mii.cch = strlen(text);
      SetMenuItemInfo(hMenu, g_Commands[i].m_nCommand, FALSE, &mii);
    }
  }
}

// 0x00412060: runs a "+Command" argument; returns how many arguments it used
int FUN_00412060(char **arg)
{
  if (**arg == '+')
  {
    const char *name = *arg + 1;
    for (int i = 0; i < g_nCommandCount; i++)
    {
      if (!_stricmp(g_Commands[i].m_strCommand, name))
      {
        AfxGetMainWnd()->PostMessage(WM_COMMAND, g_Commands[i].m_nCommand, 0);
        return 1;
      }
    }
  }
  return 0;
}

BOOL CMainFrame::PreCreateWindow(CREATESTRUCT &cs)
{
  return CFrameWnd::PreCreateWindow(cs);
}

int ParseCommandLine(char *cmdLine, char **argv, int maxArgs);
int QE_LoadProject(const char *projectfile);
const char *Com_GetExtensionSubString(const char *filename);
void Sys_Printf(const char *text, ...);
void FUN_0047a760(const char *fmt, ...);
extern int DAT_010bcd28;
extern int DAT_010bcd2c;
extern int DAT_01139e54;
extern float DAT_01139e58;
extern float DAT_01139e5c;
extern float DAT_01139e60;

void __stdcall CreateQEChildren(CMainFrame *self)
{
  bool bProjectLoaded = false;
  char *argv[32];
  char cmdLine[0x10000];

  strncpy(cmdLine, AfxGetApp()->m_lpCmdLine, sizeof(cmdLine));
  cmdLine[sizeof(cmdLine) - 1] = bProjectLoaded;
  if (ParseCommandLine(cmdLine, argv, 32) > 1)
  {
    const char *ext = Com_GetExtensionSubString(argv[1]);
    if (!_stricmp(ext, ".prj"))
      bProjectLoaded = QE_LoadProject(argv[1]);
  }

  if (!bProjectLoaded)
  {
    if (dword_01233b64->m_bLoadLast && dword_01233b64->m_strLastProject.GetLength() > 0)
      bProjectLoaded = QE_LoadProject(dword_01233b64->m_strLastProject.GetBuffer(0));
  }
  if (!bProjectLoaded)
  {
    CFileDialog dlgFile(TRUE, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, "CoD2Radiant Project files( *.prj )|*.prj||", self);
    if (dlgFile.DoModal() == IDOK)
      bProjectLoaded = QE_LoadProject(dlgFile.GetPathName().GetBuffer(0));
  }
  if (!bProjectLoaded)
    FUN_0047a760("Unable to load project file. It was unavailable in the scripts path and the default could not be found");

  DAT_010bcd2c = 8;
  DAT_010bcd28 = 1;
  DAT_01139e54 = 0;
  DAT_01139e58 = 20.0f;
  DAT_01139e5c = 46.0f;
  DAT_01139e60 = 1.0f;
  Sys_Printf("Entering message loop\n");
  self->field_07e5 = true;
  ::SetTimer(self->m_hWnd, 1, 1000, NULL);
}

BOOL CMainFrame::OnCommand(WPARAM wParam, LPARAM lParam)
{
  return CFrameWnd::OnCommand(wParam, lParam);
}

LRESULT CMainFrame::DefWindowProc(UINT message, WPARAM wParam, LPARAM lParam)
{
  RoutineProcessing();
  return CFrameWnd::DefWindowProc(message, wParam, lParam);
}

extern double DAT_01129940;
extern double DAT_01129948;

void CMainFrame::RoutineProcessing()
{
  if (field_07e5)
  {
    if (DAT_01129948 == 0.0)
      DAT_01129948 = 0.0;
    if (DAT_01129940 == 0.0)
      DAT_01129940 = 0.0;
    double time = clock() / 1000.0;
    double delta = time - DAT_01129948;
    DAT_01129948 = time;
    if (delta > 2.0)
      delta = 0.1;
    DAT_01129940 = delta;
    if (delta > 0.2)
      delta = 0.2;
    if (field_078c)
      field_078c->Cam_MouseControl(delta);
    if (dword_0123348c)
    {
      int nBits = dword_0123348c;
      dword_0123348c = 0;
      UpdateWindows(nBits);
    }
  }
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

// 0x004138c0
bool FUN_004138c0(int nChar)
{
  if (nChar == VK_UP || nChar == VK_LEFT || nChar == VK_RIGHT || nChar == VK_DOWN)
    return (bool)::GetKeyState(nChar);
  return true;
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

// 0x00414730: keep the status panes and the three splitters in proportion on resize
void CMainFrame::OnSize(UINT nType, int cx, int cy)
{
  CFrameWnd::OnSize(nType, cx, cy);
  CRect rctParent;
  GetClientRect(rctParent);
  int nWidth;
  UINT nID, nStyle;
  if (m_wndStatusBar.GetSafeHwnd())
  {
    m_wndStatusBar.GetPaneInfo(0, nID, nStyle, nWidth);
    m_wndStatusBar.SetPaneInfo(0, nID, nStyle, (int)(rctParent.Width() * 0.19));
    m_wndStatusBar.GetPaneInfo(1, nID, nStyle, nWidth);
    m_wndStatusBar.SetPaneInfo(1, nID, nStyle, (int)(rctParent.Width() * 0.19));
    m_wndStatusBar.GetPaneInfo(2, nID, nStyle, nWidth);
    m_wndStatusBar.SetPaneInfo(2, nID, nStyle, (int)(rctParent.Width() * 0.19));
    m_wndStatusBar.GetPaneInfo(3, nID, nStyle, nWidth);
    m_wndStatusBar.SetPaneInfo(3, nID, nStyle, (int)(rctParent.Width() * 0.19));
    m_wndStatusBar.GetPaneInfo(4, nID, nStyle, nWidth);
    m_wndStatusBar.SetPaneInfo(4, nID, nStyle, (int)(rctParent.Width() * 0.13));
    m_wndStatusBar.GetPaneInfo(5, nID, nStyle, nWidth);
    m_wndStatusBar.SetPaneInfo(5, nID, nStyle, (int)(rctParent.Width() * 0.01));
  }
  if (nType == SIZE_RESTORED && field_07e6 && DAT_01234668.right - DAT_01234668.left > 0
    && (field_07a0 == 0 || field_07a0 == 3))
  {
    int nCur, nMin;
    int width = DAT_01234668.right - DAT_01234668.left;
    int height = DAT_01234668.bottom - DAT_01234668.top;
    m_wndSplit1.GetRowInfo(0, nCur, nMin);
    float fRow0 = (float)nCur / height;
    m_wndSplit1.GetRowInfo(1, nCur, nMin);
    float fRow1 = (float)nCur / height;
    m_wndSplit2.GetColumnInfo(0, nCur, nMin);
    float fCol0 = (float)nCur / width;
    m_wndSplit2.GetColumnInfo(1, nCur, nMin);
    float fCol1 = (float)nCur / width;
    m_wndSplit2.GetColumnInfo(2, nCur, nMin);
    float fCol2 = (float)nCur / width;
    m_wndSplit3.GetRowInfo(0, nCur, nMin);
    float fRow2 = (float)nCur / height;
    m_wndSplit3.GetRowInfo(1, nCur, nMin);
    float fRow3 = (float)nCur / height;
    m_wndSplit1.SetRowInfo(0, (int)(rctParent.Height() * fRow0), 100);
    m_wndSplit1.SetRowInfo(1, (int)(rctParent.Height() * fRow1), 25);
    m_wndSplit2.SetColumnInfo(0, (int)(rctParent.Width() * fCol0), field_07a0 == 0 ? 10 : 25);
    m_wndSplit2.SetColumnInfo(1, (int)(rctParent.Width() * fCol1), 100);
    m_wndSplit2.SetColumnInfo(2, (int)(rctParent.Width() * fCol2), field_07a0 == 0 ? 25 : 10);
    m_wndSplit3.SetRowInfo(0, (int)(rctParent.Height() * fRow2), 50);
    m_wndSplit3.SetRowInfo(1, (int)(rctParent.Height() * fRow3), 50);
    m_wndSplit1.RecalcLayout();
    m_wndSplit2.RecalcLayout();
    m_wndSplit3.RecalcLayout();
  }
}

extern "C" void __fastcall FUN_00414c50(CMainFrame *self) { self->field_07e4 = !self->field_07e4; }
extern "C" void FUN_00414c70() {}
void CMainFrame::OnFileExit()
{
  PostMessage(WM_CLOSE, 0, 0L);
}

extern int DAT_010a4910;
// 0x00414ca0
extern "C" void FUN_00414ca0()
{
  if (FUN_0046ba10())
  {
    if (::MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
      return;
  }
  FUN_0046b9b0();
  FUN_0047aa30();
}

// 0x00414ce0
extern "C" void FUN_00414ce0()
{
  if (FUN_0046ba10())
  {
    if (::MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
      return;
  }
  FUN_0046b9b0();
  FUN_00468d10();
}

// 0x00414d20
extern "C" void FUN_00414d20()
{
  if (FUN_0046ba10())
  {
    if (::MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
      return;
  }
  FUN_0046b9b0();
  FUN_0047a8d0();
}

extern "C" void FUN_00414d60()
{
  if (DAT_010a4910)
    DAT_010a4910 = 0;
  else
    Pointfile_Check();
}
extern "C" void FUN_00414d80() {}
extern "C" void FUN_00414d90() {}
// 0x00414da0
void CMainFrame::FUN_00414da0()
{
  if (!strcmp((const char *)&dword_010a4508, "unnamed.map"))
    FUN_0047ab50(false);
  else
    FUN_00468910((const char *)&dword_010a4508, 0);
}

// 0x00414de0
void CMainFrame::FUN_00414de0() { FUN_0047ab50(false); }

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
// 0x00414ea0
extern "C" void FUN_00414ea0() { FUN_004749a0(); dword_0123348c |= 5; }

// 0x00414eb0
extern "C" void FUN_00414eb0() { FUN_00474b70(); dword_0123348c |= 5; }

// 0x00414ec0: show or hide the console pane (inspector mode 0x40)
void CMainFrame::FUN_00414ec0()
{
  int style = this->field_07a0;
  if (style > 0 && style < 3)
  {
    if (style == 1)
    {
      if (::IsWindowVisible(g_qeglobals.field_4c) && DAT_011299a8 == 0x40)
      {
        ::ShowWindow(g_qeglobals.field_4c, SW_HIDE);
        return;
      }
      ::ShowWindow(g_qeglobals.field_4c, SW_SHOWNORMAL);
      FUN_00477580(0x40);
    }
    else
    {
      if (DAT_011299a8 == 0x40)
      {
        if (::IsWindowVisible(g_qeglobals.field_4c))
          ::ShowWindow(g_qeglobals.field_4c, SW_HIDE);
        else
          ::ShowWindow(g_qeglobals.field_4c, SW_SHOWNORMAL);
        return;
      }
      ::ShowWindow(g_qeglobals.field_4c, SW_SHOWNORMAL);
      FUN_00477580(0x40);
    }
  }
}

// 0x00415100
void CMainFrame::FUN_00415100() { FUN_00403610(this->field_078c, 0); }

extern "C" void FUN_00415110()
{
  PF(0x22c) = !PF(0x22c);
  dword_01233b64->SavePrefs();
}
// 0x00415140
void CMainFrame::FUN_00415140()
{
  HWND window = g_qeglobals.field_4c;
  int style = this->field_07a0;
  if (style != 0 && style != 1 && style != 3)
  {
    if (DAT_011299a8 == 0x80)
    {
      if (::IsWindowVisible(window))
        ::ShowWindow(window, SW_HIDE);
      else
        ::ShowWindow(window, SW_SHOW);
      return;
    }
  }
  else if (::IsWindowVisible(window) && DAT_011299a8 == 0x80)
  {
    ::ShowWindow(window, SW_HIDE);
    return;
  }
  ::ShowWindow(window, SW_SHOW);
  FUN_00477580(0x80);
}

// 0x004151e0
void CMainFrame::FUN_004151e0()
{
  if (this->field_07a0 != 2)
  {
    FUN_00452ca0(this->field_0788, 0);
    FUN_00452b00(this->field_0788);
  }
  dword_0123348c |= 2;
}

// 0x00415210
extern "C" void __stdcall FUN_00415210(CMainFrame *self, int a)
{
  if (self == NULL)
    FUN_00479c00(a);
  else
    FUN_00479c00(self->m_hWnd ? (int)self->m_hWnd : 0);
}

void CMainFrame::FUN_00415240() { FUN_004416b0((DAT_01128d90 + 1) % 2); }

void CMainFrame::FUN_00415260() { FUN_004416b0(0); }

void CMainFrame::FUN_00415270() { FUN_004416b0(1); }

extern "C" void FUN_00415280() { Dvar_SetStringByName("r_textureMode", "nearest"); dword_0123348c |= 1; }
extern "C" void FUN_004152a0() { Dvar_SetStringByName("r_textureMode", "linear"); dword_0123348c |= 1; }
extern "C" void FUN_004152c0() { Dvar_SetStringByName("r_textureMode", "bilinear"); dword_0123348c |= 1; }
extern "C" void FUN_004152e0() { Dvar_SetStringByName("r_textureMode", "trilinear"); dword_0123348c |= 1; }
extern "C" void FUN_00415300() { Dvar_SetStringByName("r_textureMode", "anisotropic"); dword_0123348c |= 1; }
extern "C" void __stdcall FUN_00415320(int nID) { Texture_SetMode(nID); }
extern "C" void __stdcall FUN_00415330(int nID) { FUN_00441100(nID - 60000); }
extern "C" void __stdcall FUN_00415350(int nID) { FUN_00441200(nID - 60256); }
extern "C" void __stdcall FUN_00415370(int nID) { FUN_00441300(nID - 60512); }
// 0x00415390: show or hide the texture pane (inspector mode 0x10)
void CMainFrame::FUN_00415390()
{
  int style = this->field_07a0;
  if (style > 0 && style < 3)
  {
    if (style == 1)
    {
      if (::IsWindowVisible(g_qeglobals.field_4c) && DAT_011299a8 == 0x10)
      {
        ::ShowWindow(g_qeglobals.field_4c, SW_HIDE);
        return;
      }
      ::ShowWindow(g_qeglobals.field_4c, SW_SHOWNORMAL);
      FUN_00477580(0x10);
    }
    else
    {
      if (DAT_011299a8 == 0x10)
      {
        if (::IsWindowVisible(g_qeglobals.field_4c))
          ::ShowWindow(g_qeglobals.field_4c, SW_HIDE);
        else
          ::ShowWindow(g_qeglobals.field_4c, SW_SHOW);
        return;
      }
      ::ShowWindow(g_qeglobals.field_4c, SW_SHOW);
      FUN_00477580(0x10);
    }
  }
}

// 0x00415650
void CMainFrame::FUN_00415650() { FUN_00403610(this->field_078c, 1); }

// 0x00415660
void CMainFrame::FUN_00415660()
{
  if (this->field_07a0 != 2)
  {
    FUN_00452ca0(this->field_0788, 2);
    FUN_00452b00(this->field_0788);
  }
  dword_0123348c |= 2;
}

extern "C" void FUN_00415690() {}
extern float DAT_01139e60;
// 0x004156a0
void CMainFrame::FUN_004156a0()
{
  CXYWnd *xy = this->field_0788;
  if (xy && xy->m_bActive)
  {
    xy->m_fScale *= 1.25f;
    if (xy->m_fScale > 160.0f)
      xy->m_fScale = 160.0f;
    DAT_012334a8 = this->field_0788->m_fScale;
  }
  DAT_01139e60 *= 1.25f;
  dword_0123348c |= 6;
  if (DAT_01139e60 > 160.0f)
    DAT_01139e60 = 160.0f;
  dword_0123348c |= 0x28;
}

// 0x00415750
void CMainFrame::FUN_00415750()
{
  float scale;
  CXYWnd *xy = this->field_0788;
  if (xy && xy->m_bActive)
  {
    scale = xy->m_fScale;
    scale *= 0.8f;
    if (scale < 0.003125f)
      scale = 0.003125f;
    xy->m_fScale = scale;
    DAT_012334a8 = scale;
    if (scale != 0.0f)
      goto done;
  }
  scale = DAT_01139e60 * 0.8f;
  if (scale < 0.003125f)
    scale = 0.003125f;
done:
  DAT_01139e60 = scale;
  dword_0123348c |= 0x2e;
}

#include "../universal/com_math.h"

// 0x004157f0: move the camera along its view direction by a wheel step
void CMainFrame::FUN_004157f0(float step)
{
  float delta;
  float pitch, yaw;
  float sy, cy, sp, cp;

  if (::GetKeyState(VK_SHIFT) & 0x8000)
    delta = (float)PF(0x2b8) * 0.7f * step * 0.1f;
  else if (::GetKeyState(VK_MENU) & 0x8000)
    delta = (float)PF(0x2b8) * 0.7f * step * 1.6f;
  else
    delta = (float)PF(0x2b8) * 0.7f * step * 0.4f;
  CamView *cam = (CamView *)field_078c;
  pitch = cam->angles[0];
  yaw = cam->angles[1];
  if (::GetKeyState(VK_CONTROL) & 0x8000)
    pitch = 0.0f;
  else
    pitch = -pitch;
  FastSinCos(yaw * 0.017453292f, &sy, &cy);
  FastSinCos(pitch * 0.017453292f, &sp, &cp);
  float dx = cp * cy;
  float dy = cp * sy;
  float dz = -sp;
  delta = -delta;
  cam->origin[0] += delta * dx;
  cam->origin[1] += delta * dy;
  cam->origin[2] += delta * dz;
  dword_0123348c |= 1;
}

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
// 0x004159e0
void CMainFrame::FUN_004159e0()
{
  if (this->field_07a0 != 2)
  {
    FUN_00452ca0(this->field_0788, 1);
    FUN_00452b00(this->field_0788);
  }
  dword_0123348c |= 2;
}

// Q3Radiant OnGrid1: the grid size menu range 0x8116..0x811e
void CMainFrame::FUN_00415a10(UINT nID)
{
  HMENU hMenu = ::GetMenu(GetSafeHwnd());
  ::CheckMenuItem(hMenu, 0x8116, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x8117, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x8118, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x8119, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x811a, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x811b, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x811c, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x811d, MF_BYCOMMAND | MF_UNCHECKED);
  ::CheckMenuItem(hMenu, 0x811e, MF_BYCOMMAND | MF_UNCHECKED);
  int shift = DAT_010bcd2c;
  switch (nID)
  {
  case 0x8116: shift = 0; break;
  case 0x8117: shift = 1; break;
  case 0x8118: shift = 2; break;
  case 0x8119: shift = 3; break;
  case 0x811a: shift = 4; break;
  case 0x811b: shift = 5; break;
  case 0x811c: shift = 6; break;
  case 0x811d: shift = 7; break;
  case 0x811e: shift = 8; break;
  }
  DAT_010bcd2c = 1 << shift;
  if (PF(0x228))
    DAT_0112988c = DAT_010bcd2c;
  FUN_00419560();
  ::CheckMenuItem(hMenu, nID, MF_BYCOMMAND | MF_CHECKED);
  dword_0123348c |= 0xa;
}

// 0x00415b50 (Q3Radiant OnTexturesShowinuse shape): wait cursor, refresh the texture list, redraw the texture window
void CMainFrame::FUN_00415b50()
{
  DAT_01129e28 = ::SetCursor(::LoadCursor(NULL, IDC_WAIT));
  FUN_00441600();
  if (this->field_0790)
    ::RedrawWindow(this->field_0790->m_hWnd, NULL, NULL, RDW_INVALIDATE | RDW_ERASE | RDW_UPDATENOW);
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
// 0x00415c20 (Q3Radiant OnMiscSelectentitycolor): pick the entity colour, light entities use the light slot
void CMainFrame::FUN_00415c20()
{
  if (!edit_entity)
    return;
  bool bLight = false;
  for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
  {
    if (b->owner->def->eclass->flags & 1)
    {
      Sys_Printf("Light selected, normalizing _color value.\n");
      bLight = true;
      break;
    }
  }
  int index = 5;
  if (bLight)
    index = 6;
#define COLOR_ENTRY(i, j) (*(float *)((char *)g_qeglobals.sv.colors + (i) * 16 + (j) * 4))
  CString strColor = ValueForKey(edit_entity->epairs, "_color");
  if (strColor.GetLength() > 0)
  {
    float fR, fG, fB;
    if (sscanf(strColor, "%f %f %f", &fR, &fG, &fB) == 3)
    {
      COLOR_ENTRY(index, 0) = fR;
      COLOR_ENTRY(index, 1) = fG;
      COLOR_ENTRY(index, 2) = fB;
      COLOR_ENTRY(index, 3) = 1.0f;
    }
  }
  if (DAT_011299a8 == 0x80 && DoColor(index))
  {
    char buffer[100];
    sprintf(buffer, "%f %f %f", COLOR_ENTRY(index, 0), COLOR_ENTRY(index, 1), COLOR_ENTRY(index, 2));
    ::SetWindowText(hwndEnt[EntValueField], buffer);
    ::SetWindowText(hwndEnt[EntKeyField], "_color");
    FUN_00477e80();
  }
  dword_0123348c = -1;
}

BOOL CALLBACK FUN_00476840(HWND, UINT, WPARAM, LPARAM);
extern "C" void FUN_00415dd0() { DialogBox(g_qeglobals.d_hInstance, (LPCSTR)217, g_qeglobals.d_hwndMain, FUN_00476840); }
extern "C" void FUN_00415df0() { FUN_00469950(); }
extern "C" void FUN_00415e00() { DoColor(0); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e20() { DoColor(4); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e40() { DoColor(3); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e60() { DoColor(2); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415e80() { DoColor(1); dword_0123348c |= 0xffffffff; }
extern "C" void FUN_00415ea0()
{
  FUN_004433b0();
  Undo_GeneralStart("arbitrary sided");
  Undo_AddBrushList(&selected_selbrushes);
  DAT_012334f5 = false;
  DAT_012334f6 = false;
  DialogBox(g_qeglobals.d_hInstance, (LPCSTR)113, g_qeglobals.d_hwndMain, FUN_004766d0);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416030
void CMainFrame::FUN_00416030() { FUN_00415ef0("flip X", 0); }

// 0x00416050
void CMainFrame::FUN_00416050() { FUN_00415ef0("flip Y", 1); }

// 0x00416070
void CMainFrame::FUN_00416070() { FUN_00415ef0("flip Z", 2); }

// rotate the selection about X (matrix: -90 degree turn)
extern "C" void FUN_00416090()
{
  float mid[3], matrix[3][3], s, c;
  FUN_004433b0();
  Undo_GeneralStart("rotate X");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00470c50(mid);
  SinCosDegrees(-90.0f, &s, &c);
  AxisClear(matrix);
  matrix[1][1] = c;
  matrix[1][2] = -s;
  matrix[2][1] = s;
  matrix[2][2] = c;
  FUN_00470ce0(mid, matrix[0], 1, 0, -90.0f, false);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_00416130()
{
  float mid[3], matrix[3][3], s, c;
  FUN_004433b0();
  Undo_GeneralStart("rotate Y");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00470c50(mid);
  SinCosDegrees(-90.0f, &s, &c);
  AxisClear(matrix);
  matrix[0][0] = c;
  matrix[0][2] = s;
  matrix[2][0] = -s;
  matrix[2][2] = c;
  FUN_00470ce0(mid, matrix[0], 1, 1, -90.0f, false);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_004161d0()
{
  float mid[3], matrix[3][3], s, c;
  FUN_004433b0();
  Undo_GeneralStart("rotate Z");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00470c50(mid);
  SinCosDegrees(-90.0f, &s, &c);
  AxisClear(matrix);
  matrix[0][0] = c;
  matrix[0][1] = -s;
  matrix[1][0] = s;
  matrix[1][1] = c;
  FUN_00470ce0(mid, matrix[0], 1, 2, -90.0f, false);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_00416270() { Map_RemoveRegion(); }
extern "C" void FUN_00416280() { FUN_004694d0(); }
extern "C" void FUN_00416290() { FUN_004692a0(); }
extern "C" void FUN_004162a0() { FUN_00469420(); }
extern "C" void FUN_004162b0() { FUN_00469350(); }
// 0x004162c0
void CMainFrame::FUN_004162c0()
{
  FUN_004433b0();
  Undo_GeneralStart("arbitrary rotation");
  Undo_AddBrushList(&selected_selbrushes);
  CRotateDlg dlg;
  dlg.DoModal();
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_00416420()
{
  FUN_0046fe50();
  for (selbrush_t *b = selected_selbrushes.next; b != &selected_selbrushes; b = b->next)
    FUN_0045e0b0(b->def);
  for (selbrush_t *b = DAT_010a44dc.next; b != &DAT_010a44dc; b = b->next)
    FUN_0045e0b0(b->def);
}

extern "C" void FUN_00416480() { FUN_004364b0(); }
extern "C" void FUN_00416490() { FUN_0046dfc0(); }
// 0x004164a0
extern int DAT_011298b0;
extern "C" void FUN_004164a0()
{
  if (DAT_011298b0 == 4)
    FUN_004369b0();
  else if (!FUN_00438ca0())
    FUN_0046ddc0();
}

extern "C" void FUN_004164c0() { FUN_0046dc40(); }
extern "C" void FUN_004164d0() { FUN_00471dd0(); }
extern int DAT_01129934;
extern int DAT_01129938;
extern "C" void FUN_004164e0()
{
  int count = 0;
  for (selbrush_t *b = selected_selbrushes.next; b != &selected_selbrushes; b = b->next)
  {
    if (++count > 1)
    {
      Sys_Printf("Can't hollow more than 1 brush at a time.\n");
      return;
    }
  }
  FUN_004433b0();
  Undo_GeneralStart("hollow");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_0045f8b0();
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416540
extern "C" void FUN_00416540()
{
  FUN_004433b0();
  Undo_GeneralStart("CSG merge");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_0045ff30();
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416570
extern "C" void FUN_00416570()
{
  FUN_004433b0();
  Undo_GeneralStart("Auto caulk");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00460700();
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_004165a0() { DAT_01129934 ^= 1; dword_0123348c |= 0xffffffff; }
extern "C" void FUN_004165c0() { DAT_01129938 ^= 1; dword_0123348c |= 0xffffffff; }
extern "C" void FUN_004165e0()
{
  FUN_004433b0();
  Undo_GeneralStart("delete");
  Undo_AddBrushList(&selected_selbrushes);
  for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    Undo_AddEntity(b->owner->def);
  FUN_0046fb30();
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

void CMainFrame::FUN_00416680()
{
  if (DAT_0109fdb4)
  {
    ::PostMessage(DAT_0109fdb4, WM_COMMAND, IDCANCEL, 0);
    return;
  }
  if (DAT_0109fe5e)
  {
    FUN_004171b0();
    return;
  }
  if (DAT_0109fe5f)
  {
    FUN_00418ec0();
    return;
  }
  if (DAT_0109fe64)
  {
    FUN_00419860();
    return;
  }
  if (DAT_011298b0 == 4 && DAT_010c4d84 > 0)
  {
    DAT_010c4d84 = 0;
    dword_0123348c = -1;
    return;
  }
  FUN_0046fbe0(true);
  this->field_07a4[2] = " ";
  this->FUN_00417cf0();
}

extern "C" void FUN_00416720()
{
  if (DAT_011298b0 == 2)
  {
    DAT_011298b0 = 0;
    DAT_011298b4 = 0;
    dword_0123348c = -1;
    return;
  }
  FUN_00475350();
  if (DAT_010c2d7c)
  {
    int previous = DAT_011298b0;
    DAT_011298b0 = 2;
    if (previous == 11)
    {
      FUN_0041b190(g_pParentWnd);
      dword_0123348c = -1;
      return;
    }
    if (previous == 10)
      FUN_0042beb0();
  }
  dword_0123348c = -1;
}

extern "C" void FUN_00416790()
{
  int previous = DAT_011298b0;
  if (previous != 1 && previous != 4)
  {
    if (OnlyPatchesSelected())
    {
      FUN_0042ec60();
      dword_0123348c = -1;
      return;
    }
    if (AnyPatchesSelected())
    {
      FUN_0042edc0();
      dword_0123348c = -1;
      return;
    }
    if (!AnyPatchesSelected())
    {
      FUN_00475350();
      if (DAT_010c2d7c)
      {
        previous = DAT_011298b0;
        DAT_011298b0 = 1;
        if (previous == 11)
        {
          FUN_0041b190(g_pParentWnd);
          dword_0123348c = -1;
          return;
        }
        if (previous == 10)
          FUN_0042beb0();
      }
    }
  }
  else
  {
    DAT_011298b0 = 0;
    if (previous == 11)
      FUN_0041b190(g_pParentWnd);
    else if (previous == 10)
      FUN_0042beb0();
    DAT_011298b4 = 0;
  }
  dword_0123348c = -1;
}

extern "C" void __fastcall FUN_00416870(CMainFrame *self)
{
  PF(0x250) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x81ab, MAKELONG(PF(0x250) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
// 0x00416e90
void CMainFrame::FUN_00416e90()
{
  FUN_004433b0();
  Undo_GeneralStart("make detail");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_004721a0(0x2080, 0x8000000);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416ed0
void CMainFrame::FUN_00416ed0()
{
  FUN_004433b0();
  Undo_GeneralStart("make structural");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_004721a0(0x8002084, 0);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416f10
void CMainFrame::FUN_00416f10()
{
  FUN_004433b0();
  Undo_GeneralStart("make weaponclip");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_004721a0(0, 0x8002080);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416f50
void CMainFrame::FUN_00416f50()
{
  FUN_004433b0();
  Undo_GeneralStart("make noncolliding");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_004721a0(0, 0x8000004);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416f90
void CMainFrame::FUN_00416f90()
{
  FUN_004433b0();
  Undo_GeneralStart("make split coplanar geo");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00472280(0, 0x100);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00416fd0
void CMainFrame::FUN_00416fd0()
{
  FUN_004433b0();
  Undo_GeneralStart("make don't split coplanar geo");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00472280(0x100, 0);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_00417010() { FUN_00470ff0(); }
extern "C" void FUN_00417020() { FUN_00471530(); }
extern "C" void FUN_00417030() { FUN_00471270(); }
extern "C" void FUN_00417040() { FUN_004713e0(); }
extern "C" void FUN_00417050() { FUN_00471670(); }
// 0x00417060
extern "C" void FUN_00417060() { FUN_004718b0("targetname"); }

// 0x00417070
extern "C" void FUN_00417070() { FUN_004718b0("classname"); }

extern "C" void FUN_00417080() { FUN_00471a90(); }
void FUN_00476ce0(void);
extern "C" void FUN_00417090() { FUN_00476ce0(); }
// 0x004170b0
void CMainFrame::FUN_004170b0() { FUN_004114f0(this, 124); }

// 0x004170c0
void CMainFrame::FUN_004170c0() { FUN_004114f0(this, 170); }

// 0x004170e0
void CMainFrame::FUN_004170e0() { FUN_004114f0(this, 125); }

// 0x004170f0
void CMainFrame::FUN_004170f0()
{
  if (this->field_07a0 != 2)
  {
    CXYWnd *xy = this->field_0788;
    if (xy->m_nViewType == 2)
      FUN_00452ca0(xy, 1);
    else if (xy->m_nViewType == 1)
      FUN_00452ca0(xy, 0);
    else
      FUN_00452ca0(xy, 2);
    FUN_00452b00(this->field_0788);
    dword_0123348c |= 2;
  }
}

extern "C" void FUN_00417140() { dword_0123348c |= 1; }
void CMainFrame::FUN_00417150(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(!field_07e4);
}
void DoAbout(void);
void CMainFrame::FUN_00417170(UINT nType, int cx, int cy)
{
  Default();
  ::GetClientRect(m_hWnd, &DAT_01234668);
}

extern "C" void FUN_00417190() { DoAbout(); }
// 0x004171b0
void CMainFrame::FUN_004171b0()
{
  if (this->field_07e0)
  {
    CXYWnd *xy = (CXYWnd *)this->field_07e0;
    if (DAT_0109fe5e)
    {
      xy->SetClipMode(false);
      ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x800f, 0);
      return;
    }
    if (DAT_0109fe5f)
      FUN_00418ec0();
    xy->SetClipMode(true);
    ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x800f, 1);
  }
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
extern "C" void __fastcall FUN_004172c0(CMainFrame *self)
{
  if (!FUN_0042a7f0(0, 1, false))
  {
    CamView *cam = CAM;
    cam->origin[0] -= cam->forward[0] * 32.0f;
    cam->origin[1] -= cam->forward[1] * 32.0f;
    cam->origin[2] -= cam->forward[2] * 32.0f;
    dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
  }
}

extern "C" void __fastcall FUN_00417340(CMainFrame *self)
{
  CamView *cam = CAM;
  cam->origin[2] -= 32.0f;
  dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
}
extern "C" void __fastcall FUN_00417380(CMainFrame *self)
{
  if (!FUN_0042a7f0(0, -1, false))
  {
    CamView *cam = CAM;
    cam->origin[0] += cam->forward[0] * 32.0f;
    cam->origin[1] += cam->forward[1] * 32.0f;
    cam->origin[2] += cam->forward[2] * 32.0f;
    dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
  }
}

// 0x00417400
void CMainFrame::FUN_00417400()
{
  if (!FUN_0042a7f0(1, 0, false))
  {
    ((CamView *)field_078c)->angles[1] += 22.5;
    dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
  }
}

// 0x00417450
void CMainFrame::FUN_00417450()
{
  if (!FUN_0042a7f0(-1, 0, false))
  {
    ((CamView *)field_078c)->angles[1] -= 22.5;
    dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
  }
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
// 0x00417580
extern "C" void FUN_00417580() { FUN_0042a7f0(0, -1, true); }

// 0x004175a0
extern "C" void FUN_004175a0() { FUN_0042a7f0(0, 1, true); }

// 0x004175c0
extern "C" void FUN_004175c0() { FUN_0042a7f0(1, 0, true); }

// 0x004175e0
extern "C" void FUN_004175e0() { FUN_0042a7f0(-1, 0, true); }

extern "C" void __fastcall FUN_00417600(CMainFrame *self)
{
  CamView *cam = CAM;
  cam->origin[2] += 32.0f;
  dword_0123348c |= dword_01233b64->m_bCamXYUpdate ? 3 : 1;
}
extern int DAT_010bcd28;
extern "C" void FUN_00417640() { DAT_010bcd28 = !DAT_010bcd28; dword_0123348c |= 0xa; }
void CMainFrame::FUN_00417660()
{
  int nView = PF(0x1b4);
  int nTextureBar = PF(0x224);
  dword_01233b64->LoadPrefs();
  if (dword_01233b64->DoModal() == IDOK)
  {
    if (PF(0x1b4) != nView)
      this->MessageBox("You need to restart CoD2Radiant for the view changes to take place.", NULL, 0);
    if (this->field_0790)
      FUN_00442e60();
    if (nTextureBar != PF(0x224))
    {
      this->ShowControlBar(&this->m_wndTextureBar, nTextureBar != 0, TRUE);
      this->m_wndTextureBar.Invalidate();
    }
    CMenu *pMenu = this->GetMenu();
    if (pMenu)
      pMenu->CheckMenuItem(0x8019, MF_BYCOMMAND | (PF(0x248) ? 0 : MF_CHECKED));
    FUN_00435840();
    dword_0123348c = -1;
  }
}

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
extern bool DAT_0058fbed;

void CMainFrame::UpdateWindows(int nBits)
{
  if (!DAT_0058fbed)
    return;
  if (nBits & 6)
    if (field_0788)
      field_0788->RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
  if ((nBits & 1) || ((nBits & 0x100) && field_07e4))
    if (field_078c)
      field_078c->RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
  if (nBits & 0x28)
    if (field_0794)
      field_0794->RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
  if (nBits & 0x10)
    if (field_0790)
      field_0790->RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
}

// view of the status bar and the six pane texts (offsets from retail)
struct CMainFrameStatusView
{
  unsigned char pad0[0xd0];
  CStatusBar m_wndStatusBar;
  unsigned char pad1[0x7a4 - 0xd0 - sizeof(CStatusBar)];
  CString m_strStatus[6];
};

// 0x00417840
void CMainFrame::FUN_00417840()
{
  if (this->field_07a0 == 1 || this->field_07a0 == 2)
  {
    if (this->field_0794 && this->field_0794->GetSafeHwnd())
    {
      if (::IsWindowVisible(this->field_0794->GetSafeHwnd()))
        this->field_0794->ShowWindow(SW_HIDE);
      else
        this->field_0794->ShowWindow(SW_SHOW);
    }
  }
  else
    FUN_00444a00();
}

extern "C" void __fastcall FUN_00417890(CMainFrame *self)
{
  PF(0x1b8) = !PF(0x1b8);
  CMenu *pMenu = self->GetMenu();
  if (pMenu)
    pMenu->CheckMenuItem(0x8011, MF_BYCOMMAND | (PF(0x1b8) ? MF_CHECKED : MF_UNCHECKED));
  dword_01233b64->SavePrefs();
  self->FUN_00419560();
}

extern "C" void __fastcall FUN_00417900(CMainFrame *self)
{
  PF(0x1bc) = !PF(0x1bc);
  CMenu *pMenu = self->GetMenu();
  if (pMenu)
    pMenu->CheckMenuItem(0x81d5, MF_BYCOMMAND | (PF(0x1bc) ? MF_CHECKED : MF_UNCHECKED));
  dword_01233b64->SavePrefs();
  self->FUN_00419560();
}

// 0x00417970
void CMainFrame::FUN_00417970()
{
  CMapInfo dlg;
  dlg.DoModal();
}

// 0x004179e0 (not written)

// 0x00417a30
void CMainFrame::FUN_00417a30()
{
  CEntityListDlg dlg;
  dlg.DoModal();
}

// 0x00417a90
void CMainFrame::FUN_00417a90()
{
  if (this->field_07a0 != 2)
  {
    CXYWnd *xy = this->field_0788;
    if (xy->m_nViewType == 2)
      FUN_00452ca0(xy, 1);
    else if (xy->m_nViewType == 1)
      FUN_00452ca0(xy, 0);
    else
      FUN_00452ca0(xy, 2);
    FUN_00452b00(this->field_0788);
    dword_0123348c |= 2;
  }
}

// 0x00417ae0
void CMainFrame::FUN_00417ae0()
{
  CCommandsDlg dlg;
  dlg.DoModal();
}

// 0x00417b50 (Q3Radiant OnFileNewproject, reduced to the project-name flow)
void CMainFrame::FUN_00417b50()
{
  CNewProjDlg dlg;
  if (dlg.DoModal() == IDOK && dlg.m_strName.GetLength() > 0)
  {
    char buf[0x400];
    strcpy(buf, dlg.m_strName);
    Com_StripExtension(buf, buf);
    strcat(buf, ".prj");
    DAT_012345c0 = buf;
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)153, g_qeglobals.d_hwndMain, ProjectDlgProc);
  }
}

// 0x00417cf0 (63 B), this in ebx
void CMainFrame::FUN_00417cf0()
{
  CMainFrameStatusView *view = (CMainFrameStatusView *)this;
  for (int i = 0; i < 6; i++)
  {
    if (view->m_strStatus[i].GetLength() >= 0 && view->m_wndStatusBar.GetSafeHwnd())
      view->m_wndStatusBar.SetPaneText(i, view->m_strStatus[i], TRUE);
  }
}
// Q3Radiant SetStatusText
void CMainFrame::FUN_00417d30(int nPane, const char *pText)
{
  if (pText && nPane <= 5 && nPane > 0)
  {
    field_07a4[nPane] = pText;
    FUN_00417cf0();
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
// 0x00417e40
void CMainFrame::FUN_00417e40()
{
  if (this->field_07e0 && DAT_0109fe5e)
  {
    FUN_004433b0();
    Undo_GeneralStart("clip selected");
    Undo_AddBrushList(&selected_selbrushes);
    FUN_00452990();
    FUN_00443f80(&selected_selbrushes);
    Undo_End();
    return;
  }
  if (DAT_012334ba)
    FUN_00433da0();
}

// 0x00417ea0
void CMainFrame::FUN_00417ea0()
{
  if (this->field_07e0)
  {
    FUN_004433b0();
    Undo_GeneralStart("split selected");
    Undo_AddBrushList(&selected_selbrushes);
    FUN_00452a60(this->field_07e0);
    FUN_00443f80(&selected_selbrushes);
    Undo_End();
  }
}

// 0x00417ef0
extern "C" CWnd *__fastcall FUN_00417ef0(CMainFrame *self) { return self->field_07e0; }

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
extern "C" void FUN_00418140()
{
  g_qeglobals.sv.colors[0][0] = 0.25f;
  g_qeglobals.sv.colors[0][1] = 0.25f;
  g_qeglobals.sv.colors[0][2] = 0.25f;
  g_qeglobals.sv.colors[1][0] = 1.0f;
  g_qeglobals.sv.colors[1][1] = 1.0f;
  g_qeglobals.sv.colors[1][2] = 1.0f;
  g_qeglobals.sv.colors[2][0] = 1.0f;
  g_qeglobals.sv.colors[2][1] = 1.0f;
  g_qeglobals.sv.colors[2][2] = 0.75f;
  g_qeglobals.sv.colors[3][0] = 0.75f;
  g_qeglobals.sv.colors[3][1] = 0.75f;
  g_qeglobals.sv.colors[3][2] = 1.0f;
  g_qeglobals.sv.colors[4][0] = 0.5f;
  g_qeglobals.sv.colors[4][1] = 0.5f;
  g_qeglobals.sv.colors[4][2] = 0.5f;
  g_qeglobals.sv.colors[5][0] = 1.0f;
  g_qeglobals.sv.colors[5][1] = 0.25f;
  g_qeglobals.sv.colors[5][2] = 0.25f;
  g_qeglobals.sv.colors[6][0] = 0.25f;
  g_qeglobals.sv.colors[6][1] = 1.0f;
  g_qeglobals.sv.colors[9][1] = 0.0f;
  g_qeglobals.sv.colors[9][2] = 0.0f;
  g_qeglobals.sv.colors[10][0] = 1.0f;
  g_qeglobals.sv.colors[10][1] = 1.0f;
  g_qeglobals.sv.colors[10][2] = 0.0f;
  g_qeglobals.sv.colors[11][0] = 0.0f;
  g_qeglobals.sv.colors[11][1] = 0.0f;
  g_qeglobals.sv.colors[11][2] = 1.0f;
  g_qeglobals.sv.colors[13][1] = 1.0f;
  g_qeglobals.sv.colors[13][2] = 0.0f;
  g_qeglobals.sv.colors[14][0] = 0.0f;
  g_qeglobals.sv.colors[14][1] = 1.0f;
  g_qeglobals.sv.colors[14][2] = 1.0f;
  g_qeglobals.sv.colors[15][0] = 0.25f;
  g_qeglobals.sv.colors[15][1] = 0.25f;
  g_qeglobals.sv.colors[15][2] = 0.25f;
  g_qeglobals.sv.colors[16][0] = 0.0f;
  g_qeglobals.sv.colors[16][1] = 0.0f;
  g_qeglobals.sv.colors[16][2] = 1.0f;
  g_qeglobals.sv.colors[17][0] = 1.0f;
  g_qeglobals.sv.colors[12][0] = 0.0f;
  g_qeglobals.sv.colors[12][1] = 0.0f;
  g_qeglobals.sv.colors[12][2] = 0.0f;
  g_qeglobals.sv.colors[13][0] = 1.0f;
  g_qeglobals.sv.colors[17][1] = 0.5f;
  g_qeglobals.sv.colors[17][2] = 0.0f;
  g_qeglobals.sv.colors[18][0] = 0.75f;
  g_qeglobals.sv.colors[18][1] = 1.0f;
  g_qeglobals.sv.colors[18][2] = 0.0f;
  g_qeglobals.sv.colors[19][0] = 0.6f;
  g_qeglobals.sv.colors[19][1] = 0.0f;
  g_qeglobals.sv.colors[19][2] = 1.0f;
  g_qeglobals.sv.colors[20][0] = 0.1f;
  g_qeglobals.sv.colors[20][1] = 0.4f;
  g_qeglobals.sv.colors[20][2] = 1.0f;
  g_qeglobals.sv.colors[21][0] = 1.0f;
  g_qeglobals.sv.colors[21][1] = 1.0f;
  g_qeglobals.sv.colors[21][2] = 0.25f;
  g_qeglobals.sv.colors[22][0] = 0.25f;
  g_qeglobals.sv.colors[22][1] = 0.25f;
  g_qeglobals.sv.colors[22][2] = 0.75f;
  g_qeglobals.sv.colors[23][0] = 0.75f;
  g_qeglobals.sv.colors[23][1] = 0.75f;
  g_qeglobals.sv.colors[23][2] = 1.0f;
  g_qeglobals.sv.colors[24][0] = 0.75f;
  g_qeglobals.sv.colors[24][1] = 0.75f;
  g_qeglobals.sv.colors[24][2] = 0.75f;
  g_qeglobals.sv.colors[25][0] = 1.0f;
  g_qeglobals.sv.colors[25][1] = 0.5f;
  g_qeglobals.sv.colors[25][2] = 0.6f;
  g_qeglobals.sv.colors[26][0] = 0.0f;
  g_qeglobals.sv.colors[26][1] = 1.0f;
  g_qeglobals.sv.colors[26][2] = 0.65f;
  g_qeglobals.sv.colors[27][0] = 0.0f;
  g_qeglobals.sv.colors[27][1] = 0.0f;
  g_qeglobals.sv.colors[27][2] = 1.0f;
  g_qeglobals.sv.colors[28][0] = 0.85f;
  g_qeglobals.sv.colors[28][1] = 0.0f;
  g_qeglobals.sv.colors[28][2] = 0.85f;
  g_qeglobals.sv.colors[29][0] = 1.0f;
  g_qeglobals.sv.colors[29][1] = 0.8f;
  g_qeglobals.sv.colors[29][2] = 0.6f;
  g_qeglobals.sv.colors[30][0] = 0.0f;
  g_qeglobals.sv.colors[30][1] = 1.0f;
  g_qeglobals.sv.colors[30][2] = 0.2f;
  g_qeglobals.sv.colors[31][0] = 0.17f;
  g_qeglobals.sv.colors[31][1] = 0.14f;
  g_qeglobals.sv.colors[31][2] = 1.0f;
  dword_0123348c = -1;
}

extern "C" void FUN_00418390()
{
  g_qeglobals.sv.colors[0][0] = 0.25f;
  g_qeglobals.sv.colors[0][1] = 0.25f;
  g_qeglobals.sv.colors[0][2] = 0.25f;
  g_qeglobals.sv.colors[1][0] = 1.0f;
  g_qeglobals.sv.colors[1][1] = 1.0f;
  g_qeglobals.sv.colors[1][2] = 1.0f;
  g_qeglobals.sv.colors[2][0] = 1.0f;
  g_qeglobals.sv.colors[2][1] = 1.0f;
  g_qeglobals.sv.colors[2][2] = 1.0f;
  g_qeglobals.sv.colors[3][0] = 1.0f;
  g_qeglobals.sv.colors[3][1] = 1.0f;
  g_qeglobals.sv.colors[3][2] = 1.0f;
  g_qeglobals.sv.colors[4][0] = 0.5f;
  g_qeglobals.sv.colors[4][1] = 0.5f;
  g_qeglobals.sv.colors[4][2] = 0.5f;
  g_qeglobals.sv.colors[5][0] = 1.0f;
  g_qeglobals.sv.colors[5][1] = 0.25f;
  g_qeglobals.sv.colors[5][2] = 0.25f;
  g_qeglobals.sv.colors[6][0] = 0.25f;
  g_qeglobals.sv.colors[6][1] = 1.0f;
  g_qeglobals.sv.colors[9][1] = 0.0f;
  g_qeglobals.sv.colors[9][2] = 0.0f;
  g_qeglobals.sv.colors[10][0] = 1.0f;
  g_qeglobals.sv.colors[10][1] = 1.0f;
  g_qeglobals.sv.colors[10][2] = 0.0f;
  g_qeglobals.sv.colors[11][0] = 0.0f;
  g_qeglobals.sv.colors[11][1] = 0.0f;
  g_qeglobals.sv.colors[11][2] = 1.0f;
  g_qeglobals.sv.colors[13][1] = 1.0f;
  g_qeglobals.sv.colors[13][2] = 0.0f;
  g_qeglobals.sv.colors[14][0] = 0.0f;
  g_qeglobals.sv.colors[14][1] = 1.0f;
  g_qeglobals.sv.colors[14][2] = 1.0f;
  g_qeglobals.sv.colors[15][0] = 0.25f;
  g_qeglobals.sv.colors[15][1] = 0.25f;
  g_qeglobals.sv.colors[15][2] = 0.25f;
  g_qeglobals.sv.colors[16][0] = 0.0f;
  g_qeglobals.sv.colors[16][1] = 0.0f;
  g_qeglobals.sv.colors[16][2] = 1.0f;
  g_qeglobals.sv.colors[17][0] = 1.0f;
  g_qeglobals.sv.colors[12][0] = 0.0f;
  g_qeglobals.sv.colors[12][1] = 0.0f;
  g_qeglobals.sv.colors[12][2] = 0.0f;
  g_qeglobals.sv.colors[13][0] = 1.0f;
  g_qeglobals.sv.colors[17][1] = 0.5f;
  g_qeglobals.sv.colors[17][2] = 0.0f;
  g_qeglobals.sv.colors[18][0] = 0.75f;
  g_qeglobals.sv.colors[18][1] = 1.0f;
  g_qeglobals.sv.colors[18][2] = 0.0f;
  g_qeglobals.sv.colors[19][0] = 0.6f;
  g_qeglobals.sv.colors[19][1] = 0.0f;
  g_qeglobals.sv.colors[19][2] = 1.0f;
  g_qeglobals.sv.colors[20][0] = 0.4f;
  g_qeglobals.sv.colors[20][1] = 0.6f;
  g_qeglobals.sv.colors[20][2] = 1.0f;
  g_qeglobals.sv.colors[21][0] = 1.0f;
  g_qeglobals.sv.colors[21][1] = 1.0f;
  g_qeglobals.sv.colors[21][2] = 0.25f;
  g_qeglobals.sv.colors[22][0] = 0.25f;
  g_qeglobals.sv.colors[22][1] = 0.25f;
  g_qeglobals.sv.colors[22][2] = 0.75f;
  g_qeglobals.sv.colors[23][0] = 0.75f;
  g_qeglobals.sv.colors[23][1] = 0.75f;
  g_qeglobals.sv.colors[23][2] = 1.0f;
  g_qeglobals.sv.colors[24][0] = 0.75f;
  g_qeglobals.sv.colors[24][1] = 0.75f;
  g_qeglobals.sv.colors[24][2] = 0.75f;
  g_qeglobals.sv.colors[25][0] = 1.0f;
  g_qeglobals.sv.colors[25][1] = 0.5f;
  g_qeglobals.sv.colors[25][2] = 0.6f;
  g_qeglobals.sv.colors[26][0] = 0.0f;
  g_qeglobals.sv.colors[26][1] = 1.0f;
  g_qeglobals.sv.colors[29][2] = 0.6f;
  g_qeglobals.sv.colors[26][2] = 0.65f;
  g_qeglobals.sv.colors[27][0] = 0.0f;
  g_qeglobals.sv.colors[27][1] = 0.0f;
  g_qeglobals.sv.colors[27][2] = 1.0f;
  g_qeglobals.sv.colors[28][0] = 0.85f;
  g_qeglobals.sv.colors[28][1] = 0.0f;
  g_qeglobals.sv.colors[28][2] = 0.85f;
  g_qeglobals.sv.colors[29][0] = 1.0f;
  g_qeglobals.sv.colors[29][1] = 0.8f;
  g_qeglobals.sv.colors[30][0] = 0.0f;
  g_qeglobals.sv.colors[30][1] = 1.0f;
  g_qeglobals.sv.colors[30][2] = 0.2f;
  g_qeglobals.sv.colors[31][0] = 0.17f;
  g_qeglobals.sv.colors[31][1] = 0.14f;
  g_qeglobals.sv.colors[31][2] = 1.0f;
  dword_0123348c = -1;
}

void CMainFrame::FUN_004185d0()
{
  g_qeglobals.sv.colors[0][0] = 0.25f;
  g_qeglobals.sv.colors[0][1] = 0.25f;
  g_qeglobals.sv.colors[0][2] = 0.25f;
  g_qeglobals.sv.colors[5][1] = 0.25f;
  g_qeglobals.sv.colors[5][2] = 0.25f;
  g_qeglobals.sv.colors[6][0] = 0.25f;
  g_qeglobals.sv.colors[15][0] = 0.25f;
  g_qeglobals.sv.colors[15][1] = 0.25f;
  g_qeglobals.sv.colors[15][2] = 0.25f;
  g_qeglobals.sv.colors[17][1] = 0.7f;
  g_qeglobals.sv.colors[17][2] = 0.7f;
  g_qeglobals.sv.colors[18][0] = 0.7f;
  g_qeglobals.sv.colors[21][2] = 0.25f;
  g_qeglobals.sv.colors[22][0] = 0.25f;
  g_qeglobals.sv.colors[22][1] = 0.25f;
  g_qeglobals.sv.colors[1][0] = 1.0f;
  g_qeglobals.sv.colors[1][1] = 0.0f;
  g_qeglobals.sv.colors[1][2] = 0.0f;
  g_qeglobals.sv.colors[2][0] = 0.0f;
  g_qeglobals.sv.colors[2][1] = 1.0f;
  g_qeglobals.sv.colors[2][2] = 0.0f;
  g_qeglobals.sv.colors[3][0] = 0.0f;
  g_qeglobals.sv.colors[3][1] = 0.0f;
  g_qeglobals.sv.colors[3][2] = 1.0f;
  g_qeglobals.sv.colors[4][0] = 0.3f;
  g_qeglobals.sv.colors[4][1] = 0.5f;
  g_qeglobals.sv.colors[4][2] = 0.5f;
  g_qeglobals.sv.colors[5][0] = 1.0f;
  g_qeglobals.sv.colors[6][1] = 1.0f;
  g_qeglobals.sv.colors[9][1] = 0.0f;
  g_qeglobals.sv.colors[9][2] = 0.0f;
  g_qeglobals.sv.colors[10][0] = 1.0f;
  g_qeglobals.sv.colors[10][1] = 1.0f;
  g_qeglobals.sv.colors[10][2] = 1.0f;
  g_qeglobals.sv.colors[11][0] = 1.0f;
  g_qeglobals.sv.colors[11][1] = 1.0f;
  g_qeglobals.sv.colors[11][2] = 1.0f;
  g_qeglobals.sv.colors[13][1] = 1.0f;
  g_qeglobals.sv.colors[13][2] = 0.0f;
  g_qeglobals.sv.colors[14][0] = 0.0f;
  g_qeglobals.sv.colors[14][1] = 1.0f;
  g_qeglobals.sv.colors[14][2] = 1.0f;
  g_qeglobals.sv.colors[16][0] = 0.0f;
  g_qeglobals.sv.colors[16][1] = 0.0f;
  g_qeglobals.sv.colors[16][2] = 1.0f;
  g_qeglobals.sv.colors[17][0] = 1.0f;
  g_qeglobals.sv.colors[12][0] = 1.0f;
  g_qeglobals.sv.colors[12][1] = 1.0f;
  g_qeglobals.sv.colors[12][2] = 1.0f;
  g_qeglobals.sv.colors[13][0] = 1.0f;
  g_qeglobals.sv.colors[18][1] = 1.0f;
  g_qeglobals.sv.colors[18][2] = 0.0f;
  g_qeglobals.sv.colors[19][0] = 0.6f;
  g_qeglobals.sv.colors[19][1] = 0.0f;
  g_qeglobals.sv.colors[19][2] = 1.0f;
  g_qeglobals.sv.colors[20][0] = 0.4f;
  g_qeglobals.sv.colors[20][1] = 0.6f;
  g_qeglobals.sv.colors[20][2] = 1.0f;
  g_qeglobals.sv.colors[21][0] = 1.0f;
  g_qeglobals.sv.colors[21][1] = 1.0f;
  g_qeglobals.sv.colors[22][2] = 0.75f;
  g_qeglobals.sv.colors[23][0] = 0.75f;
  g_qeglobals.sv.colors[23][1] = 0.75f;
  g_qeglobals.sv.colors[23][2] = 1.0f;
  g_qeglobals.sv.colors[24][0] = 0.75f;
  g_qeglobals.sv.colors[24][1] = 0.75f;
  g_qeglobals.sv.colors[24][2] = 0.75f;
  g_qeglobals.sv.colors[25][0] = 1.0f;
  g_qeglobals.sv.colors[25][1] = 0.5f;
  g_qeglobals.sv.colors[25][2] = 0.6f;
  g_qeglobals.sv.colors[26][0] = 0.0f;
  g_qeglobals.sv.colors[26][1] = 1.0f;
  g_qeglobals.sv.colors[26][2] = 0.65f;
  g_qeglobals.sv.colors[27][0] = 0.0f;
  g_qeglobals.sv.colors[29][2] = 0.6f;
  g_qeglobals.sv.colors[27][1] = 0.0f;
  g_qeglobals.sv.colors[27][2] = 1.0f;
  g_qeglobals.sv.colors[28][0] = 0.85f;
  g_qeglobals.sv.colors[28][1] = 0.0f;
  g_qeglobals.sv.colors[28][2] = 0.85f;
  g_qeglobals.sv.colors[29][0] = 1.0f;
  g_qeglobals.sv.colors[29][1] = 0.8f;
  g_qeglobals.sv.colors[30][0] = 0.0f;
  g_qeglobals.sv.colors[30][1] = 1.0f;
  g_qeglobals.sv.colors[30][2] = 0.2f;
  g_qeglobals.sv.colors[31][0] = 0.17f;
  g_qeglobals.sv.colors[31][1] = 0.14f;
  g_qeglobals.sv.colors[31][2] = 1.0f;
  dword_0123348c = -1;
}

void CMainFrame::FUN_00418820()
{
  g_qeglobals.sv.colors[0][0] = 0.25f;
  g_qeglobals.sv.colors[0][1] = 0.25f;
  g_qeglobals.sv.colors[0][2] = 0.25f;
  g_qeglobals.sv.colors[3][1] = 0.25f;
  g_qeglobals.sv.colors[5][1] = 0.25f;
  g_qeglobals.sv.colors[5][2] = 0.25f;
  g_qeglobals.sv.colors[6][0] = 0.25f;
  g_qeglobals.sv.colors[11][0] = 0.7f;
  g_qeglobals.sv.colors[15][0] = 0.25f;
  g_qeglobals.sv.colors[15][1] = 0.25f;
  g_qeglobals.sv.colors[15][2] = 0.25f;
  g_qeglobals.sv.colors[17][1] = 0.7f;
  g_qeglobals.sv.colors[17][2] = 0.7f;
  g_qeglobals.sv.colors[21][2] = 0.25f;
  g_qeglobals.sv.colors[22][0] = 0.25f;
  g_qeglobals.sv.colors[22][1] = 0.25f;
  g_qeglobals.sv.colors[1][0] = 1.0f;
  g_qeglobals.sv.colors[1][1] = 0.0f;
  g_qeglobals.sv.colors[1][2] = 0.0f;
  g_qeglobals.sv.colors[2][0] = 0.0f;
  g_qeglobals.sv.colors[2][1] = 1.0f;
  g_qeglobals.sv.colors[2][2] = 0.0f;
  g_qeglobals.sv.colors[3][0] = 0.0f;
  g_qeglobals.sv.colors[3][2] = 1.0f;
  g_qeglobals.sv.colors[4][0] = 0.0f;
  g_qeglobals.sv.colors[4][1] = 0.0f;
  g_qeglobals.sv.colors[4][2] = 0.5f;
  g_qeglobals.sv.colors[5][0] = 1.0f;
  g_qeglobals.sv.colors[6][1] = 1.0f;
  g_qeglobals.sv.colors[9][1] = 0.0f;
  g_qeglobals.sv.colors[9][2] = 0.0f;
  g_qeglobals.sv.colors[10][0] = 1.0f;
  g_qeglobals.sv.colors[10][1] = 1.0f;
  g_qeglobals.sv.colors[10][2] = 0.2f;
  g_qeglobals.sv.colors[11][1] = 0.55f;
  g_qeglobals.sv.colors[11][2] = 1.0f;
  g_qeglobals.sv.colors[13][1] = 1.0f;
  g_qeglobals.sv.colors[13][2] = 0.0f;
  g_qeglobals.sv.colors[14][0] = 0.0f;
  g_qeglobals.sv.colors[14][1] = 1.0f;
  g_qeglobals.sv.colors[14][2] = 1.0f;
  g_qeglobals.sv.colors[16][0] = 0.0f;
  g_qeglobals.sv.colors[16][1] = 0.0f;
  g_qeglobals.sv.colors[16][2] = 1.0f;
  g_qeglobals.sv.colors[17][0] = 1.0f;
  g_qeglobals.sv.colors[12][0] = 0.5f;
  g_qeglobals.sv.colors[12][1] = 0.5f;
  g_qeglobals.sv.colors[12][2] = 0.5f;
  g_qeglobals.sv.colors[13][0] = 1.0f;
  g_qeglobals.sv.colors[18][0] = 0.0f;
  g_qeglobals.sv.colors[18][1] = 1.0f;
  g_qeglobals.sv.colors[18][2] = 0.0f;
  g_qeglobals.sv.colors[19][0] = 0.8f;
  g_qeglobals.sv.colors[19][1] = 0.0f;
  g_qeglobals.sv.colors[19][2] = 1.0f;
  g_qeglobals.sv.colors[20][0] = 0.4f;
  g_qeglobals.sv.colors[20][1] = 0.6f;
  g_qeglobals.sv.colors[20][2] = 1.0f;
  g_qeglobals.sv.colors[21][0] = 1.0f;
  g_qeglobals.sv.colors[21][1] = 1.0f;
  g_qeglobals.sv.colors[22][2] = 0.75f;
  g_qeglobals.sv.colors[23][0] = 0.75f;
  g_qeglobals.sv.colors[23][1] = 0.75f;
  g_qeglobals.sv.colors[23][2] = 1.0f;
  g_qeglobals.sv.colors[24][0] = 0.75f;
  g_qeglobals.sv.colors[24][1] = 0.75f;
  g_qeglobals.sv.colors[24][2] = 0.75f;
  g_qeglobals.sv.colors[25][0] = 1.0f;
  g_qeglobals.sv.colors[25][1] = 0.5f;
  g_qeglobals.sv.colors[25][2] = 0.6f;
  g_qeglobals.sv.colors[26][0] = 0.0f;
  g_qeglobals.sv.colors[26][1] = 1.0f;
  g_qeglobals.sv.colors[29][2] = 0.6f;
  g_qeglobals.sv.colors[26][2] = 0.65f;
  g_qeglobals.sv.colors[27][0] = 0.0f;
  g_qeglobals.sv.colors[27][1] = 0.0f;
  g_qeglobals.sv.colors[27][2] = 1.0f;
  g_qeglobals.sv.colors[28][0] = 0.85f;
  g_qeglobals.sv.colors[28][1] = 0.0f;
  g_qeglobals.sv.colors[28][2] = 0.85f;
  g_qeglobals.sv.colors[29][0] = 1.0f;
  g_qeglobals.sv.colors[29][1] = 0.8f;
  g_qeglobals.sv.colors[30][0] = 0.0f;
  g_qeglobals.sv.colors[30][1] = 1.0f;
  g_qeglobals.sv.colors[30][2] = 0.2f;
  g_qeglobals.sv.colors[31][0] = 0.17f;
  g_qeglobals.sv.colors[31][1] = 0.14f;
  g_qeglobals.sv.colors[31][2] = 1.0f;
  dword_0123348c = -1;
}

void CMainFrame::FUN_00418a70()
{
  g_qeglobals.sv.colors[0][0] = 0.63f;
  g_qeglobals.sv.colors[0][1] = 0.63f;
  g_qeglobals.sv.colors[0][2] = 0.63f;
  g_qeglobals.sv.colors[1][1] = 0.63f;
  g_qeglobals.sv.colors[1][2] = 0.63f;
  g_qeglobals.sv.colors[2][0] = 0.63f;
  g_qeglobals.sv.colors[2][2] = 0.57f;
  g_qeglobals.sv.colors[3][0] = 0.57f;
  g_qeglobals.sv.colors[3][1] = 0.57f;
  g_qeglobals.sv.colors[4][0] = 0.5f;
  g_qeglobals.sv.colors[4][1] = 0.5f;
  g_qeglobals.sv.colors[4][2] = 0.5f;
  g_qeglobals.sv.colors[5][1] = 0.63f;
  g_qeglobals.sv.colors[5][2] = 0.63f;
  g_qeglobals.sv.colors[6][0] = 0.63f;
  g_qeglobals.sv.colors[14][0] = 0.64f;
  g_qeglobals.sv.colors[15][1] = 0.64f;
  g_qeglobals.sv.colors[22][0] = 0.64f;
  g_qeglobals.sv.colors[24][1] = 0.5f;
  g_qeglobals.sv.colors[24][2] = 0.5f;
  g_qeglobals.sv.colors[1][0] = 1.0f;
  g_qeglobals.sv.colors[2][1] = 1.0f;
  g_qeglobals.sv.colors[3][2] = 1.0f;
  g_qeglobals.sv.colors[5][0] = 1.0f;
  g_qeglobals.sv.colors[6][1] = 1.0f;
  g_qeglobals.sv.colors[9][1] = 0.0f;
  g_qeglobals.sv.colors[9][2] = 0.0f;
  g_qeglobals.sv.colors[10][0] = 1.0f;
  g_qeglobals.sv.colors[10][1] = 1.0f;
  g_qeglobals.sv.colors[10][2] = 0.0f;
  g_qeglobals.sv.colors[11][0] = 0.27f;
  g_qeglobals.sv.colors[11][1] = 0.1f;
  g_qeglobals.sv.colors[11][2] = 1.0f;
  g_qeglobals.sv.colors[13][1] = 0.26f;
  g_qeglobals.sv.colors[13][2] = 1.0f;
  g_qeglobals.sv.colors[14][1] = 1.0f;
  g_qeglobals.sv.colors[14][2] = 0.26f;
  g_qeglobals.sv.colors[15][0] = 1.0f;
  g_qeglobals.sv.colors[15][2] = 0.25f;
  g_qeglobals.sv.colors[16][0] = 0.0f;
  g_qeglobals.sv.colors[16][1] = 0.0f;
  g_qeglobals.sv.colors[16][2] = 1.0f;
  g_qeglobals.sv.colors[17][0] = 1.0f;
  g_qeglobals.sv.colors[12][0] = 0.0f;
  g_qeglobals.sv.colors[12][1] = 0.02f;
  g_qeglobals.sv.colors[12][2] = 0.38f;
  g_qeglobals.sv.colors[13][0] = 1.0f;
  g_qeglobals.sv.colors[17][1] = 0.0f;
  g_qeglobals.sv.colors[17][2] = 0.27f;
  g_qeglobals.sv.colors[18][0] = 0.1f;
  g_qeglobals.sv.colors[18][1] = 1.0f;
  g_qeglobals.sv.colors[18][2] = 0.66f;
  g_qeglobals.sv.colors[19][0] = 0.67f;
  g_qeglobals.sv.colors[19][1] = 1.0f;
  g_qeglobals.sv.colors[19][2] = 1.0f;
  g_qeglobals.sv.colors[20][0] = 0.1f;
  g_qeglobals.sv.colors[20][1] = 0.4f;
  g_qeglobals.sv.colors[20][2] = 1.0f;
  g_qeglobals.sv.colors[21][0] = 1.0f;
  g_qeglobals.sv.colors[21][1] = 0.26f;
  g_qeglobals.sv.colors[21][2] = 1.0f;
  g_qeglobals.sv.colors[22][1] = 0.25f;
  g_qeglobals.sv.colors[22][2] = 0.75f;
  g_qeglobals.sv.colors[23][0] = 0.75f;
  g_qeglobals.sv.colors[23][1] = 0.75f;
  g_qeglobals.sv.colors[23][2] = 1.0f;
  g_qeglobals.sv.colors[24][0] = 0.0f;
  g_qeglobals.sv.colors[25][0] = 1.0f;
  g_qeglobals.sv.colors[25][1] = 0.79f;
  g_qeglobals.sv.colors[25][2] = 0.8f;
  g_qeglobals.sv.colors[29][1] = 0.8f;
  g_qeglobals.sv.colors[26][0] = 0.1f;
  g_qeglobals.sv.colors[26][1] = 1.0f;
  g_qeglobals.sv.colors[26][2] = 0.0f;
  g_qeglobals.sv.colors[27][0] = 0.27f;
  g_qeglobals.sv.colors[27][1] = 0.1f;
  g_qeglobals.sv.colors[27][2] = 1.0f;
  g_qeglobals.sv.colors[28][0] = 0.88f;
  g_qeglobals.sv.colors[28][1] = 0.89f;
  g_qeglobals.sv.colors[28][2] = 1.0f;
  g_qeglobals.sv.colors[29][0] = 1.0f;
  g_qeglobals.sv.colors[29][2] = 0.6f;
  g_qeglobals.sv.colors[30][0] = 0.0f;
  g_qeglobals.sv.colors[30][1] = 1.0f;
  g_qeglobals.sv.colors[30][2] = 0.2f;
  g_qeglobals.sv.colors[31][0] = 0.17f;
  g_qeglobals.sv.colors[31][1] = 0.14f;
  g_qeglobals.sv.colors[31][2] = 1.0f;
  dword_0123348c = -1;
}

// 0x00418d40 (Q3Radiant OnSelectionScale)
void CMainFrame::FUN_00418d40()
{
  CScaleDialog dlg;
  if (dlg.DoModal() == IDOK)
  {
    if (dlg.m_fX < 0 || dlg.m_fY < 0 || dlg.m_fZ < 0)
    {
      Sys_Printf("Cannot scale by a negative value.\n");
      return;
    }
    if ((dlg.m_fX == 0 || dlg.m_fY == 0 || dlg.m_fZ == 0) && !OnlyPatchesSelected())
    {
      Sys_Printf("Can only scale patches by zero.\n");
      return;
    }
    FUN_004433b0();
    Undo_GeneralStart("scale");
    Undo_AddBrushList(&selected_selbrushes);
    FUN_00470d80(dlg.m_fX, dlg.m_fY, dlg.m_fZ);
    FUN_00443f80(&selected_selbrushes);
    Undo_End();
    dword_0123348c = -1;
  }
}

// 0x00418ec0
void CMainFrame::FUN_00418ec0()
{
  if (this->field_07e0)
  {
    if (DAT_0109fe5e)
      FUN_004171b0();
    if (!DAT_0109fe5f)
    {
      if (FUN_00452d90(this->field_07e0))
      {
        ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802a, 1);
        return;
      }
      ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802a, 0);
    }
    else
    {
      DAT_0109fe5f = false;
      ::RedrawWindow(this->field_07e0->m_hWnd, NULL, NULL, 0x105);
      ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802a, 0);
      for (selbrush_t *b = selected_selbrushes.next; b != &selected_selbrushes; b = b->next)
      {
        if (b->field_20 == 0)
        {
          FUN_00467f00();
          return;
        }
      }
    }
  }
}

// 0x00418f90
extern "C" void __fastcall FUN_00418f90(CMainFrame *self)
{
  CWnd *window = self->field_07e0;
  if (window)
  {
    DAT_0109fe5f = false;
    ::RedrawWindow(window->m_hWnd, NULL, NULL, 0x105);
    ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x802a, 0);
  }
}

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
// 0x00419000
void CMainFrame::FUN_00419000()
{
  if (this->field_07e0)
    FUN_00452e30(this->field_07e0);
}

void CMainFrame::FUN_00419020()
{
  if (this->field_07e0)
    FUN_00452f50((CXYWnd *)this->field_07e0);
  for (selbrush_t *b = selected_selbrushes.next; b != &selected_selbrushes; b = b->next)
    FUN_0045e0b0(b->def);
  for (selbrush_t *b = DAT_010a44dc.next; b != &DAT_010a44dc; b = b->next)
    FUN_0045e0b0(b->def);
}

extern "C" void FUN_00419080() { Undo_Undo(); }
extern "C" void FUN_00419090() { Undo_Redo(); }
extern int DAT_0109fdc4;
// 0x004190a0
struct Dat109fdcc { unsigned char pad00[0xc]; int field_0c; };
extern Dat109fdcc *DAT_0109fdcc;
void CMainFrame::FUN_004190a0(CCmdUI *pCmdUI)
{
  if (DAT_0109fdcc && DAT_0109fdcc->field_0c)
    pCmdUI->Enable(TRUE);
  else
    pCmdUI->Enable(FALSE);
}

void CMainFrame::FUN_004190e0(CCmdUI *pCmdUI)
{
  bool enable = DAT_0109fdc4 != 0;
  pCmdUI->Enable(enable);
}
// 0x00419100
extern "C" void __fastcall FUN_00419100(CMainFrame *self)
{
  if (--DAT_0112988c == 0)
    DAT_0112988c = -1;
  self->FUN_00419560();
}

// 0x00419120
extern "C" void FUN_00419120() { FUN_00474230(1.0f, 1.0f, 0); dword_0123348c = -1; }

// 0x00419140
extern "C" void FUN_00419140() { FUN_00474230(1.0f, 1.0f, 1); dword_0123348c = -1; }

// 0x00419160
extern "C" void __fastcall FUN_00419160(CMainFrame *self)
{
  if (++DAT_0112988c == 0)
    DAT_0112988c = 1;
  self->FUN_00419560();
}

// 0x00419180
extern "C" void FUN_00419180() { FUN_004733f0(FUN_00449760()); }

// 0x00419190
extern "C" void FUN_00419190() { FUN_004733f0(-FUN_00449760()); }

// 0x004191a0
extern "C" void FUN_004191a0() { FUN_00472860(0, (float)(DAT_010bcd2c * 2)); }

// 0x004191d0
extern "C" void FUN_004191d0() { FUN_00472860(0, (float)(-DAT_010bcd2c * 2)); }

// 0x00419200
extern "C" void FUN_00419200() { FUN_00472860((float)(DAT_010bcd2c * 2), 0); }

// 0x00419230
extern "C" void FUN_00419230() { FUN_00472860((float)(-DAT_010bcd2c * 2), 0); }

// the grid menu item that matches the current grid size gets the check mark
#define CHECK_GRID_ITEM(hMenu) \
  switch (DAT_010bcd2c) \
  { \
  case 1: ::CheckMenuItem(hMenu, 0x8116, MF_BYCOMMAND | MF_CHECKED); break; \
  case 2: ::CheckMenuItem(hMenu, 0x8117, MF_BYCOMMAND | MF_CHECKED); break; \
  case 4: ::CheckMenuItem(hMenu, 0x8118, MF_BYCOMMAND | MF_CHECKED); break; \
  case 8: ::CheckMenuItem(hMenu, 0x8119, MF_BYCOMMAND | MF_CHECKED); break; \
  case 0x10: ::CheckMenuItem(hMenu, 0x811a, MF_BYCOMMAND | MF_CHECKED); break; \
  case 0x20: ::CheckMenuItem(hMenu, 0x811b, MF_BYCOMMAND | MF_CHECKED); break; \
  case 0x40: ::CheckMenuItem(hMenu, 0x811c, MF_BYCOMMAND | MF_CHECKED); break; \
  case 0x100: ::CheckMenuItem(hMenu, 0x811d, MF_BYCOMMAND | MF_CHECKED); break; \
  case 0x200: ::CheckMenuItem(hMenu, 0x811e, MF_BYCOMMAND | MF_CHECKED); break; \
  }

#define UNCHECK_GRID_ITEMS(hMenu) \
  ::CheckMenuItem(hMenu, 0x8116, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x8117, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x8118, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x8119, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x811a, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x811b, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x811c, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x811d, MF_BYCOMMAND | MF_UNCHECKED); \
  ::CheckMenuItem(hMenu, 0x811e, MF_BYCOMMAND | MF_UNCHECKED)

// 0x00419260: grid size up (the carve also holds 0x004193e0 and both switch tables)
void CMainFrame::FUN_00419260()
{
  if (DAT_010bcd2c < 64)
  {
    dword_0123348c |= 0xa;
    DAT_010bcd2c = DAT_010bcd2c << 1;
    FUN_00419560();
    HMENU hMenu = ::GetMenu(GetSafeHwnd());
    UNCHECK_GRID_ITEMS(hMenu);
    CHECK_GRID_ITEM(hMenu)
  }
}

// 0x004193e0: grid size down
void CMainFrame::FUN_004193e0()
{
  if (DAT_010bcd2c > 1)
  {
    dword_0123348c |= 0xa;
    DAT_010bcd2c = DAT_010bcd2c >> 1;
    FUN_00419560();
    HMENU hMenu = ::GetMenu(GetSafeHwnd());
    UNCHECK_GRID_ITEMS(hMenu);
    CHECK_GRID_ITEM(hMenu)
  }
}

// grid, texture, rotate and cubic-clip state in status pane 4
void CMainFrame::FUN_00419560()
{
  CString strStatus;
  char c1 = PF(0x1b8) ? 'M' : ' ';
  char c2 = PF(0x244) ? 'R' : ' ';
  char c3 = PF(0x1bc) ? 'L' : ' ';
  strStatus.Format("G:%i T:%i R:%i C:%i L:%c%c", DAT_010bcd2c, DAT_0112988c, FUN_00449760(), PF(0x2c4), c1, c2, c3);
  FUN_00417d30(4, strStatus);
}

// 0x00419660
extern "C" void __fastcall FUN_00419660(CMainFrame *self) { self->FUN_00419560(); }

extern "C" void FUN_00419670() { CFindTextureDlg::show(); }
extern void (*dword_0059c474)(void);
extern "C" void FUN_00419680() { dword_0059c474(); dword_0123348c |= 0xffffffff; }
void DoProjectSettings(void);
// 0x004196a0
void CMainFrame::FUN_004196a0()
{
  int flag;
  if ((DAT_0109fe60 & 2) && (DAT_0109fe60 & 4))
  {
    DAT_0109fe60 = 0;
    flag = 0;
  }
  else
  {
    DAT_0109fe60 = 6;
    flag = 1;
  }
  ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802e, flag);
  ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802f, 0);
  ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x8030, 0);
}

void CMainFrame::FUN_00419720()
{
  if ((DAT_0109fe60 & 1) && (DAT_0109fe60 & 4))
  {
    DAT_0109fe60 = 0;
    ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802e, 0);
    ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802f, 0);
  }
  else
  {
    DAT_0109fe60 = 5;
    ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802e, 0);
    ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802f, 1);
  }
  ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x8030, 0);
}

extern "C" void __fastcall FUN_004197b0(CMainFrame *self)
{
  if ((DAT_0109fe60 & 1) && (DAT_0109fe60 & 2))
  {
    DAT_0109fe60 = 0;
    ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x802e, 0);
    ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x802f, 0);
    ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8030, 0);
  }
  else
  {
    DAT_0109fe60 = 3;
    ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x802e, 0);
    ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x802f, 0);
    ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8030, 1);
  }
}

void CMainFrame::FUN_00419860()
{
  if (this->field_07e0)
  {
    if (DAT_0109fe5e)
      FUN_004171b0();
    if (DAT_0109fe5f)
    {
      DAT_0109fe5f = false;
      ::RedrawWindow(this->field_07e0->m_hWnd, NULL, NULL, 0x105);
      ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802d, 0);
    }
    if (DAT_0109fe64)
    {
      DAT_0109fe64 = false;
      ::RedrawWindow(this->field_07e0->m_hWnd, NULL, NULL, 0x105);
      ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802d, 0);
    }
    else
    {
      DAT_0109fe64 = true;
      ::RedrawWindow(this->field_07e0->m_hWnd, NULL, NULL, 0x105);
      ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x802d, 1);
    }
  }
}

extern "C" void FUN_00419930() { DoProjectSettings(); }
extern "C" void FUN_00419950() { DialogBox(g_qeglobals.d_hInstance, (LPCSTR)217, g_qeglobals.d_hwndMain, FUN_00476840); }
extern "C" void FUN_00419970() { FUN_0045c890(); }
extern "C" void FUN_00419980() { FUN_0045ca10(); }
void FUN_0045cdc0(float scale);
void FUN_0045cf60(float scale);
extern "C" void FUN_00419990() { FUN_0045cdc0(1.1f); dword_0123348c = -1; }
extern "C" void FUN_004199b0() { FUN_0045cdc0(0.9f); dword_0123348c = -1; }
extern "C" void FUN_004199d0() { FUN_0045cf60(1.1f); dword_0123348c = -1; }
extern "C" void FUN_004199f0() { FUN_0045cf60(0.9f); dword_0123348c = -1; }
extern int DAT_0109fecc;
// 0x00419a10
extern "C" void FUN_00419a10() { FUN_0045cc90(-0.05f); FUN_00439160(-1); dword_0123348c = -1; }

// 0x00419a30
extern "C" void FUN_00419a30() { FUN_0045cc90(0.05f); FUN_00439160(1); dword_0123348c = -1; }

// 0x00419a60
void CMainFrame::FUN_00419a60()
{
  CPrefsDlg *prefs = dword_01233b64;
  if (--PFP(prefs, 0x2c4) < 1)
    PFP(prefs, 0x2c4) = 1;
  prefs->SavePrefs();
  dword_0123348c |= 1;
  this->FUN_00419560();
}

// 0x00419ab0
void CMainFrame::FUN_00419ab0()
{
  CPrefsDlg *prefs = dword_01233b64;
  if (++PFP(prefs, 0x2c4) > 220)
    PFP(prefs, 0x2c4) = 220;
  prefs->SavePrefs();
  dword_0123348c |= 1;
  this->FUN_00419560();
}

extern "C" void __fastcall FUN_00419b00(CMainFrame *self)
{
  PFB(0x2c0) ^= 1;
  CMenu *pMenu = self->GetMenu();
  if (pMenu)
    pMenu->CheckMenuItem(0x8031, MF_BYCOMMAND | (PFB(0x2c0) ? MF_CHECKED : MF_UNCHECKED));
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8031, MAKELONG(PFB(0x2c0) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 1;
}

// 0x00419b90
void CMainFrame::FUN_00419b90() { FUN_0047ab50(true); }

void CMainFrame::FUN_00419ba0(CCmdUI *pCmdUI)
{
  pCmdUI->Enable(DAT_0109fecc);
}
// 0x00419bc0
extern "C" void FUN_00419bc0()
{
  FUN_004433b0();
  Undo_GeneralStart("move up");
  Undo_AddBrushList(&selected_selbrushes);
  float vec[3];
  vec[0] = vec[1] = 0;
  vec[2] = (float)-DAT_010bcd2c;
  FUN_0046fd50(vec, 1);
  dword_0123348c |= 0xb;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00419c30
extern "C" void FUN_00419c30()
{
  float vec[3];
  vec[2] = (float)DAT_010bcd2c;
  vec[0] = vec[1] = 0;
  FUN_0046fd50(vec, 1);
  dword_0123348c |= 0xb;
}

extern "C" void FUN_00419c70() {}
extern "C" void FUN_00419c80() {}
// 0x00419c90
extern "C" void FUN_00419c90()
{
  for (selbrush_t *b = selected_selbrushes.next; b != &selected_selbrushes; b = b->next)
    FUN_0045e2c0(b->def);
}

// 0x00419cc0
void CMainFrame::FUN_00419cc0()
{
  if (m_wndTextureBar.GetSafeHwnd())
    m_wndTextureBar.FUN_0043f460();
}

// 0x00419ce0
extern "C" void FUN_00419ce0()
{
  FUN_004433b0();
  Undo_GeneralStart("make cone");
  Undo_AddBrushList(&selected_selbrushes);
  DAT_012334f5 = true;
  DAT_012334f6 = false;
  DialogBox(g_qeglobals.d_hInstance, (LPCSTR)113, g_qeglobals.d_hwndMain, FUN_004766d0);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x00419d40
void CMainFrame::FUN_00419d40()
{
  PF(0x244) ^= 1;
  CMenu *pMenu = this->GetMenu();
  if (pMenu)
    ::CheckMenuItem(pMenu->m_hMenu, 0x8043, PF(0x244) ? MF_CHECKED : MF_UNCHECKED);
  dword_01233b64->SavePrefs();
  this->FUN_00419560();
}

void CMainFrame::FUN_00419da0()
{
  CFileDialog dlgFile(TRUE, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, "Map files (*.map)|*.map||", this);
  if (dlgFile.DoModal() == IDOK)
    FUN_0046ab20(dlgFile.GetPathName().GetBuffer(0));
}

void CMainFrame::FUN_00419e90()
{
  CFileDialog dlgFile(FALSE, "map", NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, "Map files (*.map)|*.map||", this);
  if (dlgFile.DoModal() == IDOK)
    FUN_0046ad90(dlgFile.GetPathName().GetBuffer(0));
}

extern "C" void FUN_00419f80() { FUN_0045c950(); }
extern "C" void FUN_00419f90() { FUN_00437400(); }
// 0x00419fa0
void CMainFrame::FUN_00419fa0() { FUN_0041a010(3, DAT_010bcd2c); }

// 0x00419fc0
void CMainFrame::FUN_00419fc0() { FUN_0041a010(0, DAT_010bcd2c); }

// 0x00419fd0
void CMainFrame::FUN_00419fd0() { FUN_0041a010(2, DAT_010bcd2c); }

// 0x00419ff0
void CMainFrame::FUN_00419ff0() { FUN_0041a010(1, DAT_010bcd2c); }

BOOL CMainFrame::PreTranslateMessage(MSG *pMsg)
{
  return CFrameWnd::PreTranslateMessage(pMsg);
}

// 0x0041a2b0
extern "C" void __stdcall FUN_0041a2b0(int axis, float amount)
{
  float vec[3];
  vec[0] = vec[1] = vec[2] = 0;
  vec[axis] = amount;
  FUN_0046fd50(vec, 1);
  dword_0123348c = -1;
}

extern "C" void __fastcall FUN_0041a2f0(CMainFrame *self)
{
  PF(0x2c8) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8054, MAKELONG(PF(0x2c8) == 0, 0));
  dword_01233b64->SavePrefs();
}
// opens an extra camera window
void CMainFrame::FUN_0041a330()
{
  CCamWnd *pCamWnd = new CCamWnd();
  CRect rect(100, 100, 300, 300);
  pCamWnd->Create("QCamera", "", WS_OVERLAPPEDWINDOW, rect, CWnd::FromHandle(::GetDesktopWindow()), 12345);
  pCamWnd->ShowWindow(SW_SHOW);
}

// 0x0041a3e0
void CMainFrame::FUN_0041a3e0()
{
  FUN_004433b0();
  Undo_GeneralStart("make simpe patch mesh");
  Undo_AddBrushList(&selected_selbrushes);
  CPatchDensityDlg dlg;
  dlg.DoModal();
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041a4d0
void CMainFrame::FUN_0041a4d0()
{
  FUN_004433b0();
  Undo_GeneralStart("make simple terrain mesh");
  Undo_AddBrushList(&selected_selbrushes);
  CTerrainDensityDlg dlg;
  dlg.DoModal();
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
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
extern "C" void __fastcall FUN_0041a750(CMainFrame *self)
{
  PF(0x1d8) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x8178, MAKELONG(PF(0x1d8) != 0, 0));
  for (selbrush_t *b = selected_selbrushes.next; b != &selected_selbrushes; b = b->next)
    FUN_0045e0b0(b->def);
  for (selbrush_t *b = DAT_010a44dc.next; b != &DAT_010a44dc; b = b->next)
    FUN_0045e0b0(b->def);
  dword_01233b64->SavePrefs();
  dword_0123348c = -1;
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
// 0x0041aa80
extern "C" void FUN_0041aa80()
{
  FUN_004433b0();
  Undo_GeneralStart("make curve cone");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(1, 0, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041aad0
extern "C" void FUN_0041aad0()
{
  FUN_004433b0();
  Undo_GeneralStart("make curve cylinder");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 0, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void __fastcall FUN_0041ab20(CMainFrame *self)
{
  PFB(0x2e4) ^= 1;
  ::SendMessage(self->m_wndToolBar.m_hWnd, 0x402, 0x805a, MAKELONG(PFB(0x2e4) != 0, 0));
  dword_01233b64->SavePrefs();
  dword_0123348c |= 0xffffffff;
}
// 0x0041ab70
extern "C" void FUN_0041ab70()
{
  FUN_004433b0();
  Undo_GeneralStart("make bevel");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 1, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041abc0
extern "C" void FUN_0041abc0()
{
  FUN_004433b0();
  Undo_GeneralStart("make end cap");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 0, 1, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
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
// 0x0041ac80
extern "C" void FUN_0041ac80()
{
  FUN_004433b0();
  Undo_GeneralStart("insert colum");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 1, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041acd0
extern "C" void FUN_0041acd0()
{
  FUN_004433b0();
  Undo_GeneralStart("insert row");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041ad20
extern "C" void FUN_0041ad20()
{
  FUN_004433b0();
  Undo_GeneralStart("delete column");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(0, 1, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041ad70
extern "C" void FUN_0041ad70()
{
  FUN_004433b0();
  Undo_GeneralStart("delete row");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(0, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041adc0
extern "C" void FUN_0041adc0()
{
  FUN_004433b0();
  Undo_GeneralStart("add (2) columns");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 1, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041ae10
extern "C" void FUN_0041ae10()
{
  FUN_004433b0();
  Undo_GeneralStart("add (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041ae60
extern "C" void FUN_0041ae60()
{
  FUN_004433b0();
  Undo_GeneralStart("insert (2) columns");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 1, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041aeb0
extern "C" void FUN_0041aeb0()
{
  FUN_004433b0();
  Undo_GeneralStart("insert (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_0041af00() { FUN_00432bb0(); }
extern "C" void FUN_0041af10() { FUN_00432ca0(0); }
extern "C" void FUN_0041af20() { FUN_00432ca0(1); }
// 0x0041af30
extern "C" void FUN_0041af30()
{
  FUN_004433b0();
  Undo_GeneralStart("delete first (2) columns");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(0, 1, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041af80
extern "C" void FUN_0041af80()
{
  FUN_004433b0();
  Undo_GeneralStart("delete first (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(0, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041afd0
extern "C" void FUN_0041afd0()
{
  FUN_004433b0();
  Undo_GeneralStart("delete last (2) columns");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(0, 1, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041b020
extern "C" void FUN_0041b020()
{
  FUN_004433b0();
  Undo_GeneralStart("delete last (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(0, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041b070
void CMainFrame::FUN_0041b070()
{
  FUN_00433ad0();
  ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x8072, MAKELONG(DAT_012334ba != 0, 0));
  dword_0123348c = -1;
}

// 0x0041b0b0
void CMainFrame::FUN_0041b0b0()
{
  FUN_00434040();
  ::SendMessage(this->m_wndToolBar.m_hWnd, 0x402, 0x8068, MAKELONG(DAT_012334b9 != 0, 0));
  dword_0123348c = -1;
}

extern "C" void FUN_0041b0f0() {}

extern bool DAT_012334ba;
extern bool DAT_012334b9;
extern bool DAT_0112993e;
extern bool DAT_0112993f;
extern int DAT_011298b0;

// 0x0041b100: with a brush of a non-world entity selected, select the entity's next brush
void CMainFrame::FUN_0041b100()
{
  if (DAT_012334ba)
  {
    FUN_00433b90();
    return;
  }
  if (DAT_012334b9)
  {
    FUN_00434110();
    return;
  }
  brush_t *selected = selected_brushes.next;
  if (selected != &selected_brushes)
  {
    entityInst_t *ent = selected->owner;
    if (_stricmp(ent->def->eclass->name, "worldspawn"))
    {
      FUN_0046fbe0(true);
      brush_t *next = ent->brushes.ownerNext;
      while (next != &ent->brushes)
      {
        if (selected == next)
        {
          next = next->ownerNext;
          break;
        }
        next = next->ownerNext;
      }
      if (next == &ent->brushes)
        next = next->ownerNext;
      FUN_0046f0b0(next, false, true, false);
      dword_0123348c = -1;
    }
  }
}

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
extern "C" void FUN_0041b2c0()
{
  FUN_004433b0();
  Undo_GeneralStart("dense cylinder");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 0, 0, 0);
  FUN_004433b0();
  Undo_GeneralStart("add (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
  FUN_004433b0();
  Undo_GeneralStart("insert (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_0041b370()
{
  FUN_004433b0();
  Undo_GeneralStart("very dense cylinder");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 0, 0, 0);
  FUN_004433b0();
  Undo_GeneralStart("add (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
  FUN_004433b0();
  Undo_GeneralStart("insert (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
  FUN_004433b0();
  Undo_GeneralStart("add (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
  FUN_004433b0();
  Undo_GeneralStart("insert (2) rows");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00431360(1, 0, 0);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041b470
extern "C" void FUN_0041b470()
{
  FUN_004433b0();
  Undo_GeneralStart("curve cap");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428b80();
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041b4b0
extern "C" void FUN_0041b4b0() { FUN_004311a0(); dword_0123348c = -1; }

// 0x0041b4c0
extern "C" void FUN_0041b4c0() { FUN_00430ff0(); dword_0123348c = -1; }

// 0x0041b4d0
extern "C" void FUN_0041b4d0() { FUN_00435c00(); dword_0123348c = -1; }

// 0x0041b4e0
extern "C" void FUN_0041b4e0() { FUN_00434190(0, 0, DAT_01128dc4, DAT_01128dc4); dword_0123348c = -1; }

// 0x0041b500
extern "C" void FUN_0041b500()
{
  FUN_004433b0();
  Undo_GeneralStart("snap to grid");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_004354b0();
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041b540
extern "C" void FUN_0041b540()
{
  FUN_004433b0();
  Undo_GeneralStart("square cylinder");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 0, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041b590
void CMainFrame::FUN_0041b590(int id)
{
  CMenu *pMenu = this->GetMenu();
  if (pMenu)
  {
    ::CheckMenuItem(pMenu->m_hMenu, 0x8082, MF_UNCHECKED);
    ::CheckMenuItem(pMenu->m_hMenu, 0x8081, MF_UNCHECKED);
    ::CheckMenuItem(pMenu->m_hMenu, 0x8080, MF_UNCHECKED);
    ::CheckMenuItem(pMenu->m_hMenu, 0x807f, MF_UNCHECKED);
    ::CheckMenuItem(pMenu->m_hMenu, 0x807e, MF_UNCHECKED);
    ::CheckMenuItem(pMenu->m_hMenu, id, MF_CHECKED);
  }
  dword_01233b64->SavePrefs();
  FUN_00441f80(16, 16);
  DAT_01128da0 = 0;
  dword_0123348c |= 0x10;
}

// 0x0041b640
void CMainFrame::FUN_0041b640() { PF(0x2d0) = 10; FUN_0041b590(0x8082); }

// 0x0041b660
void CMainFrame::FUN_0041b660() { PF(0x2d0) = 100; FUN_0041b590(0x807f); }

// 0x0041b680
void CMainFrame::FUN_0041b680() { PF(0x2d0) = 200; FUN_0041b590(0x807e); }

// 0x0041b6a0
void CMainFrame::FUN_0041b6a0() { PF(0x2d0) = 25; FUN_0041b590(0x8081); }

// 0x0041b6c0
void CMainFrame::FUN_0041b6c0() { PF(0x2d0) = 50; FUN_0041b590(0x8080); }

extern "C" void FUN_0041b6e0() { FUN_00437e50(); }
// 0x0041b6f0
extern "C" void FUN_0041b6f0() { FUN_00438020(); }

extern "C" void FUN_0041b700() { FUN_00438120(); }
extern "C" void FUN_0041b710() { FUN_00438ff0(); }
// 0x0041b720
void CMainFrame::FUN_0041b720()
{
  FUN_004433b0();
  Undo_GeneralStart("curve thicken");
  Undo_AddBrushList(&selected_selbrushes);
  CDialogThick dlg;
  if (dlg.DoModal() == IDOK)
  {
    FUN_004348e0(dlg.m_nAmount, dlg.m_bSeams != 0);
    dword_0123348c = -1;
  }
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041b7f0
extern "C" void FUN_0041b7f0() { FUN_00434190(1, 1, DAT_01128dc4, DAT_01128dc4); dword_0123348c = -1; }

// 0x0041b810
extern "C" void FUN_0041b810() { FUN_004353d0(); dword_0123348c = -1; }

// 0x0041b930
void CMainFrame::FUN_0041b930() { FUN_004114f0(this, 160); }

// 0x0041b950
void CMainFrame::FUN_0041b950()
{
  PF(0x2cc) = 0x1000;
  FUN_0041b820(this);
  dword_01233b64->SavePrefs();
  dword_0123348c = -1;
}

// 0x0041b980
void CMainFrame::FUN_0041b980()
{
  PF(0x2cc) = 0x110;
  FUN_0041b820(this);
  dword_01233b64->SavePrefs();
  dword_0123348c = -1;
}

// 0x0041b9b0
void CMainFrame::FUN_0041b9b0()
{
  PF(0x2cc) = 0x101;
  FUN_0041b820(this);
  dword_01233b64->SavePrefs();
  dword_0123348c = -1;
}

// 0x0041b9e0
void CMainFrame::FUN_0041b9e0()
{
  PF(0x2cc) = 0x10010;
  FUN_0041b820(this);
  dword_01233b64->SavePrefs();
  dword_0123348c = -1;
}

// 0x0041ba10
void CMainFrame::FUN_0041ba10()
{
  PF(0x2cc) = 0x11010;
  FUN_0041b820(this);
  dword_01233b64->SavePrefs();
  dword_0123348c = -1;
}

// 0x0041ba40
void CMainFrame::FUN_0041ba40()
{
  PF(0x2cc) = 0x10001;
  FUN_0041b820(this);
  dword_01233b64->SavePrefs();
  dword_0123348c = -1;
}

extern "C" void FUN_0041ba70() { FUN_00441460(); }
extern "C" void FUN_0041ba80() { DoPatchInspector(); }
// 0x0041ba90
extern "C" void FUN_0041ba90()
{
  if (selected_selbrushes.next != &selected_selbrushes && selected_selbrushes.next->next == &selected_selbrushes)
    FUN_00473f50();
  else
    FUN_00473c70(0);
  dword_0123348c = -1;
}

// 0x0041bad0
extern "C" void FUN_0041bad0()
{
  if (selected_selbrushes.next != &selected_selbrushes && selected_selbrushes.next->next == &selected_selbrushes)
    FUN_00473f50();
  else
    FUN_00473c70(1);
  dword_0123348c = -1;
}

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
// 0x0041bbb0
extern "C" void FUN_0041bbb0()
{
  FUN_004433b0();
  Undo_GeneralStart("square bevel");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 1, 0, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

// 0x0041bc00
extern "C" void FUN_0041bc00()
{
  FUN_004433b0();
  Undo_GeneralStart("square endcap");
  Undo_AddBrushList(&selected_selbrushes);
  FUN_00428e20(0, 0, 1, 1);
  dword_0123348c = -1;
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_0041bc50()
{
  FUN_004433b0();
  Undo_GeneralStart("make sphere");
  Undo_AddBrushList(&selected_selbrushes);
  DAT_012334f5 = false;
  DAT_012334f6 = true;
  DialogBox(g_qeglobals.d_hInstance, (LPCSTR)113, g_qeglobals.d_hwndMain, FUN_004766d0);
  FUN_00443f80(&selected_selbrushes);
  Undo_End();
}

extern "C" void FUN_0041bcb0() { DAT_012334d8 ^= 1; dword_0123348c |= 2; }
// 0x0041bcc0
extern "C" void FUN_0041bcc0()
{
  for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    b->field_26 = 1;
  dword_0123348c = -1;
  FUN_0046fbe0(1);
}

extern "C" void FUN_0041bcf0()
{
  for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    b->field_26 = 1;
  dword_0123348c = -1;
}
extern "C" void FUN_0041bd20() { FUN_004745d0(); }
void Select_Invert();
extern "C" void FUN_0041bd30() { Select_Invert(); dword_0123348c |= 0xb; }
// 0x0041bd40
extern "C" void __fastcall FUN_0041bd40(CMainFrame *self)
{
  HWND window = g_qeglobals.field_4c;
  int style = self->field_07a0;
  if (style != 0 && style != 3)
  {
    if (DAT_011299a8 == 0x800 && style != 1)
    {
      if (::IsWindowVisible(window))
        ::ShowWindow(window, SW_HIDE);
      else
        ::ShowWindow(window, SW_SHOW);
      return;
    }
  }
  else if (::IsWindowVisible(window) && DAT_011299a8 == 0x800)
  {
    ::ShowWindow(window, SW_HIDE);
    return;
  }
  ::ShowWindow(window, SW_SHOW);
  FUN_00477580(0x800);
}

// 0x0041be80
void CMainFrame::FUN_0041be80()
{
  DAT_00597154->load("maps/test.camera");
  DAT_00597154->buildCamera();
}

// 0x0041bea0
extern "C" void FUN_0041bea0() { DAT_00597154->save("maps/test.camera"); }

// 0x0041bec0
extern "C" void FUN_0041bec0() { FUN_00409930(); dword_0123348c = -1; }

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

// 0x0041c0e0
extern "C" void FUN_0041c0e0()
{
  int previous = DAT_011298b0;
  DAT_011298b0 = 8;
  if (previous == 11)
    FUN_0041b190(g_pParentWnd);
  else if (previous == 10)
    FUN_0042beb0();
  DAT_011298b4 = FUN_0041e540(1, DAT_00597154);
  FUN_00409930();
  dword_0123348c = -1;
}

// 0x0041c130
extern "C" void FUN_0041c130()
{
  int previous = DAT_011298b0;
  DAT_011298b0 = 8;
  if (previous == 11)
    FUN_0041b190(g_pParentWnd);
  else if (previous == 10)
    FUN_0042beb0();
  DAT_011298b4 = FUN_0041e540(2, DAT_00597154);
  FUN_00409930();
  dword_0123348c = -1;
}

// 0x0041c180
extern "C" void FUN_0041c180()
{
  int previous = DAT_011298b0;
  DAT_011298b0 = 8;
  if (previous == 11)
    FUN_0041b190(g_pParentWnd);
  else if (previous == 10)
    FUN_0042beb0();
  DAT_011298b4 = FUN_0041e540(0, DAT_00597154);
  FUN_00409930();
  dword_0123348c = -1;
}

// 0x0041c1d0
void CMainFrame::FUN_0041c1d0()
{
  HWND window = g_qeglobals.field_4c;
  int style = this->field_07a0;
  if (style != 0 && style != 1 && style != 3)
  {
    if (DAT_011299a8 == 0x2000)
    {
      if (::IsWindowVisible(window))
        ::ShowWindow(window, SW_HIDE);
      else
        ::ShowWindow(window, SW_SHOW);
      return;
    }
  }
  else if (::IsWindowVisible(window) && DAT_011299a8 == 0x2000)
  {
    ::ShowWindow(window, SW_HIDE);
    return;
  }
  ::ShowWindow(window, SW_SHOW);
  FUN_00477580(0x2000);
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
// 0x0041c270: the wheel scrolls the texture pane, dollies the camera or zooms the XY view
BOOL CMainFrame::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
  BOOL overTex = FALSE;
  BOOL overCam = FALSE;
  CRect r;
  CPoint cur;

  if (zDelta == 0)
    return TRUE;
  if (field_0790)
  {
    if (PF(0x1b4) != 1 || (DAT_011299a8 == 0x10 && field_0790 == CWnd::FromHandle(::WindowFromPoint(pt))))
    {
      ::GetClientRect(field_0790->m_hWnd, &r);
      field_0790->ClientToScreen(&r);
      ::GetCursorPos(&cur);
      if (cur.x >= r.left && cur.x <= r.right && cur.y >= r.top && cur.y <= r.bottom)
        overTex = TRUE;
    }
  }
  if (field_078c && PF(0x2e8))
  {
    if (PF(0x1b4) != 1 || field_078c == CWnd::FromHandle(::WindowFromPoint(pt)))
    {
      ::GetClientRect(field_078c->m_hWnd, &r);
      field_078c->ClientToScreen(&r);
      ::GetCursorPos(&pt);
      if (pt.x >= r.left && pt.x <= r.right && pt.y >= r.top && pt.y <= r.bottom)
        overCam = TRUE;
    }
  }
  if (overTex)
  {
    int step = (r.bottom - r.top) / 2;
    if (zDelta < 0)
      step = -step;
    FUN_00442140(DAT_01128da0 - step);
    return TRUE;
  }
  if (field_078c && overCam)
  {
    if (zDelta > 0)
      FUN_004157f0(-1.0f);
    else
      FUN_004157f0(1.0f);
    return TRUE;
  }
  if (zDelta > 0)
    FUN_004156a0();
  else
    FUN_00415750();
  return TRUE;
}

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

// 0x0041d5a0
extern "C" void FUN_0041d5a0()
{
  if (FUN_0046b550())
  {
    if (DAT_010a4908 && ::MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
      return;
    FUN_0046b5b0();
  }
}

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
extern "C" int FUN_0041eee0() { return 2; }
extern "C" float __fastcall FUN_0041f200(const float *value) { return value[24]; }
extern "C" unsigned char __fastcall FUN_0041f210(const unsigned char *value) { return value[80]; }
extern "C" int __fastcall FUN_0041f240(const int *value) { return value[3] - value[1]; }
