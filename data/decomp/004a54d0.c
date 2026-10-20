
char * FUN_004a54d0(int param_1,int param_2,uint param_3,int param_4)

{
  short sVar1;
  int iVar2;
  
  if ((param_4 < 0) && (DAT_0124a650 == '\0')) {
    iVar2 = FUN_0047d980("lod >= 0","\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x5f6,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a650 = '\x01';
    }
  }
  if (((uint)(int)*(short *)(param_4 * 0x14 + 0xc + *(int *)(param_1 + 0x1c + param_2 * 4)) <=
       param_3) && (DAT_0124a64f == '\0')) {
    iVar2 = FUN_0047d980("(unsigned)subMatIndex < obj->models[modelIndex]->lodInfo[lod].numsurfs",
                         "\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x5f7,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a64f = '\x01';
    }
  }
  sVar1 = *(short *)(*(int *)(param_4 * 0x14 + 0x10 + *(int *)(param_1 + 0x1c + param_2 * 4)) +
                    param_3 * 2);
  if (sVar1 != 0) {
    if (sVar1 != 0) {
      iVar2 = FUN_004a87b0();
      return (char *)(iVar2 + 4);
    }
    return (char *)0x0;
  }
  return "DEFAULT";
}

