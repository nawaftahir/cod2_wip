


void FUN_10051800(int param_1,unsigned int *param_2,unsigned int *param_3,unsigned int *param_4)

{
  byte bVar1;
  unsigned char uVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  unsigned int uVar5;
  unsigned int uVar6;
  unsigned int *puVar7;
  unsigned char *puVar8;
  unsigned int *puVar9;
  unsigned int *puVar10;
  unsigned int *puVar11;
  int local_10;
  int local_c;
  
  param_4 = (unsigned int *)*param_4;
  uVar6 = (unsigned int)*(byte *)(*(int *)(param_1 + 0x1a8) + 0x96 + *(int *)((int)param_2 + 4));
  bVar1 = *(byte *)(*(int *)(param_1 + 0x1a8) + *(int *)((int)param_2 + 4) + 0x8c);
  uVar3 = (unsigned int)bVar1;
  local_10 = 0;
  if (0 < *(int *)(param_1 + 0x11c)) {
    param_2 = param_3;
    do {
      puVar8 = (unsigned char *)*param_2;
      puVar9 = (unsigned int *)*param_4;
      puVar7 = (unsigned int *)(*(int *)(param_1 + 100) + (int)puVar9);
      while (puVar9 < puVar7) {
        uVar2 = *puVar8;
        puVar8 = puVar8 + 1;
        if (uVar3 != 0) {
          puVar10 = puVar9;
          for (uVar4 = (unsigned int)(bVar1 >> 2); uVar4 != 0; uVar4 = uVar4 - 1) {
            *puVar10 = CONCAT22(CONCAT11(uVar2,uVar2),CONCAT11(uVar2,uVar2));
            puVar10 = puVar10 + 1;
          }
          for (uVar4 = uVar3 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
            *(unsigned char *)puVar10 = uVar2;
            puVar10 = (unsigned int *)((int)puVar10 + 1);
          }
          puVar9 = (unsigned int *)((int)puVar9 + uVar3);
        }
      }
      if (1 < uVar6) {
        uVar4 = *(unsigned int *)(param_1 + 100);
        local_c = uVar6 - 1;
        puVar7 = param_4;
        puVar9 = param_4;
        if (0 < local_c) {
          do {
            puVar10 = (unsigned int *)*puVar7;
            puVar11 = (unsigned int *)puVar9[1];
            for (uVar5 = uVar4 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
              *puVar11 = *puVar10;
              puVar10 = puVar10 + 1;
              puVar11 = puVar11 + 1;
            }
            for (uVar5 = uVar4 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
              *(unsigned char *)puVar11 = *(unsigned char *)puVar10;
              puVar10 = (unsigned int *)((int)puVar10 + 1);
              puVar11 = (unsigned int *)((int)puVar11 + 1);
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


