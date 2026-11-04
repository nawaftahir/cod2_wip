// 100a4df6 size=269 FUN_100a4df6

undefined4 FUN_100a4df6(void)

{
  int *piVar1;
  uint *puVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int in_ECX;
  uint uVar8;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_c = 0xffffffff;
  local_10 = 0xffffffff;
  local_14 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar6 = local_14 * 4;
      iVar7 = *(int *)(iVar6 + *(int *)(in_ECX + 0x14));
      if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 4) & 0x10) != 0)
         && (((iVar7 = *(int *)(iVar7 + 0x6c), iVar7 == 0x11 || (iVar7 == 0x12)) &&
             (puVar2 = *(uint **)(iVar6 + *(int *)(in_ECX + 0x14)), *puVar2 = *puVar2 & 0x40000000,
             **(int **)(iVar6 + *(int *)(in_ECX + 0x14)) == 0)))) {
        iVar7 = *(int *)(iVar6 + *(int *)(in_ECX + 0x14));
        iVar3 = *(int *)(iVar7 + 0x6c);
        uVar4 = local_c;
        if ((iVar3 != 0x11) || (uVar4 = local_14, local_c == 0xffffffff)) {
          local_c = uVar4;
          uVar4 = local_10;
          if ((iVar3 == 0x12) && (uVar4 = local_14, local_10 != 0xffffffff)) {
            iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar6);
            local_8 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + local_10 * 4) + 0xc);
LAB_100a4ee9:
            *(uint *)(iVar7 + 0xc) = local_8;
          }
          else {
            local_10 = uVar4;
            uVar4 = *(uint *)(iVar7 + 0xc);
            local_8 = 0xffffffff;
            uVar8 = 0;
            if (*(int *)(in_ECX + 8) != 0) {
              do {
                iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
                if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 4) &
                     0x10) != 0) && (uVar5 = *(uint *)(iVar7 + 0xc), uVar4 < uVar5)) {
                  if ((int)local_8 <= (int)uVar5) {
                    local_8 = uVar5;
                  }
                  piVar1 = (int *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4) + 0xc);
                  *piVar1 = *piVar1 + -1;
                }
                uVar8 = uVar8 + 1;
              } while (uVar8 < *(uint *)(in_ECX + 8));
              if (local_8 != 0xffffffff) {
                iVar7 = *(int *)(iVar6 + *(int *)(in_ECX + 0x14));
                goto LAB_100a4ee9;
              }
            }
          }
        }
      }
      local_14 = local_14 + 1;
    } while (local_14 < *(uint *)(in_ECX + 8));
  }
  return 0;
}


