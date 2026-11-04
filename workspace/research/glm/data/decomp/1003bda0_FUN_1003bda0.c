// 1003bda0 size=352 FUN_1003bda0

void FUN_1003bda0(void)

{
  float fVar1;
  float fVar2;
  int in_EDX;
  int extraout_EDX;
  int extraout_EDX_00;
  float *unaff_EBX;
  float *unaff_ESI;
  float10 fVar3;
  
  fVar1 = *(float *)(DAT_101d1b9c + 0x1b4) * *(float *)(DAT_1072ddc8 + 0xc) +
          *(float *)(DAT_101d1b9c + 0x1b8) * *(float *)(DAT_1072ddc8 + 0x10) +
          *(float *)(DAT_101d1b9c + 0x1bc) * *(float *)(DAT_1072ddc8 + 0x14);
  if (*(float *)(DAT_101d1b9c + 0x194) < 0.0 == (*(float *)(DAT_101d1b9c + 0x194) == 0.0)) {
    if (fVar1 < *(float *)(DAT_101d1b9c + 0x18c) == (fVar1 == *(float *)(DAT_101d1b9c + 0x18c))) {
      if (fVar1 < *(float *)(DAT_101d1b9c + 400)) {
        fVar2 = (fVar1 - *(float *)(DAT_101d1b9c + 0x18c)) /
                (*(float *)(DAT_101d1b9c + 400) - *(float *)(DAT_101d1b9c + 0x18c));
      }
      else {
        fVar2 = 1.0;
      }
    }
    else {
      fVar2 = 0.0;
    }
    fVar3 = (float10)FUN_1003abd0(*(undefined4 *)(in_EDX + 4),fVar2 * *(float *)(in_EDX + 0x18),
                                  *(undefined4 *)(DAT_101d1b9c + 0x198),
                                  *(undefined4 *)(DAT_101d1b9c + 0x19c));
    *(float *)(extraout_EDX + 4) = (float)fVar3;
    *unaff_ESI = (float)(fVar3 * (float10)*(float *)(DAT_101d1b9c + 0x194));
    in_EDX = extraout_EDX;
  }
  else {
    *unaff_ESI = 0.0;
  }
  if (*(float *)(DAT_101d1b9c + 0x1a8) < 0.0 != (*(float *)(DAT_101d1b9c + 0x1a8) == 0.0)) {
    *unaff_EBX = 0.0;
    return;
  }
  if (fVar1 < *(float *)(DAT_101d1b9c + 0x1a0) == (fVar1 == *(float *)(DAT_101d1b9c + 0x1a0))) {
    if (fVar1 < *(float *)(DAT_101d1b9c + 0x1a4)) {
      fVar1 = (fVar1 - *(float *)(DAT_101d1b9c + 0x1a0)) /
              (*(float *)(DAT_101d1b9c + 0x1a4) - *(float *)(DAT_101d1b9c + 0x1a0));
    }
    else {
      fVar1 = 1.0;
    }
  }
  else {
    fVar1 = 0.0;
  }
  fVar3 = (float10)FUN_1003abd0(*(undefined4 *)(in_EDX + 8),fVar1 * *(float *)(in_EDX + 0x18),
                                *(undefined4 *)(DAT_101d1b9c + 0x1ac),
                                *(undefined4 *)(DAT_101d1b9c + 0x1b0));
  *(float *)(extraout_EDX_00 + 8) = (float)fVar3;
  *unaff_EBX = (float)(fVar3 * (float10)*(float *)(DAT_101d1b9c + 0x1a8));
  return;
}


