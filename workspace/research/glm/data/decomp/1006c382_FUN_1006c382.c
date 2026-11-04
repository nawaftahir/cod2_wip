// 1006c382 size=27 FUN_1006c382

undefined4 FUN_1006c382(uint param_1)

{
  undefined4 uVar1;
  int in_ECX;
  
  if (param_1 < *(uint *)(in_ECX + 0xc)) {
    uVar1 = *(undefined4 *)(*(int *)(in_ECX + 0x18) + param_1 * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


