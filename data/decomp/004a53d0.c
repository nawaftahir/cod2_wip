
int FUN_004a53d0(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  
  if ((param_2 == 0) && (DAT_0124a652 == '\0')) {
    iVar2 = FUN_0047d980(&DAT_005549b4,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x5cf,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a652 = '\x01';
    }
  }
  iVar2 = 0;
  iVar3 = *(byte *)(param_1 + 0x18) - 1;
  if (-1 < iVar3) {
    piVar4 = (int *)(param_1 + 0x1c + iVar3 * 4);
    do {
      if ((-1 < *(char *)(iVar3 + param_2)) &&
         (iVar1 = *piVar4 + 4 + *(char *)(iVar3 + param_2) * 0x14, *(int *)(iVar1 + 0x10) != 0)) {
        iVar2 = iVar2 + *(short *)(iVar1 + 8);
      }
      iVar3 = iVar3 + -1;
      piVar4 = piVar4 + -1;
    } while (-1 < iVar3);
  }
  return iVar2;
}

