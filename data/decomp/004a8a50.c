
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004a8a50(void)

{
  uint uVar1;
  int iVar2;
  ushort uVar3;
  uint uVar4;
  uint uVar5;
  
  FUN_004a7d20();
  DAT_01223300 = 0;
  uVar1 = 1;
  uVar5 = 0;
  do {
    uVar4 = uVar1;
    if (((uVar4 & 0xc000) != 0) && (DAT_0124a728 == '\0')) {
      iVar2 = FUN_0047d980("!(hash & HASH_STAT_MASK)",
                           "\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x108,0,1);
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_0124a728 = '\x01';
      }
    }
    (&DAT_01223300)[uVar4 * 2] = 0;
    uVar3 = (ushort)uVar4;
    (&DAT_01223300)[uVar5 * 2] = (&DAT_01223300)[uVar5 * 2] | uVar3;
    *(short *)(&DAT_01223302 + uVar4 * 4) = (short)uVar5;
    uVar1 = uVar4 + 1;
    uVar5 = uVar4;
  } while (uVar4 + 1 < 0x4000);
  if ((((&DAT_01223300)[uVar4 * 2] & 0x3fff) != 0) && (DAT_0124a727 == '\0')) {
    iVar2 = FUN_0047d980("!(scrStringGlob.hashTable[prev].status_next & HASH_NEXT_MASK)",
                         "\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x110,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      _DAT_01223302 = uVar3;
      DAT_0124a727 = 1;
      DAT_01233300 = 1;
      return;
    }
  }
  _DAT_01223302 = uVar3;
  DAT_01233300 = 1;
  return;
}

