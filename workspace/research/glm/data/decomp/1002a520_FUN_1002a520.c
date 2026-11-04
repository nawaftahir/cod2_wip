// 1002a520 size=67 FUN_1002a520

void FUN_1002a520(float param_1,float param_2,int param_3)

{
  float *in_EAX;
  float *pfVar1;
  int iVar2;
  
  iVar2 = 6;
  *in_EAX = param_1 * *in_EAX;
  pfVar1 = (float *)(param_3 + 8);
  do {
    iVar2 = iVar2 + -1;
    pfVar1[-2] = param_2 * pfVar1[-2];
    pfVar1[-1] = param_2 * pfVar1[-1];
    *pfVar1 = param_2 * *pfVar1;
    pfVar1[1] = param_2 * pfVar1[1];
    pfVar1 = pfVar1 + 4;
  } while (iVar2 != 0);
  return;
}


