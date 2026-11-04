// 10090e95 size=586 FUN_10090e95

bool FUN_10090e95(int param_1)

{
  uint *puVar1;
  int iVar2;
  bool bVar3;
  int iVar4;
  uint uVar5;
  int in_ECX;
  uint uVar6;
  int *piVar7;
  int *local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  bVar3 = false;
  local_8 = 0;
  iVar4 = *(int *)(in_ECX + 8);
  if (iVar4 != 0) {
    piVar7 = *(int **)(in_ECX + 0x14);
    do {
      if ((*(int *)(in_ECX + 0x88) == *(int *)(*piVar7 + 4)) &&
         (uVar5 = *(uint *)(*piVar7 + 0xc), local_8 <= uVar5)) {
        local_8 = uVar5 + 1;
      }
      piVar7 = piVar7 + 1;
      iVar4 = iVar4 + -1;
    } while (iVar4 != 0);
  }
  FUN_1008a979();
  local_18 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_18 * 4);
      if ((*puVar1 & 0xfff00000) != 0) {
        uVar5 = puVar1[1] / (*puVar1 & 0xfffff);
        puVar1[9] = 0;
        local_14 = 0;
        if (uVar5 != 0) {
          do {
            local_10 = FUN_100853cf(local_14,&local_1c);
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *local_1c * 4);
            if (*(int *)(in_ECX + 0x88) == *(int *)(iVar4 + 4)) {
              local_c = 1;
              if (1 < local_10) {
                do {
                  iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + local_1c[local_c] * 4);
                  if ((*(int *)(in_ECX + 0x88) == *(int *)(iVar2 + 4)) &&
                     (*(int *)(iVar2 + 0x48) != *(int *)(iVar4 + 0x48))) break;
                  local_c = local_c + 1;
                } while (local_c < local_10);
              }
              if ((local_c != local_10) && (uVar6 = 0, local_10 != 0)) {
                do {
                  iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + local_1c[uVar6] * 4);
                  if (*(int *)(in_ECX + 0x88) == *(int *)(iVar4 + 4)) {
                    *(undefined4 *)
                     (*(int *)(*(int *)(in_ECX + 0x18) + *(int *)(iVar4 + 0x48) * 4) + 0x24) = 1;
                  }
                  uVar6 = uVar6 + 1;
                } while (uVar6 < local_10);
              }
            }
            local_14 = local_14 + 1;
          } while (local_14 < uVar5);
        }
      }
      local_18 = local_18 + 1;
    } while (local_18 < *(uint *)(in_ECX + 0xc));
  }
  local_14 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar4 = *(int *)(*(int *)(in_ECX + 0x18) + local_14 * 4);
      if (((*(ushort *)(iVar4 + 2) & 0xfff0) != 0) && (*(int *)(iVar4 + 0x24) == 0)) {
        local_1c = *(int **)(iVar4 + 0x10);
        iVar2 = *(int *)(in_ECX + 0x14);
        if (*(int *)(in_ECX + 0x88) == *(int *)(*(int *)(iVar2 + *local_1c * 4) + 4)) {
          uVar5 = *(uint *)(iVar4 + 0xc);
          uVar6 = 0;
          if (param_1 == 0) {
            local_18 = 0;
            if (uVar5 != 0) {
              do {
                if (*(int *)(*(int *)(iVar2 + *local_1c * 4) + 0x10) == 0) break;
                local_18 = local_18 + 1;
                local_1c = local_1c + 1;
              } while (local_18 < uVar5);
            }
            if (uVar5 <= local_18) {
              uVar6 = 0;
              if (uVar5 != 0) {
                do {
                  iVar2 = uVar6 * 4;
                  uVar6 = uVar6 + 1;
                  *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(*(int *)(iVar4 + 0x10) + iVar2) * 4) + 0xc) = local_8;
                } while (uVar6 < *(uint *)(iVar4 + 0xc));
              }
              goto LAB_100910b7;
            }
          }
          else {
            if (uVar5 != 0) {
              do {
                if (uVar6 != *(uint *)(*(int *)(iVar2 + *local_1c * 4) + 0x10)) break;
                local_1c = local_1c + 1;
                uVar6 = uVar6 + 1;
              } while (uVar6 < uVar5);
            }
            if (uVar6 != uVar5) {
              uVar6 = 0;
              if (uVar5 != 0) {
                do {
                  *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(*(int *)(iVar4 + 0x10) + uVar6 * 4) * 4) + 0xc) =
                       local_8;
                  *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(*(int *)(iVar4 + 0x10) + uVar6 * 4) * 4) + 0x10) =
                       uVar6;
                  uVar6 = uVar6 + 1;
                } while (uVar6 < *(uint *)(iVar4 + 0xc));
              }
LAB_100910b7:
              local_8 = local_8 + 1;
              bVar3 = true;
            }
          }
        }
      }
      local_14 = local_14 + 1;
    } while (local_14 < *(uint *)(in_ECX + 0xc));
  }
  return !bVar3;
}


