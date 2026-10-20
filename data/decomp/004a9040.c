
void __thiscall FUN_004a9040(int param_1,byte param_2)

{
  if ((param_2 & *(byte *)(param_1 + 1)) == 0) {
    *(byte *)(param_1 + 1) = *(byte *)(param_1 + 1) | param_2;
    *(short *)(param_1 + 2) = *(short *)(param_1 + 2) + 1;
  }
  return;
}

