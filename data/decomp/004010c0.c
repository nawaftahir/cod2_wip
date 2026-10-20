
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004010c0(float param_1,float param_2)

{
  int lParam;
  float *pfVar1;
  uint uVar2;
  
  uVar2 = 0;
  pfVar1 = (float *)&DAT_0058fb90;
  do {
    if (pfVar1[-4] == param_1) {
      if (param_2 < pfVar1[-1] == (param_2 == pfVar1[-1])) {
        if (*pfVar1 <= param_2) {
          param_2 = *pfVar1;
        }
      }
      else {
        param_2 = pfVar1[-1];
      }
      FUN_004d7630((double)((param_2 - pfVar1[-1]) / pfVar1[1] + _DAT_00556b30));
      lParam = FUN_004df760();
      pfVar1[-2] = (float)lParam * pfVar1[1] + pfVar1[-1];
      if ((HWND)pfVar1[2] != (HWND)0x0) {
        SendMessageA((HWND)pfVar1[2],0x405,1,lParam);
      }
      FUN_00401000();
    }
    uVar2 = uVar2 + 1;
    pfVar1 = pfVar1 + 8;
  } while (uVar2 < 3);
  return;
}

