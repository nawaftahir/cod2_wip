
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_004481e0(float *param_1,float param_2,float param_3)

{
  float fVar1;
  float fVar2;
  int *in_EAX;
  float *pfVar3;
  int iVar4;
  int iVar5;
  int *unaff_EBX;
  float *unaff_EDI;
  
  if ((in_EAX == (int *)0x0) || (unaff_EBX == (int *)0x0)) {
    return (uint)in_EAX & 0xffffff00;
  }
  iVar5 = *in_EAX;
  iVar4 = 0;
  if (0 < iVar5) {
    pfVar3 = (float *)(in_EAX + 2);
    do {
      fVar1 = (*pfVar3 * unaff_EDI[1] + pfVar3[-1] * *unaff_EDI + pfVar3[1] * unaff_EDI[2]) -
              param_3;
      fVar2 = (float)_DAT_00556be0;
      in_EAX = (int *)CONCAT22((short)((uint)in_EAX >> 0x10),
                               (ushort)(fVar1 < fVar2) << 8 |
                               (ushort)(NAN(fVar1) || NAN(fVar2)) << 10 |
                               (ushort)(fVar1 == fVar2) << 0xe);
      if (fVar1 >= fVar2 && (fVar1 == fVar2) == 0) goto LAB_0044826b;
      iVar4 = iVar4 + 1;
      pfVar3 = pfVar3 + 3;
    } while (iVar4 < iVar5);
  }
  iVar5 = 0;
  if (0 < *unaff_EBX) {
    pfVar3 = (float *)(unaff_EBX + 2);
    do {
      fVar1 = (*pfVar3 * param_1[1] + pfVar3[1] * param_1[2] + pfVar3[-1] * *param_1) - param_2;
      fVar2 = (float)_DAT_00556be0;
      in_EAX = (int *)CONCAT22((short)((uint)param_1 >> 0x10),
                               (ushort)(fVar1 < fVar2) << 8 |
                               (ushort)(NAN(fVar1) || NAN(fVar2)) << 10 |
                               (ushort)(fVar1 == fVar2) << 0xe);
      if (fVar1 >= fVar2 && (fVar1 == fVar2) == 0) {
LAB_0044826b:
        return CONCAT31((int3)((uint)in_EAX >> 8),1);
      }
      iVar5 = iVar5 + 1;
      pfVar3 = pfVar3 + 3;
    } while (iVar5 < *unaff_EBX);
  }
  return (uint)in_EAX & 0xffffff00;
}

