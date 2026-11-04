// 1003ef30 size=477 FUN_1003ef30

void FUN_1003ef30(int param_1)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  
  if (DAT_1072d9cc != 1) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    DAT_1072d9cc = 1;
  }
  if ((0x154a < (int)((uint)*(ushort *)(param_1 + 10) + DAT_1072d9d4)) ||
     (0x100000 < (int)(DAT_1072d9d0 + (*(ushort *)(param_1 + 10) - 2) * 3))) {
    FUN_1002df40();
  }
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    iVar4 = 0;
    if (*(short *)(param_1 + 10) != 0) {
      iVar5 = 0;
      do {
        iVar2 = *(int *)(param_1 + 0xc) + iVar5;
        iVar1 = (DAT_1072d9d4 + iVar4) * 0x20;
        *(undefined4 *)(&DAT_106d3200 + iVar1) = *(undefined4 *)(*(int *)(param_1 + 0xc) + iVar5);
        *(undefined4 *)(&DAT_106d3204 + iVar1) = *(undefined4 *)(iVar2 + 4);
        *(undefined4 *)(&DAT_106d3208 + iVar1) = *(undefined4 *)(iVar2 + 8);
        *(undefined4 *)(&DAT_106d320c + (DAT_1072d9d4 + iVar4) * 0x20) =
             *(undefined4 *)(*(int *)(param_1 + 0xc) + 0x18 + iVar5);
        iVar1 = *(int *)(param_1 + 0xc);
        iVar2 = (DAT_1072d9d4 + iVar4) * 0x20;
        *(undefined4 *)(&DAT_106d3210 + iVar2) = *(undefined4 *)(iVar1 + 0x1c + iVar5);
        *(undefined4 *)(&DAT_106d3214 + iVar2) = *(undefined4 *)(iVar1 + iVar5 + 0x20);
        iVar1 = *(int *)(param_1 + 0xc);
        iVar2 = (DAT_1072d9d4 + iVar4) * 0x20;
        *(undefined4 *)(&DAT_106d3218 + iVar2) = *(undefined4 *)(iVar1 + 0x24 + iVar5);
        *(undefined4 *)(&DAT_106d321c + iVar2) = *(undefined4 *)(iVar1 + iVar5 + 0x28);
        iVar4 = iVar4 + 1;
        iVar5 = iVar5 + 0x44;
      } while (iVar4 < (int)(uint)*(ushort *)(param_1 + 10));
    }
  }
  else {
    puVar6 = *(undefined4 **)(param_1 + 0xc);
    puVar7 = (undefined4 *)(&DAT_106d3200 + DAT_1072d9d4 * 0x44);
    for (uVar3 = (uint)*(ushort *)(param_1 + 10) * 0x44 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar7 = *puVar6;
      puVar6 = puVar6 + 1;
      puVar7 = puVar7 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(undefined1 *)puVar7 = *(undefined1 *)puVar6;
      puVar6 = (undefined4 *)((int)puVar6 + 1);
      puVar7 = (undefined4 *)((int)puVar7 + 1);
    }
  }
  iVar5 = *(ushort *)(param_1 + 10) - 2;
  iVar4 = 0;
  if (iVar5 < 1) {
    DAT_1072d9d4 = DAT_1072d9d4 + (uint)*(ushort *)(param_1 + 10);
    return;
  }
  do {
    *(undefined2 *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = (undefined2)DAT_1072d9d4;
    *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = (short)iVar4 + 1 + (short)DAT_1072d9d4;
    *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = (short)iVar4 + 2 + (short)DAT_1072d9d4;
    DAT_1072d9d0 = DAT_1072d9d0 + 3;
    iVar4 = iVar4 + 1;
  } while (iVar4 < iVar5);
  DAT_1072d9d4 = DAT_1072d9d4 + (uint)*(ushort *)(param_1 + 10);
  return;
}


