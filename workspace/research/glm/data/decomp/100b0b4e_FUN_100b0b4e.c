// 100b0b4e size=366 FUN_100b0b4e

undefined4 FUN_100b0b4e(int param_1,uint param_2,uint param_3,uint *param_4)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  undefined4 uVar5;
  int in_ECX;
  uint uVar6;
  undefined4 *puVar7;
  int *piVar8;
  bool bVar9;
  int local_28 [8];
  int local_8;
  
  bVar9 = (param_3 & 0x10000) != 0;
  if (bVar9) {
    local_28[4] = 0;
  }
  uVar3 = (uint)bVar9;
  if ((param_3 & 0x20000) != 0) {
    local_28[uVar3 + 4] = 1;
    uVar3 = uVar3 + 1;
  }
  if ((param_3 & 0x40000) != 0) {
    local_28[uVar3 + 4] = 2;
    uVar3 = uVar3 + 1;
  }
  if ((param_3 & 0x80000) != 0) {
    local_28[uVar3 + 4] = 3;
    uVar3 = uVar3 + 1;
  }
  if (uVar3 < param_2) {
    param_2 = uVar3;
  }
  local_28[0] = -1;
  local_28[1] = 0xffffffff;
  local_28[2] = 0xffffffff;
  uVar3 = 0;
  local_28[3] = 0xffffffff;
  local_8 = in_ECX;
  if (param_2 != 0) {
    iVar4 = *(int *)(in_ECX + 0x14);
    do {
      iVar2 = uVar3 + 4;
      iVar1 = uVar3 * 4;
      uVar3 = uVar3 + 1;
      local_28[local_28[iVar2]] = *(int *)(*(int *)(iVar4 + *(int *)(param_1 + iVar1) * 4) + 0x10);
    } while (uVar3 < param_2);
  }
  if ((*(uint *)(local_8 + 200) & 0xffff) == 0x104) {
    uVar3 = 0;
    puVar7 = &DAT_101a3fd0;
    do {
      iVar4 = FUN_100a7dc4(local_28,puVar7);
      if (iVar4 != 0) {
        piVar8 = &DAT_101a3fd0 + uVar3 * 4;
        if (piVar8 != (int *)0x0) goto LAB_100b0c97;
        break;
      }
      uVar3 = uVar3 + 1;
      puVar7 = puVar7 + 4;
    } while (uVar3 < 5);
    FUN_1008b0b5(local_8,*(undefined4 *)(*(int *)(local_8 + 0x100) + 0x3c),0x11b5,
                 "cannot map swizzle to ps_1_4");
    uVar5 = 0x80004005;
  }
  else {
    piVar8 = &DAT_101a4000;
    iVar4 = FUN_100a7dc4(local_28,&DAT_101a4000);
    if (iVar4 == 0) {
      piVar8 = &DAT_101a4010;
      iVar4 = FUN_100a7dc4(local_28,&DAT_101a4010);
      if (((iVar4 == 0) && (iVar4 = FUN_100a7dc4(local_28,&DAT_101a3ff0), iVar4 != 0)) &&
         ((param_3 & 0xf0000) == 0x80000)) {
        piVar8 = &DAT_101a3ff0;
      }
    }
LAB_100b0c97:
    uVar6 = 0;
    uVar3 = 0x10;
    do {
      iVar4 = *piVar8;
      piVar8 = piVar8 + 1;
      uVar6 = uVar6 | iVar4 << ((byte)uVar3 & 0x1f);
      uVar3 = uVar3 + 2;
    } while (uVar3 < 0x18);
    *param_4 = uVar6;
    uVar5 = 0;
  }
  return uVar5;
}


