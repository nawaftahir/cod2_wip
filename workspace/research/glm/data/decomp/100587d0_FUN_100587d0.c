// 100587d0 size=235 FUN_100587d0

void FUN_100587d0(float param_1)

{
  float fVar1;
  float fVar2;
  float *in_EAX;
  int unaff_EBX;
  int iVar3;
  float10 fVar4;
  float local_18;
  float local_10;
  
  iVar3 = (int)param_1;
  fVar1 = (float)(int)param_1;
  param_1 = 0.0;
  local_18 = 1.0;
  local_10 = (1.0 / fVar1) * 0.5;
  if (0 < iVar3) {
    do {
      fVar4 = (float10)FUN_1010a920();
      in_EAX[2] = (local_10 + local_10) - 1.0;
      *in_EAX = (float)fVar4 * local_18;
      in_EAX[1] = (float)fVar4 * param_1;
      in_EAX = (float *)((int)in_EAX + unaff_EBX);
      iVar3 = iVar3 + -1;
      local_10 = local_10 + 1.0 / fVar1;
      fVar2 = local_18 * 0.6754903;
      local_18 = local_18 * -0.7373689 - param_1 * -0.6754903;
      param_1 = param_1 * -0.7373689 - fVar2;
    } while (iVar3 != 0);
  }
  return;
}


