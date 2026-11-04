// 100c768d size=393 FUN_100c768d

undefined4 FUN_100c768d(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  int *piVar6;
  int iVar7;
  int iVar8;
  int in_ECX;
  int *piVar9;
  uint uVar10;
  undefined1 local_1c [8];
  int local_14;
  uint local_10;
  undefined4 local_8;
  
  uVar10 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  if ((**(uint **)(in_ECX + 0x100) & 0xfff00000) == 0x70300000) {
    local_8 = *(undefined4 *)(in_ECX + 0xfc);
    iVar2 = *(int *)(in_ECX + 0x100);
    FUN_100c3a56(uVar10 | 0x20500000,iVar2,local_1c,2);
    if (local_14 == 0) {
LAB_100c780e:
      uVar5 = 1;
    }
    else {
      local_10 = 0;
      if (uVar10 != 0) {
        piVar9 = *(int **)(local_14 + 0x10);
        piVar6 = (int *)(*(int *)(iVar2 + 8) + uVar10 * 8);
        do {
          if (*piVar6 != *piVar9) goto LAB_100c780e;
          local_10 = local_10 + 1;
          piVar6 = piVar6 + 1;
          piVar9 = piVar9 + 1;
        } while (local_10 < uVar10);
      }
      iVar3 = *(int *)(iVar2 + 8);
      iVar4 = *(int *)(local_14 + 8);
      iVar1 = uVar10 * 4 + iVar3;
      iVar7 = uVar10 * 4 + iVar4;
      iVar8 = FUN_100c1688(iVar3,iVar1,iVar4,iVar7,local_14,iVar2,local_8);
      if ((((iVar8 == 0) ||
           (iVar8 = FUN_100c1688(iVar1,iVar3,iVar4,iVar7,local_14,iVar2,local_8), iVar8 == 0)) ||
          (iVar8 = FUN_100c1688(iVar3,iVar1,iVar7,iVar4,local_14,iVar2,local_8), iVar8 == 0)) ||
         (((iVar8 = FUN_100c1688(iVar1,iVar3,iVar7,iVar4,local_14,iVar2,local_8), iVar8 == 0 ||
           (iVar8 = FUN_100c1688(iVar4,iVar7,iVar3,iVar1,local_14,iVar2,local_8), iVar8 == 0)) ||
          ((iVar8 = FUN_100c1688(iVar7,iVar4,iVar3,iVar1,local_14,iVar2,local_8), iVar8 == 0 ||
           (iVar8 = FUN_100c1688(iVar4,iVar7,iVar1,iVar3,local_14,iVar2,local_8), iVar8 == 0)))))) {
        uVar5 = 0;
      }
      else {
        uVar5 = FUN_100c1688(iVar7,iVar4,iVar1,iVar3,local_14,iVar2,local_8);
      }
    }
  }
  else {
    uVar5 = 1;
  }
  return uVar5;
}


