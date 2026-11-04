// 100c136d size=210 FUN_100c136d

undefined4 FUN_100c136d(void)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  int *local_10;
  int *local_c;
  uint local_8;
  
  uVar5 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_8 = 0;
  if (uVar5 != 0) {
    uVar1 = (*(uint **)(in_ECX + 0x100))[2];
    local_10 = (int *)(uVar1 + uVar5 * 4);
    local_c = (int *)(uVar1 + uVar5 * 8);
    do {
      iVar2 = *(int *)(uVar1 + local_8 * 4);
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
      iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *local_c * 4);
      if ((iVar2 != *local_10) ||
         (((iVar2 = *(int *)(iVar4 + 0x38),
           iVar2 != *(int *)(local_8 * 4 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) &&
           ((iVar2 == -1 || (iVar2 != *(int *)(iVar3 + 0x38))))) ||
          ((*(uint *)(iVar4 + 0x3c) ^ 0x80000) != *(uint *)(iVar3 + 0x3c))))) {
        return 1;
      }
      local_8 = local_8 + 1;
      local_c = local_c + 1;
      local_10 = local_10 + 1;
    } while (local_8 < uVar5);
  }
  **(uint **)(in_ECX + 0x100) = uVar5 | 0x70000000;
  *(uint *)(*(int *)(in_ECX + 0x100) + 4) = uVar5;
  return 0;
}


