// Filter dialog code; names and signatures provisional (FUN_ = unconfirmed). Handlers sit in retail address order.
#include "stdafx.h"
#include "../universal/assertive.h"

struct qeglobals_t { unsigned char pad0[0x6cb74]; int d_exclude; unsigned d_exclude2; };
extern qeglobals_t g_qeglobals;

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

extern "C" void FUN_0040e4e0() {}
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

