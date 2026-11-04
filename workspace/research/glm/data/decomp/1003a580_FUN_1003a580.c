// 1003a580 size=112 FUN_1003a580

void FUN_1003a580(undefined4 param_1,undefined4 param_2)

{
  undefined *puVar1;
  
  if (DAT_1072debc != '\0') {
    FUN_1003e9b0();
  }
  if ((5 < DAT_1072d9c0) && (DAT_1072d9c0 < 0x12)) {
    FUN_1003a340();
  }
  if ((2 < DAT_1072d9c0) && (DAT_1072d9c0 < 0x1b)) {
    FUN_10034910();
  }
  puVar1 = (undefined *)0x0;
  if (((*(int *)(DAT_101ce708 + 8) == 2) && (8 < DAT_1072d9c0)) && (DAT_1072d9c0 < 0xf)) {
    puVar1 = &DAT_10190690;
  }
  FUN_1003a000(param_1,param_2,puVar1);
  return;
}


