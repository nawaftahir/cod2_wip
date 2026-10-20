
void FUN_0040ffb0(void)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  char *unaff_ESI;
  
  FUN_004fc069(1);
  if (*(int *)(DAT_01233868 + 0x84) != 0) {
    if (unaff_ESI == (char *)0x0) {
      iVar2 = 0;
    }
    else {
      pcVar3 = unaff_ESI;
      do {
        cVar1 = *pcVar3;
        pcVar3 = pcVar3 + 1;
      } while (cVar1 != '\0');
      iVar2 = (int)pcVar3 - (int)(unaff_ESI + 1);
    }
    FUN_00402b30(unaff_ESI,iVar2);
    FUN_004fc069(0);
  }
  return;
}

