
void FUN_004a8500(void)

{
  int in_EAX;
  undefined4 uVar1;
  int iVar2;
  
  iVar2 = in_EAX + -0x1182f00 >> 3;
  if (((iVar2 < 0) || (0xffff < iVar2)) && (DAT_0124a6dd == '\0')) {
    uVar1 = FUN_004969e0("%s\n\t((MemoryNode *) p - scrMemTreeGlob.nodes) = %i",
                         "((MemoryNode *) p - scrMemTreeGlob.nodes >= 0 && (MemoryNode *) p - scrMemTreeGlob.nodes < MEMORY_NODE_COUNT)"
                         ,iVar2,"\\trees\\cod2src\\src\\script\\scr_memorytree.cpp",0x2de,0,1);
    iVar2 = FUN_0047d980(uVar1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a6dd = 1;
      FUN_004a80c0();
      return;
    }
  }
  FUN_004a80c0();
  return;
}

