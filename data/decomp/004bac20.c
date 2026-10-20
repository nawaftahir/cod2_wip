
void __thiscall FUN_004bac20(int param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  
  if (*(undefined4 **)(param_1 + 8) != (undefined4 *)0x0) {
    (**(code **)**(undefined4 **)(param_1 + 8))(1);
  }
  uVar1 = FUN_004bc790(param_2,param_3);
  *(undefined4 *)(param_1 + 8) = uVar1;
  return;
}

