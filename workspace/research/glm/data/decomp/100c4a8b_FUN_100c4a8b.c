// 100c4a8b size=569 FUN_100c4a8b

undefined4 FUN_100c4a8b(uint param_1,int param_2,uint param_3,uint param_4,int *param_5)

{
  int iVar1;
  bool bVar2;
  uint uVar3;
  int iVar4;
  int in_ECX;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  undefined4 *local_8;
  
  local_8 = (undefined4 *)0x0;
  uVar3 = 0;
  bVar2 = false;
  if (param_5 != (int *)0x0) {
    do {
      if (*(int *)(in_ECX + 0x150) == *(int *)(param_4 + uVar3 * 4)) {
        bVar2 = true;
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < param_5);
  }
  if ((*(uint *)(in_ECX + 0x14c) <= param_1) || (bVar2)) {
    *(undefined4 *)(in_ECX + 0x13c) = 0xffffffff;
    *(undefined4 *)(in_ECX + 0x140) = 0xffffffff;
    *(undefined4 *)(in_ECX + 0x144) = 0xffffffff;
    *(undefined4 *)(in_ECX + 0x148) = 0xffffffff;
    local_8 = operator_new(*(int *)(in_ECX + 0x2c) << 2);
    if (local_8 == (undefined4 *)0x0) {
LAB_100c4cbd:
      uVar7 = 0x8007000e;
      goto LAB_100c4cab;
    }
    puVar8 = local_8;
    for (uVar3 = *(uint *)(in_ECX + 0x2c) & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar8 = 0xffffffff;
      puVar8 = puVar8 + 1;
    }
    uVar3 = 0;
    for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
      *(undefined1 *)puVar8 = 0xff;
      puVar8 = (undefined4 *)((int)puVar8 + 1);
    }
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4);
        if (((*(int *)(in_ECX + 0x88) == *(int *)(iVar5 + 4)) && (*(int *)(iVar5 + 8) == -1)) &&
           (*(uint *)(iVar5 + 0xc) < *(uint *)(in_ECX + 0x2c))) {
          if ((*(uint *)(iVar5 + 0x48) < param_1) && (param_1 <= *(uint *)(iVar5 + 0x58))) {
            local_8[*(uint *)(iVar5 + 0xc)] = 0;
          }
          uVar6 = *(uint *)(iVar5 + 0x48);
          if ((param_1 <= uVar6) && (uVar6 < (uint)local_8[*(int *)(iVar5 + 0xc)])) {
            local_8[*(int *)(iVar5 + 0xc)] = uVar6;
          }
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(in_ECX + 8));
    }
    uVar3 = 0;
    *(undefined4 *)(in_ECX + 0x150) = 0;
    *(undefined4 *)(in_ECX + 0x14c) = 0;
    if (*(int *)(in_ECX + 0x2c) != 0) {
      do {
        uVar6 = 0;
        if (param_5 == (int *)0x0) {
LAB_100c4b8d:
          if (*(uint *)(in_ECX + 0x14c) < (uint)local_8[uVar3]) {
            *(uint *)(in_ECX + 0x150) = uVar3;
            *(undefined4 *)(in_ECX + 0x14c) = local_8[uVar3];
          }
        }
        else {
          do {
            if (uVar3 == *(uint *)(param_4 + uVar6 * 4)) break;
            uVar6 = uVar6 + 1;
          } while (uVar6 < param_5);
          if (param_5 <= uVar6) goto LAB_100c4b8d;
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(in_ECX + 0x2c));
    }
    if (*(uint *)(in_ECX + 0x14c) <= param_1) {
      *(undefined4 *)(in_ECX + 0x14c) = 0xffffffff;
      *(int *)(in_ECX + 0x150) = *(int *)(in_ECX + 0x2c);
    }
  }
  param_4 = 0;
  iVar5 = (-(uint)(param_3 != 1) & 0xfffffffd) + 3;
  if (param_3 != 0) {
    param_5 = (int *)(in_ECX + 0x13c + iVar5 * 4);
    do {
      if (*param_5 != -1) {
        *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_5 * 4) + 0x50) = param_1;
      }
      iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),*(undefined4 *)(in_ECX + 0x150),iVar5,0);
      *param_5 = iVar4;
      if (iVar4 == -1) goto LAB_100c4cbd;
      iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
      *(undefined4 *)(iVar4 + 0x3c) = 0;
      *(undefined4 *)(iVar4 + 0x30) = 0;
      *(uint *)(iVar4 + 0x48) = param_1;
      *(undefined4 *)(iVar4 + 0x50) = *(undefined4 *)(in_ECX + 0x14c);
      *(uint *)(iVar4 + 0x54) = param_1;
      *(uint *)(iVar4 + 0x58) = param_1;
      *(undefined4 *)(iVar4 + 0x5c) = 1;
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + param_1 * 4);
      if (*(int *)(iVar1 + 0xc) != 0) {
        *(undefined4 *)(iVar4 + 0x18) =
             *(undefined4 *)
              (*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar1 + 0x10) * 4) + 0x18);
        *(undefined4 *)(iVar4 + 0x14) =
             *(undefined4 *)
              (*(int *)(*(int *)(in_ECX + 0x14) +
                       **(int **)(*(int *)(*(int *)(in_ECX + 0x18) + param_1 * 4) + 0x10) * 4) +
              0x14);
      }
      if (param_2 != 0) {
        *(int *)(param_2 + param_4 * 4) = *param_5;
      }
      param_5 = param_5 + 1;
      iVar5 = iVar5 + 1;
      param_4 = param_4 + 1;
    } while (param_4 < param_3);
  }
  uVar7 = 0;
LAB_100c4cab:
  _free(local_8);
  return uVar7;
}


