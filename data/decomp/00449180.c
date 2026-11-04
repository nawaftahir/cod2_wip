
void __fastcall FUN_00449180(undefined4 param_1,undefined4 *param_2,int *param_3)

{
  undefined4 *in_EAX;
  int iVar1;
  
  *param_2 = 0x48000000;
  param_2[1] = 0x48000000;
  param_2[2] = 0x48000000;
  *in_EAX = 0xc8000000;
  in_EAX[1] = 0xc8000000;
  in_EAX[2] = 0xc8000000;
  iVar1 = 0;
  if (0 < *param_3) {
    do {
      FUN_00487910();
      iVar1 = iVar1 + 1;
    } while (iVar1 < *param_3);
  }
  return;
}

