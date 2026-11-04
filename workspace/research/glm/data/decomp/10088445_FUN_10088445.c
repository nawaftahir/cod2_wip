// 10088445 size=45 FUN_10088445

undefined4 FUN_10088445(int param_1,int param_2)

{
  undefined4 uVar1;
  int in_ECX;
  
  if ((param_1 == param_2) ||
     ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4) + 0x40) &
      *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4) + 0x40)) != 0)) {
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


