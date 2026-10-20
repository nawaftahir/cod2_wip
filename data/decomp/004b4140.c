
void __fastcall FUN_004b4140(int *param_1)

{
  int iVar1;
  
  iVar1 = param_1[1];
  param_1[1] = iVar1 + 1;
  if (param_1[2] < iVar1 + 1) {
    FUN_004bf1c0(iVar1);
  }
  *(undefined1 *)(iVar1 + *param_1) = 0;
  param_1[1] = param_1[1] + -1;
  return;
}

