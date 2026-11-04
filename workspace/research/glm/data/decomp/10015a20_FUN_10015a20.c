// 10015a20 size=381 FUN_10015a20

void FUN_10015a20(int param_1,float param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float *in_EAX;
  float *in_ECX;
  float *in_EDX;
  int iVar7;
  float *pfVar8;
  
  *in_ECX = 131072.0;
  in_ECX[1] = 131072.0;
  in_ECX[2] = 131072.0;
  *in_EDX = -131072.0;
  in_EDX[1] = -131072.0;
  in_EDX[2] = -131072.0;
  fVar1 = *in_EAX;
  pfVar8 = (float *)(param_1 + 8);
  iVar7 = 4;
  fVar2 = in_EAX[1];
  fVar3 = in_EAX[2];
  do {
    fVar4 = param_2 * fVar1 + pfVar8[-2];
    fVar5 = param_2 * fVar2 + pfVar8[-1];
    fVar6 = param_2 * fVar3 + *pfVar8;
    if (fVar4 < *in_ECX) {
      *in_ECX = fVar4;
    }
    if (*in_EDX < fVar4) {
      *in_EDX = fVar4;
    }
    if (fVar5 < in_ECX[1]) {
      in_ECX[1] = fVar5;
    }
    if (in_EDX[1] < fVar5) {
      in_EDX[1] = fVar5;
    }
    if (fVar6 < in_ECX[2]) {
      in_ECX[2] = fVar6;
    }
    if (in_EDX[2] < fVar6) {
      in_EDX[2] = fVar6;
    }
    fVar4 = pfVar8[-2] - param_2 * fVar1;
    fVar5 = pfVar8[-1] - param_2 * fVar2;
    fVar6 = *pfVar8 - param_2 * fVar3;
    if (fVar4 < *in_ECX) {
      *in_ECX = fVar4;
    }
    if (*in_EDX < fVar4) {
      *in_EDX = fVar4;
    }
    if (fVar5 < in_ECX[1]) {
      in_ECX[1] = fVar5;
    }
    if (in_EDX[1] < fVar5) {
      in_EDX[1] = fVar5;
    }
    if (fVar6 < in_ECX[2]) {
      in_ECX[2] = fVar6;
    }
    if (in_EDX[2] < fVar6) {
      in_EDX[2] = fVar6;
    }
    pfVar8 = pfVar8 + 3;
    iVar7 = iVar7 + -1;
  } while (iVar7 != 0);
  return;
}


