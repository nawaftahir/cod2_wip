
void FUN_004a8920(void)

{
  char cVar1;
  int iVar2;
  int *piVar3;
  uint uVar4;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a72a == '\0')) {
    iVar2 = FUN_0047d980("stringValue","\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0xc2);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a72a = '\x01';
    }
  }
  piVar3 = (int *)FUN_004a87b0();
  uVar4 = *piVar3 - 1U & 0xff;
  cVar1 = *(char *)(uVar4 + 4 + (int)piVar3);
  while (cVar1 != '\0') {
    iVar2 = uVar4 + 0x104;
    uVar4 = uVar4 + 0x100;
    cVar1 = *(char *)((int)piVar3 + iVar2);
  }
  return;
}

