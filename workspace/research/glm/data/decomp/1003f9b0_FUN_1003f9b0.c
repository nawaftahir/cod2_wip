// 1003f9b0 size=250 FUN_1003f9b0

uint FUN_1003f9b0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float *in_EAX;
  float *in_EDX;
  float *unaff_ESI;
  
  fVar6 = DAT_1072ddc8[0x35] * *in_EAX +
          DAT_1072ddc8[0x39] * in_EAX[1] + DAT_1072ddc8[0x3d] * in_EAX[2] + DAT_1072ddc8[0x41];
  if (fVar6 < 0.0 != (fVar6 == 0.0)) {
    return (uint)(ushort)((ushort)(fVar6 < 0.0) << 8 | (ushort)NAN(fVar6) << 10 |
                         (ushort)(fVar6 == 0.0) << 0xe);
  }
  fVar5 = unaff_ESI[1];
  fVar1 = -*unaff_ESI;
  fVar7 = fVar5 * DAT_1072ddc8[9] + fVar1 * DAT_1072ddc8[6] + *DAT_1072ddc8;
  fVar9 = fVar5 * DAT_1072ddc8[10] + fVar1 * DAT_1072ddc8[7] + DAT_1072ddc8[1];
  fVar8 = fVar5 * DAT_1072ddc8[0xb] + fVar1 * DAT_1072ddc8[8] + DAT_1072ddc8[2];
  fVar1 = DAT_1072ddc8[0x3b];
  fVar2 = DAT_1072ddc8[0x33];
  fVar3 = DAT_1072ddc8[0x37];
  fVar4 = DAT_1072ddc8[0x3f];
  *in_EDX = (fVar7 * DAT_1072ddc8[0x32] + fVar9 * DAT_1072ddc8[0x36] + fVar8 * DAT_1072ddc8[0x3a] +
            DAT_1072ddc8[0x3e]) * (1.0 / fVar6) * 0.5;
  in_EDX[1] = (1.0 / fVar6) * (fVar9 * fVar3 + fVar7 * fVar2 + fVar8 * fVar1 + fVar4) * 0.5;
  return CONCAT31((int3)((uint)fVar5 >> 8),1);
}


