// 100b9661 size=57 FUN_100b9661

int FUN_100b9661(uint param_1,uint param_2,int param_3)

{
  uint uVar1;
  uint uVar2;
  
  uVar1 = *(uint *)(*(int *)(*(int *)(param_3 + 0x10) + param_1 * 4) + 8);
  uVar2 = *(uint *)(*(int *)(*(int *)(param_3 + 0x10) + param_2 * 4) + 8);
  if (uVar2 <= uVar1) {
    if (uVar2 < uVar1) {
      return -1;
    }
    if (param_1 <= param_2) {
      return -(uint)(param_1 < param_2);
    }
  }
  return 1;
}


