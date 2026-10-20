
void FUN_00470a50(undefined4 *param_1)

{
  undefined4 *in_EAX;
  undefined4 *puVar1;
  
  *param_1 = 0x48000000;
  param_1[1] = 0x48000000;
  param_1[2] = 0x48000000;
  *in_EAX = 0xc8000000;
  in_EAX[1] = 0xc8000000;
  in_EAX[2] = 0xc8000000;
  puVar1 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      FUN_00487d50();
      puVar1 = (undefined4 *)puVar1[1];
    } while (puVar1 != &DAT_010a44b4);
  }
  return;
}

