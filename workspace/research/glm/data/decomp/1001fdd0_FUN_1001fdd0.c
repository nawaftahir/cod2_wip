// 1001fdd0 size=470 FUN_1001fdd0

void FUN_1001fdd0(void)

{
  float fVar1;
  float fVar2;
  float *in_EAX;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  float *in_ECX;
  int in_EDX;
  float *unaff_EDI;
  
  uVar3 = (-1 < (int)*in_ECX) - 1 & 0xc;
  uVar4 = (-1 < (int)in_ECX[3]) - 1 & 0xc;
  uVar5 = (-1 < (int)in_ECX[6]) - 1 & 0xc;
  fVar2 = *(float *)(uVar5 + 8 + in_EDX) * in_ECX[6] +
          *(float *)(uVar4 + 4 + in_EDX) * in_ECX[3] +
          *(float *)(uVar3 + in_EDX) * *in_ECX + *in_EAX;
  fVar1 = *(float *)((in_EDX - uVar5) + 0x14) * in_ECX[6] +
          *(float *)((in_EDX - uVar4) + 0x10) * in_ECX[3] +
          *(float *)((in_EDX - uVar3) + 0xc) * *in_ECX + *in_EAX;
  if (fVar2 < *unaff_EDI) {
    *unaff_EDI = fVar2;
  }
  if (unaff_EDI[3] < fVar1) {
    unaff_EDI[3] = fVar1;
  }
  uVar3 = (-1 < (int)in_ECX[1]) - 1 & 0xc;
  uVar4 = (-1 < (int)in_ECX[4]) - 1 & 0xc;
  uVar5 = (-1 < (int)in_ECX[7]) - 1 & 0xc;
  fVar2 = *(float *)(uVar5 + 8 + in_EDX) * in_ECX[7] +
          *(float *)(uVar4 + 4 + in_EDX) * in_ECX[4] +
          *(float *)(uVar3 + in_EDX) * in_ECX[1] + in_EAX[1];
  fVar1 = *(float *)((in_EDX - uVar5) + 0x14) * in_ECX[7] +
          *(float *)((in_EDX - uVar4) + 0x10) * in_ECX[4] +
          *(float *)((in_EDX - uVar3) + 0xc) * in_ECX[1] + in_EAX[1];
  if (fVar2 < unaff_EDI[1]) {
    unaff_EDI[1] = fVar2;
  }
  if (unaff_EDI[4] < fVar1) {
    unaff_EDI[4] = fVar1;
  }
  uVar3 = (-1 < (int)in_ECX[2]) - 1 & 0xc;
  uVar4 = (-1 < (int)in_ECX[5]) - 1 & 0xc;
  uVar5 = (-1 < (int)in_ECX[8]) - 1 & 0xc;
  fVar2 = *(float *)(uVar5 + 8 + in_EDX) * in_ECX[8] +
          *(float *)(uVar4 + 4 + in_EDX) * in_ECX[5] +
          *(float *)(uVar3 + in_EDX) * in_ECX[2] + in_EAX[2];
  fVar1 = *(float *)((in_EDX - uVar5) + 0x14) * in_ECX[8] +
          *(float *)((in_EDX - uVar4) + 0x10) * in_ECX[5] +
          *(float *)((in_EDX - uVar3) + 0xc) * in_ECX[2] + in_EAX[2];
  if (fVar2 < unaff_EDI[2]) {
    unaff_EDI[2] = fVar2;
  }
  if (fVar1 <= unaff_EDI[5]) {
    return;
  }
  unaff_EDI[5] = fVar1;
  return;
}


