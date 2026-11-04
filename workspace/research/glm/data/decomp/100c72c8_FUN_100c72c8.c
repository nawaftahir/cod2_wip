// 100c72c8 size=392 FUN_100c72c8

undefined4 FUN_100c72c8(uint *param_1)

{
  int iVar1;
  int iVar2;
  uint *puVar3;
  uint *puVar4;
  uint uVar5;
  int *piVar6;
  int in_ECX;
  int *piVar7;
  undefined4 uVar8;
  bool bVar9;
  undefined4 uVar10;
  int *local_14;
  uint local_10;
  
  uVar8 = 1;
  bVar9 = param_1 == (uint *)0x0;
  if (bVar9) {
    param_1 = *(uint **)(in_ECX + 0x100);
  }
  if ((*param_1 & 0xfff00000) == 0x20400000) {
    uVar5 = *param_1 & 0xfffff;
    local_14 = (int *)param_1[2];
    piVar7 = local_14 + uVar5;
    iVar2 = *(int *)(in_ECX + 0x14);
    piVar6 = piVar7;
    if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                            *(int *)(*(int *)(iVar2 + *piVar7 * 4) + 4) * 4) + 5) & 1) == 0) &&
       (iVar1 = *local_14, piVar6 = local_14, local_14 = piVar7,
       (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(*(int *)(iVar2 + iVar1 * 4) + 4) * 4)
                 + 5) & 1) == 0)) {
LAB_100c7446:
      uVar8 = 1;
    }
    else {
      puVar3 = *(uint **)(in_ECX + 0x100);
      piVar7 = local_14;
      if (puVar3 != param_1) {
        piVar7 = (int *)puVar3[2];
      }
      *(undefined4 *)(in_ECX + 0x15c) = 0;
      local_10 = 0;
      if (uVar5 != 0) {
        iVar1 = (int)piVar6 - (int)piVar7;
        do {
          if ((*(double *)(*(int *)(iVar2 + *(int *)(iVar1 + (int)piVar7) * 4) + 0x20) != 1.0) ||
             ((bVar9 && ((*(uint *)(*(int *)(iVar2 + *piVar7 * 4) + 0x3c) & 0x1f0000) != 0x80000))))
          goto LAB_100c7446;
          puVar4 = *(uint **)(iVar2 + *piVar7 * 4);
          if (((*(byte *)((int)puVar4 + 0x3d) & 2) == 0) &&
             ((*puVar4 & (uint)bVar9 * 4 + 0x14) == 0)) {
            *(undefined4 *)(in_ECX + 0x15c) = 1;
          }
          local_10 = local_10 + 1;
          piVar7 = piVar7 + 1;
        } while (local_10 < uVar5);
      }
      if (bVar9) {
        param_1 = (uint *)0x0;
        uVar10 = 0x90000;
        uVar8 = 0x80000;
      }
      else {
        uVar10 = 0x10000;
        local_14 = (int *)puVar3[2];
        uVar8 = 0;
      }
      uVar8 = FUN_100c5bcc(0x10000,uVar8,local_14,uVar10,param_1,0);
      if (*(int *)(in_ECX + 0x15c) == 2) {
        FUN_1008b13a();
      }
    }
  }
  return uVar8;
}


