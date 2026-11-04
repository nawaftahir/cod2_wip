// 1002ec00 size=628 FUN_1002ec00

void FUN_1002ec00(int *param_1)

{
  int iVar1;
  int iVar2;
  float fVar3;
  short sVar4;
  int iVar5;
  float10 fVar6;
  float10 fVar7;
  float10 extraout_ST1;
  float10 extraout_ST1_00;
  undefined1 local_30 [4];
  undefined1 local_2c [4];
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  undefined1 *local_18;
  undefined1 *local_14;
  float local_10;
  float local_c;
  
  iVar2 = *param_1;
  if (DAT_1072debd == '\0') {
    FUN_1002e020();
  }
  local_1c = *(float *)(iVar2 + 4);
  if (((float)DAT_1072d9bc != local_1c) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if ((0x154a < DAT_1072d9d4 + 4) || (0x100000 < DAT_1072d9d0 + 6)) {
    FUN_1002df40();
  }
  iVar5 = DAT_1072d9d0;
  sVar4 = (short)DAT_1072d9d4;
  iVar1 = DAT_1072d9d0 * 2;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  *(short *)(DAT_1072d9b0 + iVar1) = sVar4 + 3;
  *(short *)(DAT_1072d9b0 + 2 + iVar5 * 2) = sVar4;
  *(short *)(DAT_1072d9b0 + 4 + iVar5 * 2) = sVar4 + 2;
  *(short *)(DAT_1072d9b0 + 6 + iVar5 * 2) = sVar4 + 2;
  *(short *)(DAT_1072d9b0 + 8 + iVar5 * 2) = sVar4;
  *(short *)(DAT_1072d9b0 + 10 + iVar5 * 2) = sVar4 + 1;
  fVar3 = *(float *)(iVar2 + 0x10) * 0.5;
  local_14 = local_2c;
  local_18 = local_30;
  local_c = *(float *)(iVar2 + 0x14) * 0.5;
  local_1c = fVar3 + *(float *)(iVar2 + 8);
  local_20 = local_c + *(float *)(iVar2 + 0xc);
  fVar6 = (float10)(*(float *)(iVar2 + 0x2c) * 0.017453292);
  fVar7 = (float10)fcos(fVar6);
  fVar6 = (float10)fsin(fVar6);
  local_10 = -((float)fVar6 * local_c);
  local_c = (float)fVar7 * local_c;
  local_24 = local_20 - (float)fVar6 * fVar3;
  local_28 = local_1c - (float)fVar7 * fVar3;
  fVar7 = (float10)FUN_1002e470(local_28 - local_10,local_24 - local_c,*(undefined4 *)(iVar2 + 0x18)
                                ,*(undefined4 *)(iVar2 + 0x1c));
  fVar7 = (float10)FUN_1002e470((float)((extraout_ST1 + (float10)local_1c) - (float10)local_10),
                                (float)(((float10)local_20 + fVar7) - (float10)local_c),
                                *(undefined4 *)(iVar2 + 0x20),*(undefined4 *)(iVar2 + 0x1c));
  FUN_1002e470((float)((float10)local_10 + extraout_ST1_00 + (float10)local_1c),
               (float)((float10)local_c + fVar7 + (float10)local_20),*(undefined4 *)(iVar2 + 0x20),
               *(undefined4 *)(iVar2 + 0x24));
  FUN_1002e470(local_28 + local_10,local_24 + local_c,*(undefined4 *)(iVar2 + 0x18),
               *(undefined4 *)(iVar2 + 0x24));
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


