// 100674ae size=323 FUN_100674ae

undefined4 FUN_100674ae(uint param_1,uint *param_2)

{
  uint uVar1;
  uint uVar2;
  undefined4 *puVar3;
  int in_ECX;
  uint uVar4;
  uint uVar5;
  int iVar6;
  undefined4 *puVar7;
  uint uVar8;
  undefined4 *puVar9;
  undefined4 local_10;
  uint local_8;
  
  uVar1 = *(uint *)(in_ECX + 0x14);
  uVar8 = 0;
  local_8 = uVar1 >> 1;
  local_10 = 0;
  uVar4 = uVar1;
  if (uVar1 == 0) {
LAB_100674f8:
    if (uVar1 == (~uVar1 + 1 & uVar1)) {
      if (uVar1 == 0) {
        iVar6 = 1;
      }
      else {
        iVar6 = uVar1 * 2;
      }
      puVar3 = operator_new(iVar6 << 2);
      if (puVar3 != (undefined4 *)0x0) {
        puVar7 = *(undefined4 **)(in_ECX + 0x1c);
        puVar9 = puVar3;
        for (uVar8 = *(uint *)(in_ECX + 0x14) & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
          *puVar9 = *puVar7;
          puVar7 = puVar7 + 1;
          puVar9 = puVar9 + 1;
        }
        for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
          *(undefined1 *)puVar9 = *(undefined1 *)puVar7;
          puVar7 = (undefined4 *)((int)puVar7 + 1);
          puVar9 = (undefined4 *)((int)puVar9 + 1);
        }
        _free(*(void **)(in_ECX + 0x1c));
        *(undefined4 **)(in_ECX + 0x1c) = puVar3;
        if (*(int *)(in_ECX + 0x14) == 0) {
          iVar6 = 1;
        }
        else {
          iVar6 = *(int *)(in_ECX + 0x14) * 2;
        }
        puVar3 = operator_new(iVar6 << 2);
        if (puVar3 != (undefined4 *)0x0) {
          puVar7 = *(undefined4 **)(in_ECX + 0x18);
          puVar9 = puVar3;
          for (uVar8 = *(uint *)(in_ECX + 0x14) & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
            *puVar9 = *puVar7;
            puVar7 = puVar7 + 1;
            puVar9 = puVar9 + 1;
          }
          for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
            *(undefined1 *)puVar9 = *(undefined1 *)puVar7;
            puVar7 = (undefined4 *)((int)puVar7 + 1);
            puVar9 = (undefined4 *)((int)puVar9 + 1);
          }
          _free(*(void **)(in_ECX + 0x18));
          *(undefined4 **)(in_ECX + 0x18) = puVar3;
          goto LAB_100675a3;
        }
      }
      local_10 = 0x8007000e;
      goto LAB_100675df;
    }
LAB_100675a3:
    for (uVar8 = *(uint *)(in_ECX + 0x14); local_8 < uVar8; uVar8 = uVar8 - 1) {
      puVar3 = (undefined4 *)(*(int *)(in_ECX + 0x18) + uVar8 * 4);
      *puVar3 = puVar3[-1];
      puVar3 = (undefined4 *)(*(int *)(in_ECX + 0x1c) + uVar8 * 4);
      *puVar3 = puVar3[-1];
    }
    *(uint *)(*(int *)(in_ECX + 0x18) + local_8 * 4) = param_1;
    *(undefined4 *)(*(int *)(in_ECX + 0x1c) + local_8 * 4) = 1;
    *(int *)(in_ECX + 0x14) = *(int *)(in_ECX + 0x14) + 1;
  }
  else {
    do {
      uVar2 = *(uint *)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      if (uVar2 < param_1) {
        uVar8 = local_8 + 1;
        uVar5 = uVar4;
      }
      else {
        uVar5 = local_8;
        if (uVar2 <= param_1) break;
      }
      local_8 = uVar5 + uVar8 >> 1;
      uVar4 = uVar5;
    } while (uVar8 < uVar5);
    if (uVar4 <= uVar8) goto LAB_100674f8;
  }
  if (param_2 != (uint *)0x0) {
    *param_2 = local_8;
  }
LAB_100675df:
  _free((void *)0x0);
  return local_10;
}


