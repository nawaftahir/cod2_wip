extern unsigned int DAT_101ce708;
extern int FUN_100f6670();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002f2a0(float param_1)

{
  float fVar1;
  float fVar2;
  float fVar3;
  
  fVar2 = (float)FUN_100f6670((double)param_1);
  fVar2 = (float)param_1 - fVar2;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    _DAT_1072dedc = (float)fVar2;
    return;
  }
  fVar1 = (float)fcos((float)(float)(fVar2 * (float)6.2831855));
  fVar3 = (float)fsin((float)(float)(fVar2 * (float)6.2831855));
  _DAT_1072da20 = (float)fVar3;
  _DAT_1072da24 = (float)fVar1;
  _DAT_1072da28 = (float)fVar2;
  _DAT_1072da2c = param_1;
  return;
}


