
int * __thiscall FUN_00423f40(int *param_1,int *param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  if (param_3 < 0) {
    param_3 = 0;
  }
  iVar2 = *param_1;
  iVar1 = *(int *)(iVar2 + -0xc);
  if (iVar1 <= param_3) {
    iVar2 = FUN_0041f340(iVar2 + -0x10);
    *param_2 = iVar2 + 0x10;
    return param_2;
  }
  uVar3 = (**(code **)(**(int **)(iVar2 + -0x10) + 0x10))();
  FUN_00424020((iVar2 - param_3) + iVar1,param_3,uVar3);
  return param_2;
}

