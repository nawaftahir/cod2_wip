extern int FUN_100827da();
extern int FUN_100827f5();


unsigned int FUN_1008289e(int param_1)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  int extraout_ECX;
  
  iVar1 = FUN_100827da(param_1);
  uVar3 = 0;
  iVar2 = extraout_ECX;
  if (iVar1 != 0) {
    for (; iVar2 != 0; iVar2 = *(int *)(iVar2 + 0xc)) {
      if (*(int *)(iVar2 + 4) != 1) {
        iVar2 = FUN_100827f5(iVar2,param_1);
        if (iVar2 == 0) {
          return 0;
        }
        break;
      }
      if (param_1 == 0) {
        return 0;
      }
      if (*(int *)(param_1 + 4) != 1) {
        return 0;
      }
      iVar1 = FUN_100827f5(*(unsigned int *)(iVar2 + 8),*(unsigned int *)(param_1 + 8));
      if (iVar1 == 0) {
        return 0;
      }
      param_1 = *(int *)(param_1 + 0xc);
    }
    uVar3 = 1;
  }
  return uVar3;
}


