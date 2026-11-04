
void __fastcall FUN_00407c90(float *param_1,float *param_2,float param_3)

{
  float *in_EAX;
  
  *in_EAX = param_3 * *param_1 + *param_2;
  in_EAX[1] = param_3 * param_1[1] + param_2[1];
  return;
}

