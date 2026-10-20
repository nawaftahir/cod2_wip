
void __fastcall FUN_0042a040(int param_1)

{
  undefined4 unaff_ESI;
  
  if (((DAT_010c4d84 != 0) && (*(int *)(param_1 + 0x3828) == *(int *)(DAT_010a44b8 + 0x14))) &&
     (DAT_010a44b4 != DAT_010a44b8)) {
    _memmove(&DAT_010c4d8c,&DAT_010c4d88,DAT_010c4d84 << 2);
    DAT_010c4d88 = unaff_ESI;
    DAT_010c4d84 = DAT_010c4d84 + 1;
    return;
  }
  (&DAT_010c4d88)[DAT_010c4d84] = unaff_ESI;
  DAT_010c4d84 = DAT_010c4d84 + 1;
  return;
}

