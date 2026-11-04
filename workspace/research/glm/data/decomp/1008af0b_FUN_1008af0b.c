// 1008af0b size=25 FUN_1008af0b

undefined4 FUN_1008af0b(void)

{
  uint uVar1;
  int in_ECX;
  
  uVar1 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar1 * 4) + 0x30) = uVar1;
      uVar1 = uVar1 + 1;
    } while (uVar1 < *(uint *)(in_ECX + 8));
  }
  return 0;
}


