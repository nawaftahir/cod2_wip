// 10003ee0 size=158 FUN_10003ee0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10003ee0(int *param_1)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  
  iVar2 = FUN_10001940();
  iVar6 = *(int *)(*param_1 + 0xbc);
  iVar1 = param_1[1];
  DAT_101ae4a0 = (*(code *)RI_Hunk_AllocInternal)(iVar2 * 0x30);
  _DAT_101ae4a4 = iVar2;
  if (0 < iVar2) {
    piVar4 = (int *)(iVar6 + iVar1 + 8);
    piVar3 = (int *)(DAT_101ae4a0 + 0x18);
    iVar6 = iVar2;
    do {
      iVar1 = piVar4[-1];
      if (iVar1 == 0) {
        iVar5 = -1;
      }
      else {
        iVar5 = piVar4[-2];
      }
      piVar3[1] = iVar5;
      *piVar3 = iVar1;
      piVar3[4] = *piVar4;
      piVar4 = piVar4 + 3;
      piVar3 = piVar3 + 0xc;
      iVar6 = iVar6 + -1;
    } while (iVar6 != 0);
  }
  iVar6 = 0;
  if (0 < iVar2) {
    do {
      iVar6 = FUN_10003d40(iVar6 * 0x30 + DAT_101ae4a0,iVar6 + 1);
    } while (iVar6 < iVar2);
  }
  return;
}


