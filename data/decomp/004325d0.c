
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004325d0(void)

{
  int iVar1;
  int iVar2;
  int unaff_EBX;
  int *unaff_ESI;
  int iVar3;
  int local_8;
  
  iVar3 = 0;
  local_8 = 0;
  if (0 < *unaff_ESI) {
    do {
      if (0 < unaff_ESI[1]) {
        iVar2 = 0;
        do {
          if (DAT_011298b0 == 4) {
            iVar1 = 0;
            if (0 < DAT_010c4d84) {
              do {
                if (unaff_ESI + (iVar3 + iVar2) * 0xe + 9 == (int *)(&DAT_010c4d88)[iVar1]) {
                  if (iVar1 != -1) goto LAB_00432629;
                  break;
                }
                iVar1 = iVar1 + 1;
              } while (iVar1 < DAT_010c4d84);
            }
          }
          else {
LAB_00432629:
            unaff_ESI[unaff_EBX + 0xc + ((iVar3 + iVar2) * 7 + DAT_01128d94) * 2] =
                 (int)(_DAT_00556a58 -
                      (float)unaff_ESI[unaff_EBX + 0xc + ((iVar3 + iVar2) * 7 + DAT_01128d94) * 2]);
          }
          iVar2 = iVar2 + 1;
        } while (iVar2 < unaff_ESI[1]);
      }
      local_8 = local_8 + 1;
      iVar3 = iVar3 + 0x10;
    } while (local_8 < *unaff_ESI);
  }
  if (DAT_01128d94 == 1) {
    *(undefined1 *)((int)unaff_ESI + 0x382f) = 0;
  }
  if ((void *)unaff_ESI[0xe09] != (void *)0x0) {
    _free((void *)unaff_ESI[0xe09]);
  }
  iVar3 = FUN_004267d0(DAT_01128d94,0,0);
  *(short *)(unaff_ESI + 0xe0b) = (short)unaff_ESI[0xe0b] + 1;
  unaff_ESI[0xe09] = iVar3;
  return;
}

