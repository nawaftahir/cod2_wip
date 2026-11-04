// 100b0922 size=556 FUN_100b0922

undefined4 FUN_100b0922(uint *param_1,uint *param_2)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int in_ECX;
  uint *puVar6;
  uint uVar7;
  uint uVar8;
  bool bVar9;
  bool bVar10;
  uint auStack_cc [18];
  uint auStack_84 [18];
  int local_3c;
  uint local_38;
  int local_34;
  int local_30;
  int local_2c;
  int local_28;
  int local_24;
  uint local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  if (param_1 == (uint *)0x0) {
    uVar3 = 1;
  }
  else if ((*param_1 & 0xfff00000) == 0) {
    uVar3 = 0;
  }
  else {
    local_10 = *param_1 & 0xfffff;
    local_8 = 0;
    local_c = 0;
    local_1c = 0;
    local_20 = param_1[1] / local_10;
    uVar8 = param_2[1];
    uVar7 = *param_2 & 0xfffff;
    iVar4 = *(int *)(in_ECX + 0x80);
    iVar5 = *(int *)(in_ECX + 0x88);
    auStack_84[iVar4] = 0;
    auStack_84[iVar5] = 0;
    iVar1 = *(int *)(in_ECX + 0x7c);
    auStack_84[iVar1] = 0;
    auStack_cc[iVar4] = 2;
    uVar2 = local_20;
    auStack_cc[iVar5] = 5;
    auStack_cc[iVar1] = 3;
    local_38 = uVar8 / uVar7 + uVar2;
    if (local_38 != 0) {
      local_18 = 0;
      local_28 = local_10 << 2;
      local_2c = uVar7 * uVar2 * -4;
      local_30 = uVar7 << 2;
      local_3c = local_2c;
      do {
        if (local_8 < local_20) {
          iVar4 = *(int *)(local_18 + param_1[2]);
        }
        else {
          iVar4 = *(int *)(local_2c + param_2[2]);
        }
        iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
        iVar5 = *(int *)(iVar4 + 4);
        local_34 = *(int *)(*(int *)(in_ECX + 0x10) + iVar5 * 4);
        local_14 = 0;
        if (local_8 != 0) {
          local_10 = 0;
          local_24 = local_3c;
          do {
            puVar6 = param_2;
            uVar8 = local_24;
            if (local_14 < local_20) {
              puVar6 = param_1;
              uVar8 = local_10;
            }
            iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar8 + puVar6[2]) * 4);
            if (((iVar5 == *(int *)(iVar1 + 4)) && (*(int *)(iVar4 + 8) == *(int *)(iVar1 + 8))) &&
               (*(int *)(iVar4 + 0xc) == *(int *)(iVar1 + 0xc))) break;
            local_24 = local_24 + local_30;
            local_14 = local_14 + 1;
            local_10 = local_10 + local_28;
          } while (local_14 < local_8);
        }
        if (local_14 == local_8) {
          iVar1 = *(int *)(in_ECX + 0x88);
          if (((iVar5 == iVar1) && (1 < *(uint *)(iVar4 + 0xc))) &&
             (local_c = local_c + 1, 3 < local_c)) {
            return 1;
          }
          if (iVar5 == *(int *)(in_ECX + 0x80)) {
            iVar5 = *(int *)(in_ECX + 0x80);
            if (((*(char *)(iVar4 + 0x6c) == '\x03') &&
                (iVar5 = iVar1, (*(uint *)(in_ECX + 200) & 0xffff) == 0x101)) &&
               (local_c = local_c + 1, 3 < local_c)) {
              return 1;
            }
            puVar6 = auStack_84 + iVar5;
            *puVar6 = *puVar6 + 1;
            bVar9 = *puVar6 < auStack_cc[iVar5];
            bVar10 = *puVar6 == auStack_cc[iVar5];
          }
          else {
            uVar8 = *(uint *)(local_34 + 4);
            if ((char)uVar8 < '\0') break;
            if ((uVar8 & 0x200) == 0) {
              iVar4 = *(int *)(iVar4 + 4);
              puVar6 = auStack_84 + iVar4;
              *puVar6 = *puVar6 + 1;
              bVar9 = *puVar6 < auStack_cc[iVar4];
              bVar10 = *puVar6 == auStack_cc[iVar4];
            }
            else {
              local_1c = local_1c + 1;
              bVar9 = local_1c < 3;
              bVar10 = local_1c == 3;
            }
          }
          if (!bVar9 && !bVar10) {
            return 1;
          }
        }
        local_8 = local_8 + 1;
        local_18 = local_18 + local_28;
        local_2c = local_2c + local_30;
      } while (local_8 < local_38);
    }
    uVar3 = 0;
  }
  return uVar3;
}


