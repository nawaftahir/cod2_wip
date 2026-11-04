// 1002dc80 size=102 FUN_1002dc80

void FUN_1002dc80(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar1 = (*(code *)RI_Hunk_OverrideDataForFile)();
  iVar3 = 0;
  if (0 < iVar1) {
    do {
      iVar2 = (*(code *)RI_XModelPrecache)();
      iVar4 = 0;
      if (0 < iVar2) {
        do {
          FUN_1002db80();
          iVar4 = iVar4 + 1;
        } while (iVar4 < iVar2);
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar1);
  }
  return;
}


