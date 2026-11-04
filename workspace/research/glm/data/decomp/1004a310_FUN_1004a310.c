// 1004a310 size=227 FUN_1004a310

undefined4 FUN_1004a310(void)

{
  char cVar1;
  int iVar2;
  int *unaff_ESI;
  
  iVar2 = unaff_ESI[5];
  if (((iVar2 == 0xcd) || (iVar2 == 0xce)) && ((char)unaff_ESI[0x12] == '\0')) {
    if ((uint)unaff_ESI[0x20] < (uint)unaff_ESI[0x1a]) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x43;
      (**(code **)*unaff_ESI)();
    }
    (**(code **)(unaff_ESI[0x62] + 4))();
    unaff_ESI[5] = 0xd2;
  }
  else if (iVar2 == 0xcf) {
    unaff_ESI[5] = 0xd2;
  }
  else if (iVar2 != 0xd2) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x14;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[5];
    (**(code **)*unaff_ESI)();
  }
  cVar1 = *(char *)(unaff_ESI[0x66] + 0x11);
  while (cVar1 == '\0') {
    iVar2 = (**(code **)unaff_ESI[0x66])();
    if (iVar2 == 0) {
      return 0;
    }
    cVar1 = *(char *)(unaff_ESI[0x66] + 0x11);
  }
  (**(code **)(unaff_ESI[8] + 0x18))();
  if (unaff_ESI[1] != 0) {
    (**(code **)(unaff_ESI[1] + 0x24))();
    if ((char)unaff_ESI[4] != '\0') {
      unaff_ESI[5] = 200;
      unaff_ESI[0x45] = 0;
      return 1;
    }
    unaff_ESI[5] = 100;
  }
  return 1;
}


