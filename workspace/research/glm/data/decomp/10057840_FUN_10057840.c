// 10057840 size=296 FUN_10057840

void FUN_10057840(void)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  int *unaff_ESI;
  
  puVar1 = (undefined4 *)(**(code **)unaff_ESI[1])();
  unaff_ESI[0x6c] = (int)puVar1;
  *puVar1 = &LAB_10057710;
  puVar1[3] = &LAB_10057830;
  puVar1[8] = 0;
  puVar1[10] = 0;
  if (unaff_ESI[0x1b] != 3) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x2f;
    (**(code **)*unaff_ESI)();
  }
  uVar2 = (**(code **)unaff_ESI[1])();
  puVar1[6] = uVar2;
  iVar3 = 0;
  do {
    uVar2 = (**(code **)(unaff_ESI[1] + 4))();
    *(undefined4 *)(puVar1[6] + iVar3) = uVar2;
    iVar3 = iVar3 + 4;
  } while (iVar3 < 0x80);
  *(undefined1 *)(puVar1 + 7) = 1;
  if (*(char *)((int)unaff_ESI + 0x62) == '\0') {
    puVar1[4] = 0;
  }
  else {
    iVar3 = unaff_ESI[0x17];
    if (iVar3 < 8) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x38;
      *(undefined4 *)(*unaff_ESI + 0x18) = 8;
      (**(code **)*unaff_ESI)();
    }
    if (0x100 < iVar3) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x39;
      *(undefined4 *)(*unaff_ESI + 0x18) = 0x100;
      (**(code **)*unaff_ESI)();
    }
    uVar2 = (**(code **)(unaff_ESI[1] + 8))();
    puVar1[4] = uVar2;
    puVar1[5] = iVar3;
  }
  if (unaff_ESI[0x15] != 0) {
    unaff_ESI[0x15] = 2;
  }
  if (unaff_ESI[0x15] == 2) {
    uVar2 = (**(code **)(unaff_ESI[1] + 4))();
    puVar1[8] = uVar2;
    FUN_10057630();
    return;
  }
  return;
}


