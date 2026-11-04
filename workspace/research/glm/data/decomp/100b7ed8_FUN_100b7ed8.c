// 100b7ed8 size=486 FUN_100b7ed8

undefined4 FUN_100b7ed8(uint *param_1,uint *param_2)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  int iVar6;
  int *in_ECX;
  uint uVar7;
  int *piVar8;
  uint auStack_b0 [18];
  uint auStack_68 [18];
  int local_20;
  int local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  if (param_1 == (uint *)0x0) {
    uVar4 = 1;
  }
  else {
    uVar7 = *param_1 & 0xfff00000;
    if ((uVar7 == 0) || (uVar7 == 0x20700000)) {
      uVar4 = 0;
    }
    else {
      uVar5 = *param_1 & 0xfffff;
      local_14 = param_1[1] / uVar5;
      if (((uVar7 == 0x70500000) || (uVar7 == 0x70600000)) || (uVar7 == 0x70700000)) {
        local_14 = 2;
      }
      if (1 < local_14) {
        iVar2 = in_ECX[0x20];
        iVar6 = in_ECX[0x22];
        iVar3 = in_ECX[0x1f];
        auStack_68[iVar2] = 0;
        auStack_68[iVar6] = 0;
        auStack_68[iVar3] = 0;
        auStack_b0[iVar2] = 1;
        uVar7 = local_14;
        auStack_b0[iVar6] = 3;
        auStack_b0[iVar3] = 1;
        local_18 = 0;
        local_10 = 0;
        if (uVar7 != 0) {
          local_1c = 0;
          local_20 = uVar5 << 2;
          do {
            iVar2 = *(int *)(in_ECX[5] + *(int *)(local_1c + param_1[2]) * 4);
            uVar7 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(iVar2 + 4) * 4) + 4);
            if ((uVar7 & 0x200) == 0) {
              if ((char)uVar7 < '\0') goto LAB_100b7fdf;
              if (((uVar7 & 0x10) == 0) ||
                 (iVar6 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar2 + 0x6c)),
                 iVar6 == 0xffff)) {
                iVar6 = in_ECX[0x22];
              }
              else {
                iVar6 = in_ECX[0x20];
              }
            }
            else if ((char)uVar7 < '\0') {
LAB_100b7fdf:
              iVar6 = in_ECX[0x25];
            }
            else {
              iVar6 = in_ECX[0x1f];
            }
            local_c = 0;
            local_8 = iVar6;
            if (local_10 != 0) {
              piVar8 = (int *)param_1[2];
              do {
                iVar3 = *(int *)(in_ECX[5] + *piVar8 * 4);
                if (((*(int *)(iVar2 + 4) == *(int *)(iVar3 + 4)) &&
                    (*(int *)(iVar2 + 8) == *(int *)(iVar3 + 8))) &&
                   (*(int *)(iVar2 + 0xc) == *(int *)(iVar3 + 0xc))) break;
                local_c = local_c + 1;
                piVar8 = (int *)((int)piVar8 + local_20);
              } while (local_c < local_10);
            }
            if (local_c == local_10) {
              puVar1 = auStack_68 + iVar6;
              *puVar1 = *puVar1 + 1;
              if (auStack_b0[iVar6] < *puVar1) goto LAB_100b80b0;
            }
            if (((0x1ff < (in_ECX[0x32] & 0xffffU)) && (in_ECX[0x1f] == local_8)) &&
               (local_18 = local_18 + 1, 2 < local_18)) {
LAB_100b80b0:
              if (param_2 != (uint *)0x0) {
                *param_2 = local_10;
              }
              return 1;
            }
            local_10 = local_10 + 1;
            local_1c = local_1c + local_20;
          } while (local_10 < local_14);
        }
      }
      uVar4 = 0;
    }
  }
  return uVar4;
}


