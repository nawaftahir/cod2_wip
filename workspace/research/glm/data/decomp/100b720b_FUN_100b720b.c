// 100b720b size=522 FUN_100b720b

int FUN_100b720b(void)

{
  int *piVar1;
  int iVar2;
  int *in_ECX;
  uint uVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 local_1c [4];
  int local_c;
  uint local_8;
  
  uVar3 = *(uint *)(in_ECX[0x40] + 0xc);
  local_8 = 0;
  if (uVar3 != 0) {
    piVar1 = *(int **)(in_ECX[0x40] + 0x10);
    do {
      if ((*(byte *)(*(int *)(in_ECX[5] + *piVar1 * 4) + 3) & 2) == 0) break;
      local_8 = local_8 + 1;
      piVar1 = piVar1 + 1;
    } while (local_8 < uVar3);
  }
  if (local_8 < uVar3) {
    iVar2 = in_ECX[0x40];
    uVar5 = *(undefined4 *)(iVar2 + 4);
    uVar9 = *(undefined4 *)(iVar2 + 0xc);
    uVar8 = *(undefined4 *)(iVar2 + 8);
    uVar7 = *(undefined4 *)(iVar2 + 0x10);
    uVar6 = 0xf;
  }
  else {
    iVar2 = in_ECX[0x40];
    if ((in_ECX[0x32] & 0xffffU) < 0x200) {
      local_c = 0;
      if (*(uint *)(iVar2 + 4) < *(uint *)(iVar2 + 0xc)) {
        iVar2 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_1c,4,0,0);
        if (iVar2 < 0) {
          return iVar2;
        }
        iVar2 = FUN_100c9a7f(0x4f,local_1c + 2,1,*(undefined4 *)(in_ECX[0x40] + 8),0,0,1,0,0,0,0);
        if (iVar2 < 0) {
          return iVar2;
        }
        iVar2 = in_ECX[0x40];
        uVar3 = 0;
        if (*(int *)(iVar2 + 0xc) != 0) {
          do {
            local_1c[uVar3] = local_1c[2];
            uVar3 = uVar3 + 1;
          } while (uVar3 < *(uint *)(iVar2 + 0xc));
        }
        uVar5 = *(undefined4 *)(in_ECX[0x40] + 0xc);
        iVar2 = FUN_100c9a7f(1,*(undefined4 *)(in_ECX[0x40] + 0x10),uVar5,local_1c,0,0,uVar5,0,0,0,0
                            );
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      else {
        local_8 = 0;
        if (uVar3 != 0) {
          do {
            iVar2 = local_8 * 4;
            if (*(int *)(*(int *)(in_ECX[5] + *(int *)(iVar2 + *(int *)(in_ECX[0x40] + 0x10)) * 4) +
                        0x10) == 2) {
              puVar4 = (undefined4 *)(*(int *)(in_ECX[0x40] + 8) + iVar2);
              iVar2 = *(int *)(in_ECX[0x40] + 0x10) + iVar2;
              uVar5 = 0x4f;
            }
            else {
              if (local_c == 0) {
                iVar2 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_1c,4,0,0);
                if (iVar2 < 0) {
                  return iVar2;
                }
                local_c = 1;
              }
              iVar2 = FUN_100c9a7f(0x4f,local_1c + 2,1,*(int *)(in_ECX[0x40] + 8) + local_8 * 4,0,0,
                                   1,0,0,0,0);
              if (iVar2 < 0) {
                return iVar2;
              }
              puVar4 = local_1c + 2;
              iVar2 = *(int *)(in_ECX[0x40] + 0x10) + local_8 * 4;
              uVar5 = 1;
            }
            iVar2 = FUN_100c9a7f(uVar5,iVar2,1,puVar4,0,0,1,0,0,0,0);
            if (iVar2 < 0) {
              return iVar2;
            }
            local_8 = local_8 + 1;
          } while (local_8 < *(uint *)(in_ECX[0x40] + 0xc));
        }
      }
      return 0;
    }
    uVar5 = *(undefined4 *)(iVar2 + 4);
    uVar9 = *(undefined4 *)(iVar2 + 0xc);
    uVar8 = *(undefined4 *)(iVar2 + 8);
    uVar7 = *(undefined4 *)(iVar2 + 0x10);
    uVar6 = 0x4f;
  }
  iVar2 = FUN_100cb349(uVar6,uVar7,uVar8,uVar9,uVar5,0,0);
  return iVar2;
}


