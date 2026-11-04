// 100c127a size=243 FUN_100c127a

undefined4 FUN_100c127a(void)

{
  int iVar1;
  uint uVar2;
  int in_ECX;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  uint local_10;
  int *local_c;
  int *local_8;
  
  uVar2 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_10 = 0;
  if (uVar2 != 0) {
    local_8 = *(int **)(*(int *)(in_ECX + 0x100) + 8);
    local_c = local_8 + uVar2;
    do {
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *local_8 * 4);
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *local_c * 4);
      if ((((*(int *)(iVar3 + 4) != *(int *)(iVar1 + 4)) ||
           (*(int *)(iVar3 + 8) != *(int *)(iVar1 + 8))) ||
          (*(int *)(iVar3 + 0xc) != *(int *)(iVar1 + 0xc))) ||
         ((*(int *)(iVar3 + 0x10) != *(int *)(iVar1 + 0x10) ||
          ((*(uint *)(iVar1 + 0x3c) ^ *(uint *)(iVar3 + 0x3c)) != 0x80000)))) {
        return 1;
      }
      local_10 = local_10 + 1;
      local_8 = local_8 + 1;
      local_c = local_c + 1;
    } while (local_10 < uVar2);
  }
  **(uint **)(in_ECX + 0x100) = uVar2 | 0x70000000;
  *(uint *)(*(int *)(in_ECX + 0x100) + 4) = uVar2;
  if ((uVar2 != 0) &&
     ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(*(int *)(in_ECX + 0x100) + 8) * 4) +
                0x3e) & 8) != 0)) {
    puVar5 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
    puVar4 = puVar5 + uVar2;
    for (; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
  }
  return 0;
}


