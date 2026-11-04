// 1007da77 size=33 FUN_1007da77

undefined4 FUN_1007da77(uint param_1)

{
  undefined4 uVar1;
  int in_ECX;
  
  if (param_1 < *(ushort *)(*(int *)(in_ECX + 0x18) + 10)) {
    uVar1 = *(undefined4 *)(*(int *)(in_ECX + 0x38) + param_1 * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


