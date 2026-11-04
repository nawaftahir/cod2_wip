// 100a7509 size=300 FUN_100a7509

undefined4 FUN_100a7509(void)

{
  byte *pbVar1;
  int *piVar2;
  uint *puVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  int in_ECX;
  uint uVar7;
  uint local_c;
  uint local_8;
  
  if (((**(uint **)(in_ECX + 0x100) & 0xfff00000) == 0x10000000) &&
     ((*(uint *)(in_ECX + 200) & 0xffff) < 0x104)) {
    puVar3 = *(uint **)(in_ECX + 0x100);
    uVar4 = *puVar3;
    iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[2] * 4);
    iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[4] * 4);
    if ((*(int *)(iVar6 + 0x3c) == 0) &&
       ((((*(byte *)(iVar5 + 0x3d) & 2) != 0 && (*(char *)(iVar6 + 0x6c) == '\x03')) &&
        (*(int *)(iVar5 + 4) == *(int *)(in_ECX + 0x88))))) {
      local_c = 0;
      if ((uVar4 & 0xfffff) != 0) {
        do {
          iVar6 = local_c * 4;
          pbVar1 = (byte *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(iVar6 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) * 4) +
                           0x3d);
          *pbVar1 = *pbVar1 | 2;
          for (uVar7 = *(uint *)(in_ECX + 0xfc); uVar7 < *(uint *)(in_ECX + 0xc); uVar7 = uVar7 + 1)
          {
            iVar5 = *(int *)(*(int *)(in_ECX + 0x18) + uVar7 * 4);
            local_8 = 0;
            if (*(int *)(iVar5 + 4) != 0) {
              do {
                piVar2 = (int *)(*(int *)(iVar5 + 8) + local_8 * 4);
                if (*piVar2 == *(int *)(iVar6 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10))) {
                  *piVar2 = *(int *)(iVar6 + *(int *)(*(int *)(in_ECX + 0x100) + 8));
                }
                local_8 = local_8 + 1;
              } while (local_8 < *(uint *)(iVar5 + 4));
            }
          }
          local_c = local_c + 1;
        } while (local_c < (uVar4 & 0xfffff));
      }
      **(undefined4 **)(in_ECX + 0x100) = 0;
    }
  }
  return 0;
}


