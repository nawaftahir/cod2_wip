// 10089562 size=410 FUN_10089562

bool FUN_10089562(void)

{
  int *piVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  bool bVar6;
  uint uVar7;
  int in_ECX;
  int local_18;
  uint local_14;
  int *local_10;
  uint local_c;
  uint local_8;
  
  uVar7 = 0;
  bVar6 = false;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4) + 0x30) = 0xffffffff;
      uVar7 = uVar7 + 1;
    } while (uVar7 < *(uint *)(in_ECX + 8));
  }
  local_14 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_14 * 4);
      if ((*puVar2 & 0xfff00000) != 0) {
        local_18 = 0;
        while (local_8 = FUN_100853cf(local_18,&local_10), local_8 != 0) {
          if (*(int *)(*(int *)(*local_10 * 4 + *(int *)(in_ECX + 0x14)) + 0x30) != -1) {
            local_c = 1;
            if (1 < local_8) {
              do {
                if ((*(int *)(*(int *)(local_10[local_c] * 4 + *(int *)(in_ECX + 0x14)) + 0x30) ==
                     -1) || (iVar3 = *(int *)(in_ECX + 0x14),
                            *(int *)(*(int *)(iVar3 + *(int *)(*(int *)(iVar3 + *local_10 * 4) +
                                                              0x30) * 4) + 0xc) !=
                            *(int *)(*(int *)(iVar3 + *(int *)(*(int *)(iVar3 + local_10[local_c] *
                                                                                4) + 0x30) * 4) +
                                    0xc))) break;
                local_c = local_c + 1;
              } while (local_c < local_8);
              if (local_c < local_8) goto LAB_10089649;
            }
            uVar7 = 0;
            if (local_8 != 0) {
              do {
                piVar1 = local_10 + uVar7;
                uVar7 = uVar7 + 1;
                *piVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4) + 0x30);
              } while (uVar7 < local_8);
            }
            bVar6 = true;
          }
LAB_10089649:
          local_18 = local_18 + 1;
        }
        if (((*puVar2 & 0xfff00000) == 0x10000000) && (local_c = 0, puVar2[3] != 0)) {
          do {
            iVar3 = *(int *)(local_c * 4 + puVar2[4]);
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_c * 4 + puVar2[2]) * 4);
            if (((*(int *)(iVar4 + 4) == *(int *)(iVar5 + 4)) &&
                ((((*(int *)(iVar4 + 8) == *(int *)(iVar5 + 8) &&
                   (*(int *)(iVar4 + 0x10) == *(int *)(iVar5 + 0x10))) &&
                  (*(int *)(iVar4 + 0x14) == *(int *)(iVar5 + 0x14))) &&
                 ((*(int *)(iVar4 + 0x18) == *(int *)(iVar5 + 0x18) &&
                  (*(int *)(iVar5 + 0x38) == -1)))))) && (*(int *)(iVar4 + 0x3c) == 0)) {
              *(int *)(iVar5 + 0x30) = iVar3;
            }
            local_c = local_c + 1;
          } while (local_c < puVar2[3]);
        }
      }
      local_14 = local_14 + 1;
    } while (local_14 < *(uint *)(in_ECX + 0xc));
  }
  return !bVar6;
}


