// 10081d1e size=98 FUN_10081d1e

int FUN_10081d1e(undefined4 param_1,undefined4 *param_2)

{
  int iVar1;
  void *pvVar2;
  int *piVar3;
  
  if (param_2 == (undefined4 *)0x0) {
    iVar1 = -0x7789f794;
  }
  else {
    pvVar2 = operator_new(0x10);
    if (pvVar2 == (void *)0x0) {
      piVar3 = (int *)0x0;
    }
    else {
      piVar3 = (int *)FUN_10081d06();
    }
    if (piVar3 == (int *)0x0) {
      iVar1 = -0x7ff8fff2;
    }
    else {
      iVar1 = (**(code **)(*piVar3 + 0x18))(param_1);
      if (iVar1 < 0) {
        (**(code **)(*piVar3 + 0x14))(1);
      }
      else {
        *param_2 = piVar3;
        iVar1 = 0;
      }
    }
  }
  return iVar1;
}


