// 1001bde0 size=101 FUN_1001bde0

int FUN_1001bde0(void)

{
  char cVar1;
  int iVar2;
  int in_ECX;
  
  cVar1 = FUN_100168e0();
  if ((cVar1 == '\0') || (iVar2 = (&DAT_101d92d4)[in_ECX], iVar2 == 0)) {
    if (*(int *)(DAT_101ce708 + 8) == 2) {
      iVar2 = FUN_1001ba70();
      if (iVar2 == 0) {
        return 0;
      }
    }
    else {
      iVar2 = FUN_1001b810();
      if (iVar2 == 0) {
        return 0;
      }
    }
    FUN_10016960(iVar2);
  }
  return iVar2;
}


