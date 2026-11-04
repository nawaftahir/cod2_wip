
undefined4 FUN_004a6f70(int param_1,uint param_2)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  
  iVar4 = 0;
  if (*(char *)(param_1 + 0x18) != '\0') {
    piVar3 = (int *)(param_1 + 0x1c);
    do {
      iVar1 = *piVar3;
      if ((iVar1 == 0) && (DAT_0124a730 == '\0')) {
        iVar2 = FUN_0047d980("model","\\trees\\cod2src\\src\\xanim\\xmodel.cpp",0x18c,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a730 = '\x01';
        }
      }
      if ((*(uint *)(iVar1 + 0x5c) & param_2) != 0) {
        return 1;
      }
      iVar4 = iVar4 + 1;
      piVar3 = piVar3 + 1;
    } while (iVar4 < (int)(uint)*(byte *)(param_1 + 0x18));
  }
  return 0;
}

