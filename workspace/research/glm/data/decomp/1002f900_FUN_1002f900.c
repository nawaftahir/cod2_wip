// 1002f900 size=108 FUN_1002f900

void FUN_1002f900(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  *param_1 = (uint)*(ushort *)(iVar1 + 2) + iVar1;
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (DAT_1072debd != '\0') {
    FUN_1002e380();
  }
  if (DAT_1072debc != '\0') {
    FUN_1003e9b0();
  }
  if (DAT_10766748 == '\0') {
    FUN_1002f430(*(undefined4 *)(iVar1 + 0x10),*(undefined4 *)(iVar1 + 4));
  }
  return;
}


