
float10 __fastcall FUN_004aae30(int *param_1)

{
  float fVar1;
  
  fVar1 = *(float *)*param_1;
  *param_1 = (int)((float *)*param_1 + 1);
  return (float10)fVar1;
}

