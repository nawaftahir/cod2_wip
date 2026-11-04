// 100a5b26 size=584 FUN_100a5b26

undefined4 FUN_100a5b26(void)

{
  uint *puVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  undefined4 uVar6;
  int *in_ECX;
  int *piVar7;
  int iVar8;
  int iVar9;
  undefined4 local_24;
  uint local_18;
  uint local_14;
  uint local_10;
  int local_c;
  uint local_8;
  
  iVar8 = -1;
  local_18 = 0;
  if (in_ECX[3] != 0) {
    do {
      in_ECX[0x3f] = local_18;
      puVar1 = *(uint **)(in_ECX[6] + local_18 * 4);
      in_ECX[0x40] = (int)puVar1;
      if ((*puVar1 & 0xfff00000) != 0) {
        uVar3 = puVar1[1] / (*puVar1 & 0xfffff);
        local_8 = 0;
        if (uVar3 != 0) {
          do {
            uVar4 = FUN_100853cf(local_8,&local_c);
            local_10 = 0;
            if (uVar4 != 0) {
              do {
                iVar9 = local_10 * 4;
                uVar2 = *(uint *)(*(int *)(in_ECX[4] +
                                          *(int *)(*(int *)(in_ECX[5] +
                                                           *(int *)(iVar9 + local_c) * 4) + 4) * 4)
                                 + 4);
                if (((((uVar2 & 0x10) == 0) || ((uVar2 & 0x200) != 0)) ||
                    (iVar5 = (**(code **)(*in_ECX + 0x54))(), iVar5 != 0x11)) ||
                   ((local_8 == 0 && ((*(uint *)in_ECX[0x40] & 0xfff00000) == 0x30000000)))) break;
                if (iVar8 == -1) {
                  local_14 = 0;
                  if (in_ECX[2] != 0) {
                    piVar7 = (int *)in_ECX[5];
                    iVar8 = in_ECX[2];
                    do {
                      if ((in_ECX[0x22] == *(int *)(*piVar7 + 4)) &&
                         (uVar2 = *(uint *)(*piVar7 + 0xc), local_14 <= uVar2)) {
                        local_14 = uVar2 + 1;
                      }
                      piVar7 = piVar7 + 1;
                      iVar8 = iVar8 + -1;
                    } while (iVar8 != 0);
                  }
                  iVar8 = FUN_10086139(in_ECX[0x22],local_14,0,0);
                  if (iVar8 == -1) {
                    return 0x8007000e;
                  }
                  FUN_10085d21();
                  *(undefined4 *)(*(int *)(in_ECX[5] + iVar8 * 4) + 0x6c) = 0xffffffff;
                  local_24 = *(undefined4 *)(iVar9 + local_c);
                }
                local_10 = local_10 + 1;
                *(int *)(iVar9 + local_c) = iVar8;
              } while (local_10 < uVar4);
            }
            local_8 = local_8 + 1;
          } while (local_8 < uVar3);
        }
      }
      local_18 = local_18 + 1;
    } while (local_18 < (uint)in_ECX[3]);
    if (iVar8 != -1) {
      iVar9 = FUN_10086199(0x30000001,3,1);
      if (iVar9 != -1) {
        iVar9 = *(int *)(in_ECX[6] + iVar9 * 4);
        FUN_100853b0();
        **(int **)(iVar9 + 0x10) = iVar8;
        **(undefined4 **)(iVar9 + 8) = local_24;
        uVar6 = FUN_10086139(in_ECX[0x1e],0,0,0x3ff0000000000000);
        *(undefined4 *)(*(int *)(iVar9 + 8) + 4) = uVar6;
        uVar6 = FUN_10086139(in_ECX[0x1e],0,0,0xbff0000000000000);
        *(undefined4 *)(*(int *)(iVar9 + 8) + 8) = uVar6;
        if ((*(int *)(*(int *)(iVar9 + 8) + 4) != -1) && (*(int *)(*(int *)(iVar9 + 8) + 8) != -1))
        {
          uVar3 = in_ECX[3];
          while (1 < uVar3) {
            uVar3 = uVar3 - 1;
            piVar7 = (int *)in_ECX[6] + uVar3;
            *piVar7 = piVar7[-1];
          }
          *(int *)in_ECX[6] = iVar9;
          return 0;
        }
      }
      return 0x8007000e;
    }
  }
  return 0;
}


