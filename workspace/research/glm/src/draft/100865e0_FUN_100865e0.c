


unsigned int FUN_100865e0(unsigned int param_1,unsigned int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(*(int *)(*(int *)(param_3 + 0x18) + param_1 * 4) + 0x30);
  iVar2 = *(int *)(*(int *)(*(int *)(param_3 + 0x18) + param_2 * 4) + 0x30);
  if (iVar2 <= iVar1) {
    if (iVar2 < iVar1) {
      return 1;
    }
    if (param_2 <= param_1) {
      return (unsigned int)(param_2 < param_1);
    }
  }
  return 0xffffffff;
}


