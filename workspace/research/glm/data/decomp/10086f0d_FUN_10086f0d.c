// 10086f0d size=59 FUN_10086f0d

undefined4 FUN_10086f0d(int param_1)

{
  byte *pbVar1;
  int in_ECX;
  
  if (param_1 != -1) {
    do {
      pbVar1 = *(byte **)(*(int *)(in_ECX + 0x14) + param_1 * 4);
      if (((*pbVar1 & 0x20) != 0) ||
         ((*(int *)(pbVar1 + 0x38) != -1 &&
          ((**(byte **)(*(int *)(in_ECX + 0x14) + *(int *)(pbVar1 + 0x38) * 4) & 0x20) != 0)))) {
        return 1;
      }
      param_1 = *(int *)(pbVar1 + 8);
    } while (param_1 != -1);
  }
  return 0;
}


