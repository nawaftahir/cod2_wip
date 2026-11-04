
void __thiscall FUN_00407f60(float *param_1,float param_2)

{
  float *in_EAX;
  
  *in_EAX = param_2 * *param_1;
  in_EAX[1] = param_2 * param_1[1];
  in_EAX[2] = param_2 * param_1[2];
  return;
}

