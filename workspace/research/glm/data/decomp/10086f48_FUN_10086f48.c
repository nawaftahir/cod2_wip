// 10086f48 size=529 FUN_10086f48

undefined4 FUN_10086f48(void)

{
  uint *puVar1;
  int *piVar2;
  int in_ECX;
  int iVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  uVar6 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
      iVar5 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4);
      uVar4 = *(uint *)(iVar5 + 4);
      if (((uVar4 & 0x30) != 0) && ((uVar4 & 0x200) == 0)) {
        *(undefined4 *)(iVar3 + 4) = *(undefined4 *)(in_ECX + 0x74);
      }
      if ((*(byte *)(iVar5 + 4) & 4) != 0) {
        *(undefined4 *)(iVar3 + 4) = *(undefined4 *)(in_ECX + 0x88);
      }
      uVar6 = uVar6 + 1;
    } while (uVar6 < *(uint *)(in_ECX + 8));
  }
  local_14 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_14 * 4);
      uVar6 = *puVar1;
      if ((uVar6 & 0xfff00000) != 0) {
        local_c = 0;
        if (puVar1[3] != 0) {
          local_18 = puVar1[3];
          piVar2 = (int *)puVar1[4];
          do {
            if ((**(byte **)(*(int *)(in_ECX + 0x14) + *piVar2 * 4) & 0x20) != 0) {
              local_c = local_c + 1;
            }
            piVar2 = piVar2 + 1;
            local_18 = local_18 - 1;
          } while (local_18 != 0);
        }
        uVar4 = puVar1[3];
        if (local_c == uVar4) {
          *puVar1 = 0;
        }
        else {
          if (((local_c < uVar4) && (0xfffffff < (uVar6 & 0xf0000000))) &&
             ((uVar6 & 0xf0000000) < 0x40000001)) {
            uVar6 = puVar1[1] / (uVar6 & 0xfffff);
            uVar7 = 0;
            local_8 = 0;
            if (uVar4 != 0) {
              do {
                iVar3 = *(int *)(puVar1[4] + local_8 * 4);
                if ((**(byte **)(*(int *)(in_ECX + 0x14) + iVar3 * 4) & 0x20) == 0) {
                  local_10 = 0;
                  *(int *)(puVar1[4] + uVar7 * 4) = iVar3;
                  if (uVar6 != 0) {
                    do {
                      iVar3 = puVar1[3] * local_10;
                      local_10 = local_10 + 1;
                      *(undefined4 *)(puVar1[2] + (iVar3 + uVar7) * 4) =
                           *(undefined4 *)(puVar1[2] + (local_8 + iVar3) * 4);
                    } while (local_10 < uVar6);
                  }
                  uVar7 = uVar7 + 1;
                }
                local_8 = local_8 + 1;
              } while (local_8 < puVar1[3]);
            }
            local_8 = 1;
            if (1 < uVar6) {
              local_18 = uVar7 << 2;
              do {
                local_10 = 0;
                uVar4 = local_18;
                if (uVar7 != 0) {
                  do {
                    iVar3 = puVar1[3] * local_8 + local_10;
                    local_10 = local_10 + 1;
                    *(undefined4 *)(uVar4 + puVar1[2]) = *(undefined4 *)(puVar1[2] + iVar3 * 4);
                    uVar4 = uVar4 + 4;
                  } while (local_10 < uVar7);
                }
                local_8 = local_8 + 1;
                local_18 = local_18 + uVar7 * 4;
              } while (local_8 < uVar6);
            }
            *puVar1 = *puVar1 ^ (*puVar1 ^ uVar7) & 0xfffff;
            puVar1[1] = uVar7 * uVar6;
            puVar1[3] = uVar7;
          }
          local_10 = 0;
          if (puVar1[3] != 0) {
            do {
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + local_10 * 4) * 4);
              local_18 = *(undefined4 *)(iVar3 + 0x18);
              iVar5 = *(int *)(iVar3 + 0x14);
              while ((iVar5 != -1 &&
                     ((**(byte **)(iVar5 * 4 + *(int *)(in_ECX + 0x14)) & 0x20) != 0))) {
                iVar5 = *(int *)(iVar5 * 4 + *(int *)(in_ECX + 0x14));
                local_18 = *(undefined4 *)(iVar5 + 0x18);
                iVar5 = *(int *)(iVar5 + 0x14);
              }
              local_10 = local_10 + 1;
              *(uint *)(iVar3 + 0x18) = local_18;
              *(int *)(iVar3 + 0x14) = iVar5;
            } while (local_10 < puVar1[3]);
          }
        }
      }
      local_14 = local_14 + 1;
    } while (local_14 < *(uint *)(in_ECX + 0xc));
  }
  return 0;
}


