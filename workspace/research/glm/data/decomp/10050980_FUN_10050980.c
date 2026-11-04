// 10050980 size=578 FUN_10050980

uint FUN_10050980(int param_1,int param_2)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  undefined2 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  uint uVar12;
  int *local_3c;
  undefined4 local_28;
  undefined4 local_24;
  int local_20;
  int local_1c;
  int local_18;
  undefined4 local_14;
  int local_10 [4];
  
  iVar10 = param_1;
  uVar2 = *(undefined4 *)(param_1 + 0x180);
  iVar3 = *(int *)(param_1 + 0x1a0);
  if (((*(int *)(param_1 + 0x104) != 0) && (*(int *)(iVar3 + 0x28) == 0)) &&
     (uVar8 = FUN_100508f0(), (char)uVar8 == '\0')) {
    return uVar8;
  }
  if (*(char *)(iVar3 + 8) == '\0') {
    local_28 = **(undefined4 **)(param_1 + 0x20);
    local_24 = (*(undefined4 **)(param_1 + 0x20))[1];
    iVar9 = *(int *)(iVar3 + 0x10);
    local_14 = *(undefined4 *)(iVar3 + 0x14);
    local_10[0] = *(int *)(iVar3 + 0x18);
    local_10[1] = *(undefined4 *)(iVar3 + 0x1c);
    local_10[3] = *(undefined4 *)(iVar3 + 0x24);
    piVar1 = (int *)(param_1 + 0x148);
    iVar11 = *(int *)(iVar3 + 0xc);
    local_18 = param_1;
    local_10[2] = *(undefined4 *)(iVar3 + 0x20);
    param_1 = 0;
    if (0 < *piVar1) {
      local_3c = (int *)(iVar10 + 0x14c);
      do {
        puVar4 = *(undefined2 **)(param_2 + param_1 * 4);
        iVar5 = *local_3c;
        iVar6 = *(int *)(iVar3 + 0x2c + *(int *)(*(int *)(iVar10 + 0x130 + iVar5 * 4) + 0x14) * 4);
        if (iVar9 < 8) {
          uVar8 = FUN_1004c8b0(&local_28,iVar11,iVar9,0);
          if ((char)uVar8 == '\0') goto LAB_10050bb8;
          iVar9 = local_1c;
          iVar11 = local_20;
          if (7 < local_1c) goto LAB_10050a89;
LAB_10050ab2:
          uVar8 = FUN_1004c9d0(&local_28,iVar6);
          iVar9 = local_1c;
          iVar11 = local_20;
          uVar12 = uVar8;
          if ((int)uVar8 < 0) goto LAB_10050bb8;
        }
        else {
LAB_10050a89:
          uVar8 = iVar11 >> ((char)iVar9 - 8U & 0x1f) & 0xff;
          iVar7 = *(int *)(iVar6 + 0x90 + uVar8 * 4);
          if (iVar7 == 0) goto LAB_10050ab2;
          iVar9 = iVar9 - iVar7;
          uVar12 = (uint)*(byte *)(uVar8 + 0x490 + iVar6);
        }
        uVar8 = 0;
        if (uVar12 != 0) {
          if ((iVar9 < (int)uVar12) &&
             (uVar8 = FUN_1004c8b0(&local_28,iVar11,iVar9,uVar12), iVar9 = local_1c,
             iVar11 = local_20, (char)uVar8 == '\0')) {
LAB_10050bb8:
            return uVar8 & 0xffffff00;
          }
          iVar9 = iVar9 - uVar12;
          uVar8 = (1 << ((byte)uVar12 & 0x1f)) - 1U & iVar11 >> ((byte)iVar9 & 0x1f);
          if ((int)uVar8 < *(int *)(&DAT_10190e68 + uVar12 * 4)) {
            uVar8 = *(int *)(&DAT_10190ea8 + uVar12 * 4) + uVar8;
          }
        }
        iVar6 = local_10[iVar5];
        local_10[iVar5] = iVar6 + uVar8;
        local_3c = local_3c + 1;
        *puVar4 = (short)(iVar6 + uVar8 << ((byte)uVar2 & 0x1f));
        param_1 = param_1 + 1;
      } while (param_1 < *(int *)(iVar10 + 0x148));
    }
    **(undefined4 **)(iVar10 + 0x20) = local_28;
    *(undefined4 *)(*(int *)(iVar10 + 0x20) + 4) = local_24;
    *(int *)(iVar3 + 0xc) = iVar11;
    *(undefined4 *)(iVar3 + 0x14) = local_14;
    *(int *)(iVar3 + 0x10) = iVar9;
    *(int *)(iVar3 + 0x18) = local_10[0];
    *(int *)(iVar3 + 0x1c) = local_10[1];
    *(int *)(iVar3 + 0x20) = local_10[2];
    *(int *)(iVar3 + 0x24) = local_10[3];
  }
  iVar10 = *(int *)(iVar3 + 0x28) + -1;
  *(int *)(iVar3 + 0x28) = iVar10;
  return CONCAT31((int3)((uint)iVar10 >> 8),1);
}


