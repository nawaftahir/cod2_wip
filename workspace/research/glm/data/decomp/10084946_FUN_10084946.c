// 10084946 size=1307 FUN_10084946

undefined4 * FUN_10084946(int param_1,undefined4 *param_2,undefined4 *param_3)

{
  char *pcVar1;
  int *piVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  int *piVar9;
  char *pcVar10;
  int iVar11;
  undefined4 *puVar12;
  undefined4 *puVar13;
  uint *puVar14;
  uint uVar15;
  uint uVar16;
  int iVar17;
  uint *puVar18;
  uint *puVar19;
  uint uVar20;
  uint local_30;
  int local_2c;
  int local_1c;
  int local_18;
  undefined4 *local_14;
  uint local_10;
  undefined4 *local_c;
  int *local_8;
  
  FUN_10099399();
  local_1c = 0;
  FUN_1006c39d();
  local_8 = (int *)0x0;
  local_10 = 0;
  local_30 = 0;
  local_14 = (undefined4 *)0x0;
  local_c = (undefined4 *)FUN_100a482d(param_1,param_2,&local_1c);
  if (-1 < (int)local_c) {
    iVar17 = *(int *)(local_1c + 0x1c);
    local_18 = 2;
    if (iVar17 != 0) {
      do {
        iVar11 = *(int *)(iVar17 + 8);
        if (((iVar11 != 0) && (*(int *)(iVar11 + 4) == 6)) && (*(int *)(iVar11 + 0x10) == 1)) {
          iVar4 = *(int *)(iVar11 + 0x14);
          iVar5 = *(int *)(*(int *)(iVar11 + 0x18) + 0x20);
          if ((((*(int *)(iVar5 + 0x10) == 3) &&
               ((*(int *)(iVar5 + 0x14) == 0x1c || (*(int *)(iVar5 + 0x14) == 0x1b)))) &&
              (*(int *)(iVar5 + 0x18) == 1)) &&
             ((*(int *)(iVar5 + 0x1c) == 1 &&
              (iVar11 = *(int *)(*(int *)(iVar11 + 0x18) + 0x28), iVar11 != 0)))) {
            do {
              iVar5 = *(int *)(iVar11 + 4);
              if (iVar5 == 0xe) break;
              if (iVar5 == 0xd) {
                iVar11 = *(int *)(iVar11 + 0x20);
              }
              else {
                if (iVar5 != 1) break;
                iVar11 = *(int *)(iVar11 + 8);
              }
            } while (iVar11 != 0);
            if (*(int *)(iVar11 + 0x10) == 4) {
              local_2c = *(int *)(iVar11 + 0x18);
              uVar6 = *(undefined4 *)(*(int *)(local_2c + 0x20) + 0x18);
              uVar7 = *(undefined4 *)(*(int *)(local_2c + 0x24) + 0x20);
              uVar8 = *(undefined4 *)(*(int *)(local_2c + 0x24) + 0x24);
              if (local_10 == local_30) {
                local_30 = local_30 * 2 + 2;
                local_c = operator_new(local_30 * 4);
                if (local_c == (undefined4 *)0x0) {
                  local_c = (undefined4 *)0x8007000e;
                  goto LAB_10084e05;
                }
                uVar20 = local_10;
                puVar12 = local_14;
                puVar13 = local_c;
                if (local_10 != 0) {
                  for (; uVar20 != 0; uVar20 = uVar20 - 1) {
                    *puVar13 = *puVar12;
                    puVar12 = puVar12 + 1;
                    puVar13 = puVar13 + 1;
                  }
                }
                _free(local_14);
                local_14 = local_c;
              }
              puVar12 = local_14 + local_10;
              local_c = (undefined4 *)
                        FUN_1007d4d4(param_1,local_1c,uVar7,uVar8,1,uVar6,(uint)param_2 | 0x102,
                                     puVar12,0);
              if ((int)local_c < 0) {
                FUN_10067c3e(param_1 + 0x18,local_2c + 0x30,0xb57,
                             "There was an error compiling the fragment \'%s\'",
                             *(undefined4 *)(iVar4 + 0x18));
                goto LAB_10084e05;
              }
              local_8 = (int *)*puVar12;
              local_10 = local_10 + 1;
              (**(code **)(*local_8 + 4))(local_8);
            }
            else {
              if (*(int *)(iVar11 + 0x10) != 5) {
                FUN_10067c3e(param_1 + 0x18,local_2c + 0x30,0xb58,
                             "Internal error compiling the fragment \'%s\'",
                             *(undefined4 *)(iVar4 + 0x18));
                goto LAB_10084b8e;
              }
              local_c = (undefined4 *)FUN_10081e27(*(undefined4 *)(iVar11 + 0x1c),&local_8);
              if ((int)local_c < 0) goto LAB_10084e05;
              uVar20 = *(uint *)(iVar11 + 0x1c);
              puVar12 = *(undefined4 **)(iVar11 + 0x18);
              puVar13 = (undefined4 *)(**(code **)(*local_8 + 0xc))(local_8);
              for (uVar15 = uVar20 >> 2; uVar15 != 0; uVar15 = uVar15 - 1) {
                *puVar13 = *puVar12;
                puVar12 = puVar12 + 1;
                puVar13 = puVar13 + 1;
              }
              for (uVar20 = uVar20 & 3; uVar20 != 0; uVar20 = uVar20 - 1) {
                *(undefined1 *)puVar13 = *(undefined1 *)puVar12;
                puVar12 = (undefined4 *)((int)puVar12 + 1);
                puVar13 = (undefined4 *)((int)puVar13 + 1);
              }
            }
            pcVar10 = *(char **)(iVar4 + 0x18);
            pcVar1 = pcVar10 + 1;
            do {
              cVar3 = *pcVar10;
              pcVar10 = pcVar10 + 1;
            } while (cVar3 != '\0');
            iVar11 = (**(code **)(*local_8 + 0x10))(local_8);
            local_18 = ((uint)(pcVar10 + (4 - (int)pcVar1)) >> 2) + local_18 + 4 +
                       (iVar11 + 3U >> 2);
            (**(code **)(*local_8 + 8))(local_8);
            local_8 = (int *)0x0;
          }
        }
        iVar17 = *(int *)(iVar17 + 0xc);
      } while (iVar17 != 0);
      if (local_18 != 2) {
        local_c = (undefined4 *)FUN_10081e27(local_18 << 2,param_3);
        if (-1 < (int)local_c) {
          puVar12 = (undefined4 *)(**(code **)(*(int *)*param_3 + 0xc))((int *)*param_3);
          *puVar12 = 0x7ffe0000;
          iVar17 = *(int *)(local_1c + 0x1c);
          puVar18 = puVar12 + 1;
          if (iVar17 != 0) {
            param_2 = local_14;
            do {
              iVar11 = *(int *)(iVar17 + 8);
              if (((iVar11 != 0) && (*(int *)(iVar11 + 4) == 6)) && (*(int *)(iVar11 + 0x10) == 1))
              {
                iVar4 = *(int *)(iVar11 + 0x14);
                iVar11 = *(int *)(iVar11 + 0x18);
                iVar5 = *(int *)(iVar11 + 0x20);
                if (((*(int *)(iVar5 + 0x10) == 3) &&
                    ((*(int *)(iVar5 + 0x14) == 0x1c || (*(int *)(iVar5 + 0x14) == 0x1b)))) &&
                   ((*(int *)(iVar5 + 0x18) == 1 &&
                    ((*(int *)(iVar5 + 0x1c) == 1 &&
                     ((*(int *)(iVar11 + 0x24) != 0 || (*(int *)(iVar11 + 0x28) != 0)))))))) {
                  iVar11 = *(int *)(iVar11 + 0x28);
                  while ((iVar11 != 0 && (iVar5 = *(int *)(iVar11 + 4), iVar5 != 0xe))) {
                    if (iVar5 == 0xd) {
                      iVar11 = *(int *)(iVar11 + 0x20);
                    }
                    else {
                      if (iVar5 != 1) break;
                      iVar11 = *(int *)(iVar11 + 8);
                    }
                  }
                  if (*(int *)(iVar11 + 0x10) == 4) {
                    local_8 = (int *)*param_2;
                    *param_2 = 0;
                    param_2 = param_2 + 1;
                  }
                  else {
                    local_c = (undefined4 *)FUN_10081e27(*(undefined4 *)(iVar11 + 0x1c),&local_8);
                    if ((int)local_c < 0) goto LAB_10084e05;
                    uVar20 = *(uint *)(iVar11 + 0x1c);
                    puVar12 = *(undefined4 **)(iVar11 + 0x18);
                    puVar13 = (undefined4 *)(**(code **)(*local_8 + 0xc))(local_8);
                    for (uVar15 = uVar20 >> 2; uVar15 != 0; uVar15 = uVar15 - 1) {
                      *puVar13 = *puVar12;
                      puVar12 = puVar12 + 1;
                      puVar13 = puVar13 + 1;
                    }
                    for (uVar20 = uVar20 & 3; uVar20 != 0; uVar20 = uVar20 - 1) {
                      *(undefined1 *)puVar13 = *(undefined1 *)puVar12;
                      puVar12 = (undefined4 *)((int)puVar12 + 1);
                      puVar13 = (undefined4 *)((int)puVar13 + 1);
                    }
                  }
                  pcVar10 = *(char **)(iVar4 + 0x18);
                  pcVar1 = pcVar10 + 1;
                  do {
                    cVar3 = *pcVar10;
                    pcVar10 = pcVar10 + 1;
                  } while (cVar3 != '\0');
                  iVar11 = (**(code **)(*local_8 + 0x10))(local_8);
                  *puVar18 = ((iVar11 + 3) * 0x4000 & 0xffff0000U) + 0x30000 +
                             ((uint)(pcVar10 + (4 - (int)pcVar1)) & 0x3fffc) * 0x4000 & 0x7fff0000 |
                             0xfffe;
                  puVar18[1] = 0x47415246;
                  puVar18[2] = 8;
                  uVar20 = (uint)(pcVar10 + (4 - (int)pcVar1)) >> 2;
                  puVar18[3] = uVar20 * 4 + 8;
                  puVar18 = puVar18 + 4;
                  puVar14 = *(uint **)(iVar4 + 0x18);
                  puVar19 = puVar18;
                  for (uVar15 = (uint)(pcVar10 + (1 - (int)pcVar1)) >> 2; uVar15 != 0;
                      uVar15 = uVar15 - 1) {
                    *puVar19 = *puVar14;
                    puVar14 = puVar14 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (uVar15 = (uint)(pcVar10 + (1 - (int)pcVar1)) & 3; uVar15 != 0;
                      uVar15 = uVar15 - 1) {
                    *(char *)puVar19 = (char)*puVar14;
                    puVar14 = (uint *)((int)puVar14 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  uVar15 = (**(code **)(*local_8 + 0x10))(local_8);
                  puVar14 = (uint *)(**(code **)(*local_8 + 0xc))(local_8);
                  puVar19 = puVar18 + uVar20;
                  for (uVar16 = uVar15 >> 2; uVar16 != 0; uVar16 = uVar16 - 1) {
                    *puVar19 = *puVar14;
                    puVar14 = puVar14 + 1;
                    puVar19 = puVar19 + 1;
                  }
                  for (uVar15 = uVar15 & 3; uVar15 != 0; uVar15 = uVar15 - 1) {
                    *(char *)puVar19 = (char)*puVar14;
                    puVar14 = (uint *)((int)puVar14 + 1);
                    puVar19 = (uint *)((int)puVar19 + 1);
                  }
                  iVar11 = (**(code **)(*local_8 + 0x10))(local_8);
                  puVar18 = (uint *)((int)(puVar18 + uVar20) + (iVar11 + 3U & 0xfffffffc));
                  (**(code **)(*local_8 + 8))(local_8);
                  local_8 = (int *)0x0;
                }
              }
              iVar17 = *(int *)(iVar17 + 0xc);
            } while (iVar17 != 0);
          }
          *puVar18 = 0xffff;
        }
        goto LAB_10084e05;
      }
    }
LAB_10084b8e:
    local_c = (undefined4 *)0x80004005;
  }
LAB_10084e05:
  uVar20 = 0;
  if (local_10 != 0) {
    do {
      piVar2 = local_14 + uVar20;
      piVar9 = (int *)*piVar2;
      if (piVar9 != (int *)0x0) {
        (**(code **)(*piVar9 + 8))(piVar9);
        *piVar2 = 0;
      }
      uVar20 = uVar20 + 1;
    } while (uVar20 < local_10);
  }
  if (local_8 != (int *)0x0) {
    (**(code **)(*local_8 + 8))(local_8);
    local_8 = (int *)0x0;
  }
  _free(local_14);
  FUN_1006ddb3();
  FUN_1009aae7();
  return local_c;
}


