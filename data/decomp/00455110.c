
float10 __fastcall FUN_00455110(int param_1,int param_2,int param_3)

{
  int in_EAX;
  int unaff_ESI;
  
  return ((float10)*(float *)(param_3 + in_EAX * 4) - (float10)*(float *)(param_2 + in_EAX * 4)) *
         (float10)*(float *)(unaff_ESI + param_1 * 4) +
         ((float10)*(float *)(param_2 + in_EAX * 4) - (float10)*(float *)(unaff_ESI + in_EAX * 4)) *
         (float10)*(float *)(param_3 + param_1 * 4) +
         ((float10)*(float *)(unaff_ESI + in_EAX * 4) - (float10)*(float *)(param_3 + in_EAX * 4)) *
         (float10)*(float *)(param_2 + param_1 * 4);
}

