// 10004730 size=315 FUN_10004730

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10004730(void)

{
  int *in_EAX;
  int iVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int *piVar5;
  undefined4 *puVar6;
  int iStack_8;
  
  iVar1 = FUN_10001940();
  puVar6 = (undefined4 *)(*(int *)(*in_EAX + 0xd4) + in_EAX[1]);
  iVar2 = FUN_10001940();
  _DAT_101ae290 = iVar2 + iVar1;
  piVar5 = (int *)(*(int *)(*in_EAX + 0xdc) + in_EAX[1]);
  piVar3 = (int *)(*(code *)RI_Hunk_AllocInternal)(_DAT_101ae290 * 0x18);
  DAT_101ae294 = piVar3;
  iStack_8 = iVar1;
  if (0 < iVar1) {
    do {
      iVar4 = (*(code *)RI_DObjSetModel)(*puVar6);
      piVar3[3] = iVar4;
      *piVar3 = -1;
      iVar4 = puVar6[1];
      if (iVar4 < 0) {
        iVar4 = (iVar1 - iVar4) + -1;
      }
      piVar3[4] = (int)(DAT_101ae294 + iVar4 * 6);
      iVar4 = puVar6[2];
      if (iVar4 < 0) {
        iVar4 = (iVar1 - iVar4) + -1;
      }
      piVar3[5] = (int)(DAT_101ae294 + iVar4 * 6);
      puVar6 = puVar6 + 9;
      piVar3 = piVar3 + 6;
      iStack_8 = iStack_8 + -1;
    } while (iStack_8 != 0);
  }
  if (0 < iVar2) {
    piVar3 = piVar3 + 3;
    do {
      piVar3[-1] = piVar5[6];
      *piVar3 = *piVar5;
      piVar5 = piVar5 + 9;
      piVar3 = piVar3 + 6;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  piVar3 = DAT_101ae294;
  iVar1 = *DAT_101ae294;
  DAT_101ae294[1] = 0;
  if (iVar1 == -1) {
    FUN_100046e0(piVar3[4],piVar3);
    FUN_100046e0(piVar3[5],piVar3);
    piVar3[2] = -2;
    if (*(int *)(piVar3[4] + 8) == *(int *)(piVar3[5] + 8)) {
      piVar3[2] = *(int *)(piVar3[4] + 8);
    }
  }
  return;
}


