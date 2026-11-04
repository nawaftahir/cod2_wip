
void FUN_004997b0(void)

{
  char *pcVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  char *unaff_EBX;
  int *unaff_ESI;
  
  *unaff_ESI = 0;
  if (unaff_EBX == (char *)0x0) {
    if (DAT_0124a628 == '\0') {
      iVar3 = FUN_0047d980(&DAT_0053fb8c,"e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",
                           0xa3);
      if (iVar3 == 0) {
        DebugBreak();
      }
      else if (iVar3 == 2) {
        DAT_0124a628 = '\x01';
      }
    }
    FUN_004a0380(1,1);
    **(undefined1 **)(*unaff_ESI + 8) = 0;
    *(undefined4 *)*unaff_ESI = 0;
    return;
  }
  pcVar1 = unaff_EBX + 1;
  pcVar4 = unaff_EBX;
  do {
    cVar2 = *pcVar4;
    pcVar4 = pcVar4 + 1;
  } while (cVar2 != '\0');
  FUN_004a0380(((int)pcVar4 - (int)pcVar1) + 1,1);
  pcVar5 = *(char **)(*unaff_ESI + 8);
  do {
    cVar2 = *unaff_EBX;
    unaff_EBX = unaff_EBX + 1;
    *pcVar5 = cVar2;
    pcVar5 = pcVar5 + 1;
  } while (cVar2 != '\0');
  *(int *)*unaff_ESI = (int)pcVar4 - (int)pcVar1;
  return;
}

