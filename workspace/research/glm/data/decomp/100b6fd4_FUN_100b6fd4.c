// 100b6fd4 size=567 FUN_100b6fd4

int FUN_100b6fd4(void)

{
  uint *puVar1;
  int *piVar2;
  int iVar3;
  int *in_ECX;
  uint uVar4;
  undefined4 *puVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 local_1c [4];
  int local_c;
  uint local_8;
  
  uVar4 = *(uint *)(in_ECX[0x40] + 0xc);
  local_8 = 0;
  if (uVar4 != 0) {
    piVar2 = *(int **)(in_ECX[0x40] + 0x10);
    do {
      if ((*(byte *)(*(int *)(in_ECX[5] + *piVar2 * 4) + 3) & 2) == 0) break;
      local_8 = local_8 + 1;
      piVar2 = piVar2 + 1;
    } while (local_8 < uVar4);
  }
  if (local_8 < uVar4) {
    iVar3 = in_ECX[0x40];
    uVar7 = *(undefined4 *)(iVar3 + 4);
    uVar11 = *(undefined4 *)(iVar3 + 0xc);
    uVar10 = *(undefined4 *)(iVar3 + 8);
    uVar9 = *(undefined4 *)(iVar3 + 0x10);
    uVar8 = 0xe;
  }
  else {
    iVar3 = in_ECX[0x40];
    if ((in_ECX[0x32] & 0xffffU) < 0x200) {
      local_c = 0;
      if (*(uint *)(iVar3 + 4) < *(uint *)(iVar3 + 0xc)) {
        iVar3 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_1c,4,0,0);
        if (iVar3 < 0) {
          return iVar3;
        }
        iVar3 = FUN_100c9a7f(0x4e,local_1c + 2,1,*(undefined4 *)(in_ECX[0x40] + 8),0,0,1,0,0,0,0);
        if (iVar3 < 0) {
          return iVar3;
        }
        iVar3 = in_ECX[0x40];
        uVar4 = 0;
        if (*(int *)(iVar3 + 0xc) != 0) {
          do {
            local_1c[uVar4] = local_1c[2];
            uVar4 = uVar4 + 1;
          } while (uVar4 < *(uint *)(iVar3 + 0xc));
        }
        uVar7 = *(undefined4 *)(in_ECX[0x40] + 0xc);
        iVar3 = FUN_100c9a7f(1,*(undefined4 *)(in_ECX[0x40] + 0x10),uVar7,local_1c,0,0,uVar7,0,0,0,0
                            );
        if (iVar3 < 0) {
          return iVar3;
        }
      }
      else {
        local_8 = 0;
        if (uVar4 != 0) {
          do {
            iVar6 = local_8 * 4;
            iVar3 = *(int *)(*(int *)(in_ECX[5] +
                                     *(int *)(iVar6 + *(int *)(in_ECX[0x40] + 0x10)) * 4) + 0x10);
            puVar1 = *(uint **)(in_ECX[5] + *(int *)(iVar6 + *(int *)(in_ECX[0x40] + 8)) * 4);
            if ((((iVar3 == 0) && ((*puVar1 & 2) != 0)) || (iVar3 == 2)) ||
               (((iVar3 == 3 && (uVar4 = *puVar1, (uVar4 & 4) != 0)) && ((uVar4 & 8) != 0)))) {
              iVar3 = *(int *)(in_ECX[0x40] + 0x10);
              puVar5 = (undefined4 *)(*(int *)(in_ECX[0x40] + 8) + iVar6);
              uVar7 = 0x4e;
            }
            else {
              if (local_c == 0) {
                iVar3 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_1c,4,0,0);
                if (iVar3 < 0) {
                  return iVar3;
                }
                local_c = 1;
              }
              iVar3 = FUN_100c9a7f(0x4e,local_1c + 2,1,*(int *)(in_ECX[0x40] + 8) + iVar6,0,0,1,0,0,
                                   0,0);
              if (iVar3 < 0) {
                return iVar3;
              }
              puVar5 = local_1c + 2;
              iVar3 = *(int *)(in_ECX[0x40] + 0x10);
              uVar7 = 1;
            }
            iVar3 = FUN_100c9a7f(uVar7,iVar3 + iVar6,1,puVar5,0,0,1,0,0,0,0);
            if (iVar3 < 0) {
              return iVar3;
            }
            local_8 = local_8 + 1;
          } while (local_8 < *(uint *)(in_ECX[0x40] + 0xc));
        }
      }
      return 0;
    }
    uVar7 = *(undefined4 *)(iVar3 + 4);
    uVar11 = *(undefined4 *)(iVar3 + 0xc);
    uVar10 = *(undefined4 *)(iVar3 + 8);
    uVar9 = *(undefined4 *)(iVar3 + 0x10);
    uVar8 = 0x4e;
  }
  iVar3 = FUN_100cb349(uVar8,uVar9,uVar10,uVar11,uVar7,0,0);
  return iVar3;
}


