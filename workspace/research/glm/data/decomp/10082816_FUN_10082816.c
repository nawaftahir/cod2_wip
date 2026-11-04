// 10082816 size=25 FUN_10082816

undefined4 FUN_10082816(int *param_1)

{
  undefined4 uVar1;
  
  if (param_1 == (int *)0x0) {
    uVar1 = 0;
  }
  else {
    uVar1 = (**(code **)(*param_1 + 4))();
  }
  return uVar1;
}


