// 100b65a7 size=955 FUN_100b65a7

int FUN_100b65a7(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  uint *puVar5;
  int *in_ECX;
  int *piVar6;
  uint uVar7;
  uint uVar8;
  undefined4 *puVar9;
  int *piVar10;
  undefined4 *puVar11;
  bool bVar12;
  uint local_1c;
  int local_14;
  uint *local_10;
  int local_c;
  int *local_8;
  
  puVar5 = (uint *)in_ECX[0x40];
  uVar8 = *puVar5 & 0xfffff;
  if (uVar8 < 3) {
    return 0;
  }
  local_10 = puVar5;
  local_8 = in_ECX;
  puVar1 = (uint *)FUN_100c37fb(0x10000002,puVar5,0,2,1);
  if ((((puVar1 == (uint *)0x0) &&
       (puVar1 = (uint *)FUN_100c37fb(0x10000003,puVar5,0,2,1), puVar1 == (uint *)0x0)) &&
      (puVar1 = (uint *)FUN_100c37fb(0x10000004,puVar5,0,2,1), puVar1 == (uint *)0x0)) ||
     (local_c = local_8[5], *(int *)(*(int *)(local_c + *(int *)puVar1[4] * 4) + 4) != local_8[0x21]
     )) {
LAB_100b675b:
    if ((uVar8 == 3) && (0x1ff < (local_8[0x32] & 0xffffU))) {
      local_10 = (uint *)local_8[0x40];
      iVar2 = 3;
      bVar12 = true;
      piVar6 = (int *)local_10[2];
      piVar10 = (int *)local_10[2] + 3;
      do {
        if (iVar2 == 0) break;
        iVar2 = iVar2 + -1;
        bVar12 = *piVar6 == *piVar10;
        piVar6 = piVar6 + 1;
        piVar10 = piVar10 + 1;
      } while (bVar12);
      if (((bVar12) &&
          (puVar4 = (undefined4 *)FUN_100c37fb(&DAT_10700001,local_10,0,2,1),
          puVar4 != (undefined4 *)0x0)) &&
         ((puVar5 = (uint *)FUN_100c37fb(0x20500003,puVar4,&local_14,2,1), puVar5 != (uint *)0x0 ||
          (puVar5 = (uint *)FUN_100c37fb(0x20500004,puVar4,&local_14,2,1), puVar5 != (uint *)0x0))))
      {
        iVar2 = *(int *)(local_8[5] + *(int *)local_10[2] * 4);
        local_c = *(int *)(local_8[5] + *(int *)puVar5[4] * 4);
        uVar8 = *puVar5 & 0xfffff;
        iVar3 = 3;
        bVar12 = true;
        piVar6 = (int *)(puVar5[2] + uVar8 * 4);
        piVar10 = (int *)local_10[2];
        do {
          if (iVar3 == 0) break;
          iVar3 = iVar3 + -1;
          bVar12 = *piVar6 == *piVar10;
          piVar6 = piVar6 + 1;
          piVar10 = piVar10 + 1;
        } while (bVar12);
        if ((bVar12) &&
           ((*(int *)(iVar2 + 4) != *(int *)(local_c + 4) ||
            (*(int *)(iVar2 + 0xc) != *(int *)(local_c + 0xc))))) {
          iVar2 = FUN_10085814(0x74);
          if (iVar2 == 0) {
            local_c = 0;
          }
          else {
            local_c = FUN_10085379();
          }
          iVar2 = local_c;
          if (local_c == 0) {
            return -0x7ff8fff2;
          }
          iVar3 = FUN_1008585f(uVar8 | 0x70200000,uVar8,uVar8,0);
          if (iVar3 < 0) {
            return iVar3;
          }
          iVar3 = FUN_100853b0(puVar5);
          if (iVar3 < 0) {
            return iVar3;
          }
          puVar9 = (undefined4 *)puVar5[4];
          puVar11 = *(undefined4 **)(iVar2 + 0x10);
          for (uVar7 = uVar8; uVar7 != 0; uVar7 = uVar7 - 1) {
            *puVar11 = *puVar9;
            puVar9 = puVar9 + 1;
            puVar11 = puVar11 + 1;
          }
          for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
            *(undefined1 *)puVar11 = *(undefined1 *)puVar9;
            puVar9 = (undefined4 *)((int)puVar9 + 1);
            puVar11 = (undefined4 *)((int)puVar11 + 1);
          }
          puVar9 = (undefined4 *)(puVar5[2] + uVar8 * 4);
          puVar11 = *(undefined4 **)(local_c + 8);
          for (uVar7 = uVar8; uVar7 != 0; uVar7 = uVar7 - 1) {
            *puVar11 = *puVar9;
            puVar9 = puVar9 + 1;
            puVar11 = puVar11 + 1;
          }
          for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
            *(undefined1 *)puVar11 = *(undefined1 *)puVar9;
            puVar9 = (undefined4 *)((int)puVar9 + 1);
            puVar11 = (undefined4 *)((int)puVar11 + 1);
          }
          iVar2 = (**(code **)(*local_8 + 0x20))(local_c,0);
          if (iVar2 == 0) {
            *local_10 = 0;
            *puVar4 = 0;
            *puVar5 = 0;
            iVar2 = (**(code **)(*local_8 + 0x34))(local_c,local_14);
            if (iVar2 == 0) {
              if (*(int *)(local_8[6] + local_14 * 4) != 0) {
                FUN_1006c418(1);
              }
              *(int *)(local_8[6] + local_14 * 4) = local_c;
              return 0;
            }
            *local_10 = 0x50000003;
            *puVar4 = &DAT_10700001;
            *puVar5 = uVar8 | 0x20500000;
          }
          FUN_1006c418(1);
        }
      }
    }
  }
  else {
    local_1c = *puVar1 & 0xfffff;
    bVar12 = true;
    if (local_1c != 0) {
      local_14 = *(int *)puVar5[4];
      piVar6 = (int *)puVar1[2];
      do {
        if ((*piVar6 != local_14) ||
           ((*(uint *)(*(int *)(local_c + *piVar6 * 4) + 0x34) & 0x1ffe00) != 0)) {
          bVar12 = false;
        }
        piVar6 = piVar6 + 1;
        local_1c = local_1c - 1;
      } while (local_1c != 0);
      if (!bVar12) goto LAB_100b675b;
    }
    iVar2 = FUN_10085814(0x74);
    if (iVar2 == 0) {
      local_c = 0;
    }
    else {
      local_c = FUN_10085379();
    }
    if (local_c == 0) {
      return -0x7ff8fff2;
    }
    iVar3 = FUN_1008585f(uVar8 | 0x50000000,puVar5[1],puVar1[3],0);
    iVar2 = local_c;
    if ((iVar3 < 0) || (iVar3 = FUN_100853b0(puVar5), iVar3 < 0)) {
      FUN_1006c418(1);
      return iVar3;
    }
    puVar4 = (undefined4 *)puVar1[4];
    puVar9 = *(undefined4 **)(iVar2 + 0x10);
    for (uVar8 = *(uint *)(iVar2 + 0xc) & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
      *puVar9 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar9 = puVar9 + 1;
    }
    for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined1 *)puVar9 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    puVar4 = (undefined4 *)local_10[2];
    puVar9 = *(undefined4 **)(local_c + 8);
    for (uVar8 = *(uint *)(local_c + 4) & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
      *puVar9 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar9 = puVar9 + 1;
    }
    for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined1 *)puVar9 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    *puVar1 = 0;
    if (local_8[0x40] != 0) {
      FUN_1006c418(1);
    }
    *(int *)(local_8[6] + local_8[0x3f] * 4) = local_c;
    local_8[0x40] = local_c;
  }
  return 0;
}


