
void __thiscall FUN_004b9620(int *param_1,int *param_2)

{
  int *piVar1;
  
  if (param_1[5] == 0) {
    (**(code **)(*param_1 + 0x30))(0,0,0);
  }
  piVar1 = param_2;
  (**(code **)(*(int *)param_1[0x13] + 4))(param_2);
  FUN_004c0250(*param_2);
  FUN_004c0250(*param_2);
  FUN_004c0250(*param_2);
  (**(code **)(*(int *)param_1[0x14] + 0x10))(1,param_2);
  if (*param_2 < 2) {
    *(undefined4 *)(param_1[0x16] + 8) = 1;
    (**(code **)(*(int *)param_1[0x15] + 0x10))(1,param_2);
    (**(code **)(*(int *)param_1[0x16] + 0x10))(1,param_2);
    (**(code **)(*(int *)param_1[0x14] + 0xc))(piVar1);
    (**(code **)(*(int *)param_1[0x15] + 0xc))(piVar1);
    (**(code **)(*(int *)param_1[0x16] + 0xc))(piVar1);
    param_1[0x26] = 0;
    param_1[0x25] = 0;
    param_1[0x24] = 0;
    param_1[0x23] = 0;
    param_1[0x27] = 0;
    param_1[0x28] = 0;
    param_1[0x2a] = 0;
  }
  return;
}

