
char * FUN_004acb70(int param_1,uint param_2,int param_3)

{
  short sVar1;
  int iVar2;
  
  if ((param_3 < 0) && (DAT_0124a759 == '\0')) {
    iVar2 = FUN_0047d980("lod >= 0","\\trees\\cod2src\\src\\xanim\\xmodel_utils.cpp",0x31,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a759 = '\x01';
    }
  }
  if (((uint)(int)*(short *)(param_1 + 0xc + param_3 * 0x14) <= param_2) && (DAT_0124a758 == '\0'))
  {
    iVar2 = FUN_0047d980("(unsigned)subMatIndex < model->lodInfo[lod].numsurfs",
                         "\\trees\\cod2src\\src\\xanim\\xmodel_utils.cpp",0x32,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a758 = '\x01';
    }
  }
  sVar1 = *(short *)(*(int *)(param_1 + param_3 * 0x14 + 0x10) + param_2 * 2);
  if (sVar1 != 0) {
    if (sVar1 != 0) {
      iVar2 = FUN_004a87b0();
      return (char *)(iVar2 + 4);
    }
    return (char *)0x0;
  }
  return "DEFAULT";
}

