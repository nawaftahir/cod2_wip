// 100c19e8 size=931 FUN_100c19e8

int FUN_100c19e8(int param_1)

{
  int **ppiVar1;
  uint *puVar2;
  int *piVar3;
  int iVar4;
  int *in_ECX;
  uint uVar5;
  int iVar6;
  uint uVar7;
  undefined4 *puVar8;
  int *piVar9;
  undefined4 *puVar10;
  int *piVar11;
  bool bVar12;
  int local_118 [4];
  undefined4 local_108 [4];
  undefined4 local_f8 [4];
  int local_e8 [28];
  int *local_78 [16];
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  uint local_28;
  int *local_24;
  undefined4 *local_20;
  int local_1c;
  int *local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  int *local_8;
  
  local_10 = 0;
  local_38 = 0;
  uVar7 = *(uint *)in_ECX[0x40] & 0xfffff;
  local_34 = 1;
  local_30 = 2;
  local_2c = 3;
  local_28 = uVar7;
  local_24 = in_ECX;
  iVar4 = FUN_100b99af((uint *)in_ECX[0x40],&DAT_10118578,local_78,&local_10,local_118,&local_38,
                       uVar7,param_1);
  if ((iVar4 == 0) ||
     (iVar4 = FUN_100b99af(in_ECX[0x40],&DAT_101185d8,local_78,&local_10,local_118,&local_38,uVar7,
                           param_1), iVar4 == 0)) {
    local_14 = 0;
    local_18 = local_118;
    local_20 = local_108;
    do {
      local_c = 0;
      if (uVar7 != 0) {
        local_1c = (in_ECX[0x1b] << 6) >> 0x1f;
        local_8 = local_18;
        do {
          iVar4 = *(int *)(in_ECX[5] + *local_8 * 4);
          iVar6 = *(int *)(in_ECX[5] + local_e8[local_c] * 4);
          if (in_ECX[0x1b] << 6 < 0) {
            if ((*(uint *)(iVar6 + 0x3c) ^ *(uint *)(iVar4 + 0x3c)) != 0x80000) break;
            bVar12 = *(int *)(iVar6 + 0x38) == *local_8;
          }
          else {
            if ((((*(int *)(iVar4 + 4) != *(int *)(iVar6 + 4)) ||
                 (*(int *)(iVar4 + 8) != *(int *)(iVar6 + 8))) ||
                (*(int *)(iVar4 + 0xc) != *(int *)(iVar6 + 0xc))) ||
               (*(int *)(iVar4 + 0x10) != *(int *)(iVar6 + 0x10))) break;
            bVar12 = (*(uint *)(iVar6 + 0x3c) ^ *(uint *)(iVar4 + 0x3c)) == 0x80000;
          }
          if (!bVar12) break;
          local_c = local_c + 1;
          local_8 = local_8 + 1;
        } while (local_c < uVar7);
      }
      if (local_c == uVar7) {
        iVar4 = FUN_10085814(0x74);
        if (iVar4 == 0) {
          iVar4 = 0;
        }
        else {
          iVar4 = FUN_10085379();
        }
        if (iVar4 == 0) {
          return -0x7ff8fff2;
        }
        local_8 = (int *)FUN_1008585f(uVar7 & 0xfffff | 0x70100000,uVar7 * 3,uVar7,0);
        if ((int)local_8 < 0) {
LAB_100c1cb1:
          FUN_1006c418(1);
          return (int)local_8;
        }
        local_8 = (int *)FUN_100853b0(in_ECX[0x40]);
        piVar3 = local_24;
        if ((int)local_8 < 0) goto LAB_100c1cb1;
        puVar8 = *(undefined4 **)(in_ECX[0x40] + 0x10);
        puVar10 = *(undefined4 **)(iVar4 + 0x10);
        for (uVar5 = uVar7 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
          *puVar10 = *puVar8;
          puVar8 = puVar8 + 1;
          puVar10 = puVar10 + 1;
        }
        for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
          *(undefined1 *)puVar10 = *(undefined1 *)puVar8;
          puVar8 = (undefined4 *)((int)puVar8 + 1);
          puVar10 = (undefined4 *)((int)puVar10 + 1);
        }
        puVar8 = local_f8;
        puVar10 = *(undefined4 **)(iVar4 + 8);
        for (uVar5 = uVar7 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
          *puVar10 = *puVar8;
          puVar8 = puVar8 + 1;
          puVar10 = puVar10 + 1;
        }
        for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
          *(undefined1 *)puVar10 = *(undefined1 *)puVar8;
          puVar8 = (undefined4 *)((int)puVar8 + 1);
          puVar10 = (undefined4 *)((int)puVar10 + 1);
        }
        puVar8 = local_20;
        puVar10 = (undefined4 *)(*(int *)(iVar4 + 8) + uVar7 * 4);
        for (uVar5 = uVar7 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
          *puVar10 = *puVar8;
          puVar8 = puVar8 + 1;
          puVar10 = puVar10 + 1;
        }
        for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
          *(undefined1 *)puVar10 = *(undefined1 *)puVar8;
          puVar8 = (undefined4 *)((int)puVar8 + 1);
          puVar10 = (undefined4 *)((int)puVar10 + 1);
        }
        local_c = 0;
        piVar9 = local_e8;
        piVar11 = (int *)(*(int *)(iVar4 + 8) + local_28 * 8);
        for (uVar7 = uVar7 & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
          *piVar11 = *piVar9;
          piVar9 = piVar9 + 1;
          piVar11 = piVar11 + 1;
        }
        for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
          *(char *)piVar11 = (char)*piVar9;
          piVar9 = (int *)((int)piVar9 + 1);
          piVar11 = (int *)((int)piVar11 + 1);
        }
        iVar6 = local_24[5];
        local_8 = *(int **)(iVar6 + **(int **)(iVar4 + 0x10) * 4);
        puVar2 = *(uint **)(iVar6 + **(int **)(iVar4 + 8) * 4);
        iVar6 = *(int *)(iVar6 + (*(int **)(iVar4 + 8))[local_28 * 2] * 4);
        uVar7 = local_8[1];
        if (((((uVar7 == puVar2[1]) && (local_8[3] == puVar2[3])) ||
             ((uVar7 == *(uint *)(iVar6 + 4) && (local_8[3] == *(int *)(iVar6 + 0xc))))) ||
            (uVar7 != local_24[0x22])) && ((*(byte *)((int)local_24 + 0x6f) & 2) == 0)) {
          local_c = 1;
        }
        iVar6 = (**(code **)(*local_24 + 0x20))(iVar4,0);
        if ((iVar6 == 0) &&
           ((((*(byte *)(*(int *)(piVar3[4] + local_8[1] * 4) + 4) & 0x20) == 0 && (local_c == 0))
            || ((*(byte *)((int)piVar3 + 0x6f) & 2) != 0)))) {
          if (param_1 == 0) {
            local_1c = *local_78[0];
            *local_78[0] = 0;
          }
          if ((((*(byte *)((int)piVar3 + 0x6f) & 2) != 0) &&
              ((*(byte *)((int)puVar2 + 0x3d) & 2) == 0)) &&
             (((*puVar2 & 4) == 0 || ((*puVar2 & 0x10) == 0)))) {
            FUN_1006c418(1);
            FUN_1008b13a(piVar3,*(undefined4 *)(piVar3[0x40] + 0x3c),0x125f,
                         "cannot match lerp because lerp factor is not _sat\'d");
            *local_78[0] = local_1c;
            return 1;
          }
          if (param_1 == 0) {
            uVar7 = 0;
            if (local_10 != 0) {
              do {
                ppiVar1 = local_78 + uVar7;
                uVar7 = uVar7 + 1;
                **ppiVar1 = 0;
              } while (uVar7 < local_10);
            }
            if (*(int *)(piVar3[6] + piVar3[0x3f] * 4) != 0) {
              FUN_1006c418(1);
            }
            *(int *)(piVar3[6] + piVar3[0x3f] * 4) = iVar4;
          }
          else {
            iVar4 = FUN_10085abe(iVar4);
            FUN_1006c418(1);
            if (iVar4 < 0) {
              return iVar4;
            }
            iVar4 = FUN_100853b0(piVar3[0x40]);
            if (iVar4 < 0) {
              return iVar4;
            }
          }
          return 0;
        }
        FUN_1006c418(1);
        uVar7 = local_28;
        in_ECX = local_24;
      }
      local_14 = local_14 + 1;
      local_18 = local_18 + 4;
      local_20 = local_20 + -4;
    } while (local_14 < 2);
  }
  return 1;
}


