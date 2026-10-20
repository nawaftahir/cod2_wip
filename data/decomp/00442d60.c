
void FUN_00442d60(void)

{
  int iVar1;
  char cVar2;
  char *pcVar3;
  int iVar4;
  char *unaff_ESI;
  int unaff_EDI;
  
  if (0 < (int)DAT_00591b20) {
    KillTimer(*(HWND *)(unaff_EDI + 0x1c),1);
  }
  DAT_01234d67 = 0;
  if (unaff_ESI != (char *)0x0) {
    pcVar3 = unaff_ESI;
    do {
      cVar2 = *pcVar3;
      pcVar3 = pcVar3 + 1;
    } while (cVar2 != '\0');
    FUN_00402b30(unaff_ESI,(int)pcVar3 - (int)(unaff_ESI + 1));
    if (0 < *(int *)(DAT_01234d68 + -0xc)) {
      DAT_01234d67 = 1;
      if (((*(int *)(DAT_01233488 + 0x7a0) == 1) || (*(int *)(DAT_01233488 + 0x7a0) == 2)) &&
         (iVar4 = *(int *)(DAT_01234d68 + -0xc), DAT_012334cc < iVar4)) {
        iVar1 = iVar4 + -1;
        if ((iVar1 < 0) || (iVar4 < iVar1)) {
                    /* WARNING: Subroutine does not return */
          FUN_00402c90(0x80070057);
        }
        iVar4 = _toupper((int)*(char *)(DAT_01234d68 + iVar1));
        DAT_0109fdb8 = (char)iVar4;
        if ((DAT_0109fdb8 == 'N') || (DAT_0109fdb8 == 'O')) {
          DAT_00591b20 = SetTimer(*(HWND *)(unaff_EDI + 0x1c),1,800,(TIMERPROC)0x0);
        }
      }
    }
    DAT_012334cc = *(int *)(DAT_01234d68 + -0xc);
    _qsort(&DAT_01234d70,DAT_01234d6c,4,FUN_004405d0);
  }
  DAT_0123348c = DAT_0123348c | 0x10;
  return;
}

