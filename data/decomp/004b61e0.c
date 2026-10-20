
int __fastcall FUN_004b61e0(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0x138) != 0) {
    return param_1 + 0x134;
  }
  iVar1 = FUN_004c0fe0("P4PORT");
  *(undefined4 *)(param_1 + 0x138) = 0;
  if (iVar1 != 0) {
    FUN_004bf280(iVar1);
    return param_1 + 0x134;
  }
  FUN_004bf280("perforce:1666");
  return param_1 + 0x134;
}

