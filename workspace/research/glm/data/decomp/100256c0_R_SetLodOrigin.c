// 100256c0 size=212 R_SetLodOrigin

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_SetLodOrigin(int param_1)

{
  float10 fVar1;
  float10 fVar2;
  
  if (*(char *)(DAT_101ce710 + 7) != '\0') {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce710);
    FUN_10025570(param_1);
  }
  if (*(char *)(DAT_101ce710 + 8) == '\0') {
    _DAT_101d7e7c = *(undefined4 *)(param_1 + 0x18);
    _DAT_101d7e80 = *(undefined4 *)(param_1 + 0x1c);
    _DAT_101d7e84 = *(undefined4 *)(param_1 + 0x20);
  }
  else {
    _DAT_101d7e7c = DAT_10696a68;
    _DAT_101d7e80 = DAT_10696a6c;
    _DAT_101d7e84 = DAT_10696a70;
  }
  _DAT_101d7e88 = *(float *)(DAT_101ce690 + 8);
  _DAT_101d7e8c = *(float *)(DAT_101ce628 + 8);
  if (*(int *)(param_1 + 0x10) != 0x42a00000) {
    fVar1 = (float10)fptan((float10)*(float *)(param_1 + 0x10) * (float10)0.5 * (float10)0.017453292
                          );
    fVar2 = (float10)fptan((float10)0.6981317400932312);
    _DAT_101d7e88 = (float)((float10)_DAT_101d7e88 * (fVar1 / fVar2));
    _DAT_101d7e8c = (float)((float10)_DAT_101d7e8c * (fVar1 / fVar2));
  }
  return;
}


