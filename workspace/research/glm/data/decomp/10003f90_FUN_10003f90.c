// 10003f90 size=226 FUN_10003f90

void FUN_10003f90(int *param_1)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int iVar5;
  
  iVar2 = FUN_10001940();
  iVar1 = *(int *)(*param_1 + 0xc4);
  iVar5 = param_1[1];
  DAT_101ae388 = (*(code *)RI_Hunk_AllocInternal)(iVar2 * 0x3c);
  DAT_101ae384 = iVar2;
  if (0 < iVar2) {
    puVar4 = (undefined4 *)(iVar1 + iVar5 + 8);
    puVar3 = (undefined4 *)(DAT_101ae388 + 8);
    do {
      puVar3[-1] = puVar4[-2];
      *puVar3 = puVar4[-1];
      puVar3[1] = *puVar4;
      puVar3[2] = puVar4[1];
      puVar3[3] = puVar4[2];
      puVar3[4] = puVar4[3];
      puVar3[5] = puVar4[4] * 0x30 + DAT_101ae4a0;
      puVar3[7] = puVar4[5] * 0x44;
      puVar3[6] = puVar4[6];
      iVar1 = puVar4[8];
      if (iVar1 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = DAT_101ae494 + puVar4[7] * 4;
      }
      puVar3[9] = iVar5;
      puVar3[8] = iVar1;
      iVar1 = puVar4[10];
      if (iVar1 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = DAT_101ae490 + puVar4[9] * 4;
      }
      puVar3[0xb] = iVar5;
      puVar3[10] = iVar1;
      puVar4 = puVar4 + 0xd;
      puVar3 = puVar3 + 0xf;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  return;
}


