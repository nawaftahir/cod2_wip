// 10099913 size=12 FUN_10099913

undefined4 FUN_10099913(void)

{
  int in_ECX;
  
  if (*(int *)(in_ECX + 0x14) == 0) {
    return 0;
  }
  return *(undefined4 *)(*(int *)(in_ECX + 0x14) + 8);
}


