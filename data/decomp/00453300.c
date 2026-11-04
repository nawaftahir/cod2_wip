
int * __thiscall FUN_00453300(int *param_1,int *param_2,int param_3)

{
  int iVar1;
  undefined4 uVar2;
  
  if (param_3 < 0) {
    param_3 = 0;
  }
  iVar1 = *param_1;
  if (*(int *)(iVar1 + -0xc) <= param_3) {
    iVar1 = FUN_0041f340(iVar1 + -0x10);
    *param_2 = iVar1 + 0x10;
    return param_2;
  }
  uVar2 = (**(code **)(**(int **)(iVar1 + -0x10) + 0x10))();
  FUN_00424020(iVar1,param_3,uVar2);
  return param_2;
}

