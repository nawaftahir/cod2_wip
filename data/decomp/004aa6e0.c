
void FUN_004aa6e0(void)

{
  char cVar1;
  short sVar2;
  undefined2 uVar3;
  short *in_EAX;
  int iVar4;
  int *piVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  
  if ((in_EAX == (short *)0x0) && (DAT_0124a733 == '\0')) {
    iVar4 = FUN_0047d980("model","\\trees\\cod2src\\src\\xanim\\xmodel.cpp",0x4c);
    if (iVar4 == 0) {
      DebugBreak();
    }
    else if (iVar4 == 2) {
      DAT_0124a733 = '\x01';
    }
  }
  iVar4 = **(int **)(in_EAX + 2);
  sVar2 = *in_EAX;
  iVar7 = 0;
  if (0 < sVar2) {
    do {
      uVar3 = *(undefined2 *)(iVar4 + iVar7 * 2);
      piVar5 = (int *)FUN_004a87b0();
      uVar8 = *piVar5 - 1U & 0xff;
      cVar1 = *(char *)(uVar8 + 4 + (int)piVar5);
      while (cVar1 != '\0') {
        iVar6 = uVar8 + 0x104;
        uVar8 = uVar8 + 0x100;
        cVar1 = *(char *)((int)piVar5 + iVar6);
      }
      iVar6 = FUN_004a87b0();
      *(short *)(iVar6 + 2) = *(short *)(iVar6 + 2) + -1;
      if (*(short *)(iVar6 + 2) == 0) {
        FUN_004a9ba0(uVar3);
      }
      iVar7 = iVar7 + 1;
    } while (iVar7 < sVar2);
  }
  return;
}

