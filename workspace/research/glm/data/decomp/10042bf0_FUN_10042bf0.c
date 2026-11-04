// 10042bf0 size=501 FUN_10042bf0

void FUN_10042bf0(void)

{
  int iVar1;
  undefined4 *puVar2;
  int *unaff_ESI;
  
  puVar2 = (undefined4 *)(**(code **)unaff_ESI[1])();
  unaff_ESI[0x56] = (int)puVar2;
  *puVar2 = &DAT_10042be0;
  switch(unaff_ESI[0xc]) {
  case 1:
    if (unaff_ESI[0xb] != 1) {
LAB_10042c5a:
      *(undefined4 *)(*unaff_ESI + 0x14) = 9;
      (**(code **)*unaff_ESI)();
    }
    break;
  case 2:
  case 3:
    if (unaff_ESI[0xb] != 3) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 9;
      (**(code **)*unaff_ESI)();
    }
    break;
  case 4:
  case 5:
    if (unaff_ESI[0xb] != 4) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 9;
      (**(code **)*unaff_ESI)();
    }
    break;
  default:
    if (unaff_ESI[0xb] < 1) goto LAB_10042c5a;
  }
  switch(unaff_ESI[0x12]) {
  case 1:
    if (unaff_ESI[0x11] != 1) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    iVar1 = unaff_ESI[0xc];
    if (iVar1 != 1) {
      if (iVar1 == 2) {
        *puVar2 = FUN_100426d0;
        puVar2[1] = FUN_100428d0;
        return;
      }
      if (iVar1 != 3) goto LAB_10042d63;
    }
    puVar2[1] = FUN_10042ae0;
    return;
  case 2:
    if (unaff_ESI[0x11] != 3) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    if (unaff_ESI[0xc] != 2) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
      (**(code **)*unaff_ESI)();
      return;
    }
    break;
  case 3:
    if (unaff_ESI[0x11] != 3) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    if (unaff_ESI[0xc] == 2) {
      *puVar2 = FUN_100426d0;
      puVar2[1] = FUN_100427b0;
      return;
    }
    if (unaff_ESI[0xc] != 3) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
      (**(code **)*unaff_ESI)();
      return;
    }
    break;
  case 4:
    if (unaff_ESI[0x11] != 4) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    if (unaff_ESI[0xc] != 4) {
LAB_10042d63:
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
      (**(code **)*unaff_ESI)();
      return;
    }
    break;
  case 5:
    if (unaff_ESI[0x11] != 4) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 10;
      (**(code **)*unaff_ESI)();
    }
    if (unaff_ESI[0xc] == 4) {
      *puVar2 = FUN_100426d0;
      puVar2[1] = FUN_10042980;
      return;
    }
    if (unaff_ESI[0xc] != 5) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
      (**(code **)*unaff_ESI)();
      return;
    }
    break;
  default:
    if ((unaff_ESI[0x12] != unaff_ESI[0xc]) || (unaff_ESI[0x11] != unaff_ESI[0xb])) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x1b;
      (**(code **)*unaff_ESI)();
    }
  }
  puVar2[1] = &LAB_10042b50;
  return;
}


