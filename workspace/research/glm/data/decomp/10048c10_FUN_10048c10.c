// 10048c10 size=162 FUN_10048c10

void FUN_10048c10(void)

{
  char in_AL;
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  int *unaff_ESI;
  
  if (in_AL != '\0') {
    *(undefined4 *)(*unaff_ESI + 0x14) = 4;
    (**(code **)*unaff_ESI)();
  }
  puVar1 = (undefined4 *)(**(code **)unaff_ESI[1])();
  unaff_ESI[0x53] = (int)puVar1;
  *puVar1 = &LAB_100485a0;
  if (*(char *)(unaff_ESI[0x57] + 8) == '\0') {
    puVar1[1] = FUN_10048630;
    iVar3 = 0;
    if (0 < unaff_ESI[0x11]) {
      puVar1 = puVar1 + 2;
      do {
        uVar2 = (**(code **)(unaff_ESI[1] + 8))();
        *puVar1 = uVar2;
        iVar3 = iVar3 + 1;
        puVar1 = puVar1 + 1;
      } while (iVar3 < unaff_ESI[0x11]);
    }
    return;
  }
  puVar1[1] = FUN_10048860;
  FUN_10048ad0();
  return;
}


