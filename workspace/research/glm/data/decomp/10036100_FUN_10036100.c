// 10036100 size=201 FUN_10036100

void FUN_10036100(float param_1)

{
  int in_EAX;
  float *pfVar1;
  int in_ECX;
  byte *pbVar2;
  int iVar3;
  
  param_1 = param_1 * 0.003921569;
  iVar3 = 3;
  pfVar1 = (float *)(in_EAX + 8);
  pbVar2 = (byte *)(in_ECX + 2);
  do {
    iVar3 = iVar3 + -1;
    pfVar1[-2] = (float)pbVar2[-2] * param_1 + pfVar1[-2];
    pfVar1[-1] = (float)pbVar2[-1] * param_1 + pfVar1[-1];
    *pfVar1 = (float)*pbVar2 * param_1 + *pfVar1;
    pfVar1[1] = (float)pbVar2[1] * param_1 + pfVar1[1];
    pfVar1[2] = (float)pbVar2[2] * param_1 + pfVar1[2];
    pfVar1[3] = (float)pbVar2[3] * param_1 + pfVar1[3];
    pfVar1[4] = (float)pbVar2[4] * param_1 + pfVar1[4];
    pfVar1[5] = (float)pbVar2[5] * param_1 + pfVar1[5];
    pfVar1 = pfVar1 + 8;
    pbVar2 = pbVar2 + 8;
  } while (iVar3 != 0);
  return;
}


