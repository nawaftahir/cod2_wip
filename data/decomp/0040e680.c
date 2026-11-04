
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __thiscall FUN_0040e680(CWnd *param_1,uint param_2,long param_3)

{
  CWnd *pCVar1;
  CWnd *pCVar2;
  WPARAM wParam;
  LPCWSTR unaff_ESI;
  HWND__ local_108 [64];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if ((param_2 >> 0x10 == 1) && ((short)param_2 == 0x511)) {
    pCVar1 = CWnd::GetDlgItem(param_1,0x511);
    pCVar2 = CWnd::GetDlgItem(param_1,0x470);
    if ((pCVar1 != (CWnd *)0x0) && (pCVar2 != (CWnd *)0x0)) {
      wParam = SendMessageA(*(HWND *)(pCVar1 + 0x1c),0x188,0,0);
      SendMessageA(*(HWND *)(pCVar1 + 0x1c),0x189,wParam,(LPARAM)local_108);
      FID_conflict_SetWindowTextW(local_108,unaff_ESI);
      SendMessageA(*(HWND *)(pCVar2 + 0x1c),0xb1,0,-1);
      SendMessageA(*(HWND *)(pCVar2 + 0x1c),0xb7,0,0);
    }
  }
  CWnd::OnCommand(param_1,param_2,param_3);
  return;
}

