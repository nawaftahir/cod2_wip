// 100aa1ac size=480 FUN_100aa1ac

int FUN_100aa1ac(int param_1,uint param_2,int param_3,int *param_4)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  bool bVar4;
  int iVar5;
  int in_ECX;
  uint uVar6;
  int *piVar7;
  uint uVar8;
  uint local_18;
  int local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      if (((puVar1 != (uint *)0x0) && (puVar1[9] != 1)) && (*puVar1 != 0)) {
        bVar4 = false;
        local_10 = 0;
        if (puVar1[3] != 0) {
          do {
            local_c = 0;
            if (param_2 != 0) {
              do {
                iVar5 = *(int *)(param_1 + local_c * 4);
                iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4);
                if ((*(int *)(iVar2 + 4) == *(int *)(in_ECX + 0x80)) &&
                   (*(char *)(iVar2 + 0x6c) != '\x03')) goto LAB_100aa379;
                iVar3 = *(int *)(puVar1[4] + local_10 * 4);
                if ((iVar3 == iVar5) || (iVar3 == *(int *)(iVar2 + 0x38))) {
                  uVar6 = puVar1[1];
                  uVar8 = *puVar1 & 0xfffff;
                  local_18 = 0;
                  if (uVar6 / uVar8 != 0) {
                    local_14 = 0;
                    do {
                      iVar5 = FUN_100aa1ac(puVar1[2] + local_14,uVar8,param_3,param_4);
                      if (iVar5 < 0) {
                        return iVar5;
                      }
                      local_18 = local_18 + 1;
                      local_14 = local_14 + uVar8 * 4;
                      bVar4 = true;
                    } while (local_18 < uVar6 / uVar8);
                  }
                }
                local_c = local_c + 1;
              } while (local_c < param_2);
            }
            local_10 = local_10 + 1;
          } while (local_10 < puVar1[3]);
          if (bVar4) {
            uVar6 = *puVar1 & 0xfff00000;
            if ((((uVar6 == 0x60000000) || (uVar6 == 0x60500000)) ||
                ((uVar6 == 0x60a00000 ||
                 (((uVar6 == 0x60f00000 || (uVar6 == 0x72c00000)) || (uVar6 == 0x72d00000)))))) ||
               (uVar6 == 0x11000000)) {
              uVar8 = *puVar1 & 0xfffff;
              uVar6 = uVar8 * 2;
              if (uVar8 < uVar6) {
                piVar7 = (int *)(puVar1[2] + uVar8 * 4);
                do {
                  if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4) + 4) ==
                      *(int *)(in_ECX + 0x88)) {
LAB_100aa379:
                    FUN_1008b0b5();
                    return -0x7fffbffb;
                  }
                  uVar8 = uVar8 + 1;
                  piVar7 = piVar7 + 1;
                } while (uVar8 < uVar6);
              }
            }
            *(uint **)(param_3 + *param_4 * 4) = puVar1;
            *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + local_8 * 4) + 0x24) = 1;
            *param_4 = *param_4 + 1;
          }
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  return 0;
}


