// 100cbb65 size=71 FUN_100cbb65

uint FUN_100cbb65(int param_1,int param_2,int param_3)

{
  uint uVar1;
  uint uVar2;
  
  uVar1 = *(uint *)(*(int *)(param_3 + 0x3c) + param_1 * 4);
  uVar2 = *(uint *)(*(int *)(param_3 + 0x3c) + param_2 * 4);
  if (*(uint *)(*(int *)(param_3 + 0x2c) + uVar1 * 4) <=
      *(uint *)(*(int *)(param_3 + 0x2c) + uVar2 * 4)) {
    if (*(uint *)(*(int *)(param_3 + 0x2c) + uVar1 * 4) <
        *(uint *)(*(int *)(param_3 + 0x2c) + uVar2 * 4)) {
      return 1;
    }
    if (uVar2 <= uVar1) {
      return (uint)(uVar2 < uVar1);
    }
  }
  return 0xffffffff;
}


