
int __fastcall FUN_004b64b0(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0xfc) == 0) {
    iVar1 = FUN_004c0fe0("P4CHARSET");
    if (iVar1 != 0) {
      *(undefined4 *)(param_1 + 0xfc) = 0;
      FUN_004bf280(iVar1);
    }
  }
  return param_1 + 0xf8;
}

