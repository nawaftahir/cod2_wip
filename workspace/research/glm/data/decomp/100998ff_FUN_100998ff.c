// 100998ff size=20 FUN_100998ff

undefined4 FUN_100998ff(void)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = *(int *)(in_ECX + 0x14);
  if (iVar1 != 0) {
    *(undefined4 *)(in_ECX + 0x14) = *(undefined4 *)(iVar1 + 0xc);
    *(undefined4 *)(iVar1 + 0xc) = 0;
  }
  return 0;
}


