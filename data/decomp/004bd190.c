
int __fastcall FUN_004bd190(int param_1)

{
  int iVar1;
  undefined4 uStack_8;
  
  iVar1 = Ordinal_5(*(undefined4 *)(param_1 + 4));
  if ((-1 < iVar1) && (&stack0x00000000 == (undefined1 *)0x20)) {
    FUN_004bcfc0(4,uStack_8,param_1 + 0x18);
    return param_1 + 0x18;
  }
  *(undefined4 *)(param_1 + 0x1c) = 0;
  FUN_004bf280("unknown");
  return param_1 + 0x18;
}

