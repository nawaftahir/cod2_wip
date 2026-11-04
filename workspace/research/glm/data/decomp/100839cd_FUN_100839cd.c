// 100839cd size=65 FUN_100839cd

void FUN_100839cd(void)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_1006506e(0x24);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10082e0f();
  }
  if (iVar1 == 0) {
    return;
  }
  *(undefined4 *)(iVar1 + 0x10) = *(undefined4 *)(in_ECX + 0x10);
  *(undefined4 *)(iVar1 + 0x14) = *(undefined4 *)(in_ECX + 0x14);
  *(undefined4 *)(iVar1 + 0x18) = *(undefined4 *)(in_ECX + 0x18);
  *(undefined4 *)(iVar1 + 0x1c) = *(undefined4 *)(in_ECX + 0x1c);
  *(undefined4 *)(iVar1 + 0x20) = *(undefined4 *)(in_ECX + 0x20);
  return;
}


