// 10086c69 size=31 FUN_10086c69

undefined4 FUN_10086c69(int param_1)

{
  undefined4 uVar1;
  int in_ECX;
  
  if (param_1 == -1) {
    uVar1 = 0xffffffff;
  }
  else {
    uVar1 = *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4) + 0x30);
  }
  return uVar1;
}


