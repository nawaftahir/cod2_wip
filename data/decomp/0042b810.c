
float10 FUN_0042b810(float *param_1,int param_2,float param_3,float param_4,float param_5)

{
  float fVar1;
  float10 fVar2;
  
  fVar1 = (float)(DAT_010bcd2c << 5);
  fVar2 = (float10)FUN_00494530(*param_1 / fVar1,param_1[1] / fVar1,param_1[2] / fVar1,
                                *(undefined4 *)(&DAT_0109c500 + param_2 * 4));
  return fVar2 * (float10)param_4 * (float10)param_5 + (float10)param_3;
}

