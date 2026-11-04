
uint FUN_004adac0(int param_1)

{
  int iVar1;
  int iVar2;
  
  if ((param_1 == 0) || (iVar1 = *(int *)(param_1 + 0x1c), iVar1 == 0)) {
    return 0xfffffffe;
  }
  iVar2 = *(int *)(iVar1 + 4);
  if (((iVar2 != 0x2a) && (iVar2 != 0x71)) && (iVar2 != 0x29a)) {
    return 0xfffffffe;
  }
  if (*(int *)(iVar1 + 8) != 0) {
    (**(code **)(param_1 + 0x24))(*(undefined4 *)(param_1 + 0x28),*(int *)(iVar1 + 8));
  }
  iVar1 = *(int *)(*(int *)(param_1 + 0x1c) + 0x3c);
  if (iVar1 != 0) {
    (**(code **)(param_1 + 0x24))(*(undefined4 *)(param_1 + 0x28),iVar1);
  }
  iVar1 = *(int *)(*(int *)(param_1 + 0x1c) + 0x38);
  if (iVar1 != 0) {
    (**(code **)(param_1 + 0x24))(*(undefined4 *)(param_1 + 0x28),iVar1);
  }
  iVar1 = *(int *)(*(int *)(param_1 + 0x1c) + 0x30);
  if (iVar1 != 0) {
    (**(code **)(param_1 + 0x24))(*(undefined4 *)(param_1 + 0x28),iVar1);
  }
  (**(code **)(param_1 + 0x24))(*(undefined4 *)(param_1 + 0x28),*(undefined4 *)(param_1 + 0x1c));
  *(undefined4 *)(param_1 + 0x1c) = 0;
  return (iVar2 != 0x71) - 1 & 0xfffffffd;
}

