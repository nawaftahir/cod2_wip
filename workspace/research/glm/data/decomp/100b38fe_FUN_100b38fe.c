// 100b38fe size=310 FUN_100b38fe

void FUN_100b38fe(void)

{
  uint *puVar1;
  int *piVar2;
  uint uVar3;
  int iVar4;
  int *in_ECX;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int *piVar8;
  int *piVar9;
  int local_38 [4];
  int local_28 [4];
  int local_18;
  int *local_14;
  int *local_10;
  uint local_c;
  uint local_8;
  
  puVar1 = (uint *)in_ECX[0x40];
  local_8 = puVar1[3];
  piVar2 = (int *)puVar1[2];
  local_14 = (int *)puVar1[4];
  uVar6 = *puVar1 & 0xfffff;
  local_10 = piVar2 + uVar6;
  iVar4 = in_ECX[5];
  local_c = *(uint *)(iVar4 + *piVar2 * 4);
  iVar5 = *(int *)(iVar4 + *local_14 * 4);
  local_18 = *(int *)(iVar4 + *local_10 * 4);
  if (((*(int *)(iVar5 + 4) == *(int *)(local_c + 4)) &&
      (*(int *)(iVar5 + 0xc) == *(int *)(local_c + 0xc))) ||
     ((*(int *)(iVar5 + 4) == *(int *)(local_18 + 4) &&
      (*(int *)(iVar5 + 0xc) == *(int *)(local_18 + 0xc))))) {
    iVar4 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_38,4,0,0);
    if (iVar4 < 0) {
      return;
    }
    local_c = 0;
    if (local_8 != 0) {
      iVar4 = in_ECX[5];
      local_18 = (int)local_14 - (int)local_28;
      do {
        uVar3 = local_c;
        iVar5 = local_c * 4;
        local_c = local_c + 1;
        local_28[uVar3] =
             local_38[*(int *)(*(int *)(iVar4 + *(int *)((int)local_28 + local_18 + iVar5) * 4) +
                              0x10)];
      } while (local_c < local_8);
    }
    FUN_100c9a7f(2,local_28,local_8,piVar2,local_10,0,uVar6,0,0x1000000,0,0);
    uVar7 = 0x58;
    piVar8 = local_28;
    piVar9 = piVar2;
  }
  else {
    piVar9 = (int *)0x0;
    uVar7 = 10;
    piVar8 = piVar2;
  }
  FUN_100c9a7f(uVar7,local_14,local_8,piVar8,local_10,piVar9,uVar6,0,0,0,0);
  return;
}


