// 10083aeb size=324 FUN_10083aeb

int FUN_10083aeb(void)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int local_8;
  
  iVar1 = FUN_1006506e(0x40);
  if (iVar1 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_1008300b();
  }
  if (local_8 != 0) {
    *(undefined4 *)(local_8 + 0x10) = *(undefined4 *)(in_ECX + 0x10);
    *(undefined4 *)(local_8 + 0x14) = *(undefined4 *)(in_ECX + 0x14);
    *(undefined4 *)(local_8 + 0x18) = *(undefined4 *)(in_ECX + 0x18);
    *(undefined4 *)(local_8 + 0x1c) = *(undefined4 *)(in_ECX + 0x1c);
    *(undefined4 *)(local_8 + 0x34) = *(undefined4 *)(in_ECX + 0x34);
    if (*(int *)(in_ECX + 0x20) != 0) {
      iVar1 = (**(code **)(**(int **)(in_ECX + 0x20) + 4))();
      *(int *)(local_8 + 0x20) = iVar1;
      if (iVar1 == 0) {
        return 0;
      }
    }
    if (*(int *)(in_ECX + 0x24) != 0) {
      iVar1 = (**(code **)(**(int **)(in_ECX + 0x24) + 4))();
      *(int *)(local_8 + 0x24) = iVar1;
      if (iVar1 == 0) {
        return 0;
      }
    }
    if (*(int *)(in_ECX + 0x28) != 0) {
      iVar1 = (**(code **)(**(int **)(in_ECX + 0x28) + 4))();
      *(int *)(local_8 + 0x28) = iVar1;
      if (iVar1 == 0) {
        return 0;
      }
    }
    if (*(int *)(in_ECX + 0x2c) != 0) {
      iVar1 = (**(code **)(**(int **)(in_ECX + 0x2c) + 4))();
      *(int *)(local_8 + 0x2c) = iVar1;
      if (iVar1 == 0) {
        return 0;
      }
    }
    if (*(int *)(in_ECX + 0x30) != 0) {
      iVar1 = (**(code **)(**(int **)(in_ECX + 0x30) + 4))();
      *(int *)(local_8 + 0x30) = iVar1;
      if (iVar1 == 0) {
        return 0;
      }
    }
    if (*(int *)(in_ECX + 0x34) == 0) {
      return local_8;
    }
    iVar1 = FUN_100826bd(*(int *)(in_ECX + 0x34) << 2,0x10);
    *(int *)(local_8 + 0x38) = iVar1;
    if (iVar1 != 0) {
      iVar1 = FUN_100826bd(*(int *)(in_ECX + 0x14) << 2,0x10);
      *(int *)(local_8 + 0x3c) = iVar1;
      if (iVar1 != 0) {
        puVar3 = *(undefined4 **)(in_ECX + 0x38);
        puVar4 = *(undefined4 **)(local_8 + 0x38);
        for (uVar2 = *(uint *)(in_ECX + 0x34) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
          *puVar4 = *puVar3;
          puVar3 = puVar3 + 1;
          puVar4 = puVar4 + 1;
        }
        for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
          *(undefined1 *)puVar4 = *(undefined1 *)puVar3;
          puVar3 = (undefined4 *)((int)puVar3 + 1);
          puVar4 = (undefined4 *)((int)puVar4 + 1);
        }
        puVar3 = *(undefined4 **)(in_ECX + 0x3c);
        puVar4 = *(undefined4 **)(local_8 + 0x3c);
        for (uVar2 = *(uint *)(in_ECX + 0x14) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
          *puVar4 = *puVar3;
          puVar3 = puVar3 + 1;
          puVar4 = puVar4 + 1;
        }
        for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
          *(undefined1 *)puVar4 = *(undefined1 *)puVar3;
          puVar3 = (undefined4 *)((int)puVar3 + 1);
          puVar4 = (undefined4 *)((int)puVar4 + 1);
        }
        return local_8;
      }
    }
  }
  return 0;
}


