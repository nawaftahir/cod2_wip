// 100168e0 size=96 FUN_100168e0

undefined4 FUN_100168e0(void)

{
  char cVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  uint *unaff_EBX;
  uint uVar5;
  char *unaff_EDI;
  
  uVar5 = 0;
  iVar4 = 0x77;
  cVar1 = *unaff_EDI;
  while (cVar1 != '\0') {
    uVar5 = uVar5 + cVar1 * iVar4;
    iVar3 = iVar4 + -0x76;
    iVar4 = iVar4 + 1;
    cVar1 = unaff_EDI[iVar3];
  }
  uVar5 = uVar5 & 0x3ff;
  puVar2 = (undefined4 *)(&DAT_101d92d4)[uVar5];
  while( true ) {
    if (puVar2 == (undefined4 *)0x0) {
      *unaff_EBX = uVar5;
      return 0;
    }
    iVar4 = __stricmp((char *)*puVar2,unaff_EDI);
    if (iVar4 == 0) break;
    uVar5 = uVar5 + 1 & 0x3ff;
    puVar2 = (undefined4 *)(&DAT_101d92d4)[uVar5];
  }
  *unaff_EBX = uVar5;
  return 1;
}


