// 1006c34c size=27 FUN_1006c34c

undefined4 FUN_1006c34c(uint param_1)

{
  undefined4 uVar1;
  int in_ECX;
  
  if (param_1 < *(uint *)(in_ECX + 4)) {
    uVar1 = *(undefined4 *)(*(int *)(in_ECX + 0x10) + param_1 * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


