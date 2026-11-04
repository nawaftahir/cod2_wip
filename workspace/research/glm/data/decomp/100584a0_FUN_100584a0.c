// 100584a0 size=98 FUN_100584a0

undefined4 * FUN_100584a0(undefined4 param_1,float param_2)

{
  float10 fVar1;
  float *unaff_ESI;
  float10 fVar2;
  float10 fVar3;
  
  fVar2 = (float10)FUN_1010a920();
  fVar1 = (float10)fcos((float10)(param_2 * 6.2831855));
  fVar3 = (float10)fsin((float10)(param_2 * 6.2831855));
  *unaff_ESI = (float)fVar1 * (float)fVar2;
  unaff_ESI[1] = (float)fVar3 * (float)fVar2;
  return &param_1;
}


