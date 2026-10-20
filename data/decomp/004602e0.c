
undefined4 FUN_004602e0(void)

{
  int iVar1;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a2b2 == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_005461fc,".\\csg.cpp",0x14d,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2b2 = '\x01';
    }
  }
  if ((*(int *)(unaff_ESI + 8) == 0) && (DAT_0124a2b1 == '\0')) {
    iVar1 = FUN_0047d980("def->owner",".\\csg.cpp",0x14e,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2b1 = '\x01';
    }
  }
  if ((*(int *)(*(int *)(unaff_ESI + 8) + 0x50) == 0) && (DAT_0124a2b0 == '\0')) {
    iVar1 = FUN_0047d980("def->owner->eclass",".\\csg.cpp",0x14f,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2b0 = '\x01';
    }
  }
  iVar1 = *(int *)(*(int *)(*(int *)(unaff_ESI + 8) + 0x50) + 8);
  if (iVar1 != 0) {
    return CONCAT31((int3)((uint)iVar1 >> 8),1);
  }
  return CONCAT31((int3)((uint)*(int *)(unaff_ESI + 0x44) >> 8),*(int *)(unaff_ESI + 0x44) != 0);
}

