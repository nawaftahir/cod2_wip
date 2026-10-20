
void FUN_0047c650(undefined4 param_1)

{
  char cVar1;
  undefined4 in_EAX;
  char *pcVar2;
  undefined4 *unaff_ESI;
  char *unaff_EDI;
  
  unaff_ESI[2] = in_EAX;
  pcVar2 = unaff_EDI;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  pcVar2 = (char *)FUN_004ff450(pcVar2 + (1 - (int)(unaff_EDI + 1)));
  *unaff_ESI = pcVar2;
  if (pcVar2 != (char *)0x0) {
    do {
      cVar1 = *unaff_EDI;
      unaff_EDI = unaff_EDI + 1;
      *pcVar2 = cVar1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    unaff_ESI[1] = param_1;
    return;
  }
  FUN_00408f20("Out of memory: filename \'%s\', line %d\n",
               "\\trees\\cod2src\\src\\universal\\assertive.cpp",0xf2);
                    /* WARNING: Subroutine does not return */
  _exit(-1);
}

