// 10001690 size=168 R_LoadWorld

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_LoadWorld(undefined4 param_1,undefined4 *param_2)

{
  FUN_100376c0(param_1);
  DAT_101d1b9c = FUN_10004890(param_1);
  if (param_2 != (undefined4 *)0x0) {
    *param_2 = *(undefined4 *)(DAT_101d1b9c + 0x154);
  }
  FUN_10001490();
  FUN_100013d0();
  FUN_10029120();
  _DAT_10696bd0 = 0x41200000;
  DAT_10696bd4 = 0xffffffff;
  DAT_101d49b8 = (*(code *)RI_Hunk_AllocInternal)(0xc0000);
  FUN_100015b0();
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    DAT_101d1ba0 = FUN_1000d200(1);
  }
  return;
}


