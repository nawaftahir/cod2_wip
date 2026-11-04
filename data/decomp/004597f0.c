
void FUN_004597f0(undefined4 *param_1,undefined4 param_2,undefined4 param_3,char param_4)

{
  int iVar1;
  int unaff_ESI;
  int iVar2;
  
  iVar2 = 0;
  if (0 < *(int *)(unaff_ESI + 0x38)) {
    iVar1 = 0;
    do {
      FUN_004593c0(*(int *)(unaff_ESI + 0x3c) + iVar1,param_1);
      iVar2 = iVar2 + 1;
      iVar1 = iVar1 + 0xa8;
    } while (iVar2 < *(int *)(unaff_ESI + 0x38));
  }
  FUN_0045a220(1);
  if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
    FUN_00475350();
  }
  FUN_0047a3c0();
  iVar2 = *(int *)(unaff_ESI + 0x44);
  *(short *)(unaff_ESI + 0x42) = *(short *)(unaff_ESI + 0x42) + 1;
  if (iVar2 != 0) {
    if (param_4 == '\0') {
      FUN_0042f970(param_2,param_3);
    }
    else {
      *(undefined4 *)(iVar2 + 0x18 + DAT_01128d90 * 4) = *param_1;
      *(short *)(iVar2 + 0x382c) = *(short *)(iVar2 + 0x382c) + 1;
      if (DAT_01234694 != 0) {
        FUN_00424b10();
        FUN_0045e0b0();
        return;
      }
    }
  }
  FUN_0045e0b0();
  return;
}

