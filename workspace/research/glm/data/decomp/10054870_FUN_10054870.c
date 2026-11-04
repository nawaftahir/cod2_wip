// 10054870 size=1131 FUN_10054870

void FUN_10054870(int param_1,int param_2,short *param_3,int *param_4,int param_5)

{
  int *piVar1;
  undefined1 uVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  undefined1 *puVar6;
  int iVar7;
  int iVar8;
  bool bVar9;
  int local_40 [7];
  int local_24;
  int local_20 [7];
  int local_4;
  
  piVar4 = *(int **)(param_2 + 0x50);
  iVar3 = *(int *)(param_1 + 0x128) + 0x80;
  param_1 = 6;
  piVar1 = (int *)&stack0xffffffb0;
  do {
    piVar5 = piVar1 + 4;
    if (((param_1 != 4) && (param_1 != 2)) && (param_1 != 0)) {
      if (((param_3[8] == 0) && (param_3[0x18] == 0)) &&
         ((param_3[0x28] == 0 && (param_3[0x38] == 0)))) {
        iVar7 = (int)*param_3 * *piVar4 * 4;
        *piVar5 = iVar7;
      }
      else {
        iVar8 = (int)param_3[0x28] * piVar4[0x28] * 0x1b37 +
                (int)param_3[0x18] * piVar4[0x18] * -0x28ba +
                (int)param_3[0x38] * piVar4[0x38] * -0x1712 + (int)param_3[8] * piVar4[8] * 0x73fc;
        iVar7 = (int)*param_3 * *piVar4 * 0x8000;
        *piVar5 = iVar8 + 0x1000 + iVar7 >> 0xd;
        iVar7 = (iVar7 - iVar8) + 0x1000 >> 0xd;
      }
      piVar1[0xc] = iVar7;
    }
    if (((param_1 != 5) && (param_1 != 3)) && (param_1 != 1)) {
      if ((((param_3[9] == 0) && (param_3[0x19] == 0)) && (param_3[0x29] == 0)) &&
         (param_3[0x39] == 0)) {
        iVar7 = (int)param_3[1] * piVar4[1] * 4;
        piVar1[5] = iVar7;
      }
      else {
        iVar8 = (int)param_3[0x29] * piVar4[0x29] * 0x1b37 +
                (int)param_3[0x19] * piVar4[0x19] * -0x28ba +
                (int)param_3[0x39] * piVar4[0x39] * -0x1712 + (int)param_3[9] * piVar4[9] * 0x73fc;
        iVar7 = (int)param_3[1] * piVar4[1] * 0x8000;
        piVar1[5] = iVar8 + 0x1000 + iVar7 >> 0xd;
        iVar7 = (iVar7 - iVar8) + 0x1000 >> 0xd;
      }
      piVar1[0xd] = iVar7;
    }
    if (((param_1 != 6) && (param_1 != 4)) && (param_1 != 2)) {
      if (((param_3[10] == 0) && (param_3[0x1a] == 0)) &&
         ((param_3[0x2a] == 0 && (param_3[0x3a] == 0)))) {
        iVar7 = (int)param_3[2] * piVar4[2] * 4;
        piVar1[6] = iVar7;
      }
      else {
        iVar8 = (int)param_3[0x2a] * piVar4[0x2a] * 0x1b37 +
                (int)param_3[0x1a] * piVar4[0x1a] * -0x28ba +
                (int)param_3[0x3a] * piVar4[0x3a] * -0x1712 + (int)param_3[10] * piVar4[10] * 0x73fc
        ;
        iVar7 = (int)param_3[2] * piVar4[2] * 0x8000;
        piVar1[6] = iVar8 + 0x1000 + iVar7 >> 0xd;
        iVar7 = (iVar7 - iVar8) + 0x1000 >> 0xd;
      }
      piVar1[0xe] = iVar7;
    }
    if (((param_1 != 7) && (param_1 != 5)) && (param_1 != 3)) {
      if (((param_3[0xb] == 0) && (param_3[0x1b] == 0)) &&
         ((param_3[0x2b] == 0 && (param_3[0x3b] == 0)))) {
        iVar7 = (int)param_3[3] * piVar4[3] * 4;
        piVar1[7] = iVar7;
      }
      else {
        iVar8 = (int)param_3[0x2b] * piVar4[0x2b] * 0x1b37 +
                (int)param_3[0x1b] * piVar4[0x1b] * -0x28ba +
                (int)param_3[0x3b] * piVar4[0x3b] * -0x1712 +
                (int)param_3[0xb] * piVar4[0xb] * 0x73fc;
        iVar7 = (int)param_3[3] * piVar4[3] * 0x8000;
        piVar1[7] = iVar8 + 0x1000 + iVar7 >> 0xd;
        iVar7 = (iVar7 - iVar8) + 0x1000 >> 0xd;
      }
      piVar1[0xf] = iVar7;
    }
    iVar7 = param_1 + -2;
    param_3 = param_3 + 4;
    piVar4 = piVar4 + 4;
    bVar9 = param_1 != 2;
    piVar1 = piVar5;
    param_1 = param_1 + -4;
  } while (bVar9 && -1 < iVar7);
  puVar6 = (undefined1 *)(*param_4 + param_5);
  if (((local_40[1] == 0) && (local_40[3] == 0)) && ((local_40[5] == 0 && (local_24 == 0)))) {
    uVar2 = *(undefined1 *)((local_40[0] + 0x10 >> 5 & 0x3ffU) + iVar3);
    *puVar6 = uVar2;
  }
  else {
    iVar7 = local_40[1] * 0x73fc + local_40[3] * -0x28ba + local_40[5] * 0x1b37 + local_24 * -0x1712
    ;
    *puVar6 = *(undefined1 *)((iVar7 + 0x80000 + local_40[0] * 0x8000 >> 0x14 & 0x3ffU) + iVar3);
    uVar2 = *(undefined1 *)(((local_40[0] * 0x8000 - iVar7) + 0x80000 >> 0x14 & 0x3ffU) + iVar3);
  }
  puVar6[1] = uVar2;
  puVar6 = (undefined1 *)(param_4[1] + param_5);
  if ((((local_20[1] == 0) && (local_20[3] == 0)) && (local_20[5] == 0)) && (local_4 == 0)) {
    uVar2 = *(undefined1 *)((local_20[0] + 0x10 >> 5 & 0x3ffU) + iVar3);
    *puVar6 = uVar2;
    puVar6[1] = uVar2;
    return;
  }
  iVar7 = local_20[1] * 0x73fc + local_20[5] * 0x1b37 + local_4 * -0x1712 + local_20[3] * -0x28ba;
  *puVar6 = *(undefined1 *)((iVar7 + 0x80000 + local_20[0] * 0x8000 >> 0x14 & 0x3ffU) + iVar3);
  puVar6[1] = *(undefined1 *)(((local_20[0] * 0x8000 - iVar7) + 0x80000 >> 0x14 & 0x3ffU) + iVar3);
  return;
}


