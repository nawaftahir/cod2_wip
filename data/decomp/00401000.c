
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00401000(uint param_1)

{
  float10 fVar1;
  double dVar2;
  char local_48 [64];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  if (((-1 < (int)param_1) && (param_1 < 3)) && ((&DAT_0058fb9c)[param_1 * 8] != 0)) {
    if ((&DAT_0058fb80)[param_1 * 8] == 0x592) {
      fVar1 = (float10)FUN_00401c20();
      dVar2 = (double)fVar1;
    }
    else {
      dVar2 = (double)(float)(&DAT_0058fb88)[param_1 * 8];
    }
    _sprintf(local_48,"%g",dVar2);
    SetWindowTextA((HWND)(&DAT_0058fb9c)[param_1 * 8],local_48);
    DAT_0123348c = DAT_0123348c | 1;
  }
  return;
}

