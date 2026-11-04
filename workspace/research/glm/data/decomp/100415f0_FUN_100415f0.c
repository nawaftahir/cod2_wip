// 100415f0 size=153 FUN_100415f0

void FUN_100415f0(int param_1)

{
  if ((DAT_1072d9e0 != 0) &&
     ((DAT_1072d9e8 != *(int *)(param_1 + 0x1c) || (DAT_1072d9e4 != *(ushort *)(param_1 + 0x20)))))
  {
    FUN_1002df40();
  }
  if (0x100000 < (int)((uint)*(ushort *)(param_1 + 0x22) + DAT_1072d9e0)) {
    FUN_1002df40();
  }
  DAT_1072d9b8 = 1;
  FUN_1005eaf0(DAT_1072d9b4 + DAT_1072d9e0 * 2,*(undefined4 *)(param_1 + 0x24),
               (uint)*(ushort *)(param_1 + 0x22) << 1);
  DAT_1072d9e0 = DAT_1072d9e0 + (uint)*(ushort *)(param_1 + 0x22);
  DAT_1072d9e8 = *(undefined4 *)(param_1 + 0x1c);
  DAT_1072d9e4 = (uint)*(ushort *)(param_1 + 0x20);
  return;
}


