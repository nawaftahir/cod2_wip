
undefined1 * __fastcall FUN_004893a0(undefined4 param_1,float *param_2,float param_3,float param_4)

{
  float10 fVar1;
  float10 fVar2;
  float10 fVar3;
  float10 fVar4;
  undefined1 local_8 [4];
  
  fVar1 = (float10)fcos((float10)param_4);
  fVar3 = (float10)fsin((float10)param_4);
  fVar2 = (float10)fcos((float10)param_4);
  fVar4 = (float10)fsin((float10)param_4);
  *param_2 = (float)fVar2 * (float)fVar1 * param_3;
  param_2[1] = (float)fVar2 * (float)fVar3 * param_3;
  param_2[2] = (float)fVar4 * param_3;
  return local_8;
}

