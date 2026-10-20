
void __fastcall FUN_00498c10(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *in_EAX;
  
  fVar1 = param_1[2];
  fVar2 = param_2[2];
  fVar3 = *param_1;
  fVar4 = *param_2;
  in_EAX[1] = param_1[1] + param_2[1];
  in_EAX[2] = fVar1 + fVar2;
  *in_EAX = fVar3 + fVar4;
  return;
}

