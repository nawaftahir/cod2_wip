// 10009700 size=58 FUN_10009700

undefined4 FUN_10009700(void)

{
  int iVar1;
  char cVar2;
  int iVar3;
  
  iVar1 = DAT_101ce5c0;
  iVar3 = 0;
  if (0 < DAT_101ce5c0) {
    do {
      cVar2 = FUN_10007e80();
      if (cVar2 != '\0') {
        return 1;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar1);
  }
  return 0;
}


