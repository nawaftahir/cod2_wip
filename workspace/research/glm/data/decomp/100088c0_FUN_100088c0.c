// 100088c0 size=2317 FUN_100088c0

void FUN_100088c0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  int in_ECX;
  float *in_EDX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  *in_EDX = 131072.0;
  in_EDX[1] = 131072.0;
  in_EDX[2] = 131072.0;
  *unaff_ESI = -131072.0;
  unaff_ESI[1] = -131072.0;
  unaff_ESI[2] = -131072.0;
  fVar1 = *unaff_EDI;
  fVar2 = unaff_EDI[1];
  fVar3 = unaff_EDI[2];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  fVar1 = unaff_EDI[3];
  fVar2 = unaff_EDI[1];
  fVar3 = unaff_EDI[2];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  fVar1 = *unaff_EDI;
  fVar2 = unaff_EDI[4];
  fVar3 = unaff_EDI[2];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  fVar1 = unaff_EDI[3];
  fVar2 = unaff_EDI[4];
  fVar3 = unaff_EDI[2];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  fVar1 = *unaff_EDI;
  fVar2 = unaff_EDI[1];
  fVar3 = unaff_EDI[5];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  fVar1 = unaff_EDI[3];
  fVar2 = unaff_EDI[1];
  fVar3 = unaff_EDI[5];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  fVar1 = *unaff_EDI;
  fVar2 = unaff_EDI[4];
  fVar3 = unaff_EDI[5];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  fVar1 = unaff_EDI[3];
  fVar2 = unaff_EDI[4];
  fVar3 = unaff_EDI[5];
  fVar4 = fVar3 * *(float *)(in_ECX + 0x2c) +
          fVar2 * *(float *)(in_ECX + 0x20) +
          fVar1 * *(float *)(in_ECX + 0x14) + *(float *)(in_ECX + 0x3c);
  fVar5 = fVar3 * *(float *)(in_ECX + 0x30) +
          fVar2 * *(float *)(in_ECX + 0x24) +
          fVar1 * *(float *)(in_ECX + 0x18) + *(float *)(in_ECX + 0x40);
  fVar1 = fVar3 * *(float *)(in_ECX + 0x34) +
          fVar2 * *(float *)(in_ECX + 0x28) +
          fVar1 * *(float *)(in_ECX + 0x1c) + *(float *)(in_ECX + 0x44);
  if (fVar4 < *in_EDX) {
    *in_EDX = fVar4;
  }
  if (*unaff_ESI < fVar4) {
    *unaff_ESI = fVar4;
  }
  if (fVar5 < in_EDX[1]) {
    in_EDX[1] = fVar5;
  }
  if (unaff_ESI[1] < fVar5) {
    unaff_ESI[1] = fVar5;
  }
  if (fVar1 < in_EDX[2]) {
    in_EDX[2] = fVar1;
  }
  if (unaff_ESI[2] < fVar1) {
    unaff_ESI[2] = fVar1;
  }
  return;
}


