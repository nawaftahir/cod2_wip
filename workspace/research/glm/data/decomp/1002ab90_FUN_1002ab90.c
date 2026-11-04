// 1002ab90 size=87 FUN_1002ab90

uint FUN_1002ab90(void)

{
  int *piVar1;
  int *piVar2;
  int unaff_EDI;
  
  piVar2 = *(int **)(unaff_EDI + 0xc428);
  if (*DAT_101da9c8 - piVar2[2] < 3) {
    return (uint)DAT_101da9c8 & 0xffffff00;
  }
  FUN_1002aac0();
  *(int *)piVar2[1] = *piVar2;
  *(int *)(*piVar2 + 4) = piVar2[1];
  piVar1 = piVar2 + 0x22;
  *piVar1 = unaff_EDI + 0xc400;
  piVar2[0x23] = *(int *)(unaff_EDI + 0xc404);
  *(int **)(unaff_EDI + 0xc404) = piVar1;
  *(int **)piVar2[0x23] = piVar1;
  return CONCAT31((int3)((uint)piVar1 >> 8),1);
}


