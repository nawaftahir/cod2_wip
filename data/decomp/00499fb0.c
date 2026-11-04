
void FUN_00499fb0(int param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  if (0 < *(int *)(param_1 + 0x1c)) {
    while( true ) {
      piVar1 = (int *)FUN_0040abc0();
      iVar3 = *piVar1;
      if ((*(int *)(iVar3 + 0x20) == 0) && (DAT_0124a0ba == '\0')) {
        iVar2 = FUN_0047d980("m_data","e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",
                             0x11a,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a0ba = '\x01';
        }
      }
      iVar3 = FUN_004965d0(param_2,*(undefined4 *)(*(int *)(iVar3 + 0x20) + 8));
      if (iVar3 == 0) break;
      iVar4 = iVar4 + 1;
      if (*(int *)(param_1 + 0x1c) <= iVar4) {
        return;
      }
    }
    if (((iVar4 < 0) || (*(int *)(param_1 + 0x1c) <= iVar4)) && (DAT_0124a0b6 == '\0')) {
      iVar3 = FUN_0047d980("index >= 0 && index < targetPositions.Num()",
                           "e:\\trees\\cod2src\\radiant\\../src/universal/splines/splines.h",0x486,0
                           ,1);
      if (iVar3 == 0) {
        DebugBreak();
      }
      else if (iVar3 == 2) {
        *(int *)(param_1 + 0x54) = iVar4;
        DAT_0124a0b6 = 1;
        return;
      }
    }
    *(int *)(param_1 + 0x54) = iVar4;
  }
  return;
}

