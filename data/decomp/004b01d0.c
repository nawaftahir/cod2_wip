
undefined4 FUN_004b01d0(int param_1,int param_2,char *param_3,int param_4)

{
  int iVar1;
  undefined4 uVar2;
  
  if (((param_3 == (char *)0x0) || (*param_3 != '1')) || (param_4 != 0x38)) {
    return 0xfffffffa;
  }
  if (param_1 == 0) {
    return 0xfffffffe;
  }
  *(undefined4 *)(param_1 + 0x18) = 0;
  if (*(int *)(param_1 + 0x20) == 0) {
    *(code **)(param_1 + 0x20) = FUN_004b3ca0;
    *(undefined4 *)(param_1 + 0x28) = 0;
  }
  if (*(int *)(param_1 + 0x24) == 0) {
    *(code **)(param_1 + 0x24) = FUN_004b3ce0;
  }
  iVar1 = (**(code **)(param_1 + 0x20))(*(undefined4 *)(param_1 + 0x28),1,0x18);
  *(int *)(param_1 + 0x1c) = iVar1;
  if (iVar1 != 0) {
    *(undefined4 *)(iVar1 + 0x14) = 0;
    *(undefined4 *)(*(int *)(param_1 + 0x1c) + 0xc) = 0;
    if (param_2 < 0) {
      param_2 = -param_2;
      *(undefined4 *)(*(int *)(param_1 + 0x1c) + 0xc) = 1;
    }
    if ((param_2 < 8) || (0xf < param_2)) {
      FUN_004b0180(param_1);
      return 0xfffffffe;
    }
    *(int *)(*(int *)(param_1 + 0x1c) + 0x10) = param_2;
    uVar2 = FUN_004ae9d0((*(int *)(*(int *)(param_1 + 0x1c) + 0xc) != 0) - 1 & 0x4acfc0);
    *(undefined4 *)(*(int *)(param_1 + 0x1c) + 0x14) = uVar2;
    if (*(int *)(*(int *)(param_1 + 0x1c) + 0x14) != 0) {
      FUN_004b0140();
      return 0;
    }
    FUN_004b0180(param_1);
  }
  return 0xfffffffc;
}

