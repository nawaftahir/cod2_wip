// 10089f75 size=293 FUN_10089f75

undefined4 FUN_10089f75(int param_1,uint param_2,uint param_3)

{
  byte *pbVar1;
  int iVar2;
  int iVar3;
  bool bVar4;
  int in_ECX;
  uint uVar5;
  uint uVar6;
  int iVar7;
  undefined4 local_8;
  
  uVar5 = 0;
  if (*(int *)(in_ECX + 4) != 0) {
    do {
      iVar7 = *(int *)(*(int *)(in_ECX + 0x10) + uVar5 * 4);
      uVar6 = *(uint *)(iVar7 + 4);
      if (((uVar6 & param_2) == param_2) && ((param_3 & uVar6) == 0)) {
        *(undefined4 *)(iVar7 + 8) = 0;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 4));
  }
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      iVar2 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4);
      if ((((*(uint *)(iVar2 + 4) & param_2) == param_2) && ((param_3 & *(uint *)(iVar2 + 4)) == 0))
         && (uVar6 = *(int *)(iVar7 + 0xc) + 1, *(uint *)(iVar2 + 8) <= uVar6)) {
        *(uint *)(iVar2 + 8) = uVar6;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  uVar5 = 0;
  iVar7 = 0;
  bVar4 = false;
  if (*(int *)(in_ECX + 4) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x10) + uVar5 * 4);
      uVar6 = *(uint *)(iVar2 + 4);
      if (((uVar6 & param_2) == param_2) && ((param_3 & uVar6) == 0)) {
        *(int *)(iVar2 + 0x10) = iVar7;
        *(int *)(iVar2 + 0x18) = param_1;
        if ((uVar6 & 0x400) != 0) {
          bVar4 = true;
        }
        iVar7 = iVar7 + *(int *)(iVar2 + 8);
        *(undefined4 *)(iVar2 + 8) = 0;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 4));
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + local_8 * 4);
      iVar3 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4);
      if (((*(uint *)(iVar3 + 4) & param_2) == param_2) && ((param_3 & *(uint *)(iVar3 + 4)) == 0))
      {
        *(undefined4 *)(iVar2 + 4) = *(undefined4 *)(iVar3 + 0x18);
        *(int *)(iVar2 + 0xc) = *(int *)(iVar2 + 0xc) + *(int *)(iVar3 + 0x10);
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 8));
  }
  *(int *)(*(int *)(param_1 * 4 + *(int *)(in_ECX + 0x10)) + 8) = iVar7;
  if (bVar4) {
    pbVar1 = (byte *)(*(int *)(param_1 * 4 + *(int *)(in_ECX + 0x10)) + 5);
    *pbVar1 = *pbVar1 | 4;
  }
  return 0;
}


