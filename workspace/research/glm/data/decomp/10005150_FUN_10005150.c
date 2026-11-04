// 10005150 size=135 FUN_10005150

void FUN_10005150(uint *param_1)

{
  int in_EAX;
  undefined4 uVar1;
  
  if ((in_EAX == 1) || (in_EAX == 3)) {
    uVar1 = 2;
  }
  else {
    uVar1 = 0;
  }
  (*(code *)RI_Printf)(uVar1,"Video card or driver %s.\n");
  if (in_EAX == 0) {
    FUN_100138c0(0,"Video card or driver %s.\n");
  }
  else {
    if (in_EAX == 3) {
      *param_1 = *param_1 & 0xfffffffb;
      (*(code *)RI_Printf)(uVar1,"  DirectX 7 rendering path will not be available.\n");
      return;
    }
    if (in_EAX == 4) {
      *param_1 = *param_1 & 0xfffffffd;
      (*(code *)RI_Printf)(uVar1,"  DirectX 9 rendering path will not be available.\n");
      return;
    }
  }
  return;
}


