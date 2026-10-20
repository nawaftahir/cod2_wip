
int FUN_00475250(void)

{
  int iVar1;
  int *piVar2;
  undefined4 unaff_EBX;
  int unaff_ESI;
  int unaff_EDI;
  
  iVar1 = 0;
  if (0 < DAT_010c4d80) {
    piVar2 = &DAT_010c2d84;
    do {
      if ((piVar2[-1] == unaff_ESI) && (*piVar2 == unaff_EDI)) {
        *(undefined4 *)(&DAT_010c2d8c + iVar1 * 0x10) = unaff_EBX;
        return iVar1;
      }
      iVar1 = iVar1 + 1;
      piVar2 = piVar2 + 4;
    } while (iVar1 < DAT_010c4d80);
  }
  (&DAT_010c2d80)[DAT_010c4d80 * 4] = unaff_EDI;
  (&DAT_010c2d84)[DAT_010c4d80 * 4] = unaff_ESI;
  *(undefined4 *)(&DAT_010c2d88 + DAT_010c4d80 * 0x10) = unaff_EBX;
  if (DAT_010c4d80 < 0x1ff) {
    DAT_010c4d80 = DAT_010c4d80 + 1;
  }
  return DAT_010c4d80 + -1;
}

