
void FUN_00455cb0(void)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  
  iVar1 = 0;
  if (0 < *(int *)(in_EAX + 0x38)) {
    iVar2 = 0;
    do {
      if (*(int *)(*(int *)(in_EAX + 0x3c) + 0xa0 + iVar2) == 0) {
        FUN_00455bd0(iVar1);
      }
      else {
        iVar1 = iVar1 + 1;
        iVar2 = iVar2 + 0xa8;
      }
    } while (iVar1 < *(int *)(in_EAX + 0x38));
  }
  return;
}

