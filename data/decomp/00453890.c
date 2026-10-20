
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_00453890(int param_1)

{
  char cVar1;
  HDC pHVar2;
  tagPAINTSTRUCT local_48;
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (DAT_0059c440 != (code *)0x0) {
    cVar1 = (*DAT_0059c440)(DAT_010bcd6c);
    if (cVar1 != '\0') {
      pHVar2 = BeginPaint(*(HWND *)(param_1 + 0x1c),&local_48);
      CDC::FromHandle(pHVar2);
      (*DAT_0059c3ac)();
      (*DAT_0059c3c4)(7,&DAT_01129718,0x3f800000,0);
      FUN_0047ba90();
      (*DAT_0059c3b0)();
      (*DAT_0059c444)(DAT_010bcd6c);
      if (DAT_01233514 != 0) {
        DAT_01147dd4 = DAT_01147dd0;
      }
      EndPaint(*(HWND *)(param_1 + 0x1c),&local_48);
    }
  }
  return;
}

