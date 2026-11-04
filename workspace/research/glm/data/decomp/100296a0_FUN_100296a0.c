// 100296a0 size=73 FUN_100296a0

int FUN_100296a0(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  iVar1 = (*(code *)RI_Hunk_OverrideDataForFile)();
  iVar3 = 0;
  if (0 < iVar1) {
    do {
      iVar2 = (*(code *)RI_XModelPrecache)();
      if (iVar4 < iVar2) {
        iVar4 = iVar2;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar1);
  }
  return iVar4;
}


