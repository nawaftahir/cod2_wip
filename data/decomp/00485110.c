
void __fastcall FUN_00485110(float *param_1,float *param_2,float param_3)

{
  float fVar1;
  float *in_EAX;
  
  *in_EAX = param_3 * *param_1;
  in_EAX[1] = param_3 * param_1[1];
  fVar1 = param_1[2];
  in_EAX[3] = 0.0;
  in_EAX[2] = param_3 * fVar1;
  in_EAX[4] = param_3 * param_1[3];
  in_EAX[5] = param_3 * param_1[4];
  fVar1 = param_1[5];
  in_EAX[7] = 0.0;
  in_EAX[6] = param_3 * fVar1;
  in_EAX[8] = param_3 * param_1[6];
  in_EAX[9] = param_3 * param_1[7];
  fVar1 = param_1[8];
  in_EAX[0xb] = 0.0;
  in_EAX[10] = param_3 * fVar1;
  in_EAX[0xc] = *param_2;
  in_EAX[0xd] = param_2[1];
  in_EAX[0xe] = param_2[2];
  in_EAX[0xf] = 1.0;
  return;
}

