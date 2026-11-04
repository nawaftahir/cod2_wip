// 1000cb40 size=72 FUN_1000cb40

void FUN_1000cb40(void)

{
  char cVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  char *unaff_ESI;
  
  uVar4 = 0;
  iVar3 = 0x77;
  cVar1 = *unaff_ESI;
  while (cVar1 != '\0') {
    uVar4 = uVar4 + cVar1 * iVar3;
    iVar2 = iVar3 + -0x76;
    iVar3 = iVar3 + 1;
    cVar1 = unaff_ESI[iVar2];
  }
  uVar4 = uVar4 & 0x7ff;
  iVar3 = (&DAT_101cea68)[uVar4];
  while (iVar3 != 0) {
    uVar4 = uVar4 + 1 & 0x7ff;
    iVar3 = (&DAT_101cea68)[uVar4];
  }
  return;
}


