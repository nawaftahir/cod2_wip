
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00408820(char *param_1)

{
  ATOM AVar1;
  char local_1008 [4096];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  _vsprintf(local_1008,param_1,&stack0x00000008);
  _printf(local_1008);
  if (DAT_01233480 == 0) {
    DAT_01233480 = 1;
    DAT_0123347c = FindWindowA((LPCSTR)0x0,"CoD2Map Process Server");
    if (DAT_0123347c == (HWND)0x0) {
      return;
    }
    DAT_0058fbe8 = RegisterWindowMessageA("Q3MPS_BroadcastCommand");
  }
  if (DAT_0123347c != (HWND)0x0) {
    AVar1 = GlobalAddAtomA(local_1008);
    PostMessageA(DAT_0123347c,DAT_0058fbe8,0,(uint)AVar1);
  }
  return;
}

