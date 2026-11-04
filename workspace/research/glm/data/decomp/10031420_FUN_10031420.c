// 10031420 size=70 FUN_10031420

void FUN_10031420(int *param_1)

{
  if (DAT_1072debd != '\0') {
    FUN_10030de0();
    *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
    return;
  }
  FUN_10031070(*param_1);
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


