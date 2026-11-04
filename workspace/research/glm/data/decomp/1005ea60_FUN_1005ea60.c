// 1005ea60 size=129 FUN_1005ea60

void FUN_1005ea60(int param_1,undefined4 param_2,uint param_3)

{
  uint uVar1;
  undefined4 *puVar2;
  
  uVar1 = param_3 & 0xfffffff8;
  if (uVar1 != 0) {
    do {
      uVar1 = uVar1 - 8;
      *(undefined4 *)(param_1 + uVar1 * 4) = param_2;
      *(undefined4 *)(param_1 + 4 + uVar1 * 4) = param_2;
      *(undefined4 *)(param_1 + 8 + uVar1 * 4) = param_2;
      *(undefined4 *)(param_1 + 0xc + uVar1 * 4) = param_2;
      *(undefined4 *)(param_1 + 0x10 + uVar1 * 4) = param_2;
      *(undefined4 *)(param_1 + 0x14 + uVar1 * 4) = param_2;
      *(undefined4 *)(param_1 + 0x18 + uVar1 * 4) = param_2;
      *(undefined4 *)(param_1 + 0x1c + uVar1 * 4) = param_2;
    } while (7 < (int)uVar1);
  }
  uVar1 = param_3 & 7;
  if (uVar1 != 0) {
    puVar2 = (undefined4 *)(param_1 + (param_3 & 0xfffffff8) * 4);
    if (3 < uVar1) {
      *puVar2 = param_2;
      puVar2[1] = param_2;
      puVar2[2] = param_2;
      puVar2[3] = param_2;
      puVar2 = puVar2 + 4;
      uVar1 = uVar1 - 4;
    }
    if (1 < (int)uVar1) {
      *puVar2 = param_2;
      puVar2[1] = param_2;
      puVar2 = puVar2 + 2;
      uVar1 = uVar1 - 2;
    }
    if (0 < (int)uVar1) {
      *puVar2 = param_2;
    }
  }
  return;
}


