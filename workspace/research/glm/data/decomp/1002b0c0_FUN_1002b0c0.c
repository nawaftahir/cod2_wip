// 1002b0c0 size=764 FUN_1002b0c0

void FUN_1002b0c0(void)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  
  iVar1 = 0;
  if (3 < in_EAX) {
    iVar2 = (in_EAX - 4U >> 2) + 1;
    iVar1 = iVar2 * 4;
    do {
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  if (iVar1 < in_EAX) {
    iVar1 = in_EAX - iVar1;
    do {
      iVar1 = iVar1 + -1;
    } while (iVar1 != 0);
  }
  FUN_1000f180();
  return;
}


