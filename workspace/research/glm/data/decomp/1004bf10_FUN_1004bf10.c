// 1004bf10 size=429 FUN_1004bf10

void FUN_1004bf10(void)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  int *unaff_ESI;
  
  puVar1 = (undefined4 *)(**(code **)unaff_ESI[1])();
  unaff_ESI[0x6b] = (int)puVar1;
  *puVar1 = &DAT_1004bf00;
  switch(unaff_ESI[0xc]) {
  case 1:
    if (unaff_ESI[0xb] != 1) {
LAB_1004bf76:
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    break;
  case 2:
  case 3:
    if (unaff_ESI[0xb] != 3) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    break;
  case 4:
  case 5:
    if (unaff_ESI[0xb] != 4) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    break;
  default:
    if (unaff_ESI[0xb] < 1) goto LAB_1004bf76;
  }
  iVar2 = unaff_ESI[0xd];
  if (iVar2 == 1) {
    unaff_ESI[0x1b] = 1;
    if ((unaff_ESI[0xc] == 1) || (unaff_ESI[0xc] == 3)) {
      puVar1[1] = &LAB_1004bd20;
      iVar2 = 1;
      if (1 < unaff_ESI[0xb]) {
        iVar3 = 0x54;
        do {
          *(undefined1 *)(unaff_ESI[0x33] + 0x30 + iVar3) = 0;
          iVar2 = iVar2 + 1;
          iVar3 = iVar3 + 0x54;
        } while (iVar2 < unaff_ESI[0xb]);
      }
      goto LAB_1004c0a6;
    }
  }
  else {
    if (iVar2 == 2) {
      iVar2 = unaff_ESI[0xc];
      unaff_ESI[0x1b] = 3;
      if (iVar2 == 3) {
        puVar1[1] = FUN_1004bb80;
        FUN_1004bab0();
      }
      else if (iVar2 == 1) {
        puVar1[1] = &LAB_1004bd50;
      }
      else if (iVar2 == 2) {
        puVar1[1] = FUN_1004bca0;
      }
      else {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
        (**(code **)*unaff_ESI)();
      }
      goto LAB_1004c0a6;
    }
    if (iVar2 == 4) {
      unaff_ESI[0x1b] = 4;
      if (unaff_ESI[0xc] == 5) {
        puVar1[1] = FUN_1004bdb0;
        FUN_1004bab0();
      }
      else if (unaff_ESI[0xc] == 4) {
        puVar1[1] = FUN_1004bca0;
      }
      else {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
        (**(code **)*unaff_ESI)();
      }
      goto LAB_1004c0a6;
    }
    if (iVar2 == unaff_ESI[0xc]) {
      unaff_ESI[0x1b] = unaff_ESI[0xb];
      puVar1[1] = FUN_1004bca0;
      goto LAB_1004c0a6;
    }
  }
  *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
  (**(code **)*unaff_ESI)();
LAB_1004c0a6:
  if (*(char *)((int)unaff_ESI + 0x52) == '\0') {
    unaff_ESI[0x1c] = unaff_ESI[0x1b];
    return;
  }
  unaff_ESI[0x1c] = 1;
  return;
}


