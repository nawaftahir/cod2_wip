// 10050bd0 size=573 FUN_10050bd0

uint FUN_10050bd0(int param_1,int *param_2)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  int local_8;
  int local_4;
  
  iVar6 = *(int *)(param_1 + 0x178);
  iVar1 = *(int *)(param_1 + 0x1a0);
  uVar2 = *(undefined4 *)(param_1 + 0x180);
  if (((*(int *)(param_1 + 0x104) != 0) && (*(int *)(iVar1 + 0x28) == 0)) &&
     (uVar5 = FUN_100508f0(), (char)uVar5 == '\0')) {
    return uVar5;
  }
  if (*(char *)(iVar1 + 8) == '\0') {
    if (*(int *)(iVar1 + 0x14) != 0) {
      iVar6 = *(int *)(iVar1 + 0x28) + -1;
      *(int *)(iVar1 + 0x28) = iVar6;
      *(int *)(iVar1 + 0x14) = *(int *)(iVar1 + 0x14) + -1;
      return CONCAT31((int3)((uint)iVar6 >> 8),1);
    }
    local_14 = **(undefined4 **)(param_1 + 0x20);
    local_10 = (*(undefined4 **)(param_1 + 0x20))[1];
    iVar3 = *param_2;
    iVar8 = *(int *)(iVar1 + 0xc);
    iVar7 = *(int *)(iVar1 + 0x10);
    iVar4 = *(int *)(iVar1 + 0x3c);
    iVar12 = 0;
    local_4 = param_1;
    for (iVar10 = *(int *)(param_1 + 0x174); iVar10 <= iVar6; iVar10 = iVar10 + 1) {
      if (iVar7 < 8) {
        uVar5 = FUN_1004c8b0(&local_14,iVar8,iVar7,0);
        if ((char)uVar5 == '\0') goto LAB_10050d89;
        iVar7 = local_8;
        iVar8 = local_c;
        if (7 < local_8) goto LAB_10050cb2;
LAB_10050cdb:
        uVar5 = FUN_1004c9d0(&local_14,iVar4);
        iVar7 = local_8;
        iVar8 = local_c;
        if ((int)uVar5 < 0) goto LAB_10050d89;
      }
      else {
LAB_10050cb2:
        uVar5 = iVar8 >> ((char)iVar7 - 8U & 0x1f) & 0xff;
        iVar9 = *(int *)(iVar4 + 0x90 + uVar5 * 4);
        if (iVar9 == 0) goto LAB_10050cdb;
        uVar5 = (uint)*(byte *)(uVar5 + 0x490 + iVar4);
        iVar7 = iVar7 - iVar9;
      }
      iVar9 = (int)uVar5 >> 4;
      uVar11 = uVar5 & 0xf;
      if (uVar11 == 0) {
        if (iVar9 != 0xf) {
          iVar12 = 1 << ((byte)iVar9 & 0x1f);
          if (iVar9 != 0) {
            if ((iVar7 < iVar9) &&
               (uVar5 = FUN_1004c8b0(&local_14,iVar8,iVar7,iVar9), iVar7 = local_8, iVar8 = local_c,
               (char)uVar5 == '\0')) goto LAB_10050d89;
            iVar7 = iVar7 - iVar9;
            iVar12 = iVar12 + (iVar8 >> ((byte)iVar7 & 0x1f) & iVar12 - 1U);
          }
          iVar12 = iVar12 + -1;
          break;
        }
        iVar10 = iVar10 + 0xf;
      }
      else {
        iVar10 = iVar10 + iVar9;
        if ((iVar7 < (int)uVar11) &&
           (uVar5 = FUN_1004c8b0(&local_14,iVar8,iVar7,uVar11), iVar7 = local_8, iVar8 = local_c,
           (char)uVar5 == '\0')) {
LAB_10050d89:
          return uVar5 & 0xffffff00;
        }
        iVar7 = iVar7 - uVar11;
        uVar5 = (1 << (sbyte)uVar11) - 1U & iVar8 >> ((byte)iVar7 & 0x1f);
        if ((int)uVar5 < *(int *)(&DAT_10190e68 + uVar11 * 4)) {
          uVar5 = *(int *)(&DAT_10190ea8 + uVar11 * 4) + uVar5;
        }
        *(short *)(iVar3 + (&DAT_10191200)[iVar10] * 2) = (short)(uVar5 << ((byte)uVar2 & 0x1f));
      }
    }
    **(undefined4 **)(param_1 + 0x20) = local_14;
    *(undefined4 *)(*(int *)(param_1 + 0x20) + 4) = local_10;
    *(int *)(iVar1 + 0xc) = iVar8;
    *(int *)(iVar1 + 0x10) = iVar7;
    *(int *)(iVar1 + 0x14) = iVar12;
  }
  iVar6 = *(int *)(iVar1 + 0x28) + -1;
  *(int *)(iVar1 + 0x28) = iVar6;
  return CONCAT31((int3)((uint)iVar6 >> 8),1);
}


