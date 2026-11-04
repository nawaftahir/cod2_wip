


unsigned int FUN_10086899(int param_1,int param_2,int param_3)

{
  int iVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  
  iVar1 = *(int *)(*(int *)(param_3 + 0xbc) + 0x58);
  uVar3 = *(unsigned int *)(iVar1 + param_1 * 0xc);
  uVar2 = *(unsigned int *)(iVar1 + param_2 * 0xc);
  if (uVar2 < uVar3) {
    uVar3 = 0xffffffff;
  }
  else {
    uVar3 = (unsigned int)(uVar3 < uVar2);
  }
  return uVar3;
}


