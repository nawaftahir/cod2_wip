// 100b6d0e size=710 FUN_100b6d0e

/* WARNING: Type propagation algorithm not settling */

int FUN_100b6d0e(void)

{
  int iVar1;
  int *piVar2;
  int *in_ECX;
  uint uVar3;
  undefined4 *puVar4;
  int iVar5;
  undefined4 uVar6;
  undefined4 local_30 [4];
  int local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_18 = 0;
  if (*(uint *)(in_ECX[0x40] + 4) < *(uint *)(in_ECX[0x40] + 0xc)) {
    iVar1 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_30,4,0,0);
    if (iVar1 < 0) {
      return iVar1;
    }
    iVar1 = FUN_100c9a7f(0x4e,local_30 + 1,1,*(undefined4 *)(in_ECX[0x40] + 8),0,0,1,0,0,0,0);
    if (iVar1 < 0) {
      return iVar1;
    }
    iVar1 = in_ECX[0x40];
    uVar3 = 0;
    if (*(int *)(iVar1 + 0xc) != 0) {
      do {
        local_30[uVar3] = local_30[1];
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(iVar1 + 0xc));
    }
    uVar6 = *(undefined4 *)(in_ECX[0x40] + 0xc);
    iVar1 = FUN_100c9a7f(1,*(undefined4 *)(in_ECX[0x40] + 0x10),uVar6,local_30,0,0,uVar6,0,0,0,0);
    if (iVar1 < 0) {
      return iVar1;
    }
  }
  else {
    local_14 = 0;
    do {
      iVar1 = in_ECX[0x40];
      local_1c = *(uint *)(iVar1 + 0xc);
      local_8 = 0;
      if (local_1c != 0) {
        local_10 = 1;
        local_c = 2;
        do {
          iVar5 = local_8 * 4;
          piVar2 = (int *)(*(int *)(iVar1 + 0x10) + iVar5);
          local_20 = *(int *)(*(int *)(in_ECX[5] + *piVar2 * 4) + 0x10);
          if ((local_20 == 1) && (local_c < local_1c)) {
            if (local_14 == 1) {
              iVar1 = *(int *)(in_ECX[0x40] + 0x10);
              puVar4 = (undefined4 *)(*(int *)(in_ECX[0x40] + 8) + iVar5);
              uVar6 = 0x4e;
LAB_100b6ec5:
              iVar1 = FUN_100c9a7f(uVar6,iVar1 + iVar5,1,puVar4,0,0,1,0,0,0,0);
              if (iVar1 < 0) {
                return iVar1;
              }
            }
LAB_100b6ed4:
            local_8 = local_8 + 1;
            local_c = local_c + 1;
            local_10 = local_10 + 1;
          }
          else {
            if (local_1c <= local_10) {
              if (local_14 == 0) {
                if (local_18 == 0) {
                  iVar1 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_30,4,0,0);
                  if (iVar1 < 0) {
                    return iVar1;
                  }
                  local_18 = 1;
                }
                iVar1 = FUN_100c9a7f(0x4e,local_30 + 1,1,*(int *)(in_ECX[0x40] + 8) + iVar5,0,0,1,0,
                                     0,0,0);
                if (iVar1 < 0) {
                  return iVar1;
                }
                puVar4 = local_30 + 1;
                iVar1 = *(int *)(in_ECX[0x40] + 0x10);
                uVar6 = 1;
                goto LAB_100b6ec5;
              }
              goto LAB_100b6ed4;
            }
            if ((local_20 == 0) && (*(int *)(*(int *)(in_ECX[5] + piVar2[1] * 4) + 0x10) == 1)) {
              if (local_14 == 1) {
                iVar1 = *(int *)(in_ECX[0x40] + 0x10);
                puVar4 = (undefined4 *)(*(int *)(in_ECX[0x40] + 8) + iVar5);
                uVar6 = 0x13;
LAB_100b6f94:
                iVar1 = FUN_100c9a7f(uVar6,iVar1 + iVar5,2,puVar4,0,0,2,0,0,0,0);
                if (iVar1 < 0) {
                  return iVar1;
                }
              }
            }
            else if (local_14 == 0) {
              if (local_18 == 0) {
                iVar1 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_30,4,0,0);
                if (iVar1 < 0) {
                  return iVar1;
                }
                local_18 = 1;
              }
              iVar1 = FUN_100c9a7f(0x13,local_30,2,*(int *)(in_ECX[0x40] + 8) + iVar5,0,0,2,0,0,0,0)
              ;
              if (iVar1 < 0) {
                return iVar1;
              }
              puVar4 = local_30;
              iVar1 = *(int *)(in_ECX[0x40] + 0x10);
              uVar6 = 1;
              goto LAB_100b6f94;
            }
            local_c = local_c + 2;
            local_8 = local_8 + 2;
            local_10 = local_10 + 2;
          }
          iVar1 = in_ECX[0x40];
          local_1c = *(uint *)(iVar1 + 0xc);
        } while (local_8 < local_1c);
      }
      local_14 = local_14 + 1;
    } while (local_14 < 2);
  }
  return 0;
}


