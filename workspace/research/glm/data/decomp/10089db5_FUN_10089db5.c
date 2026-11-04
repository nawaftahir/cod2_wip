// 10089db5 size=83 FUN_10089db5

undefined4 FUN_10089db5(int param_1,int param_2)

{
  undefined4 uVar1;
  int in_ECX;
  
  param_2 = param_2 * 4;
  param_1 = param_1 * 4;
  if (((*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1) + 4) ==
        *(int *)(*(int *)(param_2 + *(int *)(in_ECX + 0x14)) + 4)) &&
      (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1) + 8) ==
       *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2) + 8))) &&
     (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1) + 0xc) ==
      *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2) + 0xc))) {
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


