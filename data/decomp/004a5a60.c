
undefined4 FUN_004a5a60(int param_1)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  
  iVar4 = *(byte *)(param_1 + 0x18) - 1;
  if (-1 < iVar4) {
    piVar3 = (int *)(param_1 + 0x1c + iVar4 * 4);
    do {
      iVar1 = *piVar3;
      if ((iVar1 == 0) && (DAT_0124a734 == '\0')) {
        iVar2 = FUN_0047d980("model","\\trees\\cod2src\\src\\xanim\\xmodel.cpp",0x27,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a734 = '\x01';
        }
      }
      if (*(char *)(iVar1 + 0x8d) != '\0') {
        return 1;
      }
      iVar4 = iVar4 + -1;
      piVar3 = piVar3 + -1;
    } while (-1 < iVar4);
  }
  return 0;
}

