
int * FUN_004b2e30(undefined4 param_1)

{
  int iVar1;
  int *piVar2;
  
  iVar1 = FUN_004d8616();
  if (iVar1 == 0) {
    return (int *)0x0;
  }
  piVar2 = _malloc(0x80);
  FUN_0048b3e0(piVar2,param_1,0x80);
  *piVar2 = iVar1;
  piVar2[0x1f] = 0;
  return piVar2;
}

