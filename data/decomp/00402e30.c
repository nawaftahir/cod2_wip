
void __thiscall FUN_00402e30(int *param_1,undefined4 param_2)

{
  int iVar1;
  
  iVar1 = (**(code **)(**(int **)(*param_1 + -0x10) + 8))(*param_1 + -0x10,param_2,1);
  if (iVar1 == 0) {
    iVar1 = FUN_00402e20();
  }
  *param_1 = iVar1 + 0x10;
  return;
}

