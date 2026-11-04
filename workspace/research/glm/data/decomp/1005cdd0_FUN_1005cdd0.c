// 1005cdd0 size=399 FUN_1005cdd0

undefined4 FUN_1005cdd0(void)

{
  float *pfVar1;
  float *pfVar2;
  float *pfVar3;
  int iVar4;
  int iVar5;
  float fVar6;
  undefined4 *in_ECX;
  float *unaff_EDI;
  
  pfVar1 = (float *)in_ECX[2];
  pfVar2 = (float *)*in_ECX;
  pfVar3 = (float *)in_ECX[1];
  fVar6 = (pfVar3[2] * pfVar2[1] - pfVar3[1] * pfVar2[2]) * *pfVar1 +
          (pfVar1[1] * pfVar2[2] - pfVar1[2] * pfVar2[1]) * *pfVar3 +
          (pfVar1[2] * pfVar3[1] - pfVar3[2] * pfVar1[1]) * *pfVar2;
  if (ABS(fVar6) < 0.001) {
    return 0;
  }
  iVar4 = in_ECX[2];
  fVar6 = 1.0 / fVar6;
  iVar5 = in_ECX[1];
  *unaff_EDI = ((*(float *)(iVar5 + 8) * pfVar2[1] - *(float *)(iVar5 + 4) * pfVar2[2]) *
                *(float *)(iVar4 + 0xc) +
                (*(float *)(iVar4 + 4) * pfVar2[2] - *(float *)(iVar4 + 8) * pfVar2[1]) *
                *(float *)(iVar5 + 0xc) +
               (*(float *)(iVar4 + 8) * *(float *)(iVar5 + 4) -
               *(float *)(iVar5 + 8) * *(float *)(iVar4 + 4)) * pfVar2[3]) * fVar6;
  pfVar1 = (float *)in_ECX[1];
  pfVar2 = (float *)in_ECX[2];
  pfVar3 = (float *)*in_ECX;
  unaff_EDI[1] = ((*pfVar1 * pfVar3[2] - pfVar1[2] * *pfVar3) * pfVar2[3] +
                  (*pfVar3 * pfVar2[2] - *pfVar2 * pfVar3[2]) * pfVar1[3] +
                 (pfVar1[2] * *pfVar2 - *pfVar1 * pfVar2[2]) * pfVar3[3]) * fVar6;
  pfVar1 = (float *)in_ECX[1];
  pfVar2 = (float *)in_ECX[2];
  pfVar3 = (float *)*in_ECX;
  unaff_EDI[2] = ((*pfVar3 * pfVar1[1] - *pfVar1 * pfVar3[1]) * pfVar2[3] +
                  (*pfVar2 * pfVar3[1] - *pfVar3 * pfVar2[1]) * pfVar1[3] +
                 (*pfVar1 * pfVar2[1] - pfVar1[1] * *pfVar2) * pfVar3[3]) * fVar6;
  return 1;
}


