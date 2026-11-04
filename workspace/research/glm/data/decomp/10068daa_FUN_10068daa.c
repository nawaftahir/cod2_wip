// 10068daa size=2273 FUN_10068daa

int FUN_10068daa(int param_1)

{
  byte bVar1;
  byte bVar2;
  uint uVar3;
  byte *pbVar4;
  int iVar5;
  int in_ECX;
  uint uVar6;
  uint uVar7;
  int iVar8;
  byte *pbVar9;
  bool bVar10;
  byte local_58 [16];
  byte *local_48;
  int local_44;
  int local_40;
  byte *local_3c;
  int local_38;
  int local_34;
  int local_30;
  int local_2c;
  int local_28;
  int local_24;
  int local_20;
  int local_1c;
  byte *local_18;
  int local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  local_3c = *(byte **)(param_1 + 8);
  *(undefined4 *)(in_ECX + 0x54) = 0;
  local_8 = 0x10d;
  local_44 = 0;
  local_c = 0;
  local_10 = 0;
  local_40 = 1;
  local_28 = 0;
  local_30 = 0;
  local_34 = 0;
  local_20 = 0;
  local_2c = 0;
  local_24 = 0;
  local_1c = 0;
  local_38 = 0;
  local_18 = local_3c;
  iVar8 = 0;
  local_14 = in_ECX;
  if (*local_3c == 0) {
LAB_1006966f:
    *(uint *)(in_ECX + 0x44) = local_c;
    *(uint *)(in_ECX + 0x48) = local_10;
    *(int *)(in_ECX + 0x40) = iVar8;
    *(undefined4 *)(in_ECX + 0x54) = 0;
  }
  else {
    do {
      iVar8 = 3;
      for (; (*local_18 != 0 && (*local_18 != 0x5f)); local_18 = local_18 + 1) {
      }
      uVar3 = (int)local_18 - (int)local_3c;
      if (0xf < uVar3) goto LAB_10069668;
      pbVar4 = local_3c;
      pbVar9 = local_58;
      for (uVar6 = uVar3 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
        *(undefined4 *)pbVar9 = *(undefined4 *)pbVar4;
        pbVar4 = pbVar4 + 4;
        pbVar9 = pbVar9 + 4;
      }
      for (uVar6 = uVar3 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
        *pbVar9 = *pbVar4;
        pbVar4 = pbVar4 + 1;
        pbVar9 = pbVar9 + 1;
      }
      local_58[uVar3] = 0;
      if (*local_18 != 0) {
        local_18 = local_18 + 1;
      }
      local_3c = local_18;
      if (local_40 == 0) {
        if (local_30 != 0) {
          iVar5 = 4;
          bVar10 = true;
          pbVar4 = local_58;
          pbVar9 = &DAT_1010ecf8;
          do {
            if (iVar5 == 0) break;
            iVar5 = iVar5 + -1;
            bVar10 = *pbVar4 == *pbVar9;
            pbVar4 = pbVar4 + 1;
            pbVar9 = pbVar9 + 1;
          } while (bVar10);
          if (bVar10) {
            local_c = local_c | 0x100000;
            local_28 = 0;
            local_30 = 0;
            goto LAB_10069608;
          }
        }
        if (local_34 != 0) {
          iVar5 = 9;
          bVar10 = true;
          pbVar4 = local_58;
          pbVar9 = (byte *)"centroid";
          do {
            if (iVar5 == 0) break;
            iVar5 = iVar5 + -1;
            bVar10 = *pbVar4 == *pbVar9;
            pbVar4 = pbVar4 + 1;
            pbVar9 = pbVar9 + 1;
          } while (bVar10);
          if (bVar10) {
            local_c = local_c | 0x400000;
            local_34 = 0;
            goto LAB_10069608;
          }
        }
        if (local_28 == 0) {
          if (local_20 != 0) {
            uVar3 = 0;
            bVar10 = true;
            iVar5 = iVar8;
            pbVar4 = local_58;
            pbVar9 = &DAT_1010ecd0;
            do {
              if (iVar5 == 0) break;
              iVar5 = iVar5 + -1;
              bVar10 = *pbVar4 == *pbVar9;
              pbVar4 = pbVar4 + 1;
              pbVar9 = pbVar9 + 1;
            } while (bVar10);
            if (bVar10) {
              uVar3 = 0x10000000;
            }
            else {
              iVar5 = 5;
              bVar10 = true;
              pbVar4 = local_58;
              pbVar9 = &DAT_1010ecc8;
              do {
                if (iVar5 == 0) break;
                iVar5 = iVar5 + -1;
                bVar10 = *pbVar4 == *pbVar9;
                pbVar4 = pbVar4 + 1;
                pbVar9 = pbVar9 + 1;
              } while (bVar10);
              if (bVar10) {
                uVar3 = 0x18000000;
              }
              else {
                iVar5 = 7;
                bVar10 = true;
                pbVar4 = local_58;
                pbVar9 = (byte *)"volume";
                do {
                  if (iVar5 == 0) break;
                  iVar5 = iVar5 + -1;
                  bVar10 = *pbVar4 == *pbVar9;
                  pbVar4 = pbVar4 + 1;
                  pbVar9 = pbVar9 + 1;
                } while (bVar10);
                if (bVar10) {
                  uVar3 = 0x20000000;
                }
              }
            }
            local_10 = local_10 | uVar3;
            local_20 = 0;
            if (uVar3 != 0) {
              local_2c = 0;
              local_24 = 0;
              goto LAB_10069608;
            }
          }
          if (local_38 != 0) {
            bVar10 = true;
            pbVar4 = local_58;
            pbVar9 = &DAT_1010ecbc;
            do {
              if (iVar8 == 0) break;
              iVar8 = iVar8 + -1;
              bVar10 = *pbVar4 == *pbVar9;
              pbVar4 = pbVar4 + 1;
              pbVar9 = pbVar9 + 1;
            } while (bVar10);
            if (bVar10) {
              local_c = local_c | 0x200000;
              local_38 = 0;
              goto LAB_10069608;
            }
          }
          if (local_2c == 0) {
LAB_100693a4:
            if (local_24 == 0) {
              if (local_1c != 0) {
                iVar8 = 3;
                bVar10 = true;
                iVar5 = iVar8;
                pbVar4 = local_58;
                pbVar9 = &DAT_1010ec6c;
                do {
                  if (iVar5 == 0) break;
                  iVar5 = iVar5 + -1;
                  bVar10 = *pbVar4 == *pbVar9;
                  pbVar4 = pbVar4 + 1;
                  pbVar9 = pbVar9 + 1;
                } while (bVar10);
                if (bVar10) {
                  local_10 = 1;
                }
                else {
                  bVar10 = true;
                  iVar5 = iVar8;
                  pbVar4 = local_58;
                  pbVar9 = &DAT_1010ec68;
                  do {
                    if (iVar5 == 0) break;
                    iVar5 = iVar5 + -1;
                    bVar10 = *pbVar4 == *pbVar9;
                    pbVar4 = pbVar4 + 1;
                    pbVar9 = pbVar9 + 1;
                  } while (bVar10);
                  if (bVar10) {
                    local_10 = 2;
                  }
                  else {
                    bVar10 = true;
                    iVar5 = iVar8;
                    pbVar4 = local_58;
                    pbVar9 = &DAT_1010ec64;
                    do {
                      if (iVar5 == 0) break;
                      iVar5 = iVar5 + -1;
                      bVar10 = *pbVar4 == *pbVar9;
                      pbVar4 = pbVar4 + 1;
                      pbVar9 = pbVar9 + 1;
                    } while (bVar10);
                    if (bVar10) {
                      local_10 = 3;
                    }
                    else {
                      bVar10 = true;
                      iVar5 = iVar8;
                      pbVar4 = local_58;
                      pbVar9 = &DAT_1010ec60;
                      do {
                        if (iVar5 == 0) break;
                        iVar5 = iVar5 + -1;
                        bVar10 = *pbVar4 == *pbVar9;
                        pbVar4 = pbVar4 + 1;
                        pbVar9 = pbVar9 + 1;
                      } while (bVar10);
                      if (bVar10) {
                        local_10 = 4;
                      }
                      else {
                        bVar10 = true;
                        iVar5 = iVar8;
                        pbVar4 = local_58;
                        pbVar9 = &DAT_1010ec5c;
                        do {
                          if (iVar5 == 0) break;
                          iVar5 = iVar5 + -1;
                          bVar10 = *pbVar4 == *pbVar9;
                          pbVar4 = pbVar4 + 1;
                          pbVar9 = pbVar9 + 1;
                        } while (bVar10);
                        if (bVar10) {
                          local_10 = 5;
                        }
                        else {
                          bVar10 = true;
                          pbVar4 = local_58;
                          pbVar9 = &DAT_1010ec58;
                          do {
                            if (iVar8 == 0) break;
                            iVar8 = iVar8 + -1;
                            bVar10 = *pbVar4 == *pbVar9;
                            pbVar4 = pbVar4 + 1;
                            pbVar9 = pbVar9 + 1;
                          } while (bVar10);
                          if (!bVar10) goto LAB_10069668;
                          local_10 = 6;
                        }
                      }
                    }
                  }
                }
                local_1c = 0;
                goto LAB_10069608;
              }
              goto LAB_10069668;
            }
            pbVar4 = local_58;
            if (local_58[0] == 0) {
LAB_100693db:
              uVar3 = 0;
            }
            else {
              do {
                iVar8 = _isalpha((int)(char)*pbVar4);
                if (iVar8 == 0) break;
                pbVar4 = pbVar4 + 1;
              } while (*pbVar4 != 0);
              if (*pbVar4 == 0) goto LAB_100693db;
              uVar3 = _atol((char *)pbVar4);
            }
            if (0xf < uVar3) goto LAB_10069668;
            if (*pbVar4 != 0) {
              *pbVar4 = 0;
              pbVar4 = pbVar4 + 1;
            }
            bVar2 = *pbVar4;
            if (bVar2 != 0) {
              do {
                iVar8 = _isdigit((int)(char)bVar2);
                if (iVar8 == 0) break;
                pbVar4 = pbVar4 + 1;
                bVar2 = *pbVar4;
              } while (bVar2 != 0);
              if (*pbVar4 != 0) goto LAB_10069668;
            }
            iVar8 = 9;
            uVar6 = 0;
            bVar10 = true;
            pbVar4 = local_58;
            pbVar9 = (byte *)"position";
            do {
              if (iVar8 == 0) break;
              iVar8 = iVar8 + -1;
              bVar10 = *pbVar4 == *pbVar9;
              pbVar4 = pbVar4 + 1;
              pbVar9 = pbVar9 + 1;
            } while (bVar10);
            if (!bVar10) {
              iVar8 = 0xc;
              bVar10 = true;
              pbVar4 = local_58;
              pbVar9 = (byte *)"blendweight";
              do {
                if (iVar8 == 0) break;
                iVar8 = iVar8 + -1;
                bVar10 = *pbVar4 == *pbVar9;
                pbVar4 = pbVar4 + 1;
                pbVar9 = pbVar9 + 1;
              } while (bVar10);
              if (bVar10) {
                uVar6 = 1;
              }
              else {
                iVar8 = 0xd;
                bVar10 = true;
                pbVar4 = local_58;
                pbVar9 = (byte *)"blendindices";
                do {
                  if (iVar8 == 0) break;
                  iVar8 = iVar8 + -1;
                  bVar10 = *pbVar4 == *pbVar9;
                  pbVar4 = pbVar4 + 1;
                  pbVar9 = pbVar9 + 1;
                } while (bVar10);
                if (bVar10) {
                  uVar6 = 2;
                }
                else {
                  iVar8 = 7;
                  bVar10 = true;
                  pbVar4 = local_58;
                  pbVar9 = (byte *)"normal";
                  do {
                    if (iVar8 == 0) break;
                    iVar8 = iVar8 + -1;
                    bVar10 = *pbVar4 == *pbVar9;
                    pbVar4 = pbVar4 + 1;
                    pbVar9 = pbVar9 + 1;
                  } while (bVar10);
                  if (bVar10) {
                    uVar6 = 3;
                  }
                  else {
                    iVar8 = 6;
                    bVar10 = true;
                    pbVar4 = local_58;
                    pbVar9 = (byte *)"psize";
                    do {
                      if (iVar8 == 0) break;
                      iVar8 = iVar8 + -1;
                      bVar10 = *pbVar4 == *pbVar9;
                      pbVar4 = pbVar4 + 1;
                      pbVar9 = pbVar9 + 1;
                    } while (bVar10);
                    if (bVar10) {
                      uVar6 = 4;
                    }
                    else {
                      iVar8 = 9;
                      bVar10 = true;
                      pbVar4 = local_58;
                      pbVar9 = (byte *)"texcoord";
                      do {
                        if (iVar8 == 0) break;
                        iVar8 = iVar8 + -1;
                        bVar10 = *pbVar4 == *pbVar9;
                        pbVar4 = pbVar4 + 1;
                        pbVar9 = pbVar9 + 1;
                      } while (bVar10);
                      if (bVar10) {
                        uVar6 = 5;
                      }
                      else {
                        uVar6 = 8;
                        bVar10 = true;
                        uVar7 = uVar6;
                        pbVar4 = local_58;
                        pbVar9 = (byte *)"tangent";
                        do {
                          if (uVar7 == 0) break;
                          uVar7 = uVar7 - 1;
                          bVar10 = *pbVar4 == *pbVar9;
                          pbVar4 = pbVar4 + 1;
                          pbVar9 = pbVar9 + 1;
                        } while (bVar10);
                        if (bVar10) {
                          uVar6 = 6;
                        }
                        else {
                          iVar8 = 9;
                          bVar10 = true;
                          pbVar4 = local_58;
                          pbVar9 = (byte *)"binormal";
                          do {
                            if (iVar8 == 0) break;
                            iVar8 = iVar8 + -1;
                            bVar10 = *pbVar4 == *pbVar9;
                            pbVar4 = pbVar4 + 1;
                            pbVar9 = pbVar9 + 1;
                          } while (bVar10);
                          if (bVar10) {
                            uVar6 = 7;
                          }
                          else {
                            iVar8 = 0xb;
                            bVar10 = true;
                            pbVar4 = local_58;
                            pbVar9 = (byte *)"tessfactor";
                            do {
                              if (iVar8 == 0) break;
                              iVar8 = iVar8 + -1;
                              bVar10 = *pbVar4 == *pbVar9;
                              pbVar4 = pbVar4 + 1;
                              pbVar9 = pbVar9 + 1;
                            } while (bVar10);
                            if (!bVar10) {
                              uVar6 = 10;
                              bVar10 = true;
                              uVar7 = uVar6;
                              pbVar4 = local_58;
                              pbVar9 = (byte *)"positiont";
                              do {
                                if (uVar7 == 0) break;
                                uVar7 = uVar7 - 1;
                                bVar10 = *pbVar4 == *pbVar9;
                                pbVar4 = pbVar4 + 1;
                                pbVar9 = pbVar9 + 1;
                              } while (bVar10);
                              if (bVar10) {
                                uVar6 = 9;
                              }
                              else {
                                iVar8 = 6;
                                bVar10 = true;
                                pbVar4 = local_58;
                                pbVar9 = (byte *)"color";
                                do {
                                  if (iVar8 == 0) break;
                                  iVar8 = iVar8 + -1;
                                  bVar10 = *pbVar4 == *pbVar9;
                                  pbVar4 = pbVar4 + 1;
                                  pbVar9 = pbVar9 + 1;
                                } while (bVar10);
                                if (!bVar10) {
                                  iVar8 = 4;
                                  bVar10 = true;
                                  pbVar4 = local_58;
                                  pbVar9 = &DAT_10195a98;
                                  do {
                                    if (iVar8 == 0) break;
                                    iVar8 = iVar8 + -1;
                                    bVar10 = *pbVar4 == *pbVar9;
                                    pbVar4 = pbVar4 + 1;
                                    pbVar9 = pbVar9 + 1;
                                  } while (bVar10);
                                  if (bVar10) {
                                    uVar6 = 0xb;
                                  }
                                  else {
                                    iVar8 = 6;
                                    bVar10 = true;
                                    pbVar4 = local_58;
                                    pbVar9 = (byte *)"depth";
                                    do {
                                      if (iVar8 == 0) break;
                                      iVar8 = iVar8 + -1;
                                      bVar10 = *pbVar4 == *pbVar9;
                                      pbVar4 = pbVar4 + 1;
                                      pbVar9 = pbVar9 + 1;
                                    } while (bVar10);
                                    if (bVar10) {
                                      uVar6 = 0xc;
                                    }
                                    else {
                                      iVar8 = 7;
                                      bVar10 = true;
                                      pbVar4 = local_58;
                                      pbVar9 = (byte *)"sample";
                                      do {
                                        if (iVar8 == 0) break;
                                        iVar8 = iVar8 + -1;
                                        bVar10 = *pbVar4 == *pbVar9;
                                        pbVar4 = pbVar4 + 1;
                                        pbVar9 = pbVar9 + 1;
                                      } while (bVar10);
                                      if (!bVar10) goto LAB_10069668;
                                      uVar6 = 0xd;
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
            local_24 = 0;
            local_10 = (uVar3 & 0xf) << 0x10 | uVar6;
          }
          else {
            pbVar4 = local_58;
            if (local_58[0] == 0) {
LAB_10069209:
              uVar3 = 0;
            }
            else {
              do {
                iVar8 = _isalpha((int)(char)*pbVar4);
                if (iVar8 == 0) break;
                pbVar4 = pbVar4 + 1;
              } while (*pbVar4 != 0);
              if (*pbVar4 == 0) goto LAB_10069209;
              uVar3 = _atol((char *)pbVar4);
            }
            if (0xf < uVar3) goto LAB_100693a4;
            bVar2 = *pbVar4;
            local_48 = pbVar4;
            if (bVar2 != 0) {
              *pbVar4 = 0;
              pbVar4 = pbVar4 + 1;
            }
            bVar1 = *pbVar4;
            if (bVar1 != 0) {
              do {
                iVar8 = _isdigit((int)(char)bVar1);
                if (iVar8 == 0) break;
                pbVar4 = pbVar4 + 1;
                bVar1 = *pbVar4;
              } while (bVar1 != 0);
              if (*pbVar4 == 0) goto LAB_10069248;
LAB_1006939c:
              *local_48 = bVar2;
              goto LAB_100693a4;
            }
LAB_10069248:
            iVar8 = 9;
            uVar6 = 0;
            bVar10 = true;
            pbVar4 = local_58;
            pbVar9 = (byte *)"position";
            do {
              if (iVar8 == 0) break;
              iVar8 = iVar8 + -1;
              bVar10 = *pbVar4 == *pbVar9;
              pbVar4 = pbVar4 + 1;
              pbVar9 = pbVar9 + 1;
            } while (bVar10);
            if (bVar10) {
              if (uVar3 == 0) goto LAB_1006939c;
            }
            else {
              iVar8 = 0xc;
              bVar10 = true;
              pbVar4 = local_58;
              pbVar9 = (byte *)"blendweight";
              do {
                if (iVar8 == 0) break;
                iVar8 = iVar8 + -1;
                bVar10 = *pbVar4 == *pbVar9;
                pbVar4 = pbVar4 + 1;
                pbVar9 = pbVar9 + 1;
              } while (bVar10);
              if (bVar10) {
                uVar6 = 1;
              }
              else {
                iVar8 = 0xd;
                bVar10 = true;
                pbVar4 = local_58;
                pbVar9 = (byte *)"blendindices";
                do {
                  if (iVar8 == 0) break;
                  iVar8 = iVar8 + -1;
                  bVar10 = *pbVar4 == *pbVar9;
                  pbVar4 = pbVar4 + 1;
                  pbVar9 = pbVar9 + 1;
                } while (bVar10);
                if (bVar10) {
                  uVar6 = 2;
                }
                else {
                  iVar8 = 7;
                  bVar10 = true;
                  pbVar4 = local_58;
                  pbVar9 = (byte *)"normal";
                  do {
                    if (iVar8 == 0) break;
                    iVar8 = iVar8 + -1;
                    bVar10 = *pbVar4 == *pbVar9;
                    pbVar4 = pbVar4 + 1;
                    pbVar9 = pbVar9 + 1;
                  } while (bVar10);
                  if (bVar10) {
                    uVar6 = 3;
                  }
                  else {
                    uVar6 = 6;
                    bVar10 = true;
                    uVar7 = uVar6;
                    pbVar4 = local_58;
                    pbVar9 = (byte *)"psize";
                    do {
                      if (uVar7 == 0) break;
                      uVar7 = uVar7 - 1;
                      bVar10 = *pbVar4 == *pbVar9;
                      pbVar4 = pbVar4 + 1;
                      pbVar9 = pbVar9 + 1;
                    } while (bVar10);
                    if (bVar10) {
                      uVar6 = 4;
                    }
                    else {
                      iVar8 = 9;
                      bVar10 = true;
                      pbVar4 = local_58;
                      pbVar9 = (byte *)"texcoord";
                      do {
                        if (iVar8 == 0) break;
                        iVar8 = iVar8 + -1;
                        bVar10 = *pbVar4 == *pbVar9;
                        pbVar4 = pbVar4 + 1;
                        pbVar9 = pbVar9 + 1;
                      } while (bVar10);
                      if (bVar10) {
                        uVar6 = 5;
                      }
                      else {
                        iVar8 = 8;
                        bVar10 = true;
                        pbVar4 = local_58;
                        pbVar9 = (byte *)"tangent";
                        do {
                          if (iVar8 == 0) break;
                          iVar8 = iVar8 + -1;
                          bVar10 = *pbVar4 == *pbVar9;
                          pbVar4 = pbVar4 + 1;
                          pbVar9 = pbVar9 + 1;
                        } while (bVar10);
                        if (!bVar10) {
                          iVar8 = 9;
                          bVar10 = true;
                          pbVar4 = local_58;
                          pbVar9 = (byte *)"binormal";
                          do {
                            if (iVar8 == 0) break;
                            iVar8 = iVar8 + -1;
                            bVar10 = *pbVar4 == *pbVar9;
                            pbVar4 = pbVar4 + 1;
                            pbVar9 = pbVar9 + 1;
                          } while (bVar10);
                          if (bVar10) {
                            uVar6 = 7;
                          }
                          else {
                            iVar8 = 0xb;
                            bVar10 = true;
                            pbVar4 = local_58;
                            pbVar9 = (byte *)"tessfactor";
                            do {
                              if (iVar8 == 0) break;
                              iVar8 = iVar8 + -1;
                              bVar10 = *pbVar4 == *pbVar9;
                              pbVar4 = pbVar4 + 1;
                              pbVar9 = pbVar9 + 1;
                            } while (bVar10);
                            if (bVar10) {
                              uVar6 = 8;
                            }
                            else {
                              uVar6 = 10;
                              bVar10 = true;
                              uVar7 = uVar6;
                              pbVar4 = local_58;
                              pbVar9 = (byte *)"positiont";
                              do {
                                if (uVar7 == 0) break;
                                uVar7 = uVar7 - 1;
                                bVar10 = *pbVar4 == *pbVar9;
                                pbVar4 = pbVar4 + 1;
                                pbVar9 = pbVar9 + 1;
                              } while (bVar10);
                              if (bVar10) {
                                uVar6 = 9;
                              }
                              else {
                                iVar8 = 6;
                                bVar10 = true;
                                pbVar4 = local_58;
                                pbVar9 = (byte *)"color";
                                do {
                                  if (iVar8 == 0) break;
                                  iVar8 = iVar8 + -1;
                                  bVar10 = *pbVar4 == *pbVar9;
                                  pbVar4 = pbVar4 + 1;
                                  pbVar9 = pbVar9 + 1;
                                } while (bVar10);
                                if (!bVar10) {
                                  iVar8 = 4;
                                  bVar10 = true;
                                  pbVar4 = local_58;
                                  pbVar9 = &DAT_10195a98;
                                  do {
                                    if (iVar8 == 0) break;
                                    iVar8 = iVar8 + -1;
                                    bVar10 = *pbVar4 == *pbVar9;
                                    pbVar4 = pbVar4 + 1;
                                    pbVar9 = pbVar9 + 1;
                                  } while (bVar10);
                                  if (bVar10) {
                                    uVar6 = 0xb;
                                  }
                                  else {
                                    iVar8 = 6;
                                    bVar10 = true;
                                    pbVar4 = local_58;
                                    pbVar9 = (byte *)"depth";
                                    do {
                                      if (iVar8 == 0) break;
                                      iVar8 = iVar8 + -1;
                                      bVar10 = *pbVar4 == *pbVar9;
                                      pbVar4 = pbVar4 + 1;
                                      pbVar9 = pbVar9 + 1;
                                    } while (bVar10);
                                    if (bVar10) {
                                      uVar6 = 0xc;
                                    }
                                    else {
                                      iVar8 = 7;
                                      bVar10 = true;
                                      pbVar4 = local_58;
                                      pbVar9 = (byte *)"sample";
                                      do {
                                        if (iVar8 == 0) break;
                                        iVar8 = iVar8 + -1;
                                        bVar10 = *pbVar4 == *pbVar9;
                                        pbVar4 = pbVar4 + 1;
                                        pbVar9 = pbVar9 + 1;
                                      } while (bVar10);
                                      if (!bVar10) goto LAB_1006939c;
                                      uVar6 = 0xd;
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
            local_10 = local_10 | (uVar3 & 0xf) << 0x10 | uVar6;
            local_2c = 0;
          }
          local_20 = 0;
        }
        else {
          bVar10 = true;
          iVar5 = iVar8;
          pbVar4 = local_58;
          pbVar9 = &DAT_1010ece8;
          do {
            if (iVar5 == 0) break;
            iVar5 = iVar5 + -1;
            bVar10 = *pbVar4 == *pbVar9;
            pbVar4 = pbVar4 + 1;
            pbVar9 = pbVar9 + 1;
          } while (bVar10);
          if (bVar10) {
            local_c = 0x3000000;
          }
          else {
            bVar10 = true;
            iVar5 = iVar8;
            pbVar4 = local_58;
            pbVar9 = &DAT_1010ece4;
            do {
              if (iVar5 == 0) break;
              iVar5 = iVar5 + -1;
              bVar10 = *pbVar4 == *pbVar9;
              pbVar4 = pbVar4 + 1;
              pbVar9 = pbVar9 + 1;
            } while (bVar10);
            if (bVar10) {
              local_c = 0x2000000;
            }
            else {
              bVar10 = true;
              iVar5 = iVar8;
              pbVar4 = local_58;
              pbVar9 = &DAT_1010ece0;
              do {
                if (iVar5 == 0) break;
                iVar5 = iVar5 + -1;
                bVar10 = *pbVar4 == *pbVar9;
                pbVar4 = pbVar4 + 1;
                pbVar9 = pbVar9 + 1;
              } while (bVar10);
              if (bVar10) {
                local_c = 0x1000000;
              }
              else {
                bVar10 = true;
                iVar5 = iVar8;
                pbVar4 = local_58;
                pbVar9 = &DAT_1010ecdc;
                do {
                  if (iVar5 == 0) break;
                  iVar5 = iVar5 + -1;
                  bVar10 = *pbVar4 == *pbVar9;
                  pbVar4 = pbVar4 + 1;
                  pbVar9 = pbVar9 + 1;
                } while (bVar10);
                if (bVar10) {
                  local_c = 0xf000000;
                }
                else {
                  bVar10 = true;
                  iVar5 = iVar8;
                  pbVar4 = local_58;
                  pbVar9 = &DAT_1010ecd8;
                  do {
                    if (iVar5 == 0) break;
                    iVar5 = iVar5 + -1;
                    bVar10 = *pbVar4 == *pbVar9;
                    pbVar4 = pbVar4 + 1;
                    pbVar9 = pbVar9 + 1;
                  } while (bVar10);
                  if (bVar10) {
                    local_c = 0xe000000;
                  }
                  else {
                    bVar10 = true;
                    pbVar4 = local_58;
                    pbVar9 = &DAT_1010ecd4;
                    do {
                      if (iVar8 == 0) break;
                      iVar8 = iVar8 + -1;
                      bVar10 = *pbVar4 == *pbVar9;
                      pbVar4 = pbVar4 + 1;
                      pbVar9 = pbVar9 + 1;
                    } while (bVar10);
                    if (!bVar10) goto LAB_10069668;
                    local_c = 0xd000000;
                  }
                }
              }
            }
          }
          local_28 = 0;
        }
      }
      else {
        iVar8 = 0;
        uVar3 = 0;
        do {
          pbVar9 = *(byte **)((int)&PTR_DAT_1010cbf0 + uVar3);
          pbVar4 = local_58;
          do {
            bVar2 = *pbVar4;
            bVar10 = bVar2 < *pbVar9;
            if (bVar2 != *pbVar9) {
LAB_10068e8e:
              iVar5 = (1 - (uint)bVar10) - (uint)(bVar10 != 0);
              goto LAB_10068e95;
            }
            if (bVar2 == 0) break;
            bVar2 = pbVar4[1];
            bVar10 = bVar2 < pbVar9[1];
            if (bVar2 != pbVar9[1]) goto LAB_10068e8e;
            pbVar4 = pbVar4 + 2;
            pbVar9 = pbVar9 + 2;
          } while (bVar2 != 0);
          iVar5 = 0;
LAB_10068e95:
          if (iVar5 == 0) break;
          uVar3 = uVar3 + 0x44;
          iVar8 = iVar8 + 1;
        } while (uVar3 < 0x1650);
        if (iVar8 == 0x54) goto LAB_10069668;
        iVar5 = *(int *)(local_14 + 0x38);
        uVar3 = *(uint *)(&DAT_1010cbf8 + (iVar8 * 0x11 + iVar5) * 4);
        if (uVar3 < 0xfffffffb) {
          if (uVar3 == 0xfffffffa) {
            local_8 = 0x10c;
          }
          else if (uVar3 == 0) {
            local_8 = 0x102;
          }
          else if (uVar3 == 1) {
            local_8 = 0x103;
          }
          else if (uVar3 == 2) {
            local_8 = 0x104;
          }
          else if (uVar3 == 3) {
            local_8 = 0x105;
          }
          else if (uVar3 == 4) {
            local_8 = 0x106;
          }
          else if (uVar3 == 5) {
            local_8 = 0x107;
          }
        }
        else if (uVar3 == 0xfffffffb) {
          local_8 = 0x10b;
        }
        else if (uVar3 == 0xfffffffc) {
          local_8 = 0x10a;
        }
        else if (uVar3 == 0xfffffffd) {
          local_8 = 0x108;
        }
        else if (uVar3 == 0xfffffffe) {
          local_8 = 0x109;
        }
        else if (uVar3 == 0xffffffff) {
          *(undefined4 *)(local_14 + 0x54) = 0x7e7;
          goto LAB_10069668;
        }
        local_44 = (&DAT_1010cbf4)[iVar8 * 0x11];
        local_40 = 0;
        if ((((5 < iVar5) && (iVar5 < 10)) && (0x102 < local_8)) && (local_8 < 0x108)) {
          local_28 = 1;
        }
        if (((((3 < iVar5) && (iVar5 < 6)) || ((5 < iVar5 && (iVar5 < 0xf)))) &&
            ((0x102 < local_8 && (local_8 < 0x108)))) && (local_44 != 0x1f)) {
          local_30 = 1;
        }
        if (9 < iVar5) {
          if ((iVar5 < 0xf) && (local_44 == 0x1f)) {
            local_34 = 1;
          }
          if ((((9 < iVar5) && (iVar5 < 0xf)) && (0x102 < local_8)) && (local_8 < 0x108)) {
            local_38 = 1;
          }
        }
        if ((((3 < iVar5) && (iVar5 < 6)) || ((9 < iVar5 && (iVar5 < 0xf)))) && (local_44 == 0x1f))
        {
          local_20 = 1;
        }
        if (((0xc < iVar5) && (iVar5 < 0xf)) && (local_44 == 0x1f)) {
          local_2c = 1;
        }
        if (((-1 < iVar5) && (iVar5 < 6)) && (local_44 == 0x1f)) {
          local_24 = 1;
        }
        if (((local_44 == 0x28) || (local_44 == 0x2c)) || (local_44 == 0x5e)) {
          local_1c = 1;
        }
        *(undefined4 *)(local_14 + 0x54) = 0x7e8;
      }
LAB_10069608:
    } while (*local_18 != 0);
    if (local_44 == 0x28) {
      if (local_1c != 0) goto LAB_10069663;
      if (*(int *)(&DAT_1010e248 + *(int *)(local_14 + 0x38) * 4) != -1) {
        local_44 = 0x29;
        local_8 = 0x10c;
        goto LAB_10069638;
      }
    }
    else {
LAB_10069638:
      if (local_44 == 0x2c) {
        if (local_1c != 0) goto LAB_10069663;
        if (*(int *)(&DAT_1010e290 + *(int *)(local_14 + 0x38) * 4) == -1) goto LAB_10069668;
        local_44 = 0x2d;
        local_8 = 0x10c;
      }
      if ((local_44 != 0x5e) || (local_1c == 0)) {
LAB_10069663:
        iVar8 = local_44;
        in_ECX = local_14;
        if (local_24 == 0) goto LAB_1006966f;
      }
    }
LAB_10069668:
    local_8 = 0x10d;
  }
  return local_8;
}


