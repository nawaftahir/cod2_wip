// 100331d0 size=1009 FUN_100331d0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_100331d0(void)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  LARGE_INTEGER local_9c;
  undefined8 local_94;
  uint local_8c;
  int iStack_88;
  undefined4 local_84 [16];
  undefined1 local_44 [68];
  
  local_84[0] = 0x3f800000;
  local_84[1] = 0;
  local_84[2] = 0;
  local_84[3] = 0;
  local_84[4] = 0x3f800000;
  local_84[5] = 0;
  local_84[6] = 0;
  local_84[7] = 0;
  local_84[8] = 0x3f800000;
  FUN_1005bcb0();
  FUN_1005bbe0(0x42b40000,0x42b40000,0x3f666666);
  FUN_1002e380();
  puVar3 = (undefined4 *)(&DAT_1072dee0 + DAT_10730550 * 0xcd0);
  puVar4 = (undefined4 *)(&DAT_1072ebb0 + DAT_10730550 * 0xcd0);
  for (iVar2 = 0x334; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  DAT_10730550 = DAT_10730550 + 1;
  puVar3 = &DAT_10191368;
  puVar4 = (undefined4 *)(&DAT_1072def0 + DAT_10730550 * 0xcd0);
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  FUN_1003de30(0x3f800000);
  FUN_1003df90(local_44);
  puVar3 = local_84;
  puVar4 = (undefined4 *)(&DAT_1072e220 + DAT_10730550 * 0xcd0);
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  FUN_1003e130();
  DAT_1072de40 = &DAT_1072de48;
  DAT_1072de44 = 0;
  _DAT_1072da50 = 0x3f800000;
  _DAT_1072da54 = 0x3f800000;
  _DAT_1072da58 = 0x3f800000;
  _DAT_1072da5c = 0x3f800000;
  _DAT_1072da30 = 0;
  _DAT_1072da34 = 0;
  _DAT_1072da38 = 0;
  _DAT_1072da3c = 0x3f800000;
  _DAT_1072dab0 = 0;
  _DAT_1072dab4 = 0;
  _DAT_1072dab8 = 0;
  _DAT_1072dabc = 0x3f800000;
  FUN_1003a5f0(0);
  local_9c.s.LowPart = 0;
  FUN_1002e550(0x3f800000,0x3f800000,0x3f800000,0,0);
  local_9c.s.LowPart = (DWORD)0.0;
  FUN_1002e550(0x3f800000,0xbf800000,0x3f800000,0x3f800000,0);
  FUN_1002e550(0x3f800000,0xbf800000,(float)local_9c.s.LowPart - 1.0,0x3f800000,0x3f800000);
  FUN_1002e550(0x3f800000,0x3f800000,0xbf800000,0,0x3f800000);
  DAT_1072d9d4 = 4;
  iVar2 = *(int *)(DAT_101ce75c + 8);
  iVar1 = iVar2;
  if (0 < iVar2) {
    do {
      *(undefined2 *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = 3;
      *(undefined2 *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = 0;
      *(undefined2 *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = 2;
      *(undefined2 *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = 2;
      *(undefined2 *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = 0;
      *(undefined2 *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = 1;
      DAT_1072d9d0 = DAT_1072d9d0 + 6;
      iVar1 = iVar1 + -1;
    } while (iVar1 != 0);
  }
  FUN_10032f90(&local_94);
  FUN_1003a8d0();
  FUN_10033010(&local_8c);
  FUN_1003e4b0();
  QueryPerformanceFrequency(&local_9c);
  local_94 = CONCAT44((iStack_88 - local_94._4_4_) - (uint)(local_8c < (uint)local_94),
                      local_8c - (uint)local_94);
  return (float10)(float)(((float10)iVar2 /
                          ((float10)local_94 /
                          (float10)CONCAT44(local_9c.s.HighPart,local_9c.s.LowPart))) /
                         (float10)60.0);
}


