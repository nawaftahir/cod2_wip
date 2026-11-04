// 100cc228 size=1129 FUN_100cc228

int FUN_100cc228(int param_1)

{
  void *pvVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  uint uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  undefined4 *puVar8;
  uint local_c;
  uint local_8;
  
  *(undefined4 *)(in_ECX + 8) = 0;
  *(undefined4 *)(in_ECX + 0xc) = 0;
  *(undefined4 *)(in_ECX + 0x10) = 0;
  *(undefined4 *)(in_ECX + 0x1c) = 0;
  *(undefined4 *)(in_ECX + 0x20) = 0;
  *(undefined4 *)(in_ECX + 0x24) = 0;
  *(undefined4 *)(in_ECX + 0x28) = 0;
  *(undefined4 *)(in_ECX + 0x2c) = 0;
  *(undefined4 *)(in_ECX + 0x30) = 0;
  *(undefined4 *)(in_ECX + 0x34) = 0;
  *(undefined4 *)(in_ECX + 0x3c) = 0;
  *(undefined4 *)(in_ECX + 0x38) = *(undefined4 *)(*(int *)(in_ECX + 4) + 0xc);
  FUN_1008a979();
  pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
  *(void **)(in_ECX + 8) = pvVar1;
  if (pvVar1 != (void *)0x0) {
    pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
    *(void **)(in_ECX + 0x1c) = pvVar1;
    if (pvVar1 != (void *)0x0) {
      puVar8 = *(undefined4 **)(in_ECX + 8);
      for (uVar4 = *(uint *)(in_ECX + 0x38) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
        *puVar8 = 0;
        puVar8 = puVar8 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(undefined1 *)puVar8 = 0;
        puVar8 = (undefined4 *)((int)puVar8 + 1);
      }
      puVar8 = *(undefined4 **)(in_ECX + 0x1c);
      for (uVar4 = *(uint *)(in_ECX + 0x38) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
        *puVar8 = 0;
        puVar8 = puVar8 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(undefined1 *)puVar8 = 0;
        puVar8 = (undefined4 *)((int)puVar8 + 1);
      }
      local_8 = 0;
      if (*(int *)(in_ECX + 0x38) != 0) {
        do {
          iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) + local_8 * 4);
          if ((*(ushort *)(iVar5 + 2) & 0xfff0) != 0) {
            local_c = 0;
            if (*(int *)(iVar5 + 0xc) != 0) {
              do {
                FUN_100cba4c(local_8,*(undefined4 *)(*(int *)(iVar5 + 0x10) + local_c * 4));
                local_c = local_c + 1;
              } while (local_c < *(uint *)(iVar5 + 0xc));
            }
            local_c = 0;
            if (*(int *)(iVar5 + 4) != 0) {
              do {
                FUN_100cb9d7(local_8,*(undefined4 *)(*(int *)(iVar5 + 8) + local_c * 4));
                local_c = local_c + 1;
              } while (local_c < *(uint *)(iVar5 + 4));
            }
          }
          local_8 = local_8 + 1;
        } while (local_8 < *(uint *)(in_ECX + 0x38));
      }
      pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
      *(void **)(in_ECX + 0xc) = pvVar1;
      if (pvVar1 != (void *)0x0) {
        pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
        *(void **)(in_ECX + 0x20) = pvVar1;
        if (pvVar1 != (void *)0x0) {
          iVar5 = 0;
          iVar7 = 0;
          uVar4 = 0;
          if (*(int *)(in_ECX + 0x38) != 0) {
            do {
              iVar2 = uVar4 * 4;
              *(int *)(iVar2 + *(int *)(in_ECX + 0xc)) = iVar5;
              iVar5 = iVar5 + *(int *)(iVar2 + *(int *)(in_ECX + 8));
              *(int *)(iVar2 + *(int *)(in_ECX + 0x20)) = iVar7;
              iVar7 = iVar7 + *(int *)(iVar2 + *(int *)(in_ECX + 0x1c));
              uVar4 = uVar4 + 1;
            } while (uVar4 < *(uint *)(in_ECX + 0x38));
          }
          uVar6 = 0;
          uVar4 = iVar5 << 2;
          pvVar1 = operator_new(uVar4);
          *(void **)(in_ECX + 0x10) = pvVar1;
          if (pvVar1 != (void *)0x0) {
            pvVar1 = operator_new(uVar4);
            *(void **)(in_ECX + 0x14) = pvVar1;
            if (pvVar1 != (void *)0x0) {
              pvVar1 = operator_new(uVar4);
              *(void **)(in_ECX + 0x18) = pvVar1;
              if (pvVar1 != (void *)0x0) {
                pvVar1 = operator_new(iVar7 << 2);
                *(void **)(in_ECX + 0x24) = pvVar1;
                if (pvVar1 != (void *)0x0) {
                  puVar8 = *(undefined4 **)(in_ECX + 8);
                  for (uVar4 = *(uint *)(in_ECX + 0x38) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1)
                  {
                    *puVar8 = 0;
                    puVar8 = puVar8 + 1;
                  }
                  for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
                    *(undefined1 *)puVar8 = 0;
                    puVar8 = (undefined4 *)((int)puVar8 + 1);
                  }
                  puVar8 = *(undefined4 **)(in_ECX + 0x1c);
                  for (uVar4 = *(uint *)(in_ECX + 0x38) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1)
                  {
                    *puVar8 = 0;
                    puVar8 = puVar8 + 1;
                  }
                  for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
                    *(undefined1 *)puVar8 = 0;
                    puVar8 = (undefined4 *)((int)puVar8 + 1);
                  }
                  local_8 = 0;
                  if (*(int *)(in_ECX + 0x38) != 0) {
                    do {
                      iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) + local_8 * 4);
                      if ((*(ushort *)(iVar5 + 2) & 0xfff0) != 0) {
                        local_c = 0;
                        if (*(int *)(iVar5 + 4) != 0) {
                          do {
                            FUN_100cb9d7(local_8,*(undefined4 *)(*(int *)(iVar5 + 8) + local_c * 4))
                            ;
                            local_c = local_c + 1;
                          } while (local_c < *(uint *)(iVar5 + 4));
                        }
                        local_c = 0;
                        if (*(int *)(iVar5 + 0xc) != 0) {
                          do {
                            FUN_100cba4c(local_8,*(undefined4 *)
                                                  (*(int *)(iVar5 + 0x10) + local_c * 4));
                            local_c = local_c + 1;
                          } while (local_c < *(uint *)(iVar5 + 0xc));
                        }
                      }
                      local_8 = local_8 + 1;
                    } while (local_8 < *(uint *)(in_ECX + 0x38));
                  }
                  local_c = 0;
                  if (*(int *)(in_ECX + 0x38) != 0) {
                    do {
                      iVar5 = local_c * 4;
                      FUN_100cbbc6(*(int *)(in_ECX + 0x10) +
                                   *(int *)(iVar5 + *(int *)(in_ECX + 0xc)) * 4,
                                   *(int *)(in_ECX + 8) + iVar5);
                      FUN_100cbbc6(*(int *)(in_ECX + 0x24) +
                                   *(int *)(iVar5 + *(int *)(in_ECX + 0x20)) * 4,
                                   *(int *)(in_ECX + 0x1c) + iVar5);
                      local_c = local_c + 1;
                    } while (local_c < *(uint *)(in_ECX + 0x38));
                  }
                  pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
                  *(void **)(in_ECX + 0x3c) = pvVar1;
                  if (pvVar1 != (void *)0x0) {
                    pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
                    *(void **)(in_ECX + 0x40) = pvVar1;
                    if (pvVar1 != (void *)0x0) {
                      pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
                      *(void **)(in_ECX + 0x44) = pvVar1;
                      if (pvVar1 != (void *)0x0) {
                        pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
                        *(void **)(in_ECX + 0x34) = pvVar1;
                        if (pvVar1 != (void *)0x0) {
                          if (*(int *)(in_ECX + 0x38) != 0) {
                            do {
                              iVar7 = uVar6 * 4;
                              iVar5 = *(int *)(iVar7 + *(int *)(*(int *)(in_ECX + 4) + 0x18));
                              *(uint *)(iVar7 + *(int *)(in_ECX + 0x3c)) = uVar6;
                              *(int *)(iVar7 + *(int *)(in_ECX + 0x44)) = iVar5;
                              *(undefined4 *)(iVar5 + 0x24) = 0xffffffff;
                              if ((*(ushort *)(iVar5 + 2) & 0xfff0) == 0) {
LAB_100cc578:
                                uVar3 = 1;
                              }
                              else {
                                iVar5 = FUN_10085604();
                                uVar3 = 0;
                                if (iVar5 != 0) goto LAB_100cc578;
                              }
                              uVar6 = uVar6 + 1;
                              *(undefined4 *)(iVar7 + *(int *)(in_ECX + 0x34)) = uVar3;
                            } while (uVar6 < *(uint *)(in_ECX + 0x38));
                          }
                          iVar5 = 0;
                          *(undefined4 *)(in_ECX + 0x48) = 0;
                          pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
                          *(void **)(in_ECX + 0x28) = pvVar1;
                          if (pvVar1 != (void *)0x0) {
                            pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
                            *(void **)(in_ECX + 0x2c) = pvVar1;
                            if (pvVar1 != (void *)0x0) {
                              pvVar1 = operator_new(*(int *)(in_ECX + 0x38) << 2);
                              *(void **)(in_ECX + 0x30) = pvVar1;
                              if (pvVar1 != (void *)0x0) {
                                if (param_1 != 0) {
                                  do {
                                    iVar7 = FUN_100cc1bb();
                                    if (iVar7 < 0) {
                                      return iVar7;
                                    }
                                  } while (iVar7 != 1);
                                  uVar4 = 0;
                                  if (*(int *)(in_ECX + 0x38) != 0) {
                                    do {
                                      *(undefined4 *)
                                       (*(int *)(*(int *)(in_ECX + 4) + 0x18) + uVar4 * 4) =
                                           *(undefined4 *)
                                            (*(int *)(in_ECX + 0x44) +
                                            *(int *)(*(int *)(in_ECX + 0x3c) + uVar4 * 4) * 4);
                                      uVar4 = uVar4 + 1;
                                    } while (uVar4 < *(uint *)(in_ECX + 0x38));
                                  }
                                }
                                goto LAB_100cc60d;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  iVar5 = -0x7ff8fff2;
LAB_100cc60d:
  _free(*(void **)(in_ECX + 8));
  _free(*(void **)(in_ECX + 0xc));
  _free(*(void **)(in_ECX + 0x10));
  _free(*(void **)(in_ECX + 0x14));
  _free(*(void **)(in_ECX + 0x18));
  _free(*(void **)(in_ECX + 0x1c));
  _free(*(void **)(in_ECX + 0x20));
  _free(*(void **)(in_ECX + 0x24));
  _free(*(void **)(in_ECX + 0x28));
  _free(*(void **)(in_ECX + 0x2c));
  _free(*(void **)(in_ECX + 0x30));
  _free(*(void **)(in_ECX + 0x34));
  _free(*(void **)(in_ECX + 0x3c));
  _free(*(void **)(in_ECX + 0x40));
  _free(*(void **)(in_ECX + 0x44));
  return iVar5;
}


