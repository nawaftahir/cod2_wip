// 1001d550 size=269 FUN_1001d550

void FUN_1001d550(undefined4 *param_1,undefined4 *param_2)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 *puVar7;
  int iVar8;
  undefined4 *puVar9;
  int in_EAX;
  undefined4 *puVar10;
  int local_10;
  
  iVar5 = ((int)param_2 - (int)param_1) / 0xc;
  iVar4 = (in_EAX - (int)param_1) / 0xc;
  iVar8 = iVar4;
  local_10 = iVar5;
  while (iVar6 = iVar8, iVar6 != 0) {
    iVar8 = local_10 % iVar6;
    local_10 = iVar6;
  }
  if ((local_10 < iVar5) && (0 < local_10)) {
    puVar10 = param_1 + local_10 * 3;
    do {
      uVar1 = *puVar10;
      uVar2 = puVar10[1];
      uVar3 = puVar10[2];
      puVar9 = puVar10 + iVar4 * 3;
      puVar7 = puVar10;
      if (puVar10 + iVar4 * 3 == param_2) {
        puVar9 = param_1;
      }
      while (puVar9 != puVar10) {
        *puVar7 = *puVar9;
        puVar7[1] = puVar9[1];
        puVar7[2] = puVar9[2];
        iVar5 = ((int)param_2 - (int)puVar9) / 0xc;
        puVar7 = puVar9;
        if (iVar4 < iVar5) {
          puVar9 = puVar9 + iVar4 * 3;
        }
        else {
          puVar9 = param_1 + (iVar4 - iVar5) * 3;
        }
      }
      *puVar7 = uVar1;
      puVar7[1] = uVar2;
      puVar7[2] = uVar3;
      puVar10 = puVar10 + -3;
      local_10 = local_10 + -1;
    } while (local_10 != 0);
  }
  return;
}


