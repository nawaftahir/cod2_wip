
void FUN_004a4f90(int param_1,int param_2)

{
  int iVar1;
  uint uVar2;
  
  uVar2 = (uint)*(byte *)(param_1 + 0x19);
  if ((0x80 < uVar2) && (DAT_0124a65d == '\0')) {
    iVar1 = FUN_0047d980("boneCount <= DOBJ_MAX_PARTS","\\trees\\cod2src\\src\\xanim\\dobj.cpp",
                         0x54f,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a65d = '\x01';
    }
  }
  iVar1 = FUN_004a4f30(param_1);
  if ((iVar1 == 0) && (DAT_0124a65c == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_005549c8,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x552,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a65c = '\x01';
    }
  }
  if (uVar2 != 0) {
    iVar1 = 0;
    do {
      if ((*(uint *)(param_2 + (iVar1 >> 5) * 4) & 1 << ((byte)iVar1 & 0x1f)) != 0) {
        FUN_004a1170();
      }
      iVar1 = iVar1 + 1;
    } while (iVar1 < (int)uVar2);
  }
  return;
}

