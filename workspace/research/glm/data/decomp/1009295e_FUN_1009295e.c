// 1009295e size=47 FUN_1009295e

int FUN_1009295e(undefined4 param_1,int param_2)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4) + 0x14);
  if ((iVar1 != -1) && (iVar1 = FUN_10092696(param_1,iVar1,0,0xffffffff,0xffffffff), iVar1 < 0)) {
    return iVar1;
  }
  return 0;
}


