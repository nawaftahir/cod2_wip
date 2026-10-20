
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_00423ae0(CWnd *param_1)

{
  CWnd *pCVar1;
  CWnd *pCVar2;
  LRESULT LVar3;
  WPARAM WVar4;
  undefined1 local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  pCVar1 = CWnd::GetDlgItem(param_1,0x61e);
  pCVar2 = CWnd::GetDlgItem(param_1,0x61c);
  LVar3 = SendMessageA(*(HWND *)(pCVar2 + 0x1c),0x188,0,0);
  if (LVar3 != -1) {
    WVar4 = SendMessageA(*(HWND *)(pCVar2 + 0x1c),0x188,0,0);
    SendMessageA(*(HWND *)(pCVar2 + 0x1c),0x189,WVar4,(LPARAM)local_108);
    LVar3 = SendMessageA(*(HWND *)(pCVar1 + 0x1c),0x1a2,0xffffffff,(LPARAM)local_108);
    if (LVar3 == -1) {
      WVar4 = SendMessageA(*(HWND *)(pCVar1 + 0x1c),0x180,0,(LPARAM)local_108);
      if (-1 < (int)WVar4) {
        SendMessageA(*(HWND *)(pCVar1 + 0x1c),0x186,WVar4,0);
      }
    }
  }
  return;
}

