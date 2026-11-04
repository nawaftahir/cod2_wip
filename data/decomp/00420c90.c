
int __thiscall FUN_00420c90(int *param_1,uint param_2)

{
  if (0x80 < param_2) {
    FUN_00420dd0(param_2);
    return *param_1;
  }
  *param_1 = (int)(param_1 + 1);
  return (int)(param_1 + 1);
}

