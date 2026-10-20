
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00477e80(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined1 local_2008 [4096];
  undefined1 local_1008 [4096];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (DAT_011299a0 != 0) {
    SendMessageA(DAT_01129a1c,0xd,0xfff,(LPARAM)local_2008);
    SendMessageA(DAT_01129a24,0xd,0xfff,(LPARAM)local_1008);
    FUN_004433b0();
    FUN_00443a90();
    if (DAT_011299a4 == 0) {
      FUN_004440c0();
      FUN_00465bf0(DAT_011299a0,local_2008,local_1008);
    }
    else {
      puVar2 = DAT_010a44b8;
      if (DAT_010a44b8 != &DAT_010a44b4) {
        do {
          FUN_004440c0();
          FUN_00465bf0(*(undefined4 *)(puVar2[2] + 8),local_2008,local_1008);
          puVar1 = puVar2 + 1;
          puVar2 = (undefined4 *)*puVar1;
        } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
      }
    }
    FUN_004777c0();
    FUN_00444150();
  }
  return;
}

