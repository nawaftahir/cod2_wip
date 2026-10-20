
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __thiscall FUN_0041fa90(CWnd *param_1,int param_2,int param_3)

{
  CWnd *pCVar1;
  int iVar2;
  LPCWSTR unaff_ESI;
  HWND__ local_28 [8];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  pCVar1 = CWnd::GetDlgItem(param_1,param_2);
  if ((pCVar1 == (CWnd *)0x0) && (DAT_0124a121 == '\0')) {
    iVar2 = FUN_0047d980(&DAT_005453e4,".\\MapInfo.cpp",0x95,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a121 = '\x01';
    }
  }
  __itoa(param_3,(char *)local_28,10);
  FID_conflict_SetWindowTextW(local_28,unaff_ESI);
  return;
}

