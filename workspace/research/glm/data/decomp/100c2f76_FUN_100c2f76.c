// 100c2f76 size=2181 FUN_100c2f76

int * FUN_100c2f76(int param_1,int param_2,uint *param_3,int param_4,int param_5,int *param_6,
                  uint param_7,int *param_8,int param_9,undefined4 param_10,undefined4 param_11)

{
  uint *puVar1;
  int iVar2;
  int *piVar3;
  uint uVar4;
  int in_ECX;
  uint uVar5;
  int extraout_ECX;
  int iVar6;
  undefined4 *puVar7;
  int *piVar8;
  undefined4 *puVar9;
  undefined8 uVar10;
  undefined4 uVar11;
  char *pcVar12;
  undefined4 local_83c [128];
  int local_63c [128];
  undefined4 local_43c [128];
  int local_23c [128];
  uint local_3c;
  uint local_38;
  int *local_34;
  uint local_30;
  uint local_2c;
  int local_28;
  int *local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  int *local_14;
  int *local_10;
  uint local_c;
  int *local_8;
  
  uVar4 = *param_3;
  local_28 = in_ECX;
joined_r0x100c2f94:
  local_c = uVar4;
  if (param_7 <= local_c) {
    return (int *)0x0;
  }
  piVar3 = (int *)0x0;
  puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
  local_18 = *puVar1 & 0xfff00000;
  local_14 = (int *)(*puVar1 & 0xfffff);
  if (puVar1[3] == 0) {
    uVar10 = 0x1011a1f8000012df;
    goto LAB_100c37a8;
  }
  local_10 = *(int **)(*(int *)(in_ECX + 0x14) + *(int *)puVar1[4] * 4);
  if (local_10[5] != param_1) {
    if (local_18 != 0x20700000) {
LAB_100c37ea:
      *param_3 = local_c;
      return (int *)0x0;
    }
    if (param_9 != 0) goto LAB_100c32ad;
    piVar8 = (int *)puVar1[2];
    local_18 = *(uint *)(*(int *)(in_ECX + 0x14) + *piVar8 * 4);
    if (*(int *)(local_18 + 0x14) !=
        *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + piVar8[(int)local_14] * 4) + 0x14)) {
      pcVar12 = "internal error: if block with non matching predicates found";
LAB_100c3797:
      uVar10 = CONCAT44(pcVar12,0x12e0);
      goto LAB_100c37a8;
    }
    if (((param_4 == 0) || (param_5 == 0)) || (param_6 == (int *)0x0)) {
      pcVar12 = "internal error: unexpected endif found";
LAB_100c376d:
      uVar10 = CONCAT44(pcVar12,0x12e1);
LAB_100c37a8:
      FUN_1008b0b5(in_ECX,puVar1[0xf],uVar10);
      return (int *)0x80004005;
    }
    if (*(int *)(local_18 + 0x14) != param_1) goto LAB_100c37ea;
    if (param_8 != (int *)0x0) {
      local_20 = 1;
      local_24 = (int *)0x0;
      if (*(int *)(local_18 + 0x18) != param_2) {
        local_24 = local_14;
      }
      if (local_14 != (int *)0x0) {
        local_10 = (int *)puVar1[4];
        local_8 = piVar8 + (int)local_24;
        local_34 = local_14;
        do {
          iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *local_10 * 4);
          iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *local_8 * 4);
          if (((*(int *)(iVar2 + 0xc) != *(int *)(iVar6 + 0xc)) ||
              (*(int *)(iVar2 + 0x10) != *(int *)(iVar6 + 0x10))) ||
             ((*(int *)(iVar2 + 8) != *(int *)(iVar6 + 8) ||
              ((*(int *)(iVar2 + 4) != *(int *)(iVar6 + 4) ||
               (*(int *)(iVar2 + 0x3c) != *(int *)(iVar6 + 0x3c))))))) {
            local_20 = 0;
          }
          local_10 = local_10 + 1;
          local_8 = local_8 + 1;
          local_34 = (int *)((int)local_34 + -1);
        } while (local_34 != (int *)0x0);
      }
      if (0x7f < (uint)(*param_6 + (int)local_14)) {
        uVar10 = 0x1011a14800001194;
        goto LAB_100c37a8;
      }
      if (local_20 == 0) {
        iVar2 = FUN_10085814();
        if (iVar2 == 0) {
          local_8 = (int *)0x0;
        }
        else {
          local_8 = (int *)FUN_10085379();
        }
        if (local_8 == (int *)0x0) {
          return (int *)0x8007000e;
        }
        piVar3 = (int *)FUN_1008585f((uint)local_14 & 0xfffff | 0x10000000,local_14,local_14,0);
        if ((((int)piVar3 < 0) || (piVar3 = (int *)FUN_100853b0(), (int)piVar3 < 0)) ||
           (piVar3 = (int *)FUN_10086026(), (int)piVar3 < 0)) {
LAB_100c37c4:
          FUN_1006c418();
          return piVar3;
        }
        if (*(int *)(local_18 + 0x18) == param_2) {
          puVar7 = (undefined4 *)puVar1[2];
          puVar9 = (undefined4 *)local_8[2];
          for (uVar4 = (uint)local_14 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
            *puVar9 = *puVar7;
            puVar7 = puVar7 + 1;
            puVar9 = puVar9 + 1;
          }
        }
        else {
          puVar7 = (undefined4 *)puVar1[2] + (int)local_14;
          puVar9 = (undefined4 *)local_8[2];
          for (uVar4 = (uint)local_14 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
            *puVar9 = *puVar7;
            puVar7 = puVar7 + 1;
            puVar9 = puVar9 + 1;
          }
        }
        local_10 = (int *)0x0;
        for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
          *(undefined1 *)puVar9 = *(undefined1 *)puVar7;
          puVar7 = (undefined4 *)((int)puVar7 + 1);
          puVar9 = (undefined4 *)((int)puVar9 + 1);
        }
        if (local_14 != (int *)0x0) {
          local_18 = (int)local_14 << 2;
          do {
            uVar11 = FUN_10086139(*(undefined4 *)(local_28 + 0x88),0,0,0);
            *(undefined4 *)(param_4 + (*param_6 + (int)local_10) * 4) = uVar11;
            iVar2 = *(int *)(param_4 + (*param_6 + (int)local_10) * 4);
            if (iVar2 == -1) {
              piVar3 = (int *)0x8007000e;
              goto LAB_100c37c4;
            }
            local_34 = *(int **)(*(int *)(local_28 + 0x14) + iVar2 * 4);
            iVar6 = (int)local_10 * 4;
            local_20 = *(uint *)(*(int *)(local_28 + 0x14) + *(int *)(iVar6 + puVar1[4]) * 4);
            iVar2 = FUN_10085c65();
            if ((iVar2 < 0) || (iVar2 = FUN_10085d21(), iVar2 < 0)) {
              FUN_1006c418();
              return (int *)0x8007000e;
            }
            *(undefined4 *)(iVar6 + local_8[4]) =
                 *(undefined4 *)(param_4 + (*param_6 + (int)local_10) * 4);
            *(undefined4 *)(param_5 + (*param_6 + (int)local_10) * 4) =
                 *(undefined4 *)(iVar6 + puVar1[4]);
            iVar2 = *(int *)(puVar1[2] + iVar6);
            if (*(int *)(*(int *)(*(int *)(local_28 + 0x14) + iVar2 * 4) + 0x18) == param_2) {
              *(int *)(iVar6 + local_8[2]) = iVar2;
            }
            else {
              *(undefined4 *)(iVar6 + local_8[2]) = *(undefined4 *)(puVar1[2] + local_18);
            }
            local_10 = (int *)((int)local_10 + 1);
            local_18 = local_18 + 4;
          } while (local_10 < local_14);
        }
      }
      else if (local_14 != (int *)0x0) {
        local_24 = (int *)((int)local_24 << 2);
        do {
          puVar7 = (undefined4 *)((int)local_24 + puVar1[2]);
          local_24 = local_24 + 1;
          *(undefined4 *)(param_4 + (*param_6 + (int)piVar3) * 4) = *puVar7;
          iVar2 = (int)piVar3 * 4;
          iVar6 = *param_6 + (int)piVar3;
          piVar3 = (int *)((int)piVar3 + 1);
          *(undefined4 *)(param_5 + iVar6 * 4) = *(undefined4 *)(puVar1[4] + iVar2);
        } while (piVar3 < local_14);
      }
      *param_6 = *param_6 + (int)local_14;
      uVar4 = local_c + 1;
      in_ECX = local_28;
      goto joined_r0x100c2f94;
    }
LAB_100c32ad:
    uVar4 = local_c + 1;
    goto joined_r0x100c2f94;
  }
  if ((param_9 != 0) && (local_18 != 0x11200000)) goto LAB_100c32ad;
  local_8 = param_8;
  if ((param_8 != (int *)0x0) && (local_10[6] != param_2)) {
    local_8 = (int *)0x0;
  }
  iVar2 = FUN_100c2a22();
  if (iVar2 != 0) {
    if (local_14 != (int *)0x1) {
      pcVar12 = "internal error: IF with size greater then 1 found";
      goto LAB_100c3797;
    }
    if (local_8 != (int *)0x0) {
      iVar2 = FUN_100c2a8e(puVar1,1);
      if (iVar2 == 0) {
        return (int *)0x8007000e;
      }
      piVar3 = (int *)FUN_10086026();
      if ((int)piVar3 < 0) {
        return piVar3;
      }
    }
    local_30 = local_c + 1;
    local_38 = 0;
    local_1c = 0;
    local_c = local_30;
    piVar3 = (int *)FUN_100c2f76(*(undefined4 *)puVar1[4],1,&local_30,local_43c,local_23c,&local_1c,
                                 param_7,local_8,0,0,0);
    if ((int)piVar3 < 0) {
      return piVar3;
    }
    if (local_8 != (int *)0x0) {
      iVar2 = FUN_100c2a8e(puVar1,0);
      if (iVar2 == 0) {
        return (int *)0x8007000e;
      }
      piVar3 = (int *)FUN_10086026();
      if ((int)piVar3 < 0) {
        return piVar3;
      }
    }
    local_30 = local_c;
    piVar3 = (int *)FUN_100c2f76(*(undefined4 *)puVar1[4],0,&local_30,local_83c,local_63c,&local_38,
                                 param_7,local_8,0,0,0);
    if ((int)piVar3 < 0) {
      return piVar3;
    }
    if (local_8 != (int *)0x0) {
      local_18 = 1;
      if (local_1c != local_38) {
LAB_100c3768:
        pcVar12 = "internal error: endif mismatch";
        goto LAB_100c376d;
      }
      uVar4 = 0;
      if (local_38 != 0) {
        do {
          if (local_63c[uVar4] != local_23c[uVar4]) {
            local_18 = 0;
          }
          uVar4 = uVar4 + 1;
        } while (uVar4 < local_38);
        if (local_18 == 0) goto LAB_100c3768;
      }
      iVar2 = FUN_10085814();
      if (iVar2 == 0) {
        uVar4 = 0;
      }
      else {
        uVar4 = FUN_10085379();
      }
      if (uVar4 == 0) {
        return (int *)0x8007000e;
      }
      local_18 = uVar4;
      local_8 = (int *)FUN_1008585f(local_38 & 0xfffff | 0x73400000,local_38 * 2,local_38,0);
      if ((int)local_8 < 0) {
LAB_100c3778:
        FUN_1006c418();
        return local_8;
      }
      piVar3 = (int *)FUN_100853b0();
      if ((int)piVar3 < 0) {
LAB_100c3787:
        FUN_1006c418();
        return piVar3;
      }
      piVar3 = local_63c;
      piVar8 = *(int **)(uVar4 + 0x10);
      for (uVar5 = local_1c; uVar5 != 0; uVar5 = uVar5 - 1) {
        *piVar8 = *piVar3;
        piVar3 = piVar3 + 1;
        piVar8 = piVar8 + 1;
      }
      puVar7 = local_43c;
      puVar9 = *(undefined4 **)(uVar4 + 8);
      for (uVar5 = local_1c; uVar5 != 0; uVar5 = uVar5 - 1) {
        *puVar9 = *puVar7;
        puVar7 = puVar7 + 1;
        puVar9 = puVar9 + 1;
      }
      puVar7 = local_83c;
      puVar9 = (undefined4 *)(*(int *)(uVar4 + 8) + local_1c * 4);
      for (uVar5 = local_1c & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
        *puVar9 = *puVar7;
        puVar7 = puVar7 + 1;
        puVar9 = puVar9 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(undefined1 *)puVar9 = *(undefined1 *)puVar7;
        puVar7 = (undefined4 *)((int)puVar7 + 1);
        puVar9 = (undefined4 *)((int)puVar9 + 1);
      }
      piVar3 = (int *)FUN_10086026();
      in_ECX = local_28;
      if ((int)piVar3 < 0) {
        return piVar3;
      }
    }
    local_10[1] = *(int *)(in_ECX + 0x74);
    uVar4 = local_30;
    goto joined_r0x100c2f94;
  }
  uVar10 = FUN_100c2a58();
  if ((int)uVar10 == 0) {
    if ((extraout_ECX != 0x11100000) && (extraout_ECX != 0x74100000)) {
      if (extraout_ECX == 0x11200000) {
        if ((local_8 != (int *)0x0) && (param_9 != 0)) {
          piVar3 = (int *)0x0;
          if (local_14 != (int *)0x0) {
            do {
              iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + (int)piVar3 * 4) * 4);
              *(undefined4 *)(iVar2 + 0x34) = param_11;
              piVar3 = (int *)((int)piVar3 + 1);
              *(undefined4 *)(iVar2 + 0x30) = param_10;
            } while (piVar3 < local_14);
          }
LAB_100c329d:
          piVar3 = (int *)FUN_10086292();
          if ((int)piVar3 < 0) {
            return piVar3;
          }
        }
      }
      else if ((param_8 != (int *)0x0) &&
              (*(int *)((int)((ulonglong)uVar10 >> 0x20) + 0x18) == param_2)) goto LAB_100c329d;
      goto LAB_100c32ad;
    }
    local_2c = local_c + 1;
    local_1c = 0;
    local_c = local_2c;
    piVar3 = (int *)FUN_100c2f76(*(undefined4 *)puVar1[4],1,&local_2c,local_43c,local_23c,&local_1c,
                                 param_7,local_8,1,param_1,param_2);
    if ((int)piVar3 < 0) {
      return piVar3;
    }
    if (local_8 != (int *)0x0) {
      if (local_18 == 0x11100000) {
        local_20 = (uint)local_14 & 0xfffff;
        *puVar1 = local_20 | 0x74200000;
        piVar3 = (int *)FUN_10086292();
        if ((int)piVar3 < 0) {
          return piVar3;
        }
        *puVar1 = local_20 | 0x11100000;
      }
      else {
        piVar3 = (int *)FUN_10086292();
        if ((int)piVar3 < 0) {
          return piVar3;
        }
      }
      local_10[1] = *(int *)(in_ECX + 0x74);
    }
    local_2c = local_c;
    piVar3 = (int *)FUN_100c2f76(*(undefined4 *)puVar1[4],1,&local_2c,local_43c,local_23c,&local_1c,
                                 param_7,local_8,0,0,0);
    if ((int)piVar3 < 0) {
      return piVar3;
    }
    uVar4 = local_2c;
    if (local_8 == (int *)0x0) goto joined_r0x100c2f94;
    local_20 = FUN_10086139(*(undefined4 *)(in_ECX + 0xa8),0,0,0);
    if (local_20 == 0xffffffff) {
      return (int *)0x8007000e;
    }
    iVar2 = FUN_10085814();
    if (iVar2 == 0) {
      local_10 = (int *)0x0;
    }
    else {
      local_10 = (int *)FUN_10085379();
    }
    if (local_10 == (int *)0x0) {
      return (int *)0x8007000e;
    }
    if (local_18 == 0x11100000) {
      uVar11 = 0x74b00001;
    }
    else {
      uVar11 = 0x74a00001;
    }
    local_8 = (int *)FUN_1008585f(uVar11,0,1,0);
    if ((int)local_8 < 0) goto LAB_100c3778;
    piVar3 = (int *)FUN_100853b0();
    if ((int)piVar3 < 0) goto LAB_100c3787;
    *(uint *)local_10[4] = local_20;
    piVar3 = (int *)FUN_10086026();
    uVar4 = local_2c;
  }
  else {
    local_3c = local_c + 1;
    local_1c = 0;
    if (local_8 != (int *)0x0) {
      piVar3 = (int *)FUN_10086292();
      if ((int)piVar3 < 0) {
        return piVar3;
      }
      local_10[1] = *(int *)(in_ECX + 0x74);
    }
    piVar3 = (int *)FUN_100c2f76(*(undefined4 *)puVar1[4],1,&local_3c,local_43c,local_23c,&local_1c,
                                 param_7,local_8,0,0,0);
    uVar4 = local_3c;
  }
  if ((int)piVar3 < 0) {
    return piVar3;
  }
  goto joined_r0x100c2f94;
}


