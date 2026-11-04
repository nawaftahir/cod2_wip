
void FUN_004a57e0(void)

{
  int iVar1;
  undefined4 uVar2;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a64d == '\0')) {
    iVar1 = FUN_0047d980("boneName","\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x664,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a64d = '\x01';
    }
  }
  iVar1 = FUN_004a8fc0();
  if ((iVar1 == 0) && (DAT_0124a64c == '\0')) {
    if (unaff_ESI == 0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_004a87b0();
      iVar1 = iVar1 + 4;
    }
    uVar2 = FUN_004969e0(&DAT_00540fac,iVar1,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x668,0,1);
    uVar2 = FUN_004969e0("%s\n\t%s","SL_IsLowercaseString( boneName )",uVar2);
    iVar1 = FUN_0047d980(uVar2);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a64c = 1;
      FUN_004a1890();
      return;
    }
  }
  FUN_004a1890();
  return;
}

