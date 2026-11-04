// 100a9827 size=312 FUN_100a9827

int FUN_100a9827(int param_1,uint param_2)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int in_ECX;
  uint uVar4;
  uint uVar5;
  int *piVar6;
  int local_414 [256];
  int local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  uVar5 = 0;
  if (param_2 != 0) {
    do {
      iVar1 = *(int *)(param_1 + uVar5 * 4);
      if (iVar1 != 0) {
        uVar4 = 0;
        if (*(int *)(iVar1 + 0xc) != 0) {
          do {
            iVar2 = uVar4 * 4;
            uVar4 = uVar4 + 1;
            *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                              *(int *)(*(int *)(iVar1 + 0x10) + iVar2) * 4) + 0x48) = uVar5;
          } while (uVar4 < *(uint *)(iVar1 + 0xc));
        }
        *(undefined4 *)(iVar1 + 0x1c) = 0;
        *(undefined4 *)(iVar1 + 0x14) = 0;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < param_2);
  }
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      iVar2 = *(int *)(iVar1 + 0x38);
      if (iVar2 != -1) {
        *(undefined4 *)(iVar1 + 0x48) =
             *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4) + 0x48);
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  local_8 = 0;
  local_14 = in_ECX;
  if (param_2 != 0) {
    do {
      iVar1 = *(int *)(param_1 + local_8 * 4);
      uVar5 = 0;
      if (iVar1 != 0) {
        local_10 = 0;
        local_c = 0;
        if (*(int *)(iVar1 + 4) != 0) {
          do {
            iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                     *(int *)(*(int *)(iVar1 + 8) + local_c * 4) * 4) + 0x48);
            if (iVar2 != -1) {
              uVar4 = 0;
              if (uVar5 != 0) {
                do {
                  if (local_414[uVar4] == iVar2) break;
                  uVar4 = uVar4 + 1;
                } while (uVar4 < uVar5);
              }
              if (uVar4 == uVar5) {
                local_414[uVar5] = iVar2;
                uVar5 = uVar5 + 1;
                local_10 = uVar5;
              }
              iVar2 = FUN_100a97cd(*(undefined4 *)(param_1 + iVar2 * 4),local_8);
              if (iVar2 < 0) {
                return iVar2;
              }
            }
            local_c = local_c + 1;
          } while (local_c < *(uint *)(iVar1 + 4));
        }
        piVar3 = (int *)FUN_100857f7(uVar5);
        *(int **)(iVar1 + 0x18) = piVar3;
        if (piVar3 == (int *)0x0) {
          return -0x7ff8fff2;
        }
        piVar6 = local_414;
        for (; uVar5 != 0; uVar5 = uVar5 - 1) {
          *piVar3 = *piVar6;
          piVar6 = piVar6 + 1;
          piVar3 = piVar3 + 1;
        }
        *(uint *)(iVar1 + 0x14) = local_10;
        in_ECX = local_14;
      }
      local_8 = local_8 + 1;
    } while (local_8 < param_2);
  }
  return 0;
}


