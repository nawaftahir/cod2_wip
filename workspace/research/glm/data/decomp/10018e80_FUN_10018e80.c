// 10018e80 size=84 FUN_10018e80

int FUN_10018e80(void)

{
  char cVar1;
  int iVar2;
  int in_ECX;
  
  cVar1 = FUN_10016ab0();
  if ((cVar1 == '\0') || (iVar2 = (&DAT_101da3dc)[in_ECX], iVar2 == 0)) {
    iVar2 = FUN_10018d60();
    if (iVar2 == 0) {
      return 0;
    }
    FUN_10016ab0();
    (&DAT_101da3dc)[in_ECX] = iVar2;
  }
  return iVar2;
}


