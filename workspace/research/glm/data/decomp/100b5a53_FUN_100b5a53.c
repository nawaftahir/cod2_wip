// 100b5a53 size=469 FUN_100b5a53

undefined4 FUN_100b5a53(uint *param_1,uint *param_2)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  int *in_ECX;
  int *piVar7;
  uint uVar8;
  uint auStack_b4 [18];
  uint auStack_6c [18];
  int local_24;
  uint local_20;
  int local_1c;
  int local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  if (param_1 == (uint *)0x0) {
    uVar5 = 1;
  }
  else {
    uVar8 = *param_1 & 0xfff00000;
    if ((uVar8 == 0) || (uVar8 == 0x20700000)) {
      uVar5 = 0;
    }
    else {
      local_8 = *param_1 & 0xfffff;
      local_20 = param_1[1] / local_8;
      if (1 < local_20) {
        iVar2 = in_ECX[0x20];
        iVar6 = in_ECX[0x22];
        iVar3 = in_ECX[0x1f];
        auStack_6c[iVar2] = 0;
        auStack_6c[iVar6] = 0;
        auStack_6c[iVar3] = 0;
        iVar4 = in_ECX[0x25];
        auStack_b4[iVar2] = 1;
        auStack_6c[iVar4] = 0;
        uVar8 = local_20;
        auStack_b4[iVar6] = 3;
        auStack_b4[iVar3] = 1;
        auStack_b4[iVar4] = 1;
        local_14 = 0;
        local_10 = 0;
        if (uVar8 != 0) {
          local_18 = local_8 << 2;
          local_1c = 0;
          do {
            iVar2 = *(int *)(in_ECX[5] + *(int *)(local_1c + param_1[2]) * 4);
            local_24 = *(int *)(in_ECX[4] + *(int *)(iVar2 + 4) * 4);
            uVar8 = *(uint *)(local_24 + 4);
            if ((uVar8 & 0x200) == 0) {
              if ((char)uVar8 < '\0') goto LAB_100b5b51;
              if (((uVar8 & 0x10) == 0) ||
                 (iVar6 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar2 + 0x6c)),
                 iVar6 == 0xffff)) {
                local_c = in_ECX[0x22];
              }
              else {
                local_c = in_ECX[0x20];
              }
            }
            else if ((char)uVar8 < '\0') {
LAB_100b5b51:
              local_c = in_ECX[0x25];
            }
            else {
              local_c = in_ECX[0x1f];
            }
            local_8 = 0;
            if (local_10 != 0) {
              piVar7 = (int *)param_1[2];
              do {
                iVar6 = *(int *)(in_ECX[5] + *piVar7 * 4);
                if (((*(int *)(iVar2 + 4) == *(int *)(iVar6 + 4)) &&
                    (*(int *)(iVar2 + 8) == *(int *)(iVar6 + 8))) &&
                   (*(int *)(iVar2 + 0xc) == *(int *)(iVar6 + 0xc))) break;
                local_8 = local_8 + 1;
                piVar7 = (int *)((int)piVar7 + local_18);
              } while (local_8 < local_10);
            }
            if ((local_8 == local_10) && (local_c < 0x12)) {
              puVar1 = auStack_6c + local_c;
              *puVar1 = *puVar1 + 1;
              if (auStack_b4[local_c] < *puVar1) goto LAB_100b5c1b;
            }
            if (((*(byte *)(local_24 + 5) & 2) != 0) && (local_14 = local_14 + 1, 2 < local_14)) {
LAB_100b5c1b:
              if (param_2 == (uint *)0x0) {
                return 1;
              }
              *param_2 = local_10;
              return 1;
            }
            local_1c = local_1c + local_18;
            local_10 = local_10 + 1;
          } while (local_10 < local_20);
        }
      }
      uVar5 = 0;
    }
  }
  return uVar5;
}


