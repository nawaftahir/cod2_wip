// 100b0444 size=610 FUN_100b0444

undefined4 FUN_100b0444(uint *param_1,uint *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  uint uVar6;
  uint *puVar7;
  char cVar8;
  undefined4 uVar9;
  int *piVar10;
  int *piVar11;
  uint uVar12;
  int in_ECX;
  uint uVar13;
  uint auStack_b0 [18];
  uint auStack_68 [19];
  uint local_1c;
  uint local_10;
  uint local_c;
  uint local_8;
  
  if (param_1 == (uint *)0x0) {
    uVar9 = 1;
  }
  else {
    uVar13 = *param_1 & 0xfff00000;
    if ((uVar13 == 0) || (uVar13 == 0x20700000)) {
      uVar9 = 0;
    }
    else {
      local_c = *param_1 & 0xfffff;
      local_1c = param_1[1] / local_c;
      if (1 < local_1c) {
        iVar1 = *(int *)(in_ECX + 0x80);
        iVar2 = *(int *)(in_ECX + 0x88);
        iVar3 = *(int *)(in_ECX + 0x7c);
        iVar4 = *(int *)(in_ECX + 0x94);
        local_8 = 0;
        auStack_68[iVar1] = 0;
        auStack_68[iVar2] = 0;
        auStack_68[iVar3] = 0;
        auStack_68[iVar4] = 0;
        auStack_b0[iVar1] = 2;
        auStack_b0[iVar2] = 3;
        auStack_b0[iVar3] = 2;
        uVar13 = local_1c;
        auStack_b0[iVar4] = 1;
        local_10 = 0;
        if (uVar13 != 0) {
          piVar5 = (int *)param_1[2];
          piVar10 = piVar5;
          do {
            iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar10 * 4);
            param_1 = (uint *)0x0;
            uVar13 = *(uint *)(iVar1 + 4);
            piVar11 = piVar5;
            if (local_10 != 0) {
              do {
                iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar11 * 4);
                if ((((uVar13 == *(uint *)(iVar2 + 4)) &&
                     (*(int *)(iVar1 + 8) == *(int *)(iVar2 + 8))) &&
                    (*(int *)(iVar1 + 0xc) == *(int *)(iVar2 + 0xc))) &&
                   ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + uVar13 * 4) + 5) & 1) == 0 ||
                     ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4) + 5) &
                      1) == 0)) || (*(double *)(iVar1 + 0x20) == *(double *)(iVar2 + 0x20)))))
                break;
                param_1 = (uint *)((int)param_1 + 1);
                piVar11 = piVar11 + local_c;
              } while (param_1 < local_10);
            }
            if (param_1 == (uint *)local_10) {
              if (uVar13 == *(uint *)(in_ECX + 0x80)) {
                uVar12 = *(uint *)(in_ECX + 0x80);
                if (*(char *)(iVar1 + 0x6c) == '\x03') {
                  if ((((*(uint *)(in_ECX + 200) & 0xffff) == 0x101) &&
                      (local_8 = local_8 + 1, 2 < local_8)) && (param_2 == (uint *)0x0)) {
                    return 1;
                  }
                  uVar12 = *(uint *)(in_ECX + 0x88);
                }
              }
              else {
                uVar12 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + uVar13 * 4) + 4);
                cVar8 = (char)uVar12;
                if ((uVar12 & 0x200) == 0) {
                  uVar12 = uVar13;
                  if (cVar8 < '\0') goto LAB_100b05ee;
                }
                else if (cVar8 < '\0') {
LAB_100b05ee:
                  uVar12 = *(uint *)(in_ECX + 0x94);
                }
                else {
                  uVar12 = *(uint *)(in_ECX + 0x7c);
                }
              }
              if ((((((*(int *)(iVar1 + 0x48) != -1) &&
                     (uVar6 = *(uint *)(in_ECX + 0x88), uVar13 == uVar6)) &&
                    ((*(uint *)(in_ECX + 200) & 0xffff) == 0x101)) &&
                   (puVar7 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar1 + 0x48) * 4),
                   uVar12 = uVar6, puVar7 != (uint *)0x0)) &&
                  (((uVar13 = *puVar7 & 0xfff00000, uVar13 == 0x60f00000 || (uVar13 == 0x60500000))
                   || ((uVar13 == 0x60a00000 || (uVar13 == 0x60000000)))))) &&
                 ((local_8 = local_8 + 1, 2 < local_8 && (param_2 == (uint *)0x0)))) {
                return 1;
              }
              if (uVar12 < 0x12) {
                puVar7 = auStack_68 + uVar12;
                *puVar7 = *puVar7 + 1;
                if (auStack_b0[uVar12] < *puVar7) {
                  if (param_2 == (uint *)0x0) {
                    return 1;
                  }
                  *param_2 = local_10;
                  return 1;
                }
              }
            }
            piVar10 = piVar10 + local_c;
            local_10 = local_10 + 1;
          } while (local_10 < local_1c);
        }
      }
      uVar9 = 0;
    }
  }
  return uVar9;
}


