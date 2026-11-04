// 1002a200 size=69 FUN_1002a200

void FUN_1002a200(void)

{
  int iVar1;
  int iVar2;
  int in_EAX;
  int in_ECX;
  int unaff_ESI;
  
  iVar1 = *(int *)(in_EAX * 0x3c + *(int *)(unaff_ESI + 0x100) + 0x1c);
  iVar2 = *(int *)(iVar1 + 0x20);
  if ((iVar2 == 0) ||
     (*(int *)(*(int *)(iVar1 + 0x24) + -4 + iVar2 * 4) !=
      (in_ECX - *(int *)(unaff_ESI + 0xf8)) / 0x60)) {
    FUN_1002a010();
  }
  return;
}


