// 100949dc size=1240 FUN_100949dc

undefined4 FUN_100949dc(void)

{
  undefined4 *puVar1;
  uint *puVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  int in_ECX;
  uint uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  uint uVar11;
  uint local_38;
  uint local_34;
  int local_24;
  int local_20;
  uint local_1c;
  uint local_14;
  int local_10;
  uint local_c;
  uint local_8;
  
  bVar3 = false;
  FUN_1008af0b();
  local_34 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_34 * 4);
      uVar6 = *puVar2 & 0xf0000000;
      if ((0xfffffff < uVar6) && (uVar6 < 0x40000001)) {
        local_14 = *puVar2 & 0xfffff;
        uVar6 = puVar2[1] / local_14;
        iVar4 = FUN_10085469();
        local_1c = local_14;
        local_c = 1;
        if (1 < local_14) {
          iVar5 = local_14 * 4;
          local_10 = 4;
          local_24 = iVar5;
          do {
            local_24 = local_24 + 4;
            iVar7 = *(int *)(in_ECX + 0x14);
            if (((*(ushort *)
                   (*(int *)(*(int *)(in_ECX + 0x10) +
                            *(int *)(*(int *)(iVar7 + *(int *)(puVar2[4] + local_10) * 4) + 4) * 4)
                   + 4) & 0x1020) == 0) && (local_8 = 0, local_20 = iVar5, local_10 != 0)) {
              do {
                iVar9 = *(int *)(puVar2[4] + local_8 * 4);
                if ((iVar9 == -1) ||
                   ((*(ushort *)
                      (*(int *)(*(int *)(in_ECX + 0x10) +
                               *(int *)(*(int *)(iVar7 + iVar9 * 4) + 4) * 4) + 4) & 0x1020) != 0))
                goto LAB_10094d70;
                if (uVar6 == 1) {
                  iVar9 = *(int *)(puVar2[2] + local_10);
                  if (iVar9 == -1) {
                    iVar9 = -1;
                  }
                  else {
                    iVar9 = *(int *)(*(int *)(iVar7 + iVar9 * 4) + 0x30);
                  }
                  iVar10 = *(int *)(puVar2[2] + local_8 * 4);
                  if (iVar10 == -1) {
                    iVar10 = -1;
                  }
                  else {
                    iVar10 = *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30);
                  }
                  if (iVar9 != iVar10) goto LAB_10094b14;
LAB_10094d88:
                  FUN_1008d905(*(undefined4 *)(puVar2[4] + local_8 * 4),
                               *(int *)(puVar2[4] + local_10));
                  local_1c = local_1c - 1;
                  *(undefined4 *)(local_10 + puVar2[4]) = 0xffffffff;
                  break;
                }
LAB_10094b14:
                if (uVar6 == 2) {
                  uVar11 = puVar2[2];
                  if (*(int *)(uVar11 + local_10) == -1) {
                    iVar9 = -1;
                  }
                  else {
                    iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_10) * 4) + 0x30);
                  }
                  iVar10 = *(int *)(uVar11 + local_8 * 4);
                  if (iVar10 == -1) {
                    iVar8 = -1;
                  }
                  else {
                    iVar8 = *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30);
                  }
                  if (iVar9 == iVar8) {
                    if (*(int *)(uVar11 + local_24) == -1) {
                      iVar9 = -1;
                    }
                    else {
                      iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_24) * 4) + 0x30);
                    }
                    if (*(int *)(uVar11 + local_20) == -1) {
                      iVar8 = -1;
                    }
                    else {
                      iVar8 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_20) * 4) + 0x30);
                    }
                    if (iVar9 == iVar8) goto LAB_10094d88;
                  }
                  if (iVar4 != 0) {
                    if (*(int *)(uVar11 + local_10) == -1) {
                      iVar9 = -1;
                    }
                    else {
                      iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_10) * 4) + 0x30);
                    }
                    if (*(int *)(uVar11 + local_20) == -1) {
                      iVar8 = -1;
                    }
                    else {
                      iVar8 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_20) * 4) + 0x30);
                    }
                    if (iVar9 == iVar8) {
                      if (*(int *)(uVar11 + local_24) == -1) {
                        iVar9 = -1;
                      }
                      else {
                        iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_24) * 4) + 0x30);
                      }
                      if (iVar10 == -1) {
                        iVar10 = -1;
                      }
                      else {
                        iVar10 = *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30);
                      }
                      if (iVar9 == iVar10) goto LAB_10094d88;
                      goto LAB_10094be7;
                    }
                  }
                }
                else {
LAB_10094be7:
                  if (uVar6 == 3) {
                    uVar11 = puVar2[2];
                    if (*(int *)(uVar11 + local_10) == -1) {
                      iVar9 = -1;
                    }
                    else {
                      iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_10) * 4) + 0x30);
                    }
                    iVar10 = *(int *)(uVar11 + local_8 * 4);
                    if (iVar10 == -1) {
                      iVar10 = -1;
                    }
                    else {
                      iVar10 = *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30);
                    }
                    if (iVar9 == iVar10) {
                      if (*(int *)(uVar11 + local_24) == -1) {
                        iVar9 = -1;
                      }
                      else {
                        iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_24) * 4) + 0x30);
                      }
                      if (*(int *)(uVar11 + local_20) == -1) {
                        iVar10 = -1;
                      }
                      else {
                        iVar10 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_20) * 4) + 0x30);
                      }
                      if (iVar9 == iVar10) {
                        iVar9 = *(int *)(uVar11 + (local_c + local_14 * 2) * 4);
                        if (iVar9 == -1) {
                          local_38 = -1;
                        }
                        else {
                          local_38 = *(int *)(*(int *)(iVar7 + iVar9 * 4) + 0x30);
                        }
                        iVar9 = *(int *)(uVar11 + (local_14 * 2 + local_8) * 4);
                        if (iVar9 == -1) {
                          iVar9 = -1;
                        }
                        else {
                          iVar9 = *(int *)(*(int *)(iVar7 + iVar9 * 4) + 0x30);
                        }
                        if (local_38 == iVar9) goto LAB_10094d88;
                        goto LAB_10094c92;
                      }
                    }
                  }
                  else {
LAB_10094c92:
                    if (uVar6 == 4) {
                      uVar11 = puVar2[2];
                      if (*(int *)(uVar11 + local_10) == -1) {
                        iVar9 = -1;
                      }
                      else {
                        iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_10) * 4) + 0x30);
                      }
                      iVar10 = *(int *)(uVar11 + local_8 * 4);
                      if (iVar10 == -1) {
                        iVar10 = -1;
                      }
                      else {
                        iVar10 = *(int *)(*(int *)(iVar7 + iVar10 * 4) + 0x30);
                      }
                      if (iVar9 == iVar10) {
                        if (*(int *)(uVar11 + local_24) == -1) {
                          iVar9 = -1;
                        }
                        else {
                          iVar9 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_24) * 4) + 0x30)
                          ;
                        }
                        if (*(int *)(uVar11 + local_20) == -1) {
                          iVar10 = -1;
                        }
                        else {
                          iVar10 = *(int *)(*(int *)(iVar7 + *(int *)(uVar11 + local_20) * 4) + 0x30
                                           );
                        }
                        if (iVar9 == iVar10) {
                          iVar9 = *(int *)(uVar11 + (local_c + local_14 * 2) * 4);
                          if (iVar9 == -1) {
                            local_38 = -1;
                          }
                          else {
                            local_38 = *(int *)(*(int *)(iVar7 + iVar9 * 4) + 0x30);
                          }
                          iVar9 = *(int *)(uVar11 + (local_14 * 2 + local_8) * 4);
                          if (iVar9 == -1) {
                            iVar9 = -1;
                          }
                          else {
                            iVar9 = *(int *)(*(int *)(iVar7 + iVar9 * 4) + 0x30);
                          }
                          if (local_38 == iVar9) {
                            iVar9 = *(int *)(uVar11 + (local_c + local_14 * 3) * 4);
                            if (iVar9 == -1) {
                              local_38 = -1;
                            }
                            else {
                              local_38 = *(int *)(*(int *)(iVar7 + iVar9 * 4) + 0x30);
                            }
                            iVar9 = *(int *)(uVar11 + (local_14 * 3 + local_8) * 4);
                            if (iVar9 == -1) {
                              iVar9 = -1;
                            }
                            else {
                              iVar9 = *(int *)(*(int *)(iVar7 + iVar9 * 4) + 0x30);
                            }
                            if (local_38 == iVar9) goto LAB_10094d88;
                          }
                        }
                      }
                    }
                  }
                }
LAB_10094d70:
                local_8 = local_8 + 1;
                local_20 = local_20 + 4;
              } while (local_8 < local_c);
            }
            local_c = local_c + 1;
            local_10 = local_10 + 4;
          } while (local_c < local_14);
          if (local_1c < local_14) {
            local_c = 0;
            if (local_14 != 0) {
              iVar4 = 0;
              do {
                iVar9 = local_c * 4;
                iVar7 = *(int *)(puVar2[4] + iVar9);
                if (iVar7 != -1) {
                  *(int *)(puVar2[4] + iVar4) = iVar7;
                  iVar7 = iVar4;
                  for (uVar11 = uVar6; uVar11 != 0; uVar11 = uVar11 - 1) {
                    puVar1 = (undefined4 *)(puVar2[2] + iVar9);
                    iVar9 = iVar9 + iVar5;
                    *(undefined4 *)(puVar2[2] + iVar7) = *puVar1;
                    iVar7 = iVar7 + iVar5;
                  }
                  iVar4 = iVar4 + 4;
                }
                local_c = local_c + 1;
              } while (local_c < local_14);
            }
            if (1 < uVar6) {
              iVar7 = uVar6 - 1;
              iVar4 = iVar5;
              local_24 = local_1c * 4;
              do {
                if (local_1c != 0) {
                  local_38 = local_1c;
                  iVar9 = iVar4;
                  iVar10 = local_24;
                  do {
                    *(undefined4 *)(puVar2[2] + iVar10) = *(undefined4 *)(puVar2[2] + iVar9);
                    iVar9 = iVar9 + 4;
                    iVar10 = iVar10 + 4;
                    local_38 = local_38 - 1;
                  } while (local_38 != 0);
                }
                iVar4 = iVar4 + iVar5;
                local_24 = local_24 + local_1c * 4;
                iVar7 = iVar7 + -1;
              } while (iVar7 != 0);
            }
            *puVar2 = *puVar2 ^ (*puVar2 ^ local_1c) & 0xfffff;
            puVar2[1] = local_1c * uVar6;
            puVar2[3] = local_1c;
            bVar3 = true;
          }
        }
      }
      local_34 = local_34 + 1;
    } while (local_34 < *(uint *)(in_ECX + 0xc));
    if (bVar3) {
      FUN_1008af24();
      return 0;
    }
  }
  return 1;
}


