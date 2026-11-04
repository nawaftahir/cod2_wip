
void FUN_0041f910(undefined4 param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int local_8;
  
  if ((param_2 == 0) && (DAT_0124a123 == '\0')) {
    iVar1 = FUN_0047d980("entList",".\\MapInfo.cpp",99,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a123 = '\x01';
    }
  }
  for (iVar1 = *(int *)(param_2 + 4); iVar1 != param_2; iVar1 = *(int *)(iVar1 + 4)) {
    local_8 = 0;
    Lookup(*(undefined4 *)(*(int *)(*(int *)(iVar1 + 8) + 0x50) + 4),&local_8);
    iVar2 = local_8 + 1;
    local_8 = iVar2;
    piVar3 = (int *)CMapStringToPtr__operator__
                              (*(undefined4 *)(*(int *)(*(int *)(iVar1 + 8) + 0x50) + 4));
    *piVar3 = iVar2;
    if (((*(byte *)(*(int *)(*(int *)(iVar1 + 8) + 0x50) + 0x160) & 0x10) != 0) &&
       (*(int *)(iVar1 + 0x38) != 0)) {
      FUN_0041f910(param_1,*(int *)(iVar1 + 0x38));
    }
  }
  return;
}

