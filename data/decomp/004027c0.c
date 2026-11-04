
int * __fastcall FUN_004027c0(int *param_1)

{
  int *piVar1;
  int iVar2;
  
  piVar1 = (int *)FUN_004ff4c3();
  iVar2 = (**(code **)(*piVar1 + 0xc))();
  *param_1 = iVar2 + 0x10;
  return param_1;
}

