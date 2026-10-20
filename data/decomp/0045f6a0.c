
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0045f6a0(void)

{
  int iVar1;
  int unaff_EBX;
  int iVar2;
  int unaff_EDI;
  float10 fVar3;
  
  iVar2 = 0x20;
  do {
    iVar1 = *(int *)(unaff_EBX + 0x14);
    fVar3 = (float10)*(float *)(iVar2 + 0xc + iVar1);
    if (*(int *)(DAT_01233b64 + 0x248) == 0) {
      fVar3 = (float10)FUN_004d7630((double)(((fVar3 + (float10)*(float *)(iVar2 + iVar1)) *
                                             (float10)_DAT_00556ab8) / (float10)DAT_010bcd2c));
      fVar3 = fVar3 * (float10)DAT_010bcd2c;
    }
    else {
      fVar3 = (fVar3 - (float10)*(float *)(iVar2 + iVar1)) / (float10)_DAT_00556ab0 +
              (float10)*(float *)(iVar2 + iVar1);
    }
    *(float *)(unaff_EDI + -0x20 + iVar2) = (float)fVar3;
    iVar2 = iVar2 + 4;
  } while (iVar2 < 0x2c);
  return;
}

