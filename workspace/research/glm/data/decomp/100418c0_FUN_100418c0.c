// 100418c0 size=304 FUN_100418c0

void FUN_100418c0(void)

{
  int iVar1;
  char cVar2;
  int *unaff_ESI;
  uint uVar3;
  
  iVar1 = unaff_ESI[5];
  if ((iVar1 == 0x65) || (iVar1 == 0x66)) {
    if ((uint)unaff_ESI[0x36] < (uint)unaff_ESI[10]) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x43;
      (**(code **)*unaff_ESI)();
    }
    (**(code **)(unaff_ESI[0x51] + 8))();
  }
  else if (iVar1 != 0x67) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x14;
    *(int *)(*unaff_ESI + 0x18) = unaff_ESI[5];
    (**(code **)*unaff_ESI)();
  }
  cVar2 = *(char *)(unaff_ESI[0x51] + 0xd);
  while (cVar2 == '\0') {
    (**(code **)unaff_ESI[0x51])();
    uVar3 = 0;
    if (unaff_ESI[0x3a] != 0) {
      do {
        if (unaff_ESI[2] != 0) {
          *(uint *)(unaff_ESI[2] + 4) = uVar3;
          *(int *)(unaff_ESI[2] + 8) = unaff_ESI[0x3a];
          (**(code **)unaff_ESI[2])();
        }
        cVar2 = (**(code **)(unaff_ESI[0x54] + 4))();
        if (cVar2 == '\0') {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x18;
          (**(code **)*unaff_ESI)();
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < (uint)unaff_ESI[0x3a]);
    }
    (**(code **)(unaff_ESI[0x51] + 8))();
    cVar2 = *(char *)(unaff_ESI[0x51] + 0xd);
  }
  (**(code **)(unaff_ESI[0x55] + 0xc))();
  (**(code **)(unaff_ESI[8] + 0x10))();
  if (unaff_ESI[1] != 0) {
    (**(code **)(unaff_ESI[1] + 0x24))();
    if ((char)unaff_ESI[4] != '\0') {
      unaff_ESI[5] = 200;
      unaff_ESI[0x45] = 0;
      return;
    }
    unaff_ESI[5] = 100;
  }
  return;
}


