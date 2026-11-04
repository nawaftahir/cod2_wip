// 100a5d6e size=625 FUN_100a5d6e

undefined4 FUN_100a5d6e(uint *param_1,uint *param_2)

{
  uint *puVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int *in_ECX;
  int *piVar6;
  uint uVar7;
  int iVar8;
  uint auStack_ac [18];
  uint auStack_64 [18];
  uint local_1c;
  uint local_18;
  uint local_14;
  int local_10;
  uint local_c;
  uint local_8;
  
  if (param_1 == (uint *)0x0) {
    uVar3 = 1;
  }
  else {
    uVar7 = *param_1 & 0xfff00000;
    if ((uVar7 != 0) && (uVar7 != 0x20700000)) {
      local_14 = *param_1 & 0xfffff;
      local_c = param_1[1] / local_14;
      if ((uVar7 == 0x70500000) || ((uVar7 == 0x70600000 || (uVar7 == 0x70700000)))) {
        local_c = 2;
      }
      if (1 < local_c) {
        iVar8 = in_ECX[0x20];
        iVar4 = in_ECX[0x22];
        iVar5 = in_ECX[0x1f];
        auStack_64[iVar8] = 0;
        auStack_64[iVar4] = 0;
        auStack_64[iVar5] = 0;
        iVar2 = in_ECX[0x25];
        auStack_ac[iVar8] = 1;
        auStack_64[iVar2] = 0;
        auStack_ac[iVar4] = 3;
        auStack_ac[iVar5] = 1;
        uVar7 = local_c;
        auStack_ac[iVar2] = 1;
        local_1c = 0;
        local_8 = 0;
        if (uVar7 != 0) {
          local_10 = 0;
          do {
            iVar8 = *(int *)(in_ECX[5] + *(int *)(local_10 + param_1[2]) * 4);
            iVar4 = *(int *)(in_ECX[4] + *(int *)(iVar8 + 4) * 4);
            if ((*(int *)(iVar8 + 0x6c) != 0x11) || ((*(byte *)(iVar4 + 4) & 0x10) == 0)) {
              uVar7 = *(uint *)(iVar4 + 4);
              if ((uVar7 & 0x200) == 0) {
                if ((char)uVar7 < '\0') goto LAB_100a5e96;
                if (((uVar7 & 0x10) == 0) ||
                   (iVar4 = (**(code **)(*in_ECX + 0x54))(*(int *)(iVar8 + 0x6c)), iVar4 == 0xffff))
                {
                  iVar4 = in_ECX[0x22];
                }
                else {
                  iVar4 = in_ECX[0x20];
                }
              }
              else if ((char)uVar7 < '\0') {
LAB_100a5e96:
                iVar4 = in_ECX[0x25];
              }
              else {
                iVar4 = in_ECX[0x1f];
              }
              uVar7 = local_8;
              local_18 = 0;
              if (local_8 != 0) {
                piVar6 = (int *)param_1[2];
                do {
                  iVar5 = *(int *)(in_ECX[5] + *piVar6 * 4);
                  if (((*(int *)(iVar8 + 4) == *(int *)(iVar5 + 4)) &&
                      (*(int *)(iVar8 + 8) == *(int *)(iVar5 + 8))) &&
                     (*(int *)(iVar8 + 0xc) == *(int *)(iVar5 + 0xc))) break;
                  local_18 = local_18 + 1;
                  piVar6 = piVar6 + local_14;
                } while (local_18 < local_8);
              }
              if (local_18 == local_8) {
                puVar1 = auStack_64 + iVar4;
                *puVar1 = *puVar1 + 1;
                if (auStack_ac[iVar4] < *puVar1) goto joined_r0x100a5fc7;
              }
              if ((in_ECX[0x1f] == iVar4) &&
                 (local_1c = local_1c + 1, uVar7 = local_8, 2 < local_1c)) {
joined_r0x100a5fc7:
                if (param_2 == (uint *)0x0) {
                  return 1;
                }
                *param_2 = uVar7;
                return 1;
              }
            }
            local_8 = local_8 + 1;
            local_10 = local_10 + local_14 * 4;
          } while (local_8 < local_c);
        }
        local_8 = 0;
        if (local_c != 0) {
          iVar8 = 0;
          local_10 = local_14 << 2;
          do {
            if ((*param_1 & 0xf0000000) == 0x60000000) {
              iVar4 = *(int *)(in_ECX[5] + *(int *)(iVar8 + param_1[2]) * 4);
              iVar5 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar4 + 0x6c));
              if ((iVar5 == 0x12) && (*(int *)(iVar4 + 4) == in_ECX[0x20])) {
                if (param_2 != (uint *)0x0) {
                  *param_2 = local_8;
                }
                return 1;
              }
            }
            local_8 = local_8 + 1;
            iVar8 = iVar8 + local_10;
          } while (local_8 < local_c);
        }
      }
    }
    uVar3 = 0;
  }
  return uVar3;
}


