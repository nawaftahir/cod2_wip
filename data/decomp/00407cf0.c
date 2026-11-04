
undefined4 FUN_00407cf0(float param_1,float *param_2,float *param_3)

{
  float10 fVar1;
  undefined4 in_EAX;
  float10 fVar2;
  
  fVar1 = (float10)fcos((float10)param_1);
  fVar2 = (float10)fsin((float10)param_1);
  *param_3 = (float)fVar1;
  *param_2 = (float)fVar2;
  return in_EAX;
}

