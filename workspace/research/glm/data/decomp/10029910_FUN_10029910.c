// 10029910 size=699 FUN_10029910

uint FUN_10029910(int param_1,float *param_2,float *param_3,int param_4)

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int *piVar6;
  int unaff_EDI;
  int local_8;
  
  uVar4 = 0;
  iVar5 = 0;
  if (3 < param_4) {
    local_8 = (param_4 - 4U >> 2) + 1;
    iVar5 = local_8 * 4;
    piVar6 = (int *)(unaff_EDI + 8);
    do {
      iVar2 = piVar6[-2] * 0x60 + *(int *)(param_1 + 0xf8);
      if ((((*param_2 <= *(float *)(iVar2 + 0x14)) && (param_2[1] <= *(float *)(iVar2 + 0x18))) &&
          (param_2[2] <= *(float *)(iVar2 + 0x1c))) &&
         (((*(float *)(iVar2 + 0x20) <= *param_3 && (*(float *)(iVar2 + 0x24) <= param_3[1])) &&
          (*(float *)(iVar2 + 0x28) <= param_3[2])))) {
        iVar2 = *(int *)(unaff_EDI + uVar4 * 4);
        *(int *)(unaff_EDI + uVar4 * 4) = piVar6[-2];
        piVar6[-2] = iVar2;
        uVar4 = uVar4 + 1;
      }
      iVar2 = piVar6[-1] * 0x60 + *(int *)(param_1 + 0xf8);
      if (((*param_2 <= *(float *)(iVar2 + 0x14)) && (param_2[1] <= *(float *)(iVar2 + 0x18))) &&
         ((param_2[2] <= *(float *)(iVar2 + 0x1c) &&
          (((*(float *)(iVar2 + 0x20) <= *param_3 && (*(float *)(iVar2 + 0x24) <= param_3[1])) &&
           (*(float *)(iVar2 + 0x28) <= param_3[2])))))) {
        iVar2 = *(int *)(unaff_EDI + uVar4 * 4);
        *(int *)(unaff_EDI + uVar4 * 4) = piVar6[-1];
        piVar6[-1] = iVar2;
        uVar4 = uVar4 + 1;
      }
      iVar2 = *piVar6 * 0x60 + *(int *)(param_1 + 0xf8);
      if ((((*param_2 <= *(float *)(iVar2 + 0x14)) && (param_2[1] <= *(float *)(iVar2 + 0x18))) &&
          ((param_2[2] <= *(float *)(iVar2 + 0x1c) &&
           ((*(float *)(iVar2 + 0x20) <= *param_3 && (*(float *)(iVar2 + 0x24) <= param_3[1]))))))
         && (*(float *)(iVar2 + 0x28) <= param_3[2])) {
        iVar2 = *(int *)(unaff_EDI + uVar4 * 4);
        *(int *)(unaff_EDI + uVar4 * 4) = *piVar6;
        *piVar6 = iVar2;
        uVar4 = uVar4 + 1;
      }
      iVar2 = piVar6[1] * 0x60 + *(int *)(param_1 + 0xf8);
      if (((((*param_2 <= *(float *)(iVar2 + 0x14)) && (param_2[1] <= *(float *)(iVar2 + 0x18))) &&
           (param_2[2] <= *(float *)(iVar2 + 0x1c))) &&
          ((*(float *)(iVar2 + 0x20) <= *param_3 && (*(float *)(iVar2 + 0x24) <= param_3[1])))) &&
         (*(float *)(iVar2 + 0x28) <= param_3[2])) {
        iVar2 = *(int *)(unaff_EDI + uVar4 * 4);
        *(int *)(unaff_EDI + uVar4 * 4) = piVar6[1];
        piVar6[1] = iVar2;
        uVar4 = uVar4 + 1;
      }
      piVar6 = piVar6 + 4;
      local_8 = local_8 + -1;
    } while (local_8 != 0);
  }
  for (; iVar5 < param_4; iVar5 = iVar5 + 1) {
    iVar2 = *(int *)(unaff_EDI + iVar5 * 4);
    iVar3 = iVar2 * 0x60 + *(int *)(param_1 + 0xf8);
    if (((*param_2 <= *(float *)(iVar3 + 0x14)) && (param_2[1] <= *(float *)(iVar3 + 0x18))) &&
       ((param_2[2] <= *(float *)(iVar3 + 0x1c) &&
        (((*(float *)(iVar3 + 0x20) <= *param_3 && (*(float *)(iVar3 + 0x24) <= param_3[1])) &&
         (*(float *)(iVar3 + 0x28) <= param_3[2])))))) {
      uVar1 = *(undefined4 *)(unaff_EDI + uVar4 * 4);
      *(int *)(unaff_EDI + uVar4 * 4) = iVar2;
      *(undefined4 *)(unaff_EDI + iVar5 * 4) = uVar1;
      uVar4 = uVar4 + 1;
    }
  }
  return ((int)uVar4 < 2) - 1 & uVar4;
}


