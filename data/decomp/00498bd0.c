
void __thiscall FUN_00498bd0(float *param_1,float param_2)

{
  float fVar1;
  float fVar2;
  float *in_EAX;
  
  fVar1 = param_1[2];
  fVar2 = *param_1;
  in_EAX[1] = param_2 * param_1[1];
  in_EAX[2] = param_2 * fVar1;
  *in_EAX = param_2 * fVar2;
  return;
}

