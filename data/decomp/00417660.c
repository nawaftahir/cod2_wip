
void __fastcall FUN_00417660(CFrameWnd *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  HMENU pHVar4;
  CMenu *pCVar5;
  
  iVar1 = DAT_01233b64[0x6d];
  iVar2 = DAT_01233b64[0x89];
  FUN_00439ee0();
  iVar3 = (**(code **)(*DAT_01233b64 + 0x140))();
  if (iVar3 == 1) {
    if (DAT_01233b64[0x6d] != iVar1) {
      FUN_004fbd01("You need to restart CoD2Radiant for the view changes to take place.",0,0);
    }
    if (*(int *)(param_1 + 0x790) != 0) {
      FUN_00442e60();
    }
    if (iVar2 != DAT_01233b64[0x89]) {
      CFrameWnd::ShowControlBar(param_1,(CControlBar *)(param_1 + 0x2b8),(uint)(iVar2 != 0),1);
      InvalidateRect(*(HWND *)(param_1 + 0x2d4),(RECT *)0x0,1);
    }
    pHVar4 = GetMenu(*(HWND *)(param_1 + 0x1c));
    pCVar5 = CMenu::FromHandle(pHVar4);
    if (pCVar5 != (CMenu *)0x0) {
      CheckMenuItem(*(HMENU *)(pCVar5 + 4),0x8019,(DAT_01233b64[0x92] != 0) - 1 & 8);
    }
    FUN_00435840();
    DAT_0123348c = 0xffffffff;
  }
  return;
}

