
int __fastcall FUN_004b6580(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0x15c) == 0) {
    iVar1 = FUN_004c0fe0("P4LANGUAGE");
    if (iVar1 != 0) {
      *(undefined4 *)(param_1 + 0x15c) = 0;
      FUN_004bf280(iVar1);
    }
  }
  return param_1 + 0x158;
}

