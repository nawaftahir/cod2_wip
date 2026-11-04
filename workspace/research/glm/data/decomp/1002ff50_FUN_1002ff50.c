// 1002ff50 size=44 FUN_1002ff50

void FUN_1002ff50(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  FUN_1002fe70(iVar1 + 0xc,*(undefined4 *)(iVar1 + 8),*(undefined1 *)(iVar1 + 5));
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


