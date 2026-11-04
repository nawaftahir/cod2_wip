
void FUN_004b7a80(undefined4 param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = FUN_004be490("confirm",param_2);
  iVar2 = FUN_004be450("decline");
  iVar3 = FUN_004be450("handle");
  if (*param_2 < 2) {
    if (iVar3 != 0) {
      iVar3 = FUN_004c24d0(iVar3);
      if (iVar3 != 0) {
        iVar1 = iVar2;
      }
    }
    if (iVar1 != 0) {
      FUN_004b5740(iVar1);
    }
  }
  return;
}

