// 10040ca0 size=158 FUN_10040ca0

void FUN_10040ca0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float *in_EAX;
  float *in_EDX;
  
  fVar1 = *(float *)(DAT_1072ddc8 + 0x50);
  fVar2 = *(float *)(DAT_1072ddc8 + 0x4c);
  fVar3 = *(float *)(DAT_1072ddc8 + 0x60);
  fVar4 = *(float *)(DAT_1072ddc8 + 0x5c);
  fVar5 = *(float *)(DAT_1072ddc8 + 0x70);
  fVar6 = *(float *)(DAT_1072ddc8 + 0x6c);
  *in_EDX = *(float *)(DAT_1072ddc8 + 0x48) * *in_EAX +
            *(float *)(DAT_1072ddc8 + 0x58) * in_EAX[1] +
            *(float *)(DAT_1072ddc8 + 0x68) * in_EAX[2];
  in_EDX[1] = fVar2 * *in_EAX + fVar4 * in_EAX[1] + fVar6 * in_EAX[2];
  in_EDX[2] = fVar1 * *in_EAX + fVar3 * in_EAX[1] + fVar5 * in_EAX[2];
  return;
}


