extern unsigned int DAT_101ce628;
extern unsigned int DAT_101ce690;
extern unsigned int DAT_101ce710;
extern unsigned int DAT_10696a68;
extern unsigned int DAT_10696a6c;
extern unsigned int DAT_10696a70;
extern int FUN_10025570();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_SetLodOrigin(int param_1)

{
  float fVar1;
  float fVar2;
  
  if (*(char *)(g_101ce710 + 7) != '\0') {
 
	int g_101ce710 = DAT_101ce710;   (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce710);
    FUN_10025570(param_1);
  }
  if (*(char *)(g_101ce710 + 8) == '\0') {
    _DAT_101d7e7c = *(unsigned int *)(param_1 + 0x18);
    _DAT_101d7e80 = *(unsigned int *)(param_1 + 0x1c);
    _DAT_101d7e84 = *(unsigned int *)(param_1 + 0x20);
  }
  else {
    _DAT_101d7e7c = DAT_10696a68;
    _DAT_101d7e80 = DAT_10696a6c;
    _DAT_101d7e84 = DAT_10696a70;
  }
  _DAT_101d7e88 = *(float *)(DAT_101ce690 + 8);
  _DAT_101d7e8c = *(float *)(DAT_101ce628 + 8);
  if (*(int *)(param_1 + 0x10) != 0x42a00000) {
    fVar1 = (float)fptan((float)*(float *)(param_1 + 0x10) * (float)0.5 * (float)0.017453292
                          );
    fVar2 = (float)fptan((float)0.6981317400932312);
    _DAT_101d7e88 = (float)((float)_DAT_101d7e88 * (fVar1 / fVar2));
    _DAT_101d7e8c = (float)((float)_DAT_101d7e8c * (fVar1 / fVar2));
  }
  return;
}


