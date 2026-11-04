
undefined4 __fastcall FUN_0040bb70(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  
  if (*(int *)(param_1 + 0x1c) != 0) {
    puVar2 = (undefined4 *)FUN_0040abc0();
    return *puVar2;
  }
  FUN_0049eae0(0,0);
  if ((*(int *)(param_1 + 0x1c) < 1) && (DAT_0124a0b0 == '\0')) {
    iVar1 = FUN_0047d980("index < m_num","e:\\trees\\cod2src\\src\\universal\\splines\\util_list.h",
                         0xdc,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a0b0 = 1;
      return **(undefined4 **)(param_1 + 0x28);
    }
  }
  return **(undefined4 **)(param_1 + 0x28);
}

