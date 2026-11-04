// 10081a50 size=37 FUN_10081a50

int FUN_10081a50(int *param_1)

{
  int iVar1;
  int iVar2;
  
  iVar2 = param_1[1];
  iVar1 = iVar2 + -1;
  param_1[1] = iVar1;
  if (iVar2 == 1) {
    (**(code **)(*param_1 + 0x14))(1);
  }
  return iVar1;
}


