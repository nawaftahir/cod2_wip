// 10086899 size=56 FUN_10086899

uint FUN_10086899(int param_1,int param_2,int param_3)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  
  iVar1 = *(int *)(*(int *)(param_3 + 0xbc) + 0x58);
  uVar3 = *(uint *)(iVar1 + param_1 * 0xc);
  uVar2 = *(uint *)(iVar1 + param_2 * 0xc);
  if (uVar2 < uVar3) {
    uVar3 = 0xffffffff;
  }
  else {
    uVar3 = (uint)(uVar3 < uVar2);
  }
  return uVar3;
}


