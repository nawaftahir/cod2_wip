
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00403610(int param_1)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  int unaff_EDI;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  float local_10;
  float local_c;
  float local_8;
  
  local_1c = *(undefined4 *)(unaff_EDI + 0x60);
  local_18 = *(undefined4 *)(unaff_EDI + 100);
  local_10 = _DAT_00556c88 - (*(float *)(unaff_EDI + 0x68) - _DAT_00556bb8);
  local_14 = 0x48000000;
  local_8 = 0.0;
  if (param_1 == 0) {
    local_8 = 262144.0;
  }
  puVar3 = DAT_010a44e0;
  if (DAT_010a44e0 != &DAT_010a44dc) {
    do {
      iVar2 = FUN_00458fa0(&local_1c,&local_c,0);
      if (iVar2 != 0) {
        if (param_1 == 0) {
          if ((local_10 < local_c) && (local_c < local_8)) {
            local_8 = local_c;
          }
        }
        else if ((local_c < local_10) && (local_8 < local_c)) {
          local_8 = local_c;
        }
      }
      puVar1 = puVar3 + 1;
      puVar3 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44dc);
  }
  if ((local_8 != _DAT_00556a70) && (local_8 != 262144.0)) {
    DAT_0123348c = DAT_0123348c | 0x21;
    *(float *)(unaff_EDI + 0x68) = (local_10 - local_8) + *(float *)(unaff_EDI + 0x68);
  }
  return;
}

