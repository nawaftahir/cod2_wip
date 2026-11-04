
int __fastcall FUN_004b61a0(int param_1)

{
  undefined4 uVar1;
  
  if (*(int *)(param_1 + 300) != 0) {
    return param_1 + 0x128;
  }
  uVar1 = FUN_004c3cc0();
  *(undefined4 *)(param_1 + 300) = 0;
  FUN_004bf280(uVar1);
  return param_1 + 0x128;
}

