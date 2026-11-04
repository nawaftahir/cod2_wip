


unsigned int FUN_100868f2(int param_1,int param_2,int param_3)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  uVar2 = *(unsigned int *)(*(int *)(*(int *)(param_3 + 0x14) + param_1 * 4) + 0x40);
  uVar1 = *(unsigned int *)(*(int *)(*(int *)(param_3 + 0x14) + param_2 * 4) + 0x40);
  if (uVar2 < uVar1) {
    uVar2 = 0xffffffff;
  }
  else {
    uVar2 = (unsigned int)(uVar1 < uVar2);
  }
  return uVar2;
}


