// 1002a570 size=335 FUN_1002a570

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002a570(int param_1,undefined4 param_2,undefined4 *param_3)

{
  float fVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int in_EDX;
  undefined4 *puVar5;
  int local_24;
  int local_20;
  
  iVar3 = *(int *)(in_EDX + 0xf4) + -1;
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    iVar4 = (iVar3 % DAT_10696cd0) * 2;
    iVar3 = (iVar3 / DAT_10696cd0) * 2;
    local_20 = 0;
    do {
      if (iVar3 < iVar3 + 2) {
        iVar2 = iVar4;
        local_24 = iVar3;
        do {
          for (; iVar2 < iVar4 + 2; iVar2 = iVar2 + 1) {
            FUN_10029780();
          }
          local_24 = local_24 + 1;
          iVar2 = iVar4;
        } while (local_24 < iVar3 + 2);
      }
      local_20 = local_20 + 1;
    } while (local_20 < 2);
    *(float *)(param_1 + 0x54) = ((float)iVar4 + 1.0) * _DAT_10696cd8;
    fVar1 = ((float)iVar3 + 1.0) * _DAT_10696cdc;
    *(undefined4 *)(param_1 + 0x5c) = 0x3f000000;
    *(float *)(param_1 + 0x58) = fVar1;
    return;
  }
  puVar5 = (undefined4 *)(*(int *)(in_EDX + 300) + iVar3 * 0x60);
  for (iVar4 = 0x18; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar5 = *param_3;
    param_3 = param_3 + 1;
    puVar5 = puVar5 + 1;
  }
  *(undefined4 *)(*(int *)(in_EDX + 0x130) + iVar3 * 4) = param_2;
  return;
}


