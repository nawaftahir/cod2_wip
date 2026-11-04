
undefined4 FUN_00482580(double *param_1,double *param_2,double param_3)

{
  float10 fVar1;
  undefined4 in_EAX;
  float10 fVar2;
  
  fVar1 = (float10)fcos((float10)param_3);
  fVar2 = (float10)fsin((float10)param_3);
  *param_2 = (double)fVar1;
  *param_1 = (double)fVar2;
  return in_EAX;
}

