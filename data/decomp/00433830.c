
void FUN_00433830(void)

{
  float fVar1;
  int iVar2;
  int iVar3;
  int *unaff_ESI;
  int iVar4;
  int local_c;
  int local_8;
  
  local_c = 0;
  if (0 < *unaff_ESI) {
    iVar4 = 0;
    do {
      local_8 = 0;
      if (0 < unaff_ESI[1]) {
        iVar2 = iVar4;
        do {
          unaff_ESI[(DAT_01128d94 + iVar2) * 2 + 0xc] =
               (int)((float)local_c / (float)(*unaff_ESI + -1));
          fVar1 = (float)local_8;
          iVar3 = DAT_01128d94 + iVar2;
          local_8 = local_8 + 1;
          iVar2 = iVar2 + 7;
          unaff_ESI[iVar3 * 2 + 0xd] = (int)(fVar1 / (float)(unaff_ESI[1] + -1));
        } while (local_8 < unaff_ESI[1]);
      }
      local_c = local_c + 1;
      iVar4 = iVar4 + 0x70;
    } while (local_c < *unaff_ESI);
  }
  if (DAT_01128d94 == 1) {
    *(undefined1 *)((int)unaff_ESI + 0x382f) = 0;
  }
  if ((void *)unaff_ESI[0xe09] != (void *)0x0) {
    _free((void *)unaff_ESI[0xe09]);
  }
  iVar4 = FUN_004267d0(DAT_01128d94,0,0);
  *(short *)(unaff_ESI + 0xe0b) = (short)unaff_ESI[0xe0b] + 1;
  unaff_ESI[0xe09] = iVar4;
  return;
}

