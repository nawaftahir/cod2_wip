


unsigned int FUN_100cbb65(int param_1,int param_2,int param_3)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  uVar1 = *(unsigned int *)(*(int *)(param_3 + 0x3c) + param_1 * 4);
  uVar2 = *(unsigned int *)(*(int *)(param_3 + 0x3c) + param_2 * 4);
  if (*(unsigned int *)(*(int *)(param_3 + 0x2c) + uVar1 * 4) <=
      *(unsigned int *)(*(int *)(param_3 + 0x2c) + uVar2 * 4)) {
    if (*(unsigned int *)(*(int *)(param_3 + 0x2c) + uVar1 * 4) <
        *(unsigned int *)(*(int *)(param_3 + 0x2c) + uVar2 * 4)) {
      return 1;
    }
    if (uVar2 <= uVar1) {
      return (unsigned int)(uVar2 < uVar1);
    }
  }
  return 0xffffffff;
}


