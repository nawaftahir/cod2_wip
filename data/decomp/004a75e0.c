
int FUN_004a75e0(void)

{
  int iVar1;
  uint uVar2;
  byte bVar3;
  uint uVar4;
  uint uVar5;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a6fd == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00555a7c,"\\trees\\cod2src\\src\\script\\scr_memorytree.cpp",0x104
                         ,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a6fd = '\x01';
    }
  }
  uVar5 = 0x10000 - unaff_ESI;
  if ((uVar5 == 0) && (DAT_0124a6fc == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00555a7c,"\\trees\\cod2src\\src\\script\\scr_memorytree.cpp",0x106
                         ,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a6fc = '\x01';
    }
  }
  uVar4 = uVar5 >> 8 & 0xff;
  uVar2 = uVar5 & 0xff;
  bVar3 = (&DAT_01202f00)[uVar2];
  if (uVar2 == 0) {
    bVar3 = bVar3 + (&DAT_01202f00)[uVar4];
  }
  return (1 << (bVar3 & 0x1f)) +
         ((uVar5 - (byte)(&DAT_01203000)[uVar4]) - (uint)(byte)(&DAT_01203000)[uVar2]);
}

