// 1004f9e0 size=527 FUN_1004f9e0

void FUN_1004f9e0(void)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int *unaff_ESI;
  int iStack_4;
  
  if (unaff_ESI[5] != 0xca) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x14;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[5];
    (**(code **)*unaff_ESI)();
  }
  iVar6 = unaff_ESI[0xe];
  uVar1 = unaff_ESI[0xf];
  if ((uint)(iVar6 * 8) < uVar1 || iVar6 * 8 - uVar1 == 0) {
    unaff_ESI[0x19] = (int)(unaff_ESI[9] + 7 + (unaff_ESI[9] + 7 >> 0x1f & 7U)) >> 3;
    unaff_ESI[0x1a] = (int)(unaff_ESI[10] + 7 + (unaff_ESI[10] + 7 >> 0x1f & 7U)) >> 3;
    unaff_ESI[0x48] = 1;
  }
  else if ((uint)(iVar6 * 4) < uVar1 || iVar6 * 4 - uVar1 == 0) {
    unaff_ESI[0x19] = (int)(unaff_ESI[9] + 3 + (unaff_ESI[9] + 3 >> 0x1f & 3U)) >> 2;
    unaff_ESI[0x1a] = (int)(unaff_ESI[10] + 3 + (unaff_ESI[10] + 3 >> 0x1f & 3U)) >> 2;
    unaff_ESI[0x48] = 2;
  }
  else if (uVar1 < (uint)(iVar6 * 2)) {
    unaff_ESI[0x19] = unaff_ESI[9];
    unaff_ESI[0x1a] = unaff_ESI[10];
    unaff_ESI[0x48] = 8;
  }
  else {
    unaff_ESI[0x19] = (unaff_ESI[9] + 1) / 2;
    unaff_ESI[0x1a] = (unaff_ESI[10] + 1) / 2;
    unaff_ESI[0x48] = 4;
  }
  iStack_4 = 0;
  if (0 < unaff_ESI[0xb]) {
    piVar4 = (int *)(unaff_ESI[0x33] + 0xc);
    do {
      iVar6 = unaff_ESI[0x48];
      iVar3 = iVar6;
      if (iVar6 < 8) {
        do {
          iVar5 = piVar4[-1] * iVar3 * 2;
          if ((iVar5 - unaff_ESI[0x46] * iVar6 != 0 && unaff_ESI[0x46] * iVar6 <= iVar5) ||
             (iVar5 = *piVar4 * iVar3 * 2,
             iVar5 - unaff_ESI[0x47] * iVar6 != 0 && unaff_ESI[0x47] * iVar6 <= iVar5)) break;
          iVar3 = iVar3 * 2;
        } while (iVar3 < 8);
      }
      piVar4[6] = iVar3;
      iStack_4 = iStack_4 + 1;
      piVar4 = piVar4 + 0x15;
    } while (iStack_4 < unaff_ESI[0xb]);
  }
  iVar6 = 0;
  if (0 < unaff_ESI[0xb]) {
    piVar4 = (int *)(unaff_ESI[0x33] + 0x24);
    do {
      piVar4[1] = (piVar4[-7] * *piVar4 * unaff_ESI[9] + -1 + unaff_ESI[0x46] * 8) /
                  (unaff_ESI[0x46] * 8);
      iVar6 = iVar6 + 1;
      piVar4[2] = (piVar4[-6] * unaff_ESI[10] * *piVar4 + -1 + unaff_ESI[0x47] * 8) /
                  (unaff_ESI[0x47] * 8);
      piVar4 = piVar4 + 0x15;
    } while (iVar6 < unaff_ESI[0xb]);
  }
  switch(unaff_ESI[0xd]) {
  case 1:
    unaff_ESI[0x1b] = 1;
    break;
  case 2:
  case 3:
    unaff_ESI[0x1b] = 3;
    break;
  case 4:
  case 5:
    unaff_ESI[0x1b] = 4;
    break;
  default:
    unaff_ESI[0x1b] = unaff_ESI[0xb];
  }
  iVar6 = 1;
  if (*(char *)((int)unaff_ESI + 0x52) == '\0') {
    iVar6 = unaff_ESI[0x1b];
  }
  unaff_ESI[0x1c] = iVar6;
  cVar2 = FUN_1004f960();
  if (cVar2 == '\0') {
    unaff_ESI[0x1d] = 1;
    return;
  }
  unaff_ESI[0x1d] = unaff_ESI[0x47];
  return;
}


