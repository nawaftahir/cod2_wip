
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_004aa8c0(undefined4 param_1,undefined4 *param_2)

{
  undefined4 *puVar1;
  int iVar2;
  
  *(undefined1 *)((int)param_2 + 0x8d) = 1;
  _DAT_0123338c = &DAT_01233388;
  _DAT_01233398 = &DAT_0123338c;
  _DAT_0123339c = 0;
  _DAT_012333a0 = 0;
  _DAT_01233394 = 1;
  _DAT_01233396 = 1;
  _DAT_012333a4 = &DAT_01233434;
  DAT_01233434 = 0;
  _DAT_01233388 = 0;
  *param_2 = &DAT_01233394;
  puVar1 = param_2 + 2;
  iVar2 = 4;
  do {
    puVar1[3] = 0;
    *puVar1 = &DAT_0053d753;
    puVar1[-1] = 0;
    *(undefined2 *)(puVar1 + 1) = 1;
    puVar1[2] = &DAT_01233436;
    puVar1 = puVar1 + 5;
    iVar2 = iVar2 + -1;
    _DAT_01233436 = 0;
  } while (iVar2 != 0);
  _DAT_012333f8 = 0;
  *(undefined2 *)(param_2 + 0x1f) = 1;
  param_2[5] = &DAT_012333f8;
  *(undefined2 *)((int)param_2 + 0x7e) = 0;
  param_2[0x22] = "DEFAULT";
  _DAT_0123340c = 0xc1800000;
  _DAT_01233410 = 0xc1800000;
  _DAT_01233414 = 0xc1800000;
  _DAT_01233418 = 0x41800000;
  _DAT_0123341c = 0x41800000;
  _DAT_01233420 = 0x41800000;
  param_2[0x18] = &DAT_0123340c;
  return;
}

