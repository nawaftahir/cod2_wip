// 10058510 size=130 FUN_10058510

undefined4 * FUN_10058510(float param_1,float param_2)

{
  float10 fVar1;
  float fVar2;
  float *unaff_ESI;
  float10 fVar3;
  float10 fVar4;
  
  fVar2 = param_1 + param_1;
  fVar3 = (float10)FUN_1010a920();
  fVar1 = (float10)fcos((float10)(param_2 * 6.2831855));
  fVar4 = (float10)fsin((float10)(param_2 * 6.2831855));
  unaff_ESI[2] = fVar2 - 1.0;
  *unaff_ESI = (float)fVar1 * (float)fVar3;
  unaff_ESI[1] = (float)fVar4 * (float)fVar3;
  return &param_1;
}


