
void FUN_004b42e0(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  param_1[1] = 0;
  do {
    iVar3 = param_1[1];
    param_1[1] = iVar3 + 0x1000;
    if (param_1[2] < iVar3 + 0x1000) {
      FUN_004bf1c0(iVar3);
    }
    iVar1 = *param_1;
    iVar2 = __read(0,(void *)(iVar1 + iVar3),0x1000);
    iVar3 = iVar1 + iVar3 + (iVar2 - *param_1);
    param_1[1] = iVar3;
  } while (0 < iVar2);
  param_1[1] = iVar3 + 1;
  if (param_1[2] < iVar3 + 1) {
    FUN_004bf1c0(iVar3);
  }
  *(undefined1 *)(iVar3 + *param_1) = 0;
  param_1[1] = param_1[1] + -1;
  return;
}

