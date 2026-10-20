
undefined4 * FUN_00458eb0(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  int local_8;
  
  if (*(int *)(param_1 + 0x44) != 0) {
    iVar1 = FUN_00434880(*(int *)(param_1 + 0x44));
    FUN_00467240();
    puVar4 = *(undefined4 **)(iVar1 + 0x3828);
    puVar4[2] = *(undefined4 *)(param_1 + 8);
    FUN_0045a220(1);
    if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
      FUN_00475350();
    }
    FUN_0047a3c0();
    *(short *)((int)puVar4 + 0x42) = *(short *)((int)puVar4 + 0x42) + 1;
    return puVar4;
  }
  puVar2 = (undefined4 *)FUN_004ff450(0x48);
  puVar4 = puVar2;
  for (iVar1 = 0x12; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  puVar2[2] = *(undefined4 *)(param_1 + 8);
  puVar2[8] = *(undefined4 *)(param_1 + 0x20);
  puVar2[9] = *(undefined4 *)(param_1 + 0x24);
  puVar2[10] = *(undefined4 *)(param_1 + 0x28);
  puVar2[0xb] = *(undefined4 *)(param_1 + 0x2c);
  puVar2[0xc] = *(undefined4 *)(param_1 + 0x30);
  puVar2[0xd] = *(undefined4 *)(param_1 + 0x34);
  puVar2[0xe] = *(undefined4 *)(param_1 + 0x38);
  uVar3 = FUN_00454630();
  puVar2[0xf] = uVar3;
  local_8 = 0;
  if (0 < (int)puVar2[0xe]) {
    do {
      FUN_004549b0();
      local_8 = local_8 + 1;
    } while (local_8 < (int)puVar2[0xe]);
  }
  return puVar2;
}

