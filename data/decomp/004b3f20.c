
void FUN_004b3f20(int *param_1)

{
  int *piVar1;
  int iVar2;
  
  iVar2 = *param_1;
  while (iVar2 != 0) {
    _printf("%s\n",iVar2);
    piVar1 = param_1 + 1;
    param_1 = param_1 + 1;
    iVar2 = *piVar1;
  }
  return;
}

