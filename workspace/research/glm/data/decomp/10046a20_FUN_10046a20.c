// 10046a20 size=463 FUN_10046a20

void FUN_10046a20(int param_1,int param_2,char param_3)

{
  int iVar1;
  int iVar2;
  int unaff_EBX;
  int *piVar3;
  int *unaff_EDI;
  
  if (unaff_EDI[5] != 100) {
    *(undefined4 *)(*unaff_EDI + 0x14) = 0x14;
    *(int *)(*unaff_EDI + 0x18) = unaff_EDI[5];
    (**(code **)*unaff_EDI)();
  }
  if ((unaff_EBX < 0) || (3 < unaff_EBX)) {
    *(undefined4 *)(*unaff_EDI + 0x14) = 0x1f;
    *(int *)(*unaff_EDI + 0x18) = unaff_EBX;
    (**(code **)*unaff_EDI)();
  }
  if (unaff_EDI[unaff_EBX + 0x14] == 0) {
    iVar1 = (**(code **)unaff_EDI[1])();
    *(undefined1 *)(iVar1 + 0x80) = 0;
    unaff_EDI[unaff_EBX + 0x14] = iVar1;
  }
  iVar1 = 0;
  piVar3 = (int *)(param_1 + 8);
  do {
    iVar2 = (piVar3[-2] * param_2 + 0x32) / 100;
    if (iVar2 < 1) {
      iVar2 = 1;
    }
    else if (0x7fff < iVar2) {
      iVar2 = 0x7fff;
    }
    if ((param_3 != '\0') && (0xff < iVar2)) {
      iVar2 = 0xff;
    }
    *(short *)(iVar1 + unaff_EDI[unaff_EBX + 0x14]) = (short)iVar2;
    iVar2 = (piVar3[-1] * param_2 + 0x32) / 100;
    if (iVar2 < 1) {
      iVar2 = 1;
    }
    else if (0x7fff < iVar2) {
      iVar2 = 0x7fff;
    }
    if ((param_3 != '\0') && (0xff < iVar2)) {
      iVar2 = 0xff;
    }
    *(short *)(unaff_EDI[unaff_EBX + 0x14] + 2 + iVar1) = (short)iVar2;
    iVar2 = (*piVar3 * param_2 + 0x32) / 100;
    if (iVar2 < 1) {
      iVar2 = 1;
    }
    else if (0x7fff < iVar2) {
      iVar2 = 0x7fff;
    }
    if ((param_3 != '\0') && (0xff < iVar2)) {
      iVar2 = 0xff;
    }
    *(short *)(unaff_EDI[unaff_EBX + 0x14] + 4 + iVar1) = (short)iVar2;
    iVar2 = (piVar3[1] * param_2 + 0x32) / 100;
    if (iVar2 < 1) {
      iVar2 = 1;
    }
    else if (0x7fff < iVar2) {
      iVar2 = 0x7fff;
    }
    if ((param_3 != '\0') && (0xff < iVar2)) {
      iVar2 = 0xff;
    }
    *(short *)(iVar1 + 6 + unaff_EDI[unaff_EBX + 0x14]) = (short)iVar2;
    iVar1 = iVar1 + 8;
    piVar3 = piVar3 + 4;
  } while (iVar1 < 0x80);
  *(undefined1 *)(unaff_EDI[unaff_EBX + 0x14] + 0x80) = 0;
  return;
}


