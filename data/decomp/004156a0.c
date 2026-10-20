
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_004156a0(int param_1)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 0x788);
  if ((iVar1 != 0) && (*(char *)(iVar1 + 0x50) != '\0')) {
    *(float *)(iVar1 + 0x60) = *(float *)(iVar1 + 0x60) * _DAT_00556b58;
    if (_DAT_00556b54 < *(float *)(*(int *)(param_1 + 0x788) + 0x60)) {
      *(undefined4 *)(*(int *)(param_1 + 0x788) + 0x60) = 0x43200000;
    }
    _DAT_012334a8 = *(undefined4 *)(*(int *)(param_1 + 0x788) + 0x60);
  }
  DAT_01139e60 = DAT_01139e60 * _DAT_00556b58;
  if (_DAT_00556b54 < DAT_01139e60) {
    DAT_01139e60 = 160.0;
  }
  DAT_0123348c = DAT_0123348c | 0x2e;
  return;
}

