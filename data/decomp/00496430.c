
void FUN_00496430(void)

{
  int iVar1;
  undefined4 uVar2;
  char *unaff_EBX;
  int unaff_ESI;
  char *unaff_EDI;
  char *pcVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  
  if ((unaff_EDI == (char *)0x0) && (DAT_0124a505 == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00553e6c,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x224);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a505 = '\x01';
    }
  }
  if ((unaff_EBX == (char *)0x0) && (DAT_0124a504 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00553e64,"\\trees\\cod2src\\src\\universal\\q_shared.cpp",0x225);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a504 = '\x01';
    }
  }
  if ((unaff_ESI < 1) && (DAT_0124a503 == '\0')) {
    uVar6 = 1;
    uVar5 = 0;
    uVar4 = 0x226;
    pcVar3 = "\\trees\\cod2src\\src\\universal\\q_shared.cpp";
    uVar2 = FUN_004969e0("%s\n\t(destsize) = %i","(destsize >= 1)");
    iVar1 = FUN_0047d980(uVar2,pcVar3,uVar4,uVar5,uVar6);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a503 = 1;
      _strncpy(unaff_EBX,unaff_EDI,unaff_ESI - 1);
      unaff_EBX[unaff_ESI + -1] = '\0';
      return;
    }
  }
  _strncpy(unaff_EBX,unaff_EDI,unaff_ESI - 1);
  unaff_EBX[unaff_ESI + -1] = '\0';
  return;
}

