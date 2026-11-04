// 10044020 size=226 FUN_10044020

undefined4 FUN_10044020(uint param_1)

{
  int iVar1;
  int *piVar2;
  char cVar3;
  char cVar4;
  int in_EAX;
  int iVar5;
  int *unaff_ESI;
  uint uVar6;
  
  iVar5 = unaff_ESI[3];
  if (in_EAX == 0) {
    *(undefined4 *)(*(int *)unaff_ESI[8] + 0x14) = 0x28;
    (*(code *)**(undefined4 **)unaff_ESI[8])((undefined4 *)unaff_ESI[8]);
  }
  iVar5 = iVar5 + in_EAX;
  uVar6 = ((1 << ((byte)in_EAX & 0x1f)) - 1U & param_1) << (0x18U - (char)iVar5 & 0x1f) |
          unaff_ESI[2];
  do {
    if (iVar5 < 8) {
      unaff_ESI[2] = uVar6;
      unaff_ESI[3] = iVar5;
      return 1;
    }
    cVar4 = (char)(uVar6 >> 0x10);
    *(char *)*unaff_ESI = cVar4;
    iVar1 = unaff_ESI[1];
    *unaff_ESI = *unaff_ESI + 1;
    unaff_ESI[1] = iVar1 + -1;
    if (iVar1 + -1 == 0) {
      piVar2 = *(int **)(unaff_ESI[8] + 0x20);
      cVar3 = (*(code *)piVar2[3])(unaff_ESI[8]);
      if (cVar3 == '\0') {
        return 0;
      }
      *unaff_ESI = *piVar2;
      unaff_ESI[1] = piVar2[1];
    }
    if (cVar4 == -1) {
      *(undefined1 *)*unaff_ESI = 0;
      iVar1 = unaff_ESI[1];
      *unaff_ESI = *unaff_ESI + 1;
      unaff_ESI[1] = iVar1 + -1;
      if (iVar1 + -1 == 0) {
        piVar2 = *(int **)(unaff_ESI[8] + 0x20);
        cVar4 = (*(code *)piVar2[3])(unaff_ESI[8]);
        if (cVar4 == '\0') {
          return 0;
        }
        *unaff_ESI = *piVar2;
        unaff_ESI[1] = piVar2[1];
      }
    }
    uVar6 = uVar6 << 8;
    iVar5 = iVar5 + -8;
  } while( true );
}


