// 100ad49d size=989 FUN_100ad49d

int FUN_100ad49d(int param_1,uint param_2,int param_3)

{
  uint *puVar1;
  undefined4 uVar2;
  bool bVar3;
  uint uVar4;
  int iVar5;
  int *piVar6;
  int in_ECX;
  int iVar7;
  uint uVar8;
  int iVar9;
  uint *puVar10;
  uint uVar11;
  undefined4 *puVar12;
  undefined4 *puVar13;
  int local_24;
  uint local_1c;
  uint local_18;
  uint local_14;
  int local_10;
  int local_c;
  
  puVar10 = (uint *)0x0;
  local_14 = 0;
  if (param_2 == 0) {
LAB_100ad534:
    FUN_1008b0b5();
    return -0x7fffbffb;
  }
  do {
    puVar1 = *(uint **)(param_1 + local_14 * 4);
    if ((((puVar1 != (uint *)0x0) && ((*puVar1 & 0xfff00000) != 0)) && ((*puVar1 & 0xfffff) != 0))
       && (uVar11 = puVar1[3], uVar11 != 0)) {
      piVar6 = (int *)puVar1[4];
      iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
      if ((*(int *)(iVar5 + 0xc) == param_3) && (*(int *)(iVar5 + 4) == *(int *)(in_ECX + 0x88))) {
        local_18 = local_14;
        uVar4 = 0;
        puVar10 = puVar1;
        if (uVar11 != 0) {
          do {
            if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4) + 0x10) == 2) {
              return 0;
            }
            uVar4 = uVar4 + 1;
            piVar6 = piVar6 + 1;
          } while (uVar4 < uVar11);
        }
      }
    }
    local_14 = local_14 + 1;
  } while (local_14 < param_2);
  if (puVar10 == (uint *)0x0) goto LAB_100ad534;
  uVar11 = *puVar10 & 0xfffff;
  if ((*puVar10 & 0xfff00000) == 0x50000000) {
    iVar5 = FUN_10085814();
    if (iVar5 == 0) {
      param_2 = 0;
    }
    else {
      param_2 = FUN_10085379();
    }
    if (param_2 == 0) {
      return -0x7ff8fff2;
    }
    iVar5 = FUN_1008585f(*puVar10,puVar10[1],puVar10[3] + 1,0);
    if ((iVar5 < 0) || (iVar5 = FUN_100853b0(), iVar5 < 0)) goto LAB_100ad863;
    iVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),param_3,2,0);
    if (iVar5 == -1) {
LAB_100ad5fe:
      iVar5 = -0x7ff8fff2;
      goto LAB_100ad863;
    }
    puVar12 = (undefined4 *)puVar10[2];
    puVar13 = *(undefined4 **)(param_2 + 8);
    for (uVar11 = *(uint *)(param_2 + 4) & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
      *puVar13 = *puVar12;
      puVar12 = puVar12 + 1;
      puVar13 = puVar13 + 1;
    }
    for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
      *(undefined1 *)puVar13 = *(undefined1 *)puVar12;
      puVar12 = (undefined4 *)((int)puVar12 + 1);
      puVar13 = (undefined4 *)((int)puVar13 + 1);
    }
    puVar12 = (undefined4 *)puVar10[4];
    puVar13 = *(undefined4 **)(param_2 + 0x10);
    for (uVar11 = puVar10[3] & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
      *puVar13 = *puVar12;
      puVar12 = puVar12 + 1;
      puVar13 = puVar13 + 1;
    }
    for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
      *(undefined1 *)puVar13 = *(undefined1 *)puVar12;
      puVar12 = (undefined4 *)((int)puVar12 + 1);
      puVar13 = (undefined4 *)((int)puVar13 + 1);
    }
    *(int *)(*(int *)(param_2 + 0x10) + puVar10[3] * 4) = iVar5;
  }
  else {
    iVar5 = FUN_10085814();
    if (iVar5 == 0) {
      param_2 = 0;
    }
    else {
      param_2 = FUN_10085379();
    }
    if (param_2 == 0) {
      return -0x7ff8fff2;
    }
    uVar4 = puVar10[1] / uVar11;
    iVar5 = FUN_1008585f((uVar11 + 1 ^ *puVar10) & 0xfffff ^ *puVar10,puVar10[1] + uVar4,
                         puVar10[3] + 1,0);
    if ((iVar5 < 0) || (iVar5 = FUN_100853b0(), iVar5 < 0)) goto LAB_100ad863;
    local_1c = 0;
    if (uVar4 != 0) {
      local_14 = uVar11 * 4;
      local_10 = 0;
      local_c = 0;
      iVar7 = local_14 + 4;
      do {
        bVar3 = true;
        if (1 < uVar11) {
          piVar6 = (int *)(puVar10[2] + local_c);
          iVar5 = *piVar6;
          local_24 = uVar11 - 1;
          do {
            piVar6 = piVar6 + 1;
            if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4) + 0x10) !=
                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4) + 0x10)) {
              bVar3 = false;
            }
            local_24 = local_24 + -1;
          } while (local_24 != 0);
        }
        puVar12 = (undefined4 *)(puVar10[2] + local_c);
        puVar13 = (undefined4 *)(*(int *)(param_2 + 8) + local_10);
        for (uVar8 = uVar11; uVar8 != 0; uVar8 = uVar8 - 1) {
          *puVar13 = *puVar12;
          puVar12 = puVar12 + 1;
          puVar13 = puVar13 + 1;
        }
        for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
          *(undefined1 *)puVar13 = *(undefined1 *)puVar12;
          puVar12 = (undefined4 *)((int)puVar12 + 1);
          puVar13 = (undefined4 *)((int)puVar13 + 1);
        }
        if (bVar3) {
          *(undefined4 *)(local_14 + *(int *)(param_2 + 8)) = *(undefined4 *)(local_c + puVar10[2]);
        }
        else {
          iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_10 + *(int *)(param_2 + 8)) * 4)
          ;
          uVar2 = *(undefined4 *)(iVar5 + 0xc);
          iVar9 = FUN_10086139(*(undefined4 *)(iVar5 + 4),uVar2,2,0);
          if (iVar9 == -1) goto LAB_100ad5fe;
          *(int *)(local_14 + *(int *)(param_2 + 8)) = iVar9;
          if ((*(int *)(iVar5 + 4) == *(int *)(in_ECX + 0x88)) &&
             (iVar5 = FUN_100ad49d(param_1,local_18,uVar2), iVar5 < 0)) goto LAB_100ad863;
        }
        iVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),param_3,2,0);
        if (iVar5 == -1) goto LAB_100ad5fe;
        puVar12 = (undefined4 *)puVar10[4];
        puVar13 = *(undefined4 **)(param_2 + 0x10);
        for (uVar8 = puVar10[3] & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
          *puVar13 = *puVar12;
          puVar12 = puVar12 + 1;
          puVar13 = puVar13 + 1;
        }
        local_1c = local_1c + 1;
        for (iVar9 = 0; iVar9 != 0; iVar9 = iVar9 + -1) {
          *(undefined1 *)puVar13 = *(undefined1 *)puVar12;
          puVar12 = (undefined4 *)((int)puVar12 + 1);
          puVar13 = (undefined4 *)((int)puVar13 + 1);
        }
        *(int *)(*(int *)(param_2 + 0x10) + puVar10[3] * 4) = iVar5;
        local_c = local_c + uVar11 * 4;
        local_10 = local_10 + iVar7;
        local_14 = local_14 + iVar7;
      } while (local_1c < uVar4);
    }
  }
  FUN_10085abe();
  FUN_1006c418();
  param_2 = 0;
  iVar5 = 0;
LAB_100ad863:
  if (param_2 != 0) {
    FUN_1006c418();
    return iVar5;
  }
  return iVar5;
}


