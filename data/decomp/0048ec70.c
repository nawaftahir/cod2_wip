
void FUN_0048ec70(uint param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_01148e20;
  if ((param_1 != 0x2000) && (DAT_0124a487 == '\0')) {
    iVar2 = FUN_0047d980("sysFlag == DVAR_SYS_GFX_DLL","\\trees\\cod2src\\src\\universal\\dvar.cpp",
                         0x557,0,1);
    if (iVar2 == 0) {
      DebugBreak();
      iVar1 = DAT_01148e20;
    }
    else {
      iVar1 = DAT_01148e20;
      if (iVar2 == 2) {
        DAT_0124a487 = '\x01';
      }
    }
  }
  for (; iVar1 != 0; iVar1 = *(int *)(iVar1 + 0x1c)) {
    if ((param_1 & *(ushort *)(iVar1 + 4)) != 0) {
      FUN_0048eaf0();
    }
  }
  return;
}

