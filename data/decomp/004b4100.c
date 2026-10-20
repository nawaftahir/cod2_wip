
void __thiscall FUN_004b4100(int *param_1,undefined1 param_2)

{
  int iVar1;
  
  iVar1 = param_1[1];
  param_1[1] = iVar1 + 1;
  if (param_1[2] < iVar1 + 1) {
    FUN_004bf1c0(iVar1);
    *(undefined1 *)(iVar1 + *param_1) = param_2;
    return;
  }
  *(undefined1 *)(iVar1 + *param_1) = param_2;
  return;
}

