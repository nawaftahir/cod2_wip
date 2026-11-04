
void FUN_004aaba0(void)

{
  int iVar1;
  undefined4 *in_EAX;
  int iVar2;
  uint unaff_EBX;
  int iVar3;
  
  iVar3 = (int)*(short *)*in_EAX;
  iVar1 = **(int **)((short *)*in_EAX + 2);
  if ((0x7f < iVar3) && (DAT_0124a732 == '\0')) {
    iVar2 = FUN_0047d980("numBones < DOBJ_MAX_PARTS","\\trees\\cod2src\\src\\xanim\\xmodel.cpp",
                         0x161,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a732 = '\x01';
    }
  }
  do {
    iVar3 = iVar3 + -1;
    if (iVar3 < 0) {
      return;
    }
  } while (unaff_EBX != *(ushort *)(iVar1 + iVar3 * 2));
  return;
}

