// 100236c0 size=77 FUN_100236c0

void FUN_100236c0(void)

{
  float *in_EAX;
  byte *in_ECX;
  
  *in_EAX = (float)in_ECX[2] * 0.003921569;
  in_EAX[1] = (float)in_ECX[1] * 0.003921569;
  in_EAX[2] = (float)*in_ECX * 0.003921569;
  in_EAX[3] = (float)in_ECX[3] * 0.003921569;
  return;
}


