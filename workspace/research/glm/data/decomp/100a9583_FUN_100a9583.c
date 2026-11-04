// 100a9583 size=586 FUN_100a9583

int * FUN_100a9583(void)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int *in_ECX;
  uint uVar6;
  int local_10c [4];
  int local_fc [4];
  undefined4 auStack_ec [32];
  undefined4 local_6c [16];
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  int local_10;
  uint local_c;
  int *local_8;
  
  local_14 = 0;
  local_2c = 0;
  local_28 = 1;
  local_24 = 2;
  local_20 = 3;
  uVar6 = *(uint *)in_ECX[0x40] & 0xfffff;
  local_c = 0;
  iVar2 = FUN_100b99af((uint *)in_ECX[0x40],&DAT_10115db0,local_6c,&local_14,local_10c,&local_2c,
                       uVar6,0);
  if (iVar2 == 0) {
LAB_100a961d:
    local_1c = 0;
    if (local_c != 0) {
      uVar3 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(*(int *)(in_ECX[5] + local_fc[0] * 4) + 4) * 4
                                ) + 4);
      local_1c = (uint)((uVar3 & 0x200) != 0);
      if (((*(uint *)(*(int *)(in_ECX[4] + *(int *)(*(int *)(in_ECX[5] + local_10c[0] * 4) + 4) * 4)
                     + 4) & 0x300) != 0) && ((uVar3 & 0x300) != 0)) {
        return (int *)0x1;
      }
    }
    iVar2 = FUN_10085814(0x74);
    if (iVar2 == 0) {
      iVar2 = 0;
    }
    else {
      iVar2 = FUN_10085379();
    }
    if (iVar2 == 0) {
      return (int *)0x8007000e;
    }
    if (local_c == 0) {
      uVar3 = uVar6 | 0x70300000;
    }
    else {
      uVar3 = uVar6 | 0x70400000;
    }
    local_8 = (int *)FUN_1008585f(uVar3,uVar6 * 3,uVar6,0);
    if (((int)local_8 < 0) || (local_8 = (int *)FUN_100853b0(in_ECX[0x40]), (int)local_8 < 0))
    goto LAB_100a97b8;
    local_c = 0;
    if (uVar6 != 0) {
      local_18 = uVar6 << 3;
      local_10 = uVar6 << 2;
      do {
        uVar3 = local_c;
        iVar1 = local_10;
        iVar5 = local_18;
        iVar4 = local_c * 4;
        *(undefined4 *)(iVar4 + *(int *)(iVar2 + 0x10)) =
             *(undefined4 *)(iVar4 + *(int *)(in_ECX[0x40] + 0x10));
        local_8 = local_fc + local_c;
        if (local_1c == 0) {
          *(int *)(iVar4 + *(int *)(iVar2 + 8)) = local_10c[local_c];
          iVar4 = *local_8;
        }
        else {
          *(int *)(iVar4 + *(int *)(iVar2 + 8)) = *local_8;
          iVar4 = local_10c[local_c];
        }
        local_c = local_c + 1;
        local_10 = local_10 + 4;
        *(int *)(iVar1 + *(int *)(iVar2 + 8)) = iVar4;
        local_18 = local_18 + 4;
        *(undefined4 *)(iVar5 + *(int *)(iVar2 + 8)) = auStack_ec[uVar3];
      } while (local_c < uVar6);
    }
    iVar5 = (**(code **)(*in_ECX + 0x20))(iVar2,0);
    if (iVar5 != 0) {
      local_8 = (int *)0x1;
      goto LAB_100a97b8;
    }
    uVar6 = 0;
    if (local_14 != 0) {
      do {
        *(undefined4 *)local_6c[uVar6] = 0;
        uVar6 = uVar6 + 1;
      } while (uVar6 < local_14);
    }
    if (in_ECX[0x40] != 0) {
      FUN_1006c418(1);
    }
    *(int *)(in_ECX[6] + in_ECX[0x3f] * 4) = iVar2;
  }
  else {
    iVar2 = FUN_100b99af(in_ECX[0x40],&DAT_10115e10,local_6c,&local_14,local_10c,&local_2c,uVar6,0);
    local_c = 1;
    if (iVar2 == 0) goto LAB_100a961d;
  }
  iVar2 = 0;
  local_8 = (int *)0x0;
LAB_100a97b8:
  if (iVar2 != 0) {
    FUN_1006c418(1);
  }
  return local_8;
}


