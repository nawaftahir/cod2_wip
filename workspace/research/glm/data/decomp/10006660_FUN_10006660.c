// 10006660 size=672 FUN_10006660

void FUN_10006660(void)

{
  float fVar1;
  float fVar2;
  float *in_ECX;
  int in_EDX;
  float *pfVar3;
  float *unaff_EBX;
  int iVar4;
  
  pfVar3 = unaff_EBX + in_EDX * 3 + -3;
  fVar1 = *unaff_EBX * *in_ECX + unaff_EBX[1] * in_ECX[1] + unaff_EBX[2] * in_ECX[2] + in_ECX[3];
  fVar2 = *pfVar3 * *in_ECX + pfVar3[1] * in_ECX[1] + pfVar3[2] * in_ECX[2] + in_ECX[3];
  if (fVar1 <= fVar2) {
    iVar4 = in_EDX + -2;
    if (3 < iVar4) {
      pfVar3 = unaff_EBX + iVar4 * 3 + -2;
      do {
        fVar1 = pfVar3[3] * in_ECX[1] + pfVar3[2] * *in_ECX + pfVar3[4] * in_ECX[2] + in_ECX[3];
        if (fVar1 < fVar2) {
          return;
        }
        fVar2 = in_ECX[1] * *pfVar3 + pfVar3[-1] * *in_ECX + pfVar3[1] * in_ECX[2] + in_ECX[3];
        if (fVar2 < fVar1) {
          return;
        }
        fVar1 = pfVar3[-3] * in_ECX[1] + pfVar3[-4] * *in_ECX + pfVar3[-2] * in_ECX[2] + in_ECX[3];
        if (fVar1 < fVar2) {
          return;
        }
        fVar2 = pfVar3[-6] * in_ECX[1] + pfVar3[-7] * *in_ECX + pfVar3[-5] * in_ECX[2] + in_ECX[3];
        if (fVar2 < fVar1) {
          return;
        }
        iVar4 = iVar4 + -4;
        pfVar3 = pfVar3 + -0xc;
      } while (3 < iVar4);
    }
    if (0 < iVar4) {
      pfVar3 = unaff_EBX + iVar4 * 3 + 1;
      do {
        fVar1 = *pfVar3 * in_ECX[1] + pfVar3[1] * in_ECX[2] + pfVar3[-1] * *in_ECX + in_ECX[3];
        if (fVar1 < fVar2) {
          return;
        }
        iVar4 = iVar4 + -1;
        pfVar3 = pfVar3 + -3;
        fVar2 = fVar1;
      } while (0 < iVar4);
    }
  }
  else {
    iVar4 = 1;
    if (3 < in_EDX + -2) {
      pfVar3 = unaff_EBX + 7;
      do {
        fVar2 = pfVar3[-4] * *in_ECX + pfVar3[-2] * in_ECX[2] + pfVar3[-3] * in_ECX[1] + in_ECX[3];
        if (fVar2 < fVar1) {
          return;
        }
        fVar1 = in_ECX[1] * *pfVar3 + pfVar3[-1] * *in_ECX + pfVar3[1] * in_ECX[2] + in_ECX[3];
        if (fVar1 < fVar2) {
          return;
        }
        fVar2 = pfVar3[2] * *in_ECX + pfVar3[4] * in_ECX[2] + pfVar3[3] * in_ECX[1] + in_ECX[3];
        if (fVar2 < fVar1) {
          return;
        }
        fVar1 = pfVar3[5] * *in_ECX + pfVar3[7] * in_ECX[2] + pfVar3[6] * in_ECX[1] + in_ECX[3];
        if (fVar1 < fVar2) {
          return;
        }
        iVar4 = iVar4 + 4;
        pfVar3 = pfVar3 + 0xc;
      } while (iVar4 < in_EDX + -4);
    }
    if (iVar4 < in_EDX + -1) {
      pfVar3 = unaff_EBX + iVar4 * 3 + 1;
      while (fVar2 = in_ECX[1] * *pfVar3 + pfVar3[-1] * *in_ECX + pfVar3[1] * in_ECX[2] + in_ECX[3],
            fVar1 <= fVar2) {
        iVar4 = iVar4 + 1;
        pfVar3 = pfVar3 + 3;
        fVar1 = fVar2;
        if (in_EDX + -1 <= iVar4) {
          return;
        }
      }
    }
  }
  return;
}


