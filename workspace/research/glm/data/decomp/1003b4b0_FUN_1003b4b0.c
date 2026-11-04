// 1003b4b0 size=156 FUN_1003b4b0

void FUN_1003b4b0(void)

{
  int iVar1;
  int unaff_ESI;
  float10 fVar2;
  float local_c;
  float local_8;
  float local_4;
  
  fVar2 = (float10)FUN_1003b310(0x10,0x10);
  *(float *)(unaff_ESI + 0x18) = (float)fVar2;
  if (fVar2 != (float10)0.0) {
    local_c = *(float *)(DAT_101d1b9c + 0x1b4) * 262144.0 + *DAT_1072ddc8;
    local_8 = *(float *)(DAT_101d1b9c + 0x1b8) * 262144.0 + DAT_1072ddc8[1];
    local_4 = *(float *)(DAT_101d1b9c + 0x1bc) * 262144.0 + DAT_1072ddc8[2];
    iVar1 = (*(code *)RI_CM_BoxTrace)
                      (*(undefined4 *)(unaff_ESI + 0x20),DAT_1072ddc8,&local_c,&DAT_10191348,
                       &DAT_10191348,0,0x2003);
    *(int *)(unaff_ESI + 0x20) = iVar1;
    if (iVar1 != 0) {
      *(undefined4 *)(unaff_ESI + 0x18) = 0;
    }
  }
  return;
}


