// 100c85fc size=1668 FUN_100c85fc

int FUN_100c85fc(void)

{
  int *piVar1;
  int *piVar2;
  int in_ECX;
  int iVar3;
  uint uVar4;
  int iVar5;
  undefined2 *puVar6;
  undefined4 *puVar7;
  undefined4 local_70;
  undefined1 local_6c [4];
  undefined1 local_68 [4];
  uint local_64;
  undefined1 local_60 [4];
  int *local_5c;
  undefined1 local_58 [4];
  uint local_54;
  undefined1 local_50 [4];
  undefined1 local_4c [4];
  undefined1 local_48 [16];
  int local_38;
  int local_34;
  int local_30;
  uint local_2c;
  int *local_28;
  undefined4 *local_24;
  undefined4 *local_20;
  undefined4 *local_1c;
  undefined4 *local_18;
  undefined4 *local_14;
  int local_10;
  int *local_c;
  int *local_8;
  
  FUN_10084086(0x47554244);
  iVar5 = 0;
  puVar7 = &local_70;
  for (iVar3 = 10; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = 0;
    puVar7 = puVar7 + 1;
  }
  local_70 = 0x28;
  local_20 = (undefined4 *)0x0;
  local_18 = (undefined4 *)0x0;
  local_24 = (undefined4 *)0x0;
  local_1c = (undefined4 *)0x0;
  local_14 = (undefined4 *)0x0;
  local_8 = (int *)0x0;
  local_10 = FUN_100840db(&local_70,0x28,1,0);
  if (local_10 < 0) goto LAB_100c8c45;
  local_5c = *(int **)(in_ECX + 0x128);
  if (local_5c == (int *)0x0) goto LAB_100c8afc;
  local_20 = operator_new((int)local_5c << 2);
  piVar1 = local_5c;
  puVar7 = local_20;
  if (local_20 != (undefined4 *)0x0) {
    for (; piVar1 != (int *)0x0; piVar1 = (int *)((int)piVar1 + -1)) {
      *puVar7 = 0;
      puVar7 = puVar7 + 1;
    }
    local_18 = operator_new((int)local_5c << 3);
    if (local_18 != (undefined4 *)0x0) {
      local_34 = (int)local_5c << 3;
      puVar7 = local_18;
      for (iVar3 = ((uint)local_5c & 0x1fffffff) << 1; iVar3 != 0; iVar3 = iVar3 + -1) {
        *puVar7 = 0;
        puVar7 = puVar7 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(undefined1 *)puVar7 = 0;
        puVar7 = (undefined4 *)((int)puVar7 + 1);
      }
      local_14 = operator_new((int)local_5c << 4);
      if (local_14 != (undefined4 *)0x0) {
        puVar7 = local_14;
        for (iVar3 = ((uint)local_5c & 0xfffffff) << 2; iVar3 != 0; iVar3 = iVar3 + -1) {
          *puVar7 = 0;
          puVar7 = puVar7 + 1;
        }
        for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
          *(undefined1 *)puVar7 = 0;
          puVar7 = (undefined4 *)((int)puVar7 + 1);
        }
        local_c = (int *)0x0;
        if (local_5c != (int *)0x0) {
          puVar6 = (undefined2 *)((int)local_18 + 2);
          do {
            *puVar6 = 0xffff;
            puVar6[-1] = 0;
            local_2c = iVar5 + 8;
            *(undefined4 *)(puVar6 + 1) = *(undefined4 *)(*(int *)(in_ECX + 0x124) + 4 + iVar5);
            local_28 = (int *)0x4;
            do {
              iVar3 = *(int *)(local_2c + *(int *)(in_ECX + 0x124));
              if ((iVar3 != -1) &&
                 (iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4),
                 *(int **)(iVar3 + 0x74) = local_c, *(int *)(iVar3 + 0x60) != 0)) {
                local_14[(int)local_8] = *(undefined4 *)(local_2c + *(int *)(in_ECX + 0x124));
                local_8 = (int *)((int)local_8 + 1);
              }
              local_2c = local_2c + 4;
              local_28 = (int *)((int)local_28 + -1);
            } while (local_28 != (int *)0x0);
            iVar3 = *(int *)(iVar5 + *(int *)(in_ECX + 0x124));
            if (iVar3 != 0) {
              puVar6[-1] = *(undefined2 *)(iVar3 + 0x14);
              iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 0x124) + iVar5) + 0x10);
              if (iVar3 != 0) {
                iVar3 = FUN_100840db(iVar3,0xffffffff,7,&local_30);
                if (iVar3 < 0) goto LAB_100c8c45;
                local_2c = 0;
                if (local_64 != 0) {
                  do {
                    if (local_20[local_2c] == local_30) break;
                    local_2c = local_2c + 1;
                  } while (local_2c < local_64);
                }
                if (local_2c == local_64) {
                  local_20[local_64] = local_30;
                  local_64 = local_64 + 1;
                }
                *puVar6 = (short)local_2c;
              }
            }
            local_c = (int *)((int)local_c + 1);
            iVar5 = iVar5 + 0x18;
            puVar6 = puVar6 + 4;
          } while (local_c < local_5c);
        }
        if (((local_64 != 0) &&
            (local_10 = FUN_100840db(local_20,local_64 << 2,1,local_60), local_10 < 0)) ||
           (local_10 = FUN_100840db(local_18,local_34,1,local_58), puVar7 = local_14, local_10 < 0))
        goto LAB_100c8c45;
        if (local_8 != (int *)0x0) {
          FUN_10086920(FUN_100b969a,local_14,local_8,in_ECX);
          piVar1 = (int *)0x1;
          local_54 = 1;
          if ((int *)0x1 < local_8) {
            do {
              if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + puVar7[(int)((int)piVar1 + -1)] * 4) +
                          0x60) !=
                  *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + puVar7[(int)piVar1] * 4) + 0x60)) {
                local_54 = local_54 + 1;
              }
              piVar1 = (int *)((int)piVar1 + 1);
            } while (piVar1 < local_8);
          }
          local_24 = operator_new(local_54 * 0x14);
          if (local_24 == (undefined4 *)0x0) goto LAB_100c8c25;
          local_38 = local_54 * 0x14;
          puVar7 = local_24;
          for (uVar4 = local_54 * 5 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
            *puVar7 = 0;
            puVar7 = puVar7 + 1;
          }
          for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
            *(undefined1 *)puVar7 = 0;
            puVar7 = (undefined4 *)((int)puVar7 + 1);
          }
          local_c = (int *)0x0;
          local_2c = 0;
          if (local_54 != 0) {
            piVar1 = local_24 + 3;
            do {
              local_28 = local_14 + (int)local_c;
              iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_28 * 4) + 0x60);
              local_30 = iVar3;
              if ((((*(int *)(iVar3 + 0x20) != 0) &&
                   (local_10 = FUN_100840db(*(int *)(iVar3 + 0x20),0xffffffff,7,piVar1 + -3),
                   local_10 < 0)) ||
                  ((iVar5 = *(int *)(*(int *)(iVar3 + 0x14) + 0x18), iVar5 != 0 &&
                   (local_10 = FUN_100840db(iVar5,0xffffffff,7,piVar1 + -2), local_10 < 0)))) ||
                 (((*(int *)(iVar3 + 0x10) == 1 || (*(int *)(iVar3 + 0x10) == 2)) &&
                  (local_10 = FUN_100c3e06(local_48,*(undefined4 *)(*(int *)(iVar3 + 0x18) + 0x20),1
                                           ,*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                              *local_28 * 4) + 0x3c) & 0xe00000,
                                           piVar1 + -1), local_10 < 0)))) goto LAB_100c8c45;
              local_28 = local_c;
              while (local_c < local_8) {
                iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + local_14[(int)local_c] * 4);
                if (iVar3 != *(int *)(iVar5 + 0x60)) break;
                local_34 = *(int *)(iVar5 + 0x74);
                while (((local_c < local_8 &&
                        (iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + local_14[(int)local_c] * 4),
                        iVar3 == *(int *)(iVar5 + 0x60))) && (local_34 == *(int *)(iVar5 + 0x74))))
                {
                  local_c = (int *)((int)local_c + 1);
                }
                *piVar1 = *piVar1 + 1;
              }
              local_1c = operator_new(*piVar1 * 0xc);
              if (local_1c == (undefined4 *)0x0) goto LAB_100c8c25;
              local_10 = *piVar1 * 0xc;
              puVar7 = local_1c;
              for (uVar4 = *piVar1 * 3 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
                *puVar7 = 0;
                puVar7 = puVar7 + 1;
              }
              for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
                *(undefined1 *)puVar7 = 0;
                puVar7 = (undefined4 *)((int)puVar7 + 1);
              }
              *piVar1 = 0;
              local_c = local_28;
              while ((local_c < local_8 &&
                     (iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_14[(int)local_c] * 4),
                     local_30 == *(int *)(iVar3 + 0x60)))) {
                local_34 = *(int *)(iVar3 + 0x74);
                local_1c[*piVar1 * 3] = local_34;
                iVar3 = *piVar1;
                local_1c[iVar3 * 3 + 1] = 0xffffffff;
                (local_1c + iVar3 * 3 + 1)[1] = 0xffffffff;
                for (; local_c < local_8; local_c = (int *)((int)local_c + 1)) {
                  local_28 = local_14 + (int)local_c;
                  iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *local_28 * 4);
                  if ((local_30 != *(int *)(iVar3 + 0x60)) || (local_34 != *(int *)(iVar3 + 0x74)))
                  break;
                  iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *local_28 * 4);
                  *(undefined2 *)((int)local_1c + (*(int *)(iVar3 + 0x10) + *piVar1 * 6) * 2 + 4) =
                       *(undefined2 *)(iVar3 + 100);
                }
                *piVar1 = *piVar1 + 1;
              }
              local_10 = FUN_100840db(local_1c,local_10,0xb,piVar1 + 1);
              if (local_10 < 0) goto LAB_100c8c45;
              local_1c = (undefined4 *)0x0;
              local_2c = local_2c + 1;
              piVar1 = piVar1 + 5;
            } while (local_2c < local_54);
          }
          local_10 = FUN_100840db(local_24,local_38,1,local_50);
          if (local_10 < 0) goto LAB_100c8c45;
        }
LAB_100c8afc:
        if ((((*(int *)(in_ECX + 0xd0) != 0) &&
             (local_10 = FUN_100840db(*(int *)(in_ECX + 0xd0),0xffffffff,7,local_4c), local_10 < 0))
            || ((*(int *)(in_ECX + 0x130) != 0 &&
                ((iVar3 = FUN_100840db(*(int *)(in_ECX + 0x130),*(undefined4 *)(in_ECX + 0x134),5,
                                       local_68), iVar3 < 0 ||
                 (iVar3 = FUN_100840db(&DAT_1019166e,1,5,0), iVar3 < 0)))))) ||
           (iVar3 = FUN_100840db("Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904",0xffffffff,5,
                                 local_6c), iVar3 < 0)) goto LAB_100c8c45;
        uVar4 = FUN_10084214();
        if (uVar4 < 0x8001) {
          local_10 = FUN_100c40ff(uVar4);
          if (local_10 < 0) goto LAB_100c8c45;
          _memmove((void *)(*(int *)(in_ECX + 0x10c) + 4 + uVar4 * 4),
                   (void *)(*(int *)(in_ECX + 0x10c) + 4),*(int *)(in_ECX + 0x110) * 4 - 4);
          piVar1 = (int *)0x0;
          if (local_5c != (int *)0x0) {
            piVar2 = local_18 + 1;
            do {
              *piVar2 = *piVar2 + (*(int *)(in_ECX + 0x120) + uVar4) * 4;
              piVar1 = (int *)((int)piVar1 + 1);
              piVar2 = piVar2 + 2;
            } while (piVar1 < local_5c);
          }
          local_10 = FUN_10084220(*(int *)(in_ECX + 0x10c) + 4,uVar4);
          if (local_10 < 0) goto LAB_100c8c45;
          *(int *)(in_ECX + 0x110) = *(int *)(in_ECX + 0x110) + uVar4;
          *(int *)(in_ECX + 0x120) = *(int *)(in_ECX + 0x120) + uVar4;
          *(undefined4 *)(in_ECX + 0x11c) = *(undefined4 *)(in_ECX + 0x110);
        }
        else {
          FUN_1008b13a();
        }
        local_10 = 0;
        goto LAB_100c8c45;
      }
    }
  }
LAB_100c8c25:
  local_10 = -0x7ff8fff2;
LAB_100c8c45:
  _free(local_20);
  _free(local_18);
  _free(local_24);
  _free(local_1c);
  _free(local_14);
  FUN_100840a3();
  return local_10;
}


