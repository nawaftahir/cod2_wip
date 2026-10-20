
undefined4 __fastcall FUN_0041e8e0(int param_1)

{
  int in_EAX;
  int iVar1;
  undefined4 *puVar2;
  
  if (((in_EAX < 0) || (*(int *)(param_1 + 4) <= in_EAX)) && (DAT_0124a0fc == '\0')) {
    iVar1 = FUN_0047d980("index >= 0 && index < controlPoints.Num()",
                         "e:\\trees\\cod2src\\radiant\\../src/universal/splines/splines.h",0x128,0,1
                        );
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0fc = 1;
      puVar2 = (undefined4 *)FUN_0041e950();
      return *puVar2;
    }
  }
  puVar2 = (undefined4 *)FUN_0041e950();
  return *puVar2;
}

