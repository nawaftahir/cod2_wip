
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00484360(float param_1)

{
  float *pfVar1;
  float *in_EAX;
  float local_10;
  float local_c;
  float local_8;
  
  pfVar1 = in_EAX + 3;
  FUN_00484c00();
  if (param_1 != _DAT_00556a70) {
    local_10 = *pfVar1;
    local_c = in_EAX[4];
    local_8 = in_EAX[5];
    FUN_00484060(pfVar1,&local_10,param_1);
  }
  in_EAX[6] = in_EAX[5] * in_EAX[1] - in_EAX[2] * in_EAX[4];
  in_EAX[7] = *pfVar1 * in_EAX[2] - in_EAX[5] * *in_EAX;
  in_EAX[8] = in_EAX[4] * *in_EAX - *pfVar1 * in_EAX[1];
  return;
}

