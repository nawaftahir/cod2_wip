
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047a5b0(char *param_1)

{
  LPARAM lParam;
  LRESULT LVar1;
  LPARAM local_8018;
  WPARAM local_8014;
  char local_8010 [32768];
  undefined1 local_10 [8];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  _vsprintf(local_8010,param_1,&stack0x00000008);
  lParam = FUN_0047a4f0();
  LVar1 = SendMessageA(DAT_010bcd5c,0xba,0,0);
  if (600 < LVar1) {
    local_10[0] = 0;
    SendMessageA(DAT_010bcd5c,0xb,0,0);
    SendMessageA(DAT_010bcd5c,0xb0,(WPARAM)&local_8014,(LPARAM)&local_8018);
    SendMessageA(DAT_010bcd5c,0xb1,0,500);
    SendMessageA(DAT_010bcd5c,0xc2,0,(LPARAM)local_10);
    SendMessageA(DAT_010bcd5c,0xb1,local_8014,local_8018);
    SendMessageA(DAT_010bcd5c,0xb,1,0);
  }
  SendMessageA(DAT_010bcd5c,0xc2,0,lParam);
  return;
}

