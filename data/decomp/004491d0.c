
undefined4 FUN_004491d0(float *param_1,float param_2)

{
  float *pfVar1;
  float fVar2;
  float *pfVar3;
  float fVar4;
  int iVar5;
  float *pfVar6;
  float *unaff_ESI;
  float *unaff_EDI;
  
  fVar2 = *param_1;
  iVar5 = 0;
  if (0 < (int)fVar2) {
    param_2 = -param_2;
    pfVar3 = param_1;
    do {
      pfVar6 = pfVar3 + 3;
      iVar5 = iVar5 + 1;
      pfVar1 = param_1 + (iVar5 % (int)fVar2) * 3 + 1;
      fVar4 = ((pfVar1[1] - pfVar3[2]) * unaff_ESI[2] - (pfVar1[2] - *pfVar6) * unaff_ESI[1]) *
              (*unaff_EDI - pfVar3[1]) +
              ((pfVar1[2] - *pfVar6) * *unaff_ESI -
              (param_1[(iVar5 % (int)fVar2) * 3 + 1] - pfVar3[1]) * unaff_ESI[2]) *
              (unaff_EDI[1] - pfVar3[2]) +
              ((param_1[(iVar5 % (int)fVar2) * 3 + 1] - pfVar3[1]) * unaff_ESI[1] -
              (pfVar1[1] - pfVar3[2]) * *unaff_ESI) * (unaff_EDI[2] - *pfVar6);
      if (fVar4 < param_2) {
        return CONCAT22((short)((uint)pfVar1 >> 0x10),
                        (ushort)(fVar4 < param_2) << 8 | (ushort)(NAN(fVar4) || NAN(param_2)) << 10
                        | (ushort)(fVar4 == param_2) << 0xe);
      }
      pfVar3 = pfVar6;
    } while (iVar5 < (int)fVar2);
  }
  return CONCAT31((int3)((uint)iVar5 >> 8),1);
}

