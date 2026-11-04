// 100341d0 size=510 FUN_100341d0

void FUN_100341d0(void)

{
  int iVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  int iVar6;
  int iVar7;
  undefined4 local_10;
  int local_c;
  int local_8;
  
  FUN_1003a5f0(0);
  local_8 = 0;
  if (0 < *(int *)(DAT_106d3194 + 0x249d28)) {
    local_c = 0;
    do {
      iVar6 = *(int *)(DAT_106d3194 + 0x249d24) + local_c;
      uVar2 = FUN_1010a8a8();
      uVar3 = FUN_1010a8a8();
      uVar4 = FUN_1010a8a8();
      uVar5 = FUN_1010a8a8();
      iVar7 = DAT_1072d9cc;
      local_10 = CONCAT13(uVar5,CONCAT12(uVar4,CONCAT11(uVar3,uVar2)));
      if ((0x154a < *(int *)(iVar6 + 0x14) + DAT_1072d9d4) ||
         (iVar1 = iVar7, 0x100000 < DAT_1072d9d0 + (*(int *)(iVar6 + 0x14) + -2) * 3)) {
        FUN_1003a8d0();
        FUN_1003a5f0(DAT_1072d9c4);
        iVar1 = DAT_1072d9cc;
        if ((DAT_1072d9cc != iVar7) && ((DAT_1072d9d0 != 0 || (iVar1 = iVar7, DAT_1072d9e0 != 0))))
        {
          FUN_1003a8d0();
          iVar1 = iVar7;
        }
      }
      DAT_1072d9cc = iVar1;
      iVar7 = 0;
      if (0 < *(int *)(iVar6 + 0x14)) {
        do {
          FUN_100340f0(local_10);
          iVar7 = iVar7 + 1;
        } while (iVar7 < *(int *)(iVar6 + 0x14));
      }
      iVar7 = 2;
      if (2 < *(int *)(iVar6 + 0x14)) {
        do {
          *(undefined2 *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
          *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = (short)DAT_1072d9d4 + (short)iVar7;
          *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)iVar7 + -1 + (short)DAT_1072d9d4;
          DAT_1072d9d0 = DAT_1072d9d0 + 3;
          iVar7 = iVar7 + 1;
        } while (iVar7 < *(int *)(iVar6 + 0x14));
      }
      DAT_1072d9d4 = DAT_1072d9d4 + *(int *)(iVar6 + 0x14);
      local_8 = local_8 + 1;
      local_c = local_c + 0x18;
    } while (local_8 < *(int *)(DAT_106d3194 + 0x249d28));
  }
  FUN_1003a8d0();
  return;
}


