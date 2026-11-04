// 10051800 size=316 FUN_10051800

void FUN_10051800(int param_1,undefined4 *param_2,undefined4 *param_3,undefined4 *param_4)

{
  byte bVar1;
  undefined1 uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  undefined4 *puVar7;
  undefined1 *puVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  int local_10;
  int local_c;
  
  param_4 = (undefined4 *)*param_4;
  uVar6 = (uint)*(byte *)(*(int *)(param_1 + 0x1a8) + 0x96 + *(int *)((int)param_2 + 4));
  bVar1 = *(byte *)(*(int *)(param_1 + 0x1a8) + *(int *)((int)param_2 + 4) + 0x8c);
  uVar3 = (uint)bVar1;
  local_10 = 0;
  if (0 < *(int *)(param_1 + 0x11c)) {
    param_2 = param_3;
    do {
      puVar8 = (undefined1 *)*param_2;
      puVar9 = (undefined4 *)*param_4;
      puVar7 = (undefined4 *)(*(int *)(param_1 + 100) + (int)puVar9);
      while (puVar9 < puVar7) {
        uVar2 = *puVar8;
        puVar8 = puVar8 + 1;
        if (uVar3 != 0) {
          puVar10 = puVar9;
          for (uVar4 = (uint)(bVar1 >> 2); uVar4 != 0; uVar4 = uVar4 - 1) {
            *puVar10 = CONCAT22(CONCAT11(uVar2,uVar2),CONCAT11(uVar2,uVar2));
            puVar10 = puVar10 + 1;
          }
          for (uVar4 = uVar3 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
            *(undefined1 *)puVar10 = uVar2;
            puVar10 = (undefined4 *)((int)puVar10 + 1);
          }
          puVar9 = (undefined4 *)((int)puVar9 + uVar3);
        }
      }
      if (1 < uVar6) {
        uVar4 = *(uint *)(param_1 + 100);
        local_c = uVar6 - 1;
        puVar7 = param_4;
        puVar9 = param_4;
        if (0 < local_c) {
          do {
            puVar10 = (undefined4 *)*puVar7;
            puVar11 = (undefined4 *)puVar9[1];
            for (uVar5 = uVar4 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
              *puVar11 = *puVar10;
              puVar10 = puVar10 + 1;
              puVar11 = puVar11 + 1;
            }
            for (uVar5 = uVar4 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
              *(undefined1 *)puVar11 = *(undefined1 *)puVar10;
              puVar10 = (undefined4 *)((int)puVar10 + 1);
              puVar11 = (undefined4 *)((int)puVar11 + 1);
            }
            local_c = local_c + -1;
            puVar7 = puVar7 + 1;
            puVar9 = puVar9 + 1;
          } while (local_c != 0);
        }
      }
      param_2 = param_2 + 1;
      local_10 = local_10 + uVar6;
      param_4 = param_4 + uVar6;
    } while (local_10 < *(int *)(param_1 + 0x11c));
  }
  return;
}


