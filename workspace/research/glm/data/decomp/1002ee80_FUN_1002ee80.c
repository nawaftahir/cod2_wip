// 1002ee80 size=368 FUN_1002ee80

void FUN_1002ee80(int *param_1)

{
  int iVar1;
  int iVar2;
  short sVar3;
  int iVar4;
  
  iVar2 = *param_1;
  if (DAT_1072debd == '\0') {
    FUN_1002e020();
  }
  if ((DAT_1072d9bc != *(int *)(iVar2 + 4)) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if ((0x154a < DAT_1072d9d4 + 4) || (0x100000 < DAT_1072d9d0 + 6)) {
    FUN_1002df40();
  }
  iVar4 = DAT_1072d9d0;
  sVar3 = (short)DAT_1072d9d4;
  iVar1 = DAT_1072d9d0 * 2;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  *(short *)(DAT_1072d9b0 + iVar1) = sVar3 + 3;
  *(short *)(DAT_1072d9b0 + 2 + iVar4 * 2) = sVar3;
  *(short *)(DAT_1072d9b0 + 4 + iVar4 * 2) = sVar3 + 2;
  *(short *)(DAT_1072d9b0 + 6 + iVar4 * 2) = sVar3 + 2;
  *(short *)(DAT_1072d9b0 + 8 + iVar4 * 2) = sVar3;
  *(short *)(DAT_1072d9b0 + 10 + iVar4 * 2) = sVar3 + 1;
  FUN_1002e470(*(undefined4 *)(iVar2 + 8),*(undefined4 *)(iVar2 + 0xc),0,0);
  FUN_1002e470(*(undefined4 *)(iVar2 + 0x10),*(undefined4 *)(iVar2 + 0x14),0x3f800000,0);
  FUN_1002e470(*(undefined4 *)(iVar2 + 0x18),*(undefined4 *)(iVar2 + 0x1c),0x3f800000,0x3f800000);
  FUN_1002e470(*(undefined4 *)(iVar2 + 0x20),*(undefined4 *)(iVar2 + 0x24),0,0x3f800000);
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


