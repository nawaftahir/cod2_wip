
void FUN_004990b0(int param_1)

{
  undefined4 uVar1;
  bool bVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int local_10;
  int local_c;
  
  local_10 = 0;
  local_c = 2;
  iVar7 = 1;
  do {
    iVar6 = iVar7;
    if (3 < local_c) {
      puVar3 = (undefined4 *)(param_1 + (iVar7 + local_10) * 4);
      puVar4 = (undefined4 *)(param_1 + 0x20 + (local_10 + iVar7) * 4);
      iVar5 = (-iVar7 - 1U >> 2) + 1;
      iVar6 = iVar7 + iVar5 * 4;
      do {
        uVar1 = *puVar3;
        *puVar3 = puVar4[-6];
        puVar4[-6] = uVar1;
        uVar1 = puVar3[1];
        puVar3[1] = puVar4[-3];
        puVar4[-3] = uVar1;
        uVar1 = puVar3[2];
        puVar3[2] = *puVar4;
        *puVar4 = uVar1;
        uVar1 = puVar3[3];
        puVar3[3] = puVar4[3];
        puVar4[3] = uVar1;
        puVar3 = puVar3 + 4;
        puVar4 = puVar4 + 0xc;
        iVar5 = iVar5 + -1;
      } while (iVar5 != 0);
    }
    if (iVar6 < 3) {
      puVar3 = (undefined4 *)(param_1 + (local_10 + iVar6) * 4);
      puVar4 = (undefined4 *)(param_1 + -4 + (iVar7 + iVar6 * 3) * 4);
      iVar6 = 3 - iVar6;
      do {
        uVar1 = *puVar3;
        *puVar3 = *puVar4;
        *puVar4 = uVar1;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 3;
        iVar6 = iVar6 + -1;
      } while (iVar6 != 0);
    }
    local_c = local_c + -1;
    local_10 = local_10 + 3;
    bVar2 = iVar7 < 3;
    iVar7 = iVar7 + 1;
  } while (bVar2);
  return;
}

