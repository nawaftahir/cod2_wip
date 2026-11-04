// 100c0cef size=704 FUN_100c0cef

int FUN_100c0cef(void)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  int *in_ECX;
  int *piVar4;
  uint uVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int *local_108 [16];
  undefined4 local_c8;
  undefined4 local_c4;
  uint local_b8;
  uint local_b4;
  undefined4 local_a8;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_c = 0;
  local_28 = 0;
  local_10 = 0;
  uVar5 = *(uint *)in_ECX[0x40] & 0xfffff;
  local_24 = 1;
  local_20 = 2;
  local_1c = 3;
  iVar2 = FUN_100b99af((uint *)in_ECX[0x40],&DAT_10119c58,local_108,&local_c,&local_c8,&local_28,
                       uVar5,1);
  if (iVar2 != 0) {
    iVar2 = FUN_100b99af(in_ECX[0x40],&DAT_10119cb8,local_108,&local_c,&local_c8,&local_28,uVar5,1);
    if (iVar2 != 0) {
      return iVar2;
    }
    local_10 = 1;
  }
  if (*local_108[0] != 0x50000002) {
    return 1;
  }
  local_8 = 1;
  if (1 < uVar5) {
    piVar4 = *(int **)(in_ECX[0x40] + 8);
    local_14 = *piVar4;
    iVar2 = uVar5 * 4;
    do {
      piVar4 = piVar4 + 1;
      iVar2 = iVar2 + 4;
      if (*piVar4 != local_14) {
        return 1;
      }
      if (*(int *)(iVar2 + *(int *)(in_ECX[0x40] + 8)) !=
          *(int *)(*(int *)(in_ECX[0x40] + 8) + uVar5 * 4)) {
        return 1;
      }
      local_8 = local_8 + 1;
    } while (local_8 < uVar5);
  }
  iVar2 = FUN_10085814();
  if (iVar2 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_10085379();
  }
  iVar2 = FUN_1008585f(0x70800002,6,uVar5,0);
  if ((-1 < iVar2) && (iVar2 = FUN_100853b0(), uVar1 = local_8, -1 < iVar2)) {
    puVar6 = *(undefined4 **)(in_ECX[0x40] + 0x10);
    puVar7 = *(undefined4 **)(local_8 + 0x10);
    for (; uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar7 = *puVar6;
      puVar6 = puVar6 + 1;
      puVar7 = puVar7 + 1;
    }
    puVar6 = *(undefined4 **)(local_8 + 8);
    *puVar6 = local_c8;
    puVar6[1] = local_c4;
    if (local_10 == 0) {
      iVar2 = *(int *)(local_8 + 8);
      *(uint *)(iVar2 + 8) = local_b8;
    }
    else {
      iVar2 = *(int *)(in_ECX[5] + local_b4 * 4);
      local_18 = local_b8;
      iVar3 = *(int *)(in_ECX[5] + local_b8 * 4);
      uVar5 = *(uint *)(iVar3 + 0x38);
      local_10 = local_b4;
      if (uVar5 != 0xffffffff) {
        iVar3 = *(int *)(in_ECX[5] + uVar5 * 4);
        local_18 = uVar5;
      }
      uVar5 = *(uint *)(iVar2 + 0x38);
      if (uVar5 != 0xffffffff) {
        iVar2 = *(int *)(in_ECX[5] + uVar5 * 4);
        local_10 = uVar5;
      }
      local_14 = FUN_10086139(*(undefined4 *)(iVar3 + 4),*(undefined4 *)(iVar3 + 0xc),
                              *(undefined4 *)(iVar3 + 0x10),0);
      local_b4 = FUN_10086139(*(undefined4 *)(iVar2 + 4),*(undefined4 *)(iVar2 + 0xc),
                              *(undefined4 *)(iVar2 + 0x10),0);
      local_c = local_b4;
      if ((local_14 == -1) || (local_b4 == 0xffffffff)) {
        iVar2 = -0x7ff8fff2;
        goto LAB_100c0f9a;
      }
      *(uint *)(*(int *)(local_14 * 4 + in_ECX[5]) + 0x3c) = local_18 ^ 0x80000;
      *(uint *)(*(int *)(local_b4 * 4 + in_ECX[5]) + 0x3c) = local_10 ^ 0x80000;
      *(uint *)(*(int *)(local_14 * 4 + in_ECX[5]) + 0x38) = local_18;
      *(uint *)(*(int *)(local_b4 * 4 + in_ECX[5]) + 0x38) = local_10;
      *(int *)(*(int *)(uVar1 + 8) + 8) = local_14;
      iVar2 = *(int *)(uVar1 + 8);
    }
    *(uint *)(iVar2 + 0xc) = local_b4;
    *(undefined4 *)(*(int *)(uVar1 + 8) + 0x10) = local_a8;
    *(undefined4 *)(*(int *)(uVar1 + 8) + 0x14) = local_a8;
    iVar2 = (**(code **)(*in_ECX + 0x30))();
    if (iVar2 == 0) {
      iVar2 = FUN_10085abe();
    }
    else {
      iVar2 = 1;
    }
  }
LAB_100c0f9a:
  if (local_8 != 0) {
    FUN_1006c418();
  }
  return iVar2;
}


