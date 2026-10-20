
undefined4 __fastcall FUN_004999c0(int param_1)

{
  int in_EAX;
  int iVar1;
  undefined4 *puVar2;
  
  if (((in_EAX < 0) || (*(int *)(param_1 + 0x14) <= in_EAX)) && (DAT_0124a627 == '\0')) {
    iVar1 = FUN_0047d980("index >= 0 && index < splinePoints.Num()",
                         "e:\\trees\\cod2src\\src\\universal\\splines\\splines.h",0x12e,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a627 = 1;
      puVar2 = (undefined4 *)FUN_0041e950();
      return *puVar2;
    }
  }
  puVar2 = (undefined4 *)FUN_0041e950();
  return *puVar2;
}

