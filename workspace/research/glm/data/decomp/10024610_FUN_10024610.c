// 10024610 size=99 FUN_10024610

void FUN_10024610(void)

{
  int iVar1;
  int in_EAX;
  int iVar2;
  int iVar3;
  
  iVar1 = DAT_101ce654;
  *(undefined4 *)(in_EAX + 0xc) = 5;
  if (*(char *)(iVar1 + 8) != '\0') {
    iVar1 = *(int *)(in_EAX + 4);
    iVar2 = 0;
    if (0 < *(int *)(iVar1 + 0x18)) {
      iVar3 = *(int *)(iVar1 + 0x1c) * 0xc;
      do {
        FUN_10024380(*(undefined4 *)(*(int *)(DAT_101d1b9c + 0x14) + 8 + iVar3));
        iVar2 = iVar2 + 1;
        iVar3 = iVar3 + 0xc;
      } while (iVar2 < *(int *)(iVar1 + 0x18));
    }
  }
  return;
}


