// 100ac840 size=308 FUN_100ac840

undefined4 FUN_100ac840(void)

{
  uint uVar1;
  int iVar2;
  int *piVar3;
  uint uVar4;
  int in_ECX;
  int extraout_ECX;
  int iVar5;
  undefined8 uVar6;
  int local_28;
  uint local_20;
  uint local_1c;
  int *local_18;
  int *local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  piVar3 = *(int **)(in_ECX + 0x230);
  local_20 = 0x12;
  iVar5 = 6;
  do {
    if (((uint *)*piVar3 != (uint *)0x0) && ((*(uint *)*piVar3 & 0xfff00000) != 0x11000000)) {
      local_20 = local_20 - 3;
    }
    piVar3 = piVar3 + 1;
    iVar5 = iVar5 + -1;
  } while (iVar5 != 0);
  local_28 = *(int *)(in_ECX + 0x220);
  local_1c = 0;
  if (local_28 != 0) {
    local_14 = *(int **)(in_ECX + 0x22c);
    do {
      if (*local_14 != 0) {
        uVar1 = *(uint *)(*local_14 + 0xc);
        local_10 = 0;
        if (uVar1 != 0) {
          uVar4 = *(uint *)(in_ECX + 0xc);
          do {
            local_c = 0;
            if (uVar4 != 0) {
              local_18 = *(int **)(in_ECX + 0x18);
              do {
                if (((uint *)*local_18)[10] != 1) {
                  uVar6 = FUN_100a6e19(*(uint *)*local_18 & 0xfff00000);
                  iVar5 = (int)((ulonglong)uVar6 >> 0x20);
                  in_ECX = extraout_ECX;
                  if ((int)uVar6 == 0) {
                    local_8 = 0;
                    uVar4 = *(uint *)(iVar5 + 4);
                    if (uVar4 != 0) {
                      iVar2 = *(int *)(*(int *)(*local_14 + 0x10) + local_10 * 4);
                      piVar3 = *(int **)(iVar5 + 8);
                      do {
                        if ((*(int *)(*(int *)(*(int *)(extraout_ECX + 0x14) + *piVar3 * 4) + 0x38)
                             == iVar2) || (*piVar3 == iVar2)) break;
                        local_8 = local_8 + 1;
                        piVar3 = piVar3 + 1;
                      } while (local_8 < uVar4);
                    }
                    if (local_8 != uVar4) break;
                  }
                }
                local_c = local_c + 1;
                local_18 = local_18 + 1;
              } while (local_c < *(uint *)(in_ECX + 0xc));
            }
            uVar4 = *(uint *)(in_ECX + 0xc);
            if (local_c != uVar4) {
              local_1c = local_1c + 1;
            }
            local_10 = local_10 + 1;
          } while (local_10 < uVar1);
        }
      }
      local_14 = local_14 + 1;
      local_28 = local_28 + -1;
    } while (local_28 != 0);
    if (local_20 < local_1c) {
      return 1;
    }
  }
  return 0;
}


