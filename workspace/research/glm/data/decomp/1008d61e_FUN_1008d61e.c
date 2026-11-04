// 1008d61e size=614 FUN_1008d61e

undefined4 FUN_1008d61e(void)

{
  uint *puVar1;
  uint *puVar2;
  int iVar3;
  uint uVar4;
  int in_ECX;
  uint uVar5;
  undefined4 *puVar6;
  uint local_10;
  uint local_c;
  uint local_8;
  
  FUN_1008a979();
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      iVar3 = *(int *)(*(int *)(in_ECX + 0x10) + puVar1[1] * 4);
      *puVar1 = *puVar1 & 0xffffffdf;
      uVar4 = *(uint *)(iVar3 + 4);
      if (((uVar4 & 0x10) != 0) && ((uVar4 & 0x200) == 0)) {
        *puVar1 = *puVar1 | 0x20;
      }
      if ((*(byte *)(iVar3 + 5) & 8) != 0) {
        *puVar1 = *puVar1 | 0x20;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      uVar5 = *puVar1 & 0xfff00000;
      if (uVar5 != 0) {
        if ((((uVar5 == 0x50100000) || (uVar5 == 0x11000000)) || (uVar5 == 0x11200000)) ||
           ((*puVar1 & 0xf0000000) == 0x60000000)) {
          uVar5 = 0;
          if (puVar1[3] != 0) {
            do {
              puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + uVar5 * 4) * 4);
              *puVar2 = *puVar2 | 0x20;
              uVar5 = uVar5 + 1;
            } while (uVar5 < puVar1[3]);
          }
        }
        else if (((uVar5 == 0x10f00000) || (uVar5 == 0x11100000)) || (uVar5 == 0x11400000)) {
          uVar5 = 0;
          if (puVar1[3] != 0) {
            do {
              puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + uVar5 * 4) * 4);
              *puVar2 = *puVar2 | 0x20;
              uVar5 = uVar5 + 1;
            } while (uVar5 < puVar1[3]);
          }
        }
        else {
          uVar5 = 0;
          if (puVar1[3] != 0) {
            do {
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + uVar5 * 4) * 4);
              if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 5) &
                   0x10) != 0) && (iVar3 = FUN_10086f0d(*(undefined4 *)(iVar3 + 0x14)), iVar3 != 0))
              {
                puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + uVar5 * 4) * 4);
                *puVar2 = *puVar2 | 0x20;
              }
              uVar5 = uVar5 + 1;
            } while (uVar5 < puVar1[3]);
          }
          uVar5 = *puVar1 & 0xf0000000;
          if ((uVar5 < 0x10000000) || (0x40000000 < uVar5)) {
            local_10 = 0;
            if (puVar1[1] != 0) {
              puVar6 = (undefined4 *)puVar1[2];
              do {
                iVar3 = FUN_10086f0d(*puVar6);
                if (iVar3 != 0) {
                  uVar5 = 0;
                  if (puVar1[3] != 0) {
                    do {
                      puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) +
                                         *(int *)(puVar1[4] + uVar5 * 4) * 4);
                      *puVar2 = *puVar2 | 0x20;
                      uVar5 = uVar5 + 1;
                    } while (uVar5 < puVar1[3]);
                  }
                  break;
                }
                local_10 = local_10 + 1;
                puVar6 = puVar6 + 1;
              } while (local_10 < puVar1[1]);
            }
          }
          else {
            uVar4 = puVar1[1] / (*puVar1 & 0xfffff);
            local_8 = 0;
            uVar5 = puVar1[3];
            if (uVar5 != 0) {
              do {
                local_10 = 0;
                if (uVar4 != 0) {
                  puVar6 = (undefined4 *)(puVar1[2] + local_8 * 4);
                  do {
                    iVar3 = FUN_10086f0d(*puVar6);
                    if (iVar3 != 0) {
                      puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) +
                                         *(int *)(local_8 * 4 + puVar1[4]) * 4);
                      *puVar2 = *puVar2 | 0x20;
                      break;
                    }
                    local_10 = local_10 + 1;
                    puVar6 = puVar6 + uVar5;
                  } while (local_10 < uVar4);
                }
                local_8 = local_8 + 1;
                uVar5 = puVar1[3];
              } while (local_8 < uVar5);
            }
          }
        }
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar1[1] * 4) + 4) & 0x20) != 0) {
        *puVar1 = *puVar1 | 0x20;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  return 0;
}


