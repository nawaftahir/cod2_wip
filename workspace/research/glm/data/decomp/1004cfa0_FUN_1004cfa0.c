// 1004cfa0 size=510 FUN_1004cfa0

void FUN_1004cfa0(void)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int *unaff_ESI;
  int iStack_4;
  
  if ((0xffdc < unaff_ESI[10]) || (0xffdc < unaff_ESI[9])) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x29;
    *(undefined4 *)(*unaff_ESI + 0x18) = 0xffdc;
    (**(code **)*unaff_ESI)();
  }
  if (unaff_ESI[0x32] != 8) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0xf;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[0x32];
    (**(code **)*unaff_ESI)();
  }
  if (10 < unaff_ESI[0xb]) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x1a;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[0xb];
    *(undefined4 *)(*unaff_ESI + 0x1c) = 10;
    (**(code **)*unaff_ESI)();
  }
  iVar3 = 0;
  unaff_ESI[0x46] = 1;
  unaff_ESI[0x47] = 1;
  if (0 < unaff_ESI[0xb]) {
    piVar2 = (int *)(unaff_ESI[0x33] + 0xc);
    do {
      if ((((piVar2[-1] < 1) || (4 < piVar2[-1])) || (*piVar2 < 1)) || (4 < *piVar2)) {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x12;
        (**(code **)*unaff_ESI)();
      }
      iVar1 = unaff_ESI[0x46];
      if (unaff_ESI[0x46] <= piVar2[-1]) {
        iVar1 = piVar2[-1];
      }
      unaff_ESI[0x46] = iVar1;
      iVar1 = unaff_ESI[0x47];
      if (unaff_ESI[0x47] <= *piVar2) {
        iVar1 = *piVar2;
      }
      unaff_ESI[0x47] = iVar1;
      iVar3 = iVar3 + 1;
      piVar2 = piVar2 + 0x15;
    } while (iVar3 < unaff_ESI[0xb]);
  }
  unaff_ESI[0x48] = 8;
  iStack_4 = 0;
  if (0 < unaff_ESI[0xb]) {
    piVar2 = (int *)(unaff_ESI[0x33] + 0x1c);
    do {
      piVar2[2] = 8;
      *piVar2 = (unaff_ESI[9] * piVar2[-5] + -1 + unaff_ESI[0x46] * 8) / (unaff_ESI[0x46] * 8);
      piVar2[1] = (unaff_ESI[10] * piVar2[-4] + -1 + unaff_ESI[0x47] * 8) / (unaff_ESI[0x47] * 8);
      piVar2[3] = (unaff_ESI[9] * piVar2[-5] + -1 + unaff_ESI[0x46]) / unaff_ESI[0x46];
      iVar3 = unaff_ESI[10];
      iVar1 = unaff_ESI[0x47];
      *(undefined1 *)(piVar2 + 5) = 1;
      piVar2[0xc] = 0;
      piVar2[4] = (iVar3 * piVar2[-4] + -1 + iVar1) / iVar1;
      iStack_4 = iStack_4 + 1;
      piVar2 = piVar2 + 0x15;
    } while (iStack_4 < unaff_ESI[0xb]);
  }
  unaff_ESI[0x49] = (unaff_ESI[0x47] * 8 + -1 + unaff_ESI[10]) / (unaff_ESI[0x47] * 8);
  if ((unaff_ESI[0xb] <= unaff_ESI[0x4b]) && ((char)unaff_ESI[0x34] == '\0')) {
    *(undefined1 *)(unaff_ESI[0x66] + 0x10) = 0;
    return;
  }
  *(undefined1 *)(unaff_ESI[0x66] + 0x10) = 1;
  return;
}


