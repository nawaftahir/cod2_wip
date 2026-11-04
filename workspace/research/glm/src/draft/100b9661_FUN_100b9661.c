


int FUN_100b9661(unsigned int param_1,unsigned int param_2,int param_3)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  uVar1 = *(unsigned int *)(*(int *)(*(int *)(param_3 + 0x10) + param_1 * 4) + 8);
  uVar2 = *(unsigned int *)(*(int *)(*(int *)(param_3 + 0x10) + param_2 * 4) + 8);
  if (uVar2 <= uVar1) {
    if (uVar2 < uVar1) {
      return -1;
    }
    if (param_1 <= param_2) {
      return -(unsigned int)(param_1 < param_2);
    }
  }
  return 1;
}


