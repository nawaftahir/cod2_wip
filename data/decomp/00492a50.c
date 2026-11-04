
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __fastcall FUN_00492a50(undefined4 param_1,short *param_2)

{
  int iVar1;
  int iVar2;
  float local_8;
  
  iVar2 = (int)*param_2;
  if ((short)(&DAT_011546c4)[iVar2 * 0x24] < 0) {
    local_8 = 1.0;
    if ((&DAT_01154690)[iVar2 * 0x12] == 0) {
      local_8 = 0.0;
    }
    return (float10)local_8;
  }
  iVar1 = (&DAT_01154690)[iVar2 * 0x12];
  iVar2 = (int)(short)(&DAT_011546c4)[iVar2 * 0x24];
  if (iVar1 == 0) {
LAB_00492ab5:
    if ((&DAT_01154690)[iVar2 * 0x12] != 0) {
      return (float10)*(float *)(param_2 + 2);
    }
    if (iVar1 == 0) goto LAB_00492add;
  }
  else {
    if ((&DAT_01154690)[iVar2 * 0x12] != 0) {
      return (float10)_DAT_00556a58;
    }
    if (iVar1 == 0) goto LAB_00492ab5;
  }
  if ((&DAT_01154690)[iVar2 * 0x12] == 0) {
    return (float10)_DAT_00556a58 - (float10)*(float *)(param_2 + 2);
  }
LAB_00492add:
  return (float10)_DAT_00556a70;
}

