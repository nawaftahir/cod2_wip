// 1005e2c0 size=551 FUN_1005e2c0

void FUN_1005e2c0(void)

{
  float fVar1;
  float *in_EAX;
  int iVar2;
  float *unaff_EDI;
  float10 fVar3;
  float local_58;
  float local_50 [20];
  
  local_50[4] = in_EAX[5] - in_EAX[7];
  iVar2 = -1;
  local_58 = 0.0;
  local_50[5] = in_EAX[6] - in_EAX[2];
  local_50[6] = in_EAX[1] - in_EAX[3];
  local_50[7] = in_EAX[8] + *in_EAX + in_EAX[4] + 1.0;
  local_50[8] = ((*in_EAX - in_EAX[4]) - in_EAX[8]) + 1.0;
  local_50[9] = in_EAX[1] + in_EAX[3];
  local_50[10] = in_EAX[6] + in_EAX[2];
  local_50[0xd] = ((in_EAX[4] - *in_EAX) - in_EAX[8]) + 1.0;
  local_50[0xe] = in_EAX[7] + in_EAX[5];
  local_50[0x12] = ((in_EAX[8] - in_EAX[4]) - *in_EAX) + 1.0;
  fVar1 = local_50[7] * local_50[7] + local_50[4] * local_50[4] + local_50[5] * local_50[5] +
          local_50[6] * local_50[6];
  if (0.0 < fVar1) {
    iVar2 = 0;
    local_58 = fVar1;
  }
  fVar1 = local_50[8] * local_50[8] + local_50[9] * local_50[9] + local_50[10] * local_50[10] +
          local_50[4] * local_50[4];
  if (local_58 < fVar1) {
    iVar2 = 1;
    local_58 = fVar1;
  }
  fVar1 = local_50[0xd] * local_50[0xd] + local_50[0xe] * local_50[0xe] + local_50[9] * local_50[9]
          + local_50[5] * local_50[5];
  if (local_58 < fVar1) {
    iVar2 = 2;
    local_58 = fVar1;
  }
  if (local_58 <
      local_50[0x12] * local_50[0x12] + local_50[0xe] * local_50[0xe] + local_50[10] * local_50[10]
      + local_50[6] * local_50[6]) {
    iVar2 = 3;
  }
  local_50[0xb] = local_50[4];
  local_50[0xc] = local_50[9];
  local_50[0xf] = local_50[5];
  local_50[0x10] = local_50[10];
  local_50[0x11] = local_50[0xe];
  local_50[0x13] = local_50[6];
  fVar3 = (float10)FUN_1010a920();
  fVar1 = 1.0 / (float)fVar3;
  *unaff_EDI = fVar1 * local_50[iVar2 * 4 + 4];
  unaff_EDI[1] = fVar1 * local_50[iVar2 * 4 + 5];
  unaff_EDI[2] = fVar1 * local_50[iVar2 * 4 + 6];
  unaff_EDI[3] = fVar1 * local_50[iVar2 * 4 + 7];
  return;
}


