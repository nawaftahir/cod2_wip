// 100463d0 size=235 FUN_100463d0

void FUN_100463d0(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int *unaff_ESI;
  int *piVar5;
  
  if (unaff_ESI[0x2d] == 0) {
    if (4 < unaff_ESI[0x11]) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1a;
      *(int *)(*unaff_ESI + 0x18) = unaff_ESI[0x11];
      *(undefined4 *)(*unaff_ESI + 0x1c) = 4;
      (**(code **)*unaff_ESI)();
    }
    iVar2 = 0;
    unaff_ESI[0x3b] = unaff_ESI[0x11];
    if (0 < unaff_ESI[0x11]) {
      iVar3 = 0;
      piVar1 = unaff_ESI + 0x3c;
      do {
        *piVar1 = unaff_ESI[0x13] + iVar3;
        iVar2 = iVar2 + 1;
        piVar1 = piVar1 + 1;
        iVar3 = iVar3 + 0x54;
      } while (iVar2 < unaff_ESI[0x11]);
    }
    unaff_ESI[0x4d] = 0;
    unaff_ESI[0x4f] = 0;
    unaff_ESI[0x50] = 0;
    unaff_ESI[0x4e] = 0x3f;
    return;
  }
  piVar1 = (int *)(unaff_ESI[0x2d] + *(int *)(unaff_ESI[0x51] + 0x1c) * 0x24);
  unaff_ESI[0x3b] = *piVar1;
  iVar2 = 0;
  if (0 < *piVar1) {
    piVar5 = unaff_ESI + 0x3c;
    piVar4 = piVar1;
    do {
      piVar4 = piVar4 + 1;
      *piVar5 = *piVar4 * 0x54 + unaff_ESI[0x13];
      iVar2 = iVar2 + 1;
      piVar5 = piVar5 + 1;
    } while (iVar2 < *piVar1);
  }
  unaff_ESI[0x4d] = piVar1[5];
  unaff_ESI[0x4e] = piVar1[6];
  unaff_ESI[0x4f] = piVar1[7];
  unaff_ESI[0x50] = piVar1[8];
  return;
}


