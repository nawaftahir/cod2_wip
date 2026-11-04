// 100827f5 size=33 FUN_100827f5

uint FUN_100827f5(undefined4 *param_1,int param_2)

{
  uint uVar1;
  
  if (param_1 == (undefined4 *)0x0) {
    uVar1 = (uint)(param_2 == 0);
  }
  else {
    uVar1 = (**(code **)*param_1)(param_2);
  }
  return uVar1;
}


