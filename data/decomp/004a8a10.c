
int __fastcall FUN_004a8a10(char *param_1,uint param_2)

{
  uint uVar1;
  
  if (param_2 < 0x100) {
    uVar1 = 0;
    if (param_2 != 0) {
      do {
        uVar1 = uVar1 * 0x1f + (int)*param_1;
        param_1 = param_1 + 1;
        param_2 = param_2 - 1;
      } while (param_2 != 0);
      return uVar1 % 0x3fff + 1;
    }
  }
  else {
    uVar1 = param_2 >> 2;
  }
  return uVar1 % 0x3fff + 1;
}

