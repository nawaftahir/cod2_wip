
void __thiscall FUN_00402d30(int *param_1,int param_2)

{
  int iVar1;
  
  iVar1 = *param_1;
  if (param_2 < *(int *)(iVar1 + -0xc)) {
    param_2 = *(int *)(iVar1 + -0xc);
  }
  if (1 < *(int *)(iVar1 + -4)) {
    FUN_00402d90(param_2);
    return;
  }
  iVar1 = *(int *)(iVar1 + -8);
  if (iVar1 < param_2) {
    if (iVar1 < 0x401) {
      iVar1 = iVar1 * 2;
    }
    else {
      iVar1 = iVar1 + 0x400;
    }
    if (iVar1 < param_2) {
      iVar1 = param_2;
    }
    FUN_00402e30(iVar1);
  }
  return;
}

