
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_00442f70(int param_1)

{
  int iVar1;
  char cVar2;
  HDC pHVar3;
  tagPAINTSTRUCT local_48;
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (DAT_0059c440 != (code *)0x0) {
    cVar2 = (*DAT_0059c440)(DAT_010bcd64);
    if (cVar2 != '\0') {
      pHVar3 = BeginPaint(*(HWND *)(param_1 + 0x1c),&local_48);
      CDC::FromHandle(pHVar3);
      iVar1 = DAT_01128da4;
      (*DAT_0059c3ac)();
      (*DAT_0059c3c4)(7,&DAT_01129708,0x3f800000,0);
      FUN_00442300();
      (*DAT_0059c3b0)();
      (*DAT_0059c444)(DAT_010bcd64);
      if (DAT_01233514 != 0) {
        DAT_01147dd4 = DAT_01147dd0;
      }
      if ((*(int *)(DAT_01233b64 + 0x260) != 0) &&
         ((*(char *)(param_1 + 0xfc) != '\0' || (DAT_01128da4 != iVar1)))) {
        FUN_004421a0();
        *(undefined1 *)(param_1 + 0xfc) = 0;
      }
      EndPaint(*(HWND *)(param_1 + 0x1c),&local_48);
    }
  }
  return;
}

