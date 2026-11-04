// 10058620 size=192 FUN_10058620

void FUN_10058620(float param_1)

{
  float fVar1;
  float *in_EAX;
  int unaff_EBX;
  int iVar2;
  float10 fVar3;
  float local_14;
  
  iVar2 = (int)param_1;
  param_1 = 0.0;
  local_14 = 1.0;
  if (0 < iVar2) {
    do {
      fVar3 = (float10)FUN_1010a920();
      *in_EAX = (float)fVar3 * local_14;
      in_EAX[1] = (float)fVar3 * param_1;
      in_EAX = (float *)((int)in_EAX + unaff_EBX);
      iVar2 = iVar2 + -1;
      fVar1 = local_14 * 0.6754903;
      local_14 = local_14 * -0.7373689 - param_1 * -0.6754903;
      param_1 = param_1 * -0.7373689 - fVar1;
    } while (iVar2 != 0);
  }
  return;
}


