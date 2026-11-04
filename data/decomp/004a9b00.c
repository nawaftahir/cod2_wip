
void FUN_004a9b00(byte param_1)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  
  iVar1 = FUN_004a87b0();
  if ((param_1 & *(byte *)(iVar1 + 1)) == 0) {
    *(byte *)(iVar1 + 1) = *(byte *)(iVar1 + 1) | param_1;
    return;
  }
  if ((*(ushort *)(iVar1 + 2) < 2) && (DAT_0124a70e == '\0')) {
    uVar2 = FUN_004a88c0("\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x301,0,1);
    uVar2 = FUN_004969e0("%s\n\t(SL_DebugConvertToString( stringValue )) = \'%s\'",
                         "(refStr->refCount > 1)",uVar2);
    iVar3 = FUN_0047d980(uVar2);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      *(short *)(iVar1 + 2) = *(short *)(iVar1 + 2) + -1;
      DAT_0124a70e = 1;
      return;
    }
  }
  *(short *)(iVar1 + 2) = *(short *)(iVar1 + 2) + -1;
  return;
}

