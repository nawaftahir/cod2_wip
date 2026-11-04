
void FUN_004a16d0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  int unaff_EBX;
  float *unaff_EDI;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  float local_14;
  float local_10;
  
  FUN_004826e0();
  fVar1 = *unaff_EDI;
  fVar2 = *(float *)(unaff_EBX + 0x14);
  fVar3 = *unaff_EDI;
  fVar4 = unaff_EDI[1];
  fVar5 = *(float *)(unaff_EBX + 0x18);
  *unaff_EDI = local_24 * unaff_EDI[1] + local_18 * unaff_EDI[2] + local_30 * *unaff_EDI +
               *(float *)(unaff_EBX + 0x10);
  unaff_EDI[1] = local_20 * unaff_EDI[1] + local_14 * unaff_EDI[2] + local_2c * fVar1 + fVar2;
  unaff_EDI[2] = local_1c * fVar4 + local_10 * unaff_EDI[2] + local_28 * fVar3 + fVar5;
  return;
}

