
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall
FUN_0040c590(int param_1,int param_2,float param_3,uint param_4,byte param_5,int param_6)

{
  double dVar1;
  double dVar2;
  int in_EAX;
  int unaff_ESI;
  
  dVar1 = _DAT_00556a68;
  if ((param_4 & 1) == 0) {
    dVar1 = _DAT_00556ab8 / (double)param_3;
  }
  dVar2 = _DAT_00556a68;
  if ((param_5 & 1) == 0) {
    dVar2 = _DAT_00556ab8 / (double)param_3;
  }
  *(float *)(in_EAX + param_6 * 4) = (float)dVar1 + *(float *)(param_1 + param_6 * 4);
  *(float *)(in_EAX + unaff_ESI * 4) = (float)dVar2 + *(float *)(param_1 + unaff_ESI * 4);
  *(undefined4 *)(in_EAX + param_2 * 4) = *(undefined4 *)(param_1 + param_2 * 4);
  return;
}

