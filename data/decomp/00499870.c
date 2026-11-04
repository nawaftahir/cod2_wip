
void FUN_00499870(float param_1)

{
  float *in_EAX;
  
  *in_EAX = param_1 * *in_EAX;
  in_EAX[1] = param_1 * in_EAX[1];
  in_EAX[2] = param_1 * in_EAX[2];
  return;
}

