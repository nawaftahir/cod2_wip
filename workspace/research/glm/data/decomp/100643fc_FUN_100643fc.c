// 100643fc size=88 FUN_100643fc

undefined4 FUN_100643fc(void)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = *(int *)(*(int *)(in_ECX + 0x268) + 0x38);
  if (iVar1 == 0) {
    FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0x5e6,"unexpected #endif");
    *(undefined4 *)(in_ECX + 0x44) = 1;
    return 0x80004005;
  }
  *(undefined4 *)(in_ECX + 0x54) = *(undefined4 *)(iVar1 + 4);
  *(undefined4 *)(*(int *)(in_ECX + 0x268) + 0x38) = *(undefined4 *)(iVar1 + 0xc);
  *(undefined4 *)(iVar1 + 0xc) = 0;
  FUN_10063a76(1);
  return 0;
}


