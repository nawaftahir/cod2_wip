// 100c6123 size=64 FUN_100c6123

void FUN_100c6123(undefined4 param_1)

{
  int iVar1;
  int in_ECX;
  
  *(undefined4 *)(in_ECX + 0x15c) = 0;
  iVar1 = FUN_100c5bcc(0x80000,0xe0000,*(undefined4 *)(*(int *)(in_ECX + 0x100) + 8),0x80000,0,
                       param_1);
  if (-1 < iVar1) {
    FUN_100be137();
  }
  return;
}


