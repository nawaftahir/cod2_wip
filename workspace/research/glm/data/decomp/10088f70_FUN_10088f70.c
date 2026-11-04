// 10088f70 size=229 FUN_10088f70

undefined4 FUN_10088f70(uint *param_1)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  uint local_14;
  uint local_c;
  int local_8;
  
  if ((*param_1 & 0xfff00000) != 0) {
    uVar2 = *param_1 & 0xfffff;
    local_14 = param_1[1] / uVar2;
    if (local_14 != 0) {
      local_8 = 0;
      do {
        iVar4 = local_8;
        local_c = uVar2;
        if (uVar2 != 0) {
          do {
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar4 + param_1[2]) * 4);
            if ((*(int *)(iVar3 + 0x48) != -1) && (*(int *)(iVar3 + 8) == -1)) {
              iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + *(int *)(iVar3 + 0x48) * 4);
              *(uint *)(iVar3 + 0x40) =
                   *(uint *)(iVar3 + 0x40) | 1 << ((byte)*(undefined4 *)(iVar1 + 0x24) & 0x1f);
              *(undefined4 *)(iVar1 + 0x28) = 1;
            }
            local_c = local_c - 1;
            iVar3 = local_8;
            uVar5 = uVar2;
            iVar4 = iVar4 + 4;
          } while (local_c != 0);
          do {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar3 + param_1[2]) * 4);
            iVar1 = *(int *)(iVar4 + 0x48);
            if (((iVar1 != -1) && (*(int *)(iVar4 + 8) == -1)) &&
               (iVar4 = *(int *)(*(int *)(in_ECX + 0x18) + iVar1 * 4), *(int *)(iVar4 + 0x28) != 0))
            {
              *(undefined4 *)(iVar4 + 0x28) = 0;
              *(uint *)(iVar4 + 0x24) = *(int *)(iVar4 + 0x24) + 1U & 0x1f;
            }
            uVar5 = uVar5 - 1;
            iVar3 = iVar3 + 4;
          } while (uVar5 != 0);
        }
        local_8 = local_8 + uVar2 * 4;
        local_14 = local_14 - 1;
      } while (local_14 != 0);
    }
  }
  return 0;
}


