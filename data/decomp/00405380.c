
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00405380(int param_1)

{
  undefined4 *puVar1;
  int iVar2;
  
  FUN_004978a0();
  FUN_00497950();
  FUN_00497950();
  puVar1 = (undefined4 *)(param_1 + 0x150);
  iVar2 = 2;
  do {
    if ((float)puVar1[-6] <= _DAT_00556a70) {
      *puVar1 = 0;
    }
    else {
      *puVar1 = 3;
    }
    if ((float)puVar1[-5] <= _DAT_00556a70) {
      puVar1[1] = 1;
    }
    else {
      puVar1[1] = 4;
    }
    if ((float)puVar1[-4] <= _DAT_00556a70) {
      puVar1[2] = 2;
    }
    else {
      puVar1[2] = 5;
    }
    puVar1 = puVar1 + 3;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  return;
}

