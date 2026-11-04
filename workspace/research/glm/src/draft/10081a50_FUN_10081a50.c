


int FUN_10081a50(int *param_1)

{
  int iVar1;
  int iVar2;
  
  iVar2 = param_1[1];
  iVar1 = iVar2 + -1;
  param_1[1] = iVar1;
  if (iVar2 == 1) {
    (**(void **)(*param_1 + 0x14))(1);
  }
  return iVar1;
}


