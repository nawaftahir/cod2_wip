
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_00478090(void)

{
  LRESULT LVar1;
  undefined1 local_1008 [4096];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  LVar1 = SendMessageA(DAT_011299e8,0x188,0,0);
  if ((-1 < LVar1) && (DAT_011299a8 == 0x80)) {
    SendMessageA(DAT_01129a1c,0xd,0x1000,(LPARAM)local_1008);
    FUN_00402a70(local_1008);
    SendMessageA(DAT_01129a24,0xd,0x1000,(LPARAM)local_1008);
    FUN_00402a70(local_1008);
    return 1;
  }
  return 0;
}

