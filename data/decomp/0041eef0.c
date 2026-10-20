
void __thiscall FUN_0041eef0(int param_1,undefined4 *param_2)

{
  if (*(char *)(param_1 + 0x3c) != '\0') {
    *(undefined4 *)(param_1 + 0x40) = *param_2;
    *(undefined4 *)(param_1 + 0x44) = param_2[1];
    *(undefined4 *)(param_1 + 0x48) = param_2[2];
    *(undefined1 *)(param_1 + 0x3c) = 0;
    return;
  }
  *(undefined4 *)(param_1 + 0x4c) = *param_2;
  *(undefined4 *)(param_1 + 0x50) = param_2[1];
  *(undefined4 *)(param_1 + 0x54) = param_2[2];
  *(undefined1 *)(param_1 + 0x3c) = 1;
  return;
}

