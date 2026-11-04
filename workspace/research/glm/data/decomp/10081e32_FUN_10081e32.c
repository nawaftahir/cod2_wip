// 10081e32 size=104 FUN_10081e32

int FUN_10081e32(undefined4 param_1,undefined4 *param_2)

{
  int iVar1;
  void *pvVar2;
  int *extraout_ECX;
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
      FUN_10081d06();
      *extraout_ECX = (int)&PTR_FUN_1010ff18;
      piVar3 = extraout_ECX;
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


