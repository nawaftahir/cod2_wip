// 10031d20 size=361 FUN_10031d20

void FUN_10031d20(int param_1,short param_2,int param_3,int param_4,int param_5,int param_6)

{
  int iVar1;
  short in_AX;
  int iVar2;
  int in_ECX;
  int iVar3;
  int in_EDX;
  undefined4 *puVar4;
  int iVar5;
  undefined4 *puVar6;
  int local_10;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (DAT_1072debd != '\0') {
    FUN_1002e380();
  }
  if ((DAT_1072d9bc != in_EDX) || (DAT_1072d9c0 != in_ECX)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if ((0x154a < param_2 + DAT_1072d9d4) || (0x100000 < in_AX + DAT_1072d9d0)) {
    FUN_1002df40();
  }
  iVar3 = (int)in_AX;
  iVar2 = 0;
  if (0 < iVar3) {
    do {
      iVar1 = iVar2 * 2;
      iVar5 = DAT_1072d9d0 + iVar2;
      iVar2 = iVar2 + 1;
      *(short *)(DAT_1072d9b0 + iVar5 * 2) = *(short *)(param_1 + iVar1) + (short)DAT_1072d9d4;
    } while (iVar2 < iVar3);
  }
  iVar2 = 0;
  if (0 < param_2) {
    puVar6 = (undefined4 *)(param_3 + 8);
    local_10 = param_5;
    puVar4 = (undefined4 *)(param_4 + 4);
    do {
      FUN_1002e740(puVar6[-2],puVar6[-1],*puVar6,puVar6[1],puVar4[-1],*puVar4,puVar4[1],
                   *(undefined4 *)(param_6 + iVar2 * 8),*(undefined4 *)(param_6 + 4 + iVar2 * 8),
                   local_10);
      iVar2 = iVar2 + 1;
      local_10 = local_10 + 4;
      puVar4 = puVar4 + 3;
      puVar6 = puVar6 + 4;
    } while (iVar2 < param_2);
  }
  DAT_1072d9d0 = DAT_1072d9d0 + iVar3;
  DAT_1072d9d4 = DAT_1072d9d4 + param_2;
  FUN_1003a8d0();
  return;
}


