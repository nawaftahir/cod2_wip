
int FUN_00491210(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = FUN_0048b7e0();
  for (iVar1 = (&DAT_01148e30)[iVar1]; iVar1 != 0; iVar1 = *(int *)(iVar1 + 0x20)) {
    iVar2 = FUN_004965d0();
    if (iVar2 == 0) goto LAB_00491249;
  }
  iVar1 = 0;
LAB_00491249:
  if (iVar1 == 0) {
    iVar1 = FUN_0048fa50();
    return iVar1;
  }
  FUN_00490cc0(iVar1,param_1);
  return iVar1;
}

