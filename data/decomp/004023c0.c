
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

float10 __fastcall FUN_004023c0(CWnd *param_1)

{
  CWnd *this;
  double dVar1;
  char *pcVar2;
  int iVar3;
  char local_108 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar3 = 0x100;
  pcVar2 = local_108;
  this = CWnd::GetDlgItem(param_1,0x5bb);
  CWnd::GetWindowTextA(this,pcVar2,iVar3);
  dVar1 = _atof(local_108);
  return (float10)(float)dVar1;
}

