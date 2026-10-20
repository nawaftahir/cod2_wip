
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00415750(int param_1)

{
  int iVar1;
  float fVar2;
  float local_8;
  
  fVar2 = _DAT_00556a70;
  iVar1 = *(int *)(param_1 + 0x788);
  if ((iVar1 != 0) && (*(char *)(iVar1 + 0x50) != '\0')) {
    local_8 = *(float *)(iVar1 + 0x60) * _DAT_00556b50;
    if (local_8 < _DAT_00556b4c) {
      local_8 = 0.003125;
    }
    *(float *)(iVar1 + 0x60) = local_8;
    _DAT_012334a8 = local_8;
    if (local_8 != fVar2) goto LAB_004157d6;
  }
  local_8 = 0.003125;
  if (_DAT_00556b4c <= DAT_01139e60 * _DAT_00556b50) {
    local_8 = DAT_01139e60 * _DAT_00556b50;
  }
LAB_004157d6:
  DAT_01139e60 = local_8;
  DAT_0123348c = DAT_0123348c | 0x2e;
  return;
}

