// 10085e08 size=186 FUN_10085e08

int FUN_10085e08(int param_1)

{
  undefined4 *puVar1;
  int in_ECX;
  uint uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  int local_8;
  
  local_8 = *(int *)(in_ECX + 0x1c);
  if (*(int *)(in_ECX + 4) == local_8) {
    if (local_8 == 0) {
      local_8 = 0x10;
    }
    else {
      local_8 = local_8 * 2;
    }
    puVar1 = operator_new(local_8 << 2);
    if (puVar1 == (undefined4 *)0x0) {
      if (param_1 != 0) {
        FUN_10085de7(1);
      }
      return -1;
    }
    puVar4 = *(undefined4 **)(in_ECX + 0x10);
    puVar5 = puVar1;
    for (uVar2 = *(uint *)(in_ECX + 4) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    puVar4 = puVar1 + *(int *)(in_ECX + 4);
    for (uVar2 = local_8 - *(int *)(in_ECX + 4) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar4 = 0;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
    }
    _free(*(void **)(in_ECX + 0x10));
    *(int *)(in_ECX + 0x1c) = local_8;
    *(undefined4 **)(in_ECX + 0x10) = puVar1;
  }
  *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 4) * 4) = param_1;
  iVar3 = *(int *)(in_ECX + 4);
  *(int *)(in_ECX + 4) = iVar3 + 1;
  return iVar3;
}


