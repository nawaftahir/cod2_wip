
undefined4 * FUN_00458dc0(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int local_c;
  int local_8;
  
  if (*(int *)(param_1 + 0x44) == 0) {
    puVar2 = (undefined4 *)FUN_004ff450(0x48);
    puVar5 = puVar2;
    for (iVar1 = 0x12; iVar1 != 0; iVar1 = iVar1 + -1) {
      *puVar5 = 0;
      puVar5 = puVar5 + 1;
    }
    puVar2[2] = *(undefined4 *)(param_1 + 8);
    puVar2[0xe] = *(undefined4 *)(param_1 + 0x38);
    uVar3 = FUN_00454630();
    puVar2[0xf] = uVar3;
    local_c = 0;
    if (0 < (int)puVar2[0xe]) {
      local_8 = 0;
      do {
        puVar4 = (undefined4 *)(puVar2[0xf] + local_8);
        puVar5 = (undefined4 *)(*(int *)(param_1 + 0x3c) + local_8);
        puVar6 = puVar5 + 9;
        puVar7 = puVar4 + 9;
        for (iVar1 = 0xe; iVar1 != 0; iVar1 = iVar1 + -1) {
          *puVar7 = *puVar6;
          puVar6 = puVar6 + 1;
          puVar7 = puVar7 + 1;
        }
        puVar6 = puVar5 + 0x17;
        puVar7 = puVar4 + 0x17;
        for (iVar1 = 7; iVar1 != 0; iVar1 = iVar1 + -1) {
          *puVar7 = *puVar6;
          puVar6 = puVar6 + 1;
          puVar7 = puVar7 + 1;
        }
        puVar4[0x29] = puVar5[0x29];
        puVar4[0x1e] = puVar5[0x1e];
        puVar4[0x1f] = puVar5[0x1f];
        for (iVar1 = 9; iVar1 != 0; iVar1 = iVar1 + -1) {
          *puVar4 = *puVar5;
          puVar5 = puVar5 + 1;
          puVar4 = puVar4 + 1;
        }
        local_c = local_c + 1;
        local_8 = local_8 + 0xa8;
      } while (local_c < (int)puVar2[0xe]);
    }
    return puVar2;
  }
  iVar1 = FUN_00434880(*(int *)(param_1 + 0x44));
  FUN_00467240();
  return *(undefined4 **)(iVar1 + 0x3828);
}

