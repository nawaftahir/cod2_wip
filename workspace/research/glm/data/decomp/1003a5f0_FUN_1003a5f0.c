// 1003a5f0 size=153 FUN_1003a5f0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003a5f0(undefined4 param_1)

{
  undefined4 uVar1;
  undefined4 unaff_ESI;
  undefined4 *unaff_EDI;
  
  if (*(int *)(DAT_101ce7ec + 8) != 0) {
    uVar1 = FUN_10037930();
    uVar1 = FUN_10060c70("---------- RB_BeginSurface( %s, %s )\n",*unaff_EDI,uVar1);
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s",uVar1);
      _fflush(DAT_10764584);
    }
  }
  DAT_1072d9cc = 0;
  DAT_1072d9b8 = 0;
  DAT_1072d9d0 = 0;
  DAT_1072d9d4 = 0;
  _DAT_1072d9d8 = 0;
  _DAT_1072d9dc = 0;
  DAT_1072d9bc = unaff_EDI;
  DAT_1072d9c0 = unaff_ESI;
  DAT_1072d9c4 = param_1;
  return;
}


