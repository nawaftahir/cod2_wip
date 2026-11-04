// 1003c050 size=96 FUN_1003c050

void FUN_1003c050(void)

{
  int iVar1;
  int in_EAX;
  int iVar2;
  
  iVar1 = DAT_101ce684;
  iVar2 = *(int *)(&DAT_1076459c + in_EAX * 0x30);
  if ((iVar2 == 0) || (DAT_1072ddb8 < iVar2)) {
    iVar2 = 10;
  }
  else {
    iVar2 = DAT_1072ddb8 - iVar2;
  }
  *(int *)(&DAT_1076459c + in_EAX * 0x30) = DAT_1072ddb8;
  if ((*(char *)(iVar1 + 8) != '\0') && (*(char *)(DAT_101d1b9c + 0x160) != '\0')) {
    FUN_1003bce0(iVar2);
    FUN_1003bf60();
  }
  return;
}


