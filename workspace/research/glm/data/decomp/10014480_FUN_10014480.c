// 10014480 size=245 FUN_10014480

void FUN_10014480(undefined4 *param_1,undefined4 *param_2)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int in_EAX;
  int iVar8;
  int iVar9;
  int iVar10;
  undefined4 *puVar11;
  int local_14;
  
  iVar9 = (int)param_2 - (int)param_1 >> 4;
  iVar8 = in_EAX - (int)param_1 >> 4;
  iVar10 = iVar8;
  local_14 = iVar9;
  while (iVar5 = iVar10, iVar5 != 0) {
    iVar10 = local_14 % iVar5;
    local_14 = iVar5;
  }
  if ((local_14 < iVar9) && (0 < local_14)) {
    puVar11 = param_1 + local_14 * 4;
    do {
      uVar1 = *puVar11;
      uVar2 = puVar11[1];
      uVar3 = puVar11[2];
      uVar4 = puVar11[3];
      puVar7 = puVar11 + iVar8 * 4;
      puVar6 = puVar11;
      if (puVar11 + iVar8 * 4 == param_2) {
        puVar7 = param_1;
      }
      while (puVar7 != puVar11) {
        *puVar6 = *puVar7;
        puVar6[1] = puVar7[1];
        puVar6[2] = puVar7[2];
        puVar6[3] = puVar7[3];
        iVar10 = (int)param_2 - (int)puVar7 >> 4;
        puVar6 = puVar7;
        if (iVar8 < iVar10) {
          puVar7 = puVar7 + iVar8 * 4;
        }
        else {
          puVar7 = param_1 + (iVar8 - iVar10) * 4;
        }
      }
      *puVar6 = uVar1;
      puVar6[1] = uVar2;
      puVar6[2] = uVar3;
      puVar11 = puVar11 + -4;
      local_14 = local_14 + -1;
      puVar6[3] = uVar4;
    } while (local_14 != 0);
  }
  return;
}


