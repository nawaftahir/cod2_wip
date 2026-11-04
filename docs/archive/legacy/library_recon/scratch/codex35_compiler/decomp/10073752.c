// Analysis output only; no reconstructed-source credit.
// 10073752 body=23580
//

/* WARNING: Type propagation algorithm not settling */

int FUN_10073752(IMAGE_DOS_HEADER *param_1,IMAGE_DOS_HEADER *param_2)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  int iVar10;
  float10 fVar11;
  float10 fVar12;
  char *pcVar13;
  char cVar14;
  word wVar15;
  int iVar16;
  IMAGE_DOS_HEADER *pIVar17;
  int iVar18;
  uint *puVar19;
  char *pcVar20;
  word *pwVar21;
  undefined4 uVar22;
  undefined4 *puVar23;
  IMAGE_DOS_HEADER *pIVar24;
  int in_ECX;
  uint uVar25;
  IMAGE_DOS_HEADER *pIVar26;
  uint uVar27;
  ulonglong uVar28;
  undefined8 uVar29;
  undefined8 uVar30;
  ulonglong uVar31;
  longlong lVar32;
  undefined1 local_1f8 [12];
  undefined1 local_1ec [12];
  undefined1 local_1e0 [12];
  undefined1 local_1d4 [12];
  undefined1 local_1c8 [12];
  undefined1 local_1bc [12];
  undefined1 local_1b0 [12];
  undefined1 local_1a4 [12];
  undefined1 local_198 [12];
  undefined1 local_18c [12];
  undefined1 local_180 [12];
  undefined1 local_174 [12];
  int local_168;
  undefined4 local_164;
  undefined4 local_160;
  undefined1 local_15c [12];
  undefined1 local_150 [12];
  uint *local_144;
  dword local_140;
  undefined4 local_13c;
  undefined1 local_138 [12];
  uint *local_12c;
  dword local_128;
  word local_124 [2];
  uint *local_120;
  word local_11c [2];
  word local_118 [2];
  undefined1 local_114 [4];
  undefined1 local_110 [4];
  undefined1 local_10c [4];
  int local_108;
  byte local_104 [4];
  undefined1 local_100 [16];
  byte local_f0 [4];
  byte local_ec [4];
  IMAGE_DOS_HEADER *local_e8;
  uint local_e4;
  int local_e0;
  undefined4 *local_dc;
  int local_d8;
  int local_d4;
  int local_d0;
  undefined1 local_cc [8];
  uint *local_c4;
  undefined1 local_c0 [8];
  IMAGE_DOS_HEADER *local_b8;
  undefined4 local_b4;
  uint local_b0;
  word local_ac [2];
  uint *local_a8 [2];
  word local_a0 [2];
  word local_9c [2];
  uint *local_98;
  word local_94 [2];
  dword local_90;
  uint *local_8c;
  byte local_88 [4];
  uint local_84;
  int local_80;
  int local_7c;
  uint *local_78;
  IMAGE_DOS_HEADER *local_74 [4];
  IMAGE_DOS_HEADER *local_64;
  IMAGE_DOS_HEADER *local_60;
  IMAGE_DOS_HEADER *local_5c [4];
  IMAGE_DOS_HEADER *local_4c [4];
  int local_3c;
  IMAGE_DOS_HEADER *local_38;
  uint *local_34;
  uint *local_30;
  IMAGE_DOS_HEADER *local_2c;
  IMAGE_DOS_HEADER *local_28;
  uint uStack_24;
  IMAGE_DOS_HEADER *local_20 [4];
  IMAGE_DOS_HEADER *local_10;
  IMAGE_DOS_HEADER *local_c;
  IMAGE_DOS_HEADER *local_8;

  if (param_1 == (IMAGE_DOS_HEADER *)0x0) {
    if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
      return -0x7fffbffb;
    }
    return 0;
  }
  if (*(int *)((int)param_1 + 4) != 0xd) {
    return -0x7fffbffb;
  }
  local_8 = (IMAGE_DOS_HEADER *)(*(int *)((int)param_1 + 0x14) * *(int *)((int)param_1 + 0x18));
  local_168 = *(int *)((int)param_1 + 0x24);
  if (*(int *)((int)param_1 + 0x1c) != 0x1a) {
    return -0x7fffbffb;
  }
  local_160 = *(undefined4 *)(in_ECX + 0x1c);
  local_28 = (IMAGE_DOS_HEADER *)0x0;
  uStack_24 = 0;
  local_20[0] = (IMAGE_DOS_HEADER *)0x0;
  local_20[1] = (IMAGE_DOS_HEADER *)0x0;
  local_c0._0_4_ = 0;
  local_c0._4_2_ = 0;
  local_c0._6_2_ = 0;
  local_b8 = (IMAGE_DOS_HEADER *)0x0;
  local_b4._0_2_ = 0;
  local_b4._2_2_ = 0;
  local_4c[0] = (IMAGE_DOS_HEADER *)0x0;
  local_4c[1] = (IMAGE_DOS_HEADER *)0x0;
  local_4c[2] = (IMAGE_DOS_HEADER *)0x0;
  local_4c[3] = (IMAGE_DOS_HEADER *)0x0;
  local_164 = *(undefined4 *)(in_ECX + 100);
  local_60 = (IMAGE_DOS_HEADER *)0xe000000;
  local_74[3] = *(IMAGE_DOS_HEADER **)(local_168 + 8);
  if (*(IMAGE_DOS_HEADER **)(local_168 + 8) == (IMAGE_DOS_HEADER *)0x0) {
LAB_10073882:
    local_60 = (IMAGE_DOS_HEADER *)0x0;
  }
  else {
    local_10 = (IMAGE_DOS_HEADER *)0x0;
    do {
      pIVar24 = local_10;
      iVar18 = *(int *)&local_74[3]->e_cparhdr;
      if (iVar18 != 0) {
        iVar16 = *(int *)(iVar18 + 0x18) * *(int *)(iVar18 + 0x14);
        *(int *)(local_c0 + (int)local_10) = iVar16;
        piVar1 = (int *)((int)&local_28 + (int)pIVar24);
        *piVar1 = iVar18;
        pIVar17 = operator_new(iVar16 * 4);
        *(IMAGE_DOS_HEADER **)(pIVar24->e_magic + (int)local_4c) = pIVar17;
        local_20[2] = pIVar17;
        if (pIVar17 == (IMAGE_DOS_HEADER *)0x0) goto LAB_100786b6;
        iVar18 = FUN_1007b5eb(*piVar1,pIVar17,0);
        if (iVar18 < 0) goto LAB_1007933c;
        if (*(int *)(local_c0 + (int)local_10) != 0) {
          iVar18 = *(int *)(local_c0 + (int)local_10);
          pIVar24 = local_20[2];
          do {
            local_60 = (IMAGE_DOS_HEADER *)
                       ((uint)local_60 &
                       **(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *(int *)pIVar24 * 4));
            pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
            iVar18 = iVar18 + -1;
          } while (iVar18 != 0);
        }
      }
      pwVar21 = &local_74[3]->e_maxalloc;
      local_10 = (IMAGE_DOS_HEADER *)&local_10->e_cp;
      local_74[3] = *(IMAGE_DOS_HEADER **)pwVar21;
    } while (*(IMAGE_DOS_HEADER **)pwVar21 != (IMAGE_DOS_HEADER *)0x0);
    if (local_60 == (IMAGE_DOS_HEADER *)0xe000000) goto LAB_10073882;
  }
  pIVar24 = local_8;
  uVar22 = local_c0._0_4_;
  *(IMAGE_DOS_HEADER **)(in_ECX + 100) = local_60;
  switch(*(undefined4 *)(*(int *)(*(int *)((int)param_1 + 0x20) + 8) + 0x18)) {
  case 0:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_20[3] = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (local_20[3] != (IMAGE_DOS_HEADER *)0x0) {
          iVar18 = FUN_1006c566(local_20[3],local_8);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_20[3],local_4c[0],0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = CONCAT44(4,local_20[3]);
          pIVar17 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20100000);
          pIVar24 = local_4c[0];
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
LAB_10073952:
      iVar16 = *(int *)(local_168 + 0xc);
      if (iVar16 != 0) {
        param_1 = (IMAGE_DOS_HEADER *)local_4c;
        do {
          if (*(int *)(iVar16 + 8) != 0) {
            *(IMAGE_DOS_HEADER **)(in_ECX + 0x1c) = *(IMAGE_DOS_HEADER **)param_1;
            iVar18 = FUN_1007b5eb(*(undefined4 *)(iVar16 + 8),0,0);
            if (iVar18 < 0) goto LAB_1007933c;
          }
          iVar16 = *(int *)(iVar16 + 0xc);
          param_1 = (IMAGE_DOS_HEADER *)((int)param_1 + 4);
        } while (iVar16 != 0);
      }
      iVar18 = 0;
      goto LAB_1007933c;
    }
    break;
  case 1:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        lVar32 = CONCAT44(local_8,param_2);
        param_2 = (IMAGE_DOS_HEADER *)0x0;
LAB_10073e6f:
        iVar18 = FUN_1006f676(param_1,local_4c[0],param_2,lVar32);
        goto LAB_10073948;
      }
      goto LAB_10073952;
    }
    break;
  case 2:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        if (local_c0._0_4_ == 1) {
          iVar18 = FUN_1006c566(local_20 + 2,1);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0)) ||
             (iVar18 = FUN_1006c566(param_2,1), pIVar24 = local_4c[0], iVar18 < 0))
          goto LAB_1007933c;
        }
        else {
          if (local_c0._0_4_ == 2) {
            iVar18 = FUN_1006c566(local_20 + 2,1);
            if (((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0)) ||
               ((iVar18 = FUN_1006c566(local_74 + 2,1), iVar18 < 0 ||
                (((iVar18 = FUN_1006c566(param_2,1), iVar18 < 0 ||
                  (iVar18 = FUN_1006e308(param_1,0x20500001,local_20 + 2,local_4c[0],
                                         &local_4c[0]->e_cp,0), iVar18 < 0)) ||
                 (iVar18 = FUN_10070d24(param_1,local_5c + 3,local_74 + 2,local_20 + 2,1),
                 iVar18 < 0)))))) goto LAB_1007933c;
            uVar31 = CONCAT44(0x17,local_5c + 3);
            pIVar24 = (IMAGE_DOS_HEADER *)(local_74 + 2);
            goto LAB_10073a65;
          }
          if (local_c0._0_4_ != 3) {
            pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
            if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
              uVar27 = 0;
              do {
                local_5c[uVar27] = pIVar24;
                uVar27 = uVar27 + 1;
                pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + uVar22 * 4);
              } while (uVar27 < 3);
              iVar18 = FUN_1006c566(local_5c[0],local_c0._0_4_);
              if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c[1],local_c0._0_4_), iVar18 < 0))
                  || ((iVar18 = FUN_1006c566(local_5c[2],local_c0._0_4_), iVar18 < 0 ||
                      ((iVar18 = FUN_1006c566(&local_10,1), iVar18 < 0 ||
                       (iVar18 = FUN_1006c566(local_20 + 2,1), iVar18 < 0)))))) ||
                 (iVar18 = FUN_1006c566(param_2,1), iVar18 < 0)) goto LAB_1007933c;
              local_60 = (IMAGE_DOS_HEADER *)(local_c0._0_4_ & 0xfffff);
              iVar18 = FUN_1006e308(param_1,(uint)local_60 | 0x20500000,local_5c[0],local_4c[0],
                                    local_4c[0],4);
              if ((((iVar18 < 0) ||
                   (iVar18 = FUN_1006e308(param_1,(uint)local_60 | 0x10100000,local_5c[1],
                                          local_5c[0],0,8), iVar18 < 0)) ||
                  (iVar18 = FUN_1006e308(param_1,(uint)local_60 | 0x20300000,local_5c[2],local_5c[1]
                                         ,local_5c[0],0x17), iVar18 < 0)) ||
                 ((iVar18 = FUN_1006e308(param_1,(uint)local_60 | 0x50000000,&local_10,local_5c[2],
                                         local_5c[2],6), iVar18 < 0 ||
                  (iVar18 = FUN_1006e308(param_1,0x10100001,local_20 + 2,&local_10,0,10), iVar18 < 0
                  )))) goto LAB_1007933c;
              uVar31 = CONCAT44(0x17,&local_10);
              pIVar17 = (IMAGE_DOS_HEADER *)0x20300001;
              pIVar24 = (IMAGE_DOS_HEADER *)(local_20 + 2);
              goto LAB_1007393e;
            }
            goto LAB_100786b6;
          }
          iVar18 = FUN_1006c566(local_5c + 1,2);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(local_20 + 2,1), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0 ||
              (((iVar18 = FUN_1006c566(param_2,1), iVar18 < 0 ||
                (iVar18 = FUN_1006e308(param_1,0x20500001,local_5c + 1,local_4c[0],
                                       &local_4c[0]->e_cp,0), iVar18 < 0)) ||
               (iVar18 = FUN_1006e308(param_1,0x20500001,local_5c + 2,local_5c + 1,
                                      &local_4c[0]->e_cparhdr,0), iVar18 < 0))))))
          goto LAB_1007933c;
          pIVar24 = (IMAGE_DOS_HEADER *)(local_5c + 2);
        }
        iVar18 = FUN_10070d24(param_1,local_20 + 2,local_5c + 3,CONCAT44(1,pIVar24));
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = CONCAT44(0x17,local_20 + 2);
        pIVar24 = (IMAGE_DOS_HEADER *)(local_5c + 3);
LAB_10073a65:
        pIVar17 = (IMAGE_DOS_HEADER *)0x20200001;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 3:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(&local_10,1);
        if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_20 + 2,1), iVar18 < 0)) ||
            (iVar18 = FUN_1006c566(param_2,1), iVar18 < 0)) ||
           ((iVar18 = FUN_1006e308(param_1,local_c0._0_4_ & 0xfffff | 0x50000000,&local_10,
                                   local_4c[0],local_4c[0],4), iVar18 < 0 ||
            (iVar18 = FUN_1006e308(param_1,0x10100001,local_20 + 2,&local_10,0,8), iVar18 < 0))))
        goto LAB_1007933c;
        uVar31 = CONCAT44(0x17,&local_10);
        pIVar24 = (IMAGE_DOS_HEADER *)(local_20 + 2);
        goto LAB_10073a65;
      }
      goto LAB_10073952;
    }
    break;
  case 4:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        lVar32 = ZEXT48(local_8) << 0x20;
        goto LAB_10073e6f;
      }
      goto LAB_10073952;
    }
    break;
  case 5:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        pIVar24 = (IMAGE_DOS_HEADER *)0x0;
LAB_10073ef2:
        iVar18 = FUN_1006fbf4(param_1,local_4c[0],pIVar24,CONCAT44(local_8,param_2));
        goto LAB_10073948;
      }
      goto LAB_10073952;
    }
    break;
  case 6:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,local_8);
        pIVar24 = local_4c[1];
        if (iVar18 < 0) goto LAB_1007933c;
        goto LAB_10073ef2;
      }
      goto LAB_10073952;
    }
    break;
  case 7:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_20[3] = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (local_20[3] != (IMAGE_DOS_HEADER *)0x0) {
          local_10 = (IMAGE_DOS_HEADER *)(local_20[3]->e_magic + (int)local_8 * 4);
          uVar30 = FUN_1006c566(local_20[3],local_8);
          iVar18 = (int)uVar30;
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006c566((int)((ulonglong)uVar30 >> 0x20),local_8), iVar18 < 0)) ||
             (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_20[3],local_4c[0],0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar22 = 0x14;
          uVar27 = (uint)local_c | 0x10400000;
LAB_10073faf:
          iVar18 = FUN_1006e308(param_1,uVar27,local_10,local_20[3],0,uVar22);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = CONCAT44(2,local_10);
          pIVar24 = local_4c[0];
          goto LAB_10073fd3;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 8:
    if (((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
        ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
       (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_20[3] = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (local_20[3] != (IMAGE_DOS_HEADER *)0x0) {
          iVar18 = FUN_1006c566(local_20[3],local_8);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20100000,local_20[3],local_4c[0],
                                local_4c[1],0);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = ZEXT48(local_4c[2]);
          pIVar24 = local_20[3];
LAB_10077d4c:
          pIVar17 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20000000);
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 9:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      iVar18 = FUN_10070bef(param_1,local_4c[0],local_c0._0_4_);
LAB_10073948:
      if (iVar18 < 0) goto LAB_1007933c;
      goto LAB_10073952;
    }
    break;
  case 10:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        lVar32 = CONCAT44(local_8,param_2);
        param_2 = (IMAGE_DOS_HEADER *)0x0;
LAB_10077f58:
        iVar18 = FUN_1006edd4(param_1,local_4c[0],param_2,lVar32);
        goto LAB_10073948;
      }
      goto LAB_10073952;
    }
    break;
  case 0xb:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        fVar12 = (float10)log2((float10)2.0);
        local_5c[2] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   (double)((float10)1.0 / ((float10)0.6931471805599453 * fVar12)));
        local_74[1] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   0x3fe0000000000000);
        pIVar24 = local_8;
        puVar19 = (uint *)FUN_1006c449();
        if (puVar19 != (uint *)0x0) {
          uVar27 = 0;
          do {
            (&local_34)[uVar27] = puVar19;
            uVar27 = uVar27 + 1;
            puVar19 = puVar19 + (int)pIVar24;
          } while (uVar27 < 7);
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            pIVar17 = local_20[1];
            do {
              *(IMAGE_DOS_HEADER **)(((int)local_20[0] - (int)local_20[1]) + (int)pIVar17) =
                   local_5c[2];
              *(IMAGE_DOS_HEADER **)pIVar17 = local_74[1];
              pIVar17 = (IMAGE_DOS_HEADER *)&pIVar17->e_cp;
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24[-1].e_program + 0x3f);
            } while (pIVar24 != (IMAGE_DOS_HEADER *)0x0);
          }
          iVar18 = FUN_1006c566(local_34,local_8);
          if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_30,local_8), iVar18 < 0)) ||
              (iVar18 = FUN_1006c566(local_2c,local_8), iVar18 < 0)) ||
             (((iVar18 = FUN_1006c566(local_28,local_8), iVar18 < 0 ||
               (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
              (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)))) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          local_64 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20500000);
          iVar18 = FUN_1006e308(param_1,local_64,local_34,local_4c[0],local_20[0],0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_10 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10500000);
          iVar18 = FUN_1006e308(param_1,local_10,local_30,local_34,0,4);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_2c,local_34,0,0),
              iVar18 < 0)) ||
             ((iVar18 = FUN_1006e308(param_1,local_10,local_28,local_2c,0,4), iVar18 < 0 ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20400000,uStack_24,local_30,local_28,
                                     4), iVar18 < 0)))) goto LAB_1007933c;
          uVar22 = 4;
LAB_100742ce:
          uVar31 = CONCAT44(uVar22,local_20[1]);
          pIVar17 = local_64;
          pIVar24 = (IMAGE_DOS_HEADER *)uStack_24;
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0xc:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_5c[0] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cp;
        local_5c[1] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cparhdr;
        local_5c[2] = *(IMAGE_DOS_HEADER **)local_4c[0];
        local_cc._0_4_ = *(undefined4 *)&local_4c[1]->e_cparhdr;
        local_cc._4_4_ = *(undefined4 *)local_4c[1];
        local_c4 = *(uint **)&local_4c[1]->e_cp;
        local_150._0_4_ = *(undefined4 *)&local_4c[0]->e_cparhdr;
        local_150[4] = local_4c[0]->e_magic[0];
        local_150[5] = local_4c[0]->e_magic[1];
        local_150._6_2_ = local_4c[0]->e_cblp;
        local_150._8_2_ = local_4c[0]->e_cp;
        local_150._10_2_ = local_4c[0]->e_crlc;
        local_78 = *(uint **)&local_4c[1]->e_cp;
        local_74[0] = *(IMAGE_DOS_HEADER **)&local_4c[1]->e_cparhdr;
        local_74[1] = *(IMAGE_DOS_HEADER **)local_4c[1];
        uVar30 = FUN_1006c566(&uStack_24,3);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar30 = FUN_1006c566(local_15c,(int)((ulonglong)uVar30 >> 0x20));
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar30 = FUN_1006c566(local_c0 + 4,(int)((ulonglong)uVar30 >> 0x20));
        iVar18 = (int)uVar30;
        if ((iVar18 < 0) ||
           (iVar18 = FUN_1006c566(param_2,(int)((ulonglong)uVar30 >> 0x20)), iVar18 < 0))
        goto LAB_1007933c;
        local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
        local_64 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20500000);
        iVar18 = FUN_1006e308(param_1,local_64,&uStack_24,local_5c,local_cc,0);
        if ((iVar18 < 0) ||
           ((iVar18 = FUN_1006e308(param_1,local_64,local_15c,local_150,&local_78,0), iVar18 < 0 ||
            (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_c0 + 4,local_15c,0,0),
            iVar18 < 0)))) goto LAB_1007933c;
        uVar31 = ZEXT48(local_c0 + 4);
        pIVar24 = (IMAGE_DOS_HEADER *)&uStack_24;
LAB_10073fd3:
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20400000);
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0xd:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = 0;
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x10d00000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0xe:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = 0;
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x10e00000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0xf:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = 0x404ca5dc0d03cf26;
LAB_1007742c:
        uVar22 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,uVar30);
        puVar23 = (undefined4 *)FUN_1006c449();
        if (puVar23 != (undefined4 *)0x0) {
          pIVar24 = local_8;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            for (; pIVar24 != (IMAGE_DOS_HEADER *)0x0;
                pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24[-1].e_program + 0x3f)) {
              *puVar23 = uVar22;
              puVar23 = puVar23 + 1;
            }
          }
          goto LAB_10077464;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x10:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        if (local_c0._0_4_ != 1) {
          iVar2._0_2_ = local_28->e_ip;
          iVar2._2_2_ = local_28->e_cs;
          if (iVar2 == 2) {
            iVar18 = FUN_1006c566(local_cc,3);
            if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
            goto LAB_1007933c;
            local_74[0] = *(IMAGE_DOS_HEADER **)local_4c[0];
            local_5c[1] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_maxalloc;
            local_74[1] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cp;
            local_5c[2] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cparhdr;
            iVar18 = FUN_1006e308(param_1,0x20500002,local_cc,local_74,local_5c + 1,0);
            if ((iVar18 < 0) ||
               (iVar18 = FUN_1006e308(param_1,0x10100001,&local_c4,local_cc + 4,0,0), iVar18 < 0))
            goto LAB_1007933c;
            uVar31 = ZEXT48(&local_c4);
            pIVar24 = (IMAGE_DOS_HEADER *)local_cc;
LAB_100745da:
            pIVar17 = (IMAGE_DOS_HEADER *)0x20400001;
          }
          else if (iVar2 == 3) {
            uVar30 = FUN_1006c566(local_15c,3);
            iVar18 = (int)uVar30;
            if (iVar18 < 0) goto LAB_1007933c;
            uVar30 = FUN_1006c566(&uStack_24,(int)((ulonglong)uVar30 >> 0x20));
            iVar18 = (int)uVar30;
            if (iVar18 < 0) goto LAB_1007933c;
            uVar30 = FUN_1006c566(local_c0 + 4,(int)((ulonglong)uVar30 >> 0x20));
            iVar18 = (int)uVar30;
            if (((iVar18 < 0) ||
                (iVar18 = FUN_1006c566(local_150,(int)((ulonglong)uVar30 >> 0x20)), iVar18 < 0)) ||
               (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) goto LAB_1007933c;
            local_5c[0] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_sp;
            local_5c[1] = *(IMAGE_DOS_HEADER **)local_4c[0]->e_res_4_;
            local_5c[2] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cp;
            local_78 = *(uint **)(local_4c[0]->e_res_4_ + 2);
            local_74[0] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cparhdr;
            local_74[1] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_ip;
            iVar18 = FUN_1006e308(param_1,0x20500003,local_15c,local_5c,&local_78,0);
            if (iVar18 < 0) goto LAB_1007933c;
            local_5c[0] = *(IMAGE_DOS_HEADER **)local_4c[0]->e_res_4_;
            local_5c[1] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cp;
            local_5c[2] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_sp;
            local_78 = *(uint **)&local_4c[0]->e_ip;
            local_74[0] = *(IMAGE_DOS_HEADER **)(local_4c[0]->e_res_4_ + 2);
            local_74[1] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_cparhdr;
            iVar18 = FUN_1006e308(param_1,0x20500003,&uStack_24,local_5c,&local_78,0);
            if (((iVar18 < 0) ||
                (iVar18 = FUN_1006e308(param_1,0x10100003,local_c0 + 4,&uStack_24,0,0), iVar18 < 0))
               || (iVar18 = FUN_1006e308(param_1,0x20400003,local_150,local_15c,local_c0 + 4,0),
                  iVar18 < 0)) goto LAB_1007933c;
            local_5c[0] = *(IMAGE_DOS_HEADER **)local_4c[0];
            local_5c[1] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_maxalloc;
            local_5c[2] = *(IMAGE_DOS_HEADER **)&local_4c[0]->e_lfarlc;
            uVar31 = ZEXT48(local_5c);
            pIVar17 = (IMAGE_DOS_HEADER *)0x50000003;
            pIVar24 = (IMAGE_DOS_HEADER *)local_150;
          }
          else {
            if (iVar2 != 4) goto LAB_10073952;
            uVar30 = FUN_1006c566(local_1c8,0xc);
            iVar18 = (int)uVar30;
            if (iVar18 < 0) goto LAB_1007933c;
            uVar30 = FUN_1006c566(local_198,(int)((ulonglong)uVar30 >> 0x20));
            iVar18 = (int)uVar30;
            if (iVar18 < 0) goto LAB_1007933c;
            uVar30 = FUN_1006c566(local_1f8,(int)((ulonglong)uVar30 >> 0x20));
            iVar18 = (int)uVar30;
            if ((((iVar18 < 0) ||
                 (iVar18 = FUN_1006c566(local_100,(int)((ulonglong)uVar30 >> 0x20)), iVar18 < 0)) ||
                (iVar18 = FUN_1006c566(&local_28,4), iVar18 < 0)) ||
               (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) goto LAB_1007933c;
            local_b0 = *(uint *)local_4c[0]->e_res2_10_;
            local_ac = *(word (*) [2])(local_4c[0]->e_res2_10_ + 8);
            local_a8[0] = *(uint **)&local_4c[0]->e_lfarlc;
            local_a8[1] = *(uint **)(local_4c[0]->e_res2_10_ + 8);
            local_a0[0] = local_4c[0]->e_cparhdr;
            local_a0[1] = local_4c[0]->e_minalloc;
            local_9c = *(word (*) [2])local_4c[0]->e_res2_10_;
            local_98 = *(uint **)&local_4c[0]->e_lfarlc;
            local_94 = *(word (*) [2])(local_4c[0]->e_res2_10_ + 8);
            local_90._0_2_ = local_4c[0]->e_cparhdr;
            local_90._2_2_ = local_4c[0]->e_minalloc;
            local_8c = *(uint **)local_4c[0]->e_res2_10_;
            local_88 = *(byte (*) [4])&local_4c[0]->e_cparhdr;
            local_84._0_2_ = local_4c[0]->e_lfarlc;
            local_84._2_2_ = local_4c[0]->e_ovno;
            local_144 = (uint *)local_4c[0]->e_lfanew;
            local_140 = *(dword *)local_4c[0]->e_res_4_;
            local_13c._0_2_ = local_4c[0]->e_res2_10_[2];
            local_13c._2_2_ = local_4c[0]->e_res2_10_[3];
            local_138._0_4_ = *(undefined4 *)(local_4c[0]->e_res2_10_ + 2);
            local_138._4_4_ = local_4c[0]->e_lfanew;
            local_138._8_2_ = local_4c[0]->e_maxalloc;
            local_138._10_2_ = local_4c[0]->e_ss;
            local_12c = (uint *)local_4c[0]->e_lfanew;
            local_128._0_2_ = local_4c[0]->e_maxalloc;
            local_128._2_2_ = local_4c[0]->e_ss;
            local_124 = *(word (*) [2])local_4c[0]->e_res_4_;
            local_120 = *(uint **)local_4c[0]->e_res_4_;
            local_11c = *(word (*) [2])(local_4c[0]->e_res2_10_ + 2);
            local_118[0] = local_4c[0]->e_maxalloc;
            local_118[1] = local_4c[0]->e_ss;
            iVar18 = FUN_1006e308(param_1,0x20500003,local_1c8,local_c0 + 0x10,&local_144,0);
            if (((iVar18 < 0) ||
                (iVar18 = FUN_1006e308(param_1,0x20500003,local_1bc,local_a8 + 1,local_138,0),
                iVar18 < 0)) ||
               ((iVar18 = FUN_1006e308(param_1,0x20500003,local_1b0,&local_98,&local_12c,0),
                iVar18 < 0 ||
                (iVar18 = FUN_1006e308(param_1,0x20500003,local_1a4,&local_8c,&local_120,0),
                iVar18 < 0)))) goto LAB_1007933c;
            local_b0 = *(uint *)(local_4c[0]->e_res2_10_ + 8);
            local_ac[0] = local_4c[0]->e_lfarlc;
            local_ac[1] = local_4c[0]->e_ovno;
            local_a8[0] = *(uint **)local_4c[0]->e_res2_10_;
            local_a8[1] = *(uint **)local_4c[0]->e_res2_10_;
            local_a0 = *(word (*) [2])(local_4c[0]->e_res2_10_ + 8);
            local_9c[0] = local_4c[0]->e_cparhdr;
            local_9c[1] = local_4c[0]->e_minalloc;
            local_98 = *(uint **)(local_4c[0]->e_res2_10_ + 8);
            local_94[0] = local_4c[0]->e_cparhdr;
            local_94[1] = local_4c[0]->e_minalloc;
            local_90._0_2_ = local_4c[0]->e_lfarlc;
            local_90._2_2_ = local_4c[0]->e_ovno;
            local_8c = *(uint **)&local_4c[0]->e_lfarlc;
            local_88 = *(byte (*) [4])local_4c[0]->e_res2_10_;
            local_84._0_2_ = local_4c[0]->e_cparhdr;
            local_84._2_2_ = local_4c[0]->e_minalloc;
            local_144 = *(uint **)(local_4c[0]->e_res2_10_ + 2);
            local_140 = local_4c[0]->e_lfanew;
            local_13c._0_2_ = local_4c[0]->e_res_4_[0];
            local_13c._2_2_ = local_4c[0]->e_res_4_[1];
            local_138._0_4_ = local_4c[0]->e_lfanew;
            local_138._4_2_ = local_4c[0]->e_maxalloc;
            local_138._6_2_ = local_4c[0]->e_ss;
            local_138._8_4_ = *(undefined4 *)(local_4c[0]->e_res2_10_ + 2);
            local_12c = *(uint **)local_4c[0]->e_res_4_;
            local_128 = local_4c[0]->e_lfanew;
            local_124[0] = local_4c[0]->e_maxalloc;
            local_124[1] = local_4c[0]->e_ss;
            local_120 = *(uint **)(local_4c[0]->e_res2_10_ + 2);
            local_11c[0] = local_4c[0]->e_maxalloc;
            local_11c[1] = local_4c[0]->e_ss;
            local_118 = *(word (*) [2])local_4c[0]->e_res_4_;
            iVar18 = FUN_1006e308(param_1,0x20500003,local_198,local_c0 + 0x10,&local_144,0);
            if ((((iVar18 < 0) ||
                 (iVar18 = FUN_1006e308(param_1,0x20500003,local_18c,local_a8 + 1,local_138,0),
                 iVar18 < 0)) ||
                ((iVar18 = FUN_1006e308(param_1,0x20500003,local_180,&local_98,&local_12c,0),
                 iVar18 < 0 ||
                 (((iVar18 = FUN_1006e308(param_1,0x20500003,local_174,&local_8c,&local_120,0),
                   iVar18 < 0 ||
                   (iVar18 = FUN_1006e308(param_1,0x10100003,local_1f8,local_198,0,0), iVar18 < 0))
                  || (iVar18 = FUN_1006e308(param_1,0x10100003,local_1ec,local_18c,0,0), iVar18 < 0)
                  ))))) ||
               ((((iVar18 = FUN_1006e308(param_1,0x10100003,local_1e0,local_180,0,0), iVar18 < 0 ||
                  (iVar18 = FUN_1006e308(param_1,0x10100003,local_1d4,local_174,0,0), iVar18 < 0))
                 || ((iVar18 = FUN_1006e308(param_1,0x20400003,local_100,local_1c8,local_1f8,0),
                     iVar18 < 0 ||
                     ((iVar18 = FUN_1006e308(param_1,0x20400003,local_100 + 0xc,local_1bc,local_1ec,
                                             0), iVar18 < 0 ||
                      (iVar18 = FUN_1006e308(param_1,0x20400003,&local_e8,local_1b0,local_1e0,0),
                      iVar18 < 0)))))) ||
                (iVar18 = FUN_1006e308(param_1,0x20400003,&local_dc,local_1a4,local_1d4,0),
                iVar18 < 0)))) goto LAB_1007933c;
            local_b0._0_2_ = local_4c[0]->e_ip;
            local_b0._2_2_ = local_4c[0]->e_cs;
            local_ac[0] = local_4c[0]->e_oemid;
            local_ac[1] = local_4c[0]->e_oeminfo;
            local_a8[0] = *(uint **)(local_4c[0]->e_res2_10_ + 6);
            local_a8[1] = *(uint **)&local_4c[0]->e_cp;
            local_a0[0] = local_4c[0]->e_oemid;
            local_a0[1] = local_4c[0]->e_oeminfo;
            local_9c = *(word (*) [2])(local_4c[0]->e_res2_10_ + 6);
            local_98 = *(uint **)&local_4c[0]->e_cp;
            local_94[0] = local_4c[0]->e_ip;
            local_94[1] = local_4c[0]->e_cs;
            local_90 = *(dword *)(local_4c[0]->e_res2_10_ + 6);
            local_8c = *(uint **)&local_4c[0]->e_cp;
            local_88 = *(byte (*) [4])&local_4c[0]->e_ip;
            local_84._0_2_ = local_4c[0]->e_oemid;
            local_84._2_2_ = local_4c[0]->e_oeminfo;
            iVar18 = FUN_1006e308(param_1,0x50000003,&local_28,local_100,local_c0 + 0x10,0);
            if ((((iVar18 < 0) ||
                 (iVar18 = FUN_1006e308(param_1,0x50000003,&uStack_24,local_100 + 0xc,local_a8 + 1,0
                                       ), iVar18 < 0)) ||
                (iVar18 = FUN_1006e308(param_1,0x50000003,local_20,&local_e8,&local_98,0),
                iVar18 < 0)) ||
               (iVar18 = FUN_1006e308(param_1,0x50000003,local_20 + 1,&local_dc,&local_8c,0),
               iVar18 < 0)) goto LAB_1007933c;
            local_b0._0_1_ = local_4c[0]->e_magic[0];
            local_b0._1_1_ = local_4c[0]->e_magic[1];
            local_b0._2_2_ = local_4c[0]->e_cblp;
            local_ac[0] = local_4c[0]->e_sp;
            local_ac[1] = local_4c[0]->e_csum;
            local_a8[0] = *(uint **)(local_4c[0]->e_res_4_ + 2);
            local_a8[1] = *(uint **)(local_4c[0]->e_res2_10_ + 4);
            uVar31 = ZEXT48(local_c0 + 0x10);
            pIVar17 = (IMAGE_DOS_HEADER *)0x50000004;
            pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
          }
LAB_1007393e:
          iVar18 = FUN_1006e308(param_1,pIVar17,param_2,pIVar24,uVar31);
          goto LAB_10073948;
        }
        cVar14 = local_4c[0]->e_magic[1];
        wVar15 = local_4c[0]->e_cblp;
        param_2->e_magic[0] = local_4c[0]->e_magic[0];
        param_2->e_magic[1] = cVar14;
        param_2->e_cblp = wVar15;
      }
      goto LAB_10073952;
    }
    break;
  case 0x11:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c449();
        if (iVar18 != 0) {
          uVar27 = 0;
          do {
            local_5c[uVar27 + 1] = (IMAGE_DOS_HEADER *)iVar18;
            uVar27 = uVar27 + 1;
            iVar18 = iVar18 + uVar22 * 4;
          } while (uVar27 < 2);
          iVar18 = FUN_1006c566(local_5c[1],local_c0._0_4_);
          if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c[2],local_c0._0_4_), iVar18 < 0)) ||
              (iVar18 = FUN_1006c566(local_20 + 2,1), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0 ||
              (iVar18 = FUN_1006c566(param_2,1), iVar18 < 0)))) goto LAB_1007933c;
          local_60 = (IMAGE_DOS_HEADER *)(local_c0._0_4_ & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_60 | 0x10100000,local_5c[1],local_4c[1],0,0);
          if ((iVar18 < 0) ||
             (iVar18 = FUN_1006e308(param_1,(uint)local_60 | 0x20400000,local_5c[2],local_4c[0],
                                    local_5c[1],0), pIVar17 = local_5c[2], pIVar24 = local_60,
             iVar18 < 0)) goto LAB_1007933c;
LAB_10074f35:
          iVar18 = FUN_1006e308(param_1,(uint)pIVar24 | 0x50000000,local_20 + 2,pIVar17,
                                CONCAT44(4,pIVar17));
          if ((iVar18 < 0) ||
             (iVar18 = FUN_1006e308(param_1,&DAT_10700001,local_5c + 3,local_20 + 2,0,4), iVar18 < 0
             )) goto LAB_1007933c;
          uVar31 = 0x400000000;
          pIVar17 = (IMAGE_DOS_HEADER *)&DAT_10300001;
          pIVar24 = (IMAGE_DOS_HEADER *)(local_5c + 3);
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x12:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)(local_c0._0_4_ & 0xfffff | 0x50000000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x13:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_38 = *(IMAGE_DOS_HEADER **)(in_ECX + 0x20);
        local_34 = *(uint **)&local_4c[0]->e_cp;
        local_30 = *(uint **)&local_4c[0]->e_cparhdr;
        uStack_24 = *(uint *)&local_4c[1]->e_cp;
        local_20[1] = *(IMAGE_DOS_HEADER **)&local_4c[1]->e_maxalloc;
        local_2c = local_38;
        local_28 = local_38;
        local_20[0] = local_38;
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(&local_28);
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x20500000);
        pIVar24 = (IMAGE_DOS_HEADER *)&local_38;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x14:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        fVar12 = (float10)log2((float10)2.0);
        local_5c[2] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   (double)((float10)1.0 / ((float10)0.6931471805599453 * fVar12)));
        pIVar24 = local_8;
        iVar18 = FUN_1006c449();
        if (iVar18 != 0) {
          uVar27 = 0;
          do {
            *(int *)(local_cc + uVar27 * 4) = iVar18;
            uVar27 = uVar27 + 1;
            iVar18 = iVar18 + (int)pIVar24 * 4;
          } while (uVar27 < 3);
          pIVar17 = local_8;
          puVar23 = (undefined4 *)local_cc._0_4_;
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            for (; pIVar17 != (IMAGE_DOS_HEADER *)0x0;
                pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17[-1].e_program + 0x3f)) {
              *puVar23 = local_5c[2];
              puVar23 = puVar23 + 1;
            }
          }
          iVar18 = FUN_1006c566(local_cc._4_4_,local_8);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20500000,local_cc._4_4_,local_4c[0],
                                local_cc._0_4_,0);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = 0x400000000;
          pIVar17 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10500000);
          pIVar24 = (IMAGE_DOS_HEADER *)local_cc._4_4_;
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x15:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = 0x400000000;
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x10500000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x16:
    if (((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
        ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
       (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(local_20 + 2,1);
        if ((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0)) goto LAB_1007933c;
        local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
        iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x50000000,local_20 + 2,local_4c[1],
                              local_4c[2],0);
        if ((iVar18 < 0) ||
           (iVar18 = FUN_1006e308(param_1,0x20300001,local_5c + 3,local_20 + 2,in_ECX + 0x24,0x17),
           iVar18 < 0)) goto LAB_1007933c;
        iVar18 = (int)local_8 * 4;
        pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            (&local_28)[uVar27] = pIVar24;
            uVar27 = uVar27 + 1;
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + iVar18);
          } while (uVar27 < 4);
          pIVar24 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            do {
              *(IMAGE_DOS_HEADER **)(local_20[1]->e_magic + (int)pIVar24 * 4) = local_5c[3];
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
            } while (pIVar24 < local_8);
          }
          iVar18 = FUN_1006c566(local_28,local_8);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_20[0],local_8), iVar18 < 0 ||
              ((iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0 ||
               (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_28,local_4c[0],0,0),
               iVar18 < 0)))))) goto LAB_1007933c;
          local_74[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20400000);
          iVar18 = FUN_1006e308(param_1,local_74[3],uStack_24,local_28,local_28,0);
          if ((iVar18 < 0) ||
             (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20500000,local_20[0],uStack_24,
                                    local_20[1],0), iVar18 < 0)) goto LAB_1007933c;
          uVar31 = ZEXT48(local_20[0]);
          pIVar17 = local_74[3];
          pIVar24 = local_4c[0];
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x17:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_20[3] = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (local_20[3] != (IMAGE_DOS_HEADER *)0x0) {
          local_10 = (IMAGE_DOS_HEADER *)(local_20[3]->e_magic + (int)local_8 * 4);
          uVar30 = FUN_1006c566(local_20[3],local_8);
          iVar18 = (int)uVar30;
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006c566((int)((ulonglong)uVar30 >> 0x20),local_8), iVar18 < 0)) ||
             (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10400000,local_20[3],local_4c[0],0,0x14);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar22 = 0x18;
          uVar27 = (uint)local_c | 0x10100000;
          goto LAB_10073faf;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x18:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            (&local_38)[uVar27] = pIVar17;
            uVar27 = uVar27 + 1;
            pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
          } while (uVar27 < 8);
          uVar27 = 0;
          do {
            uVar30 = FUN_1006c566((&local_38)[uVar27],local_8);
            iVar18 = (int)uVar30;
            if (iVar18 < 0) goto LAB_1007933c;
            uVar27 = (int)((ulonglong)uVar30 >> 0x20) + 1;
          } while (uVar27 < 8);
          iVar18 = FUN_1006c566(param_2,local_8);
          if (iVar18 < 0) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10300000,local_38,local_4c[1],0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_64 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20500000);
          iVar18 = FUN_1006e308(param_1,local_64,local_34,local_4c[0],local_38,0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
          iVar18 = FUN_1006e308(param_1,local_20[3],local_30,local_34,0,0);
          if ((((iVar18 < 0) ||
               (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20100000,local_2c,local_34,local_30,
                                      4), iVar18 < 0)) ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10400000,local_28,local_2c,0,0x14),
              iVar18 < 0)) ||
             (((iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20300000,uStack_24,local_34,local_30
                                      ,0x17), iVar18 < 0 ||
               (iVar18 = FUN_1006e308(param_1,local_20[3],local_20[0],local_28,0,0), iVar18 < 0)) ||
              (iVar18 = FUN_1007041a(param_1,local_20[1],local_20[0],local_28,uStack_24,local_8),
              iVar18 < 0)))) goto LAB_1007933c;
          uVar31 = ZEXT48(local_4c[1]);
          pIVar17 = local_64;
          pIVar24 = local_20[1];
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x19:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = 0;
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x10400000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x1a:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      local_10 = (IMAGE_DOS_HEADER *)((int)local_8 << 2);
      local_4c[1] = operator_new((uint)local_10);
      if ((local_4c[1] == (IMAGE_DOS_HEADER *)0x0) ||
         (puVar19 = (uint *)FUN_1006c449(), puVar19 == (uint *)0x0)) goto LAB_100786b6;
      uVar27 = 0;
      do {
        local_a8[uVar27] = puVar19;
        puVar19 = (uint *)((int)puVar19 + (int)local_10);
        uVar27 = uVar27 + 1;
      } while (uVar27 < 10);
      iVar18 = FUN_1006c566(local_a8[0],local_8);
      if (((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_a8[1],local_8), iVar18 < 0)) ||
           (iVar18 = FUN_1006c566(local_a0,local_8), iVar18 < 0)) ||
          (((iVar18 = FUN_1006c566(local_9c,local_8), iVar18 < 0 ||
            (iVar18 = FUN_1006c566(local_98,local_8), iVar18 < 0)) ||
           ((iVar18 = FUN_1006c566(local_94,local_8), iVar18 < 0 ||
            ((iVar18 = FUN_1006c566(local_90,local_8), iVar18 < 0 ||
             (iVar18 = FUN_1006c566(local_8c,local_8), iVar18 < 0)))))))) ||
         (iVar18 = FUN_1006c566(local_4c[1],local_8), iVar18 < 0)) goto LAB_1007933c;
      local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
      local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
      iVar18 = FUN_1006e308(param_1,local_20[3],local_a8[0],local_4c[0],0,0);
      if ((((iVar18 < 0) ||
           (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20100000,local_a8[1],local_a8[0],
                                  local_4c[0],4), iVar18 < 0)) ||
          (iVar18 = FUN_1006e308(param_1,local_20[3],local_a0,local_a8[1],0,8), iVar18 < 0)) ||
         (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20300000,local_9c,local_a0,local_a8[1],
                                0x17), iVar18 < 0)) goto LAB_1007933c;
      local_74[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20400000);
      iVar18 = FUN_1006e308(param_1,local_74[3],local_98,local_9c,local_a8[1],4);
      if (((iVar18 < 0) ||
          (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10600000,local_94,local_98,0,0),
          iVar18 < 0)) ||
         ((iVar18 = FUN_1006e308(param_1,local_20[3],local_90,local_94,0,0), iVar18 < 0 ||
          ((iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10400000,local_8c,local_90,0,0x14),
           iVar18 < 0 ||
           (iVar18 = FUN_1006e308(param_1,local_74[3],local_4c[1],local_94,local_8c,2), iVar18 < 0))
          )))) goto LAB_1007933c;
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(local_88,local_8);
        if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_84,local_8), iVar18 < 0)) ||
            (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) ||
           ((iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10500000,local_88,local_4c[1],0,4),
            iVar18 < 0 ||
            (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10300000,local_84,local_88,0,4),
            iVar18 < 0)))) goto LAB_1007933c;
        uVar31 = (ulonglong)local_84;
        pIVar17 = local_c;
        pIVar24 = local_4c[0];
        goto LAB_1007865f;
      }
      goto LAB_10073952;
    }
    break;
  case 0x1b:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        puVar19 = (uint *)FUN_1006c449();
        if (puVar19 != (uint *)0x0) {
          uVar27 = 0;
          do {
            (&local_30)[uVar27] = puVar19;
            uVar27 = uVar27 + 1;
            puVar19 = puVar19 + (int)pIVar24;
          } while (uVar27 < 6);
          iVar18 = FUN_1006c566(local_30,local_8);
          if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_2c,local_8), iVar18 < 0)) ||
              ((iVar18 = FUN_1006c566(local_28,local_8), iVar18 < 0 ||
               (((iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0 ||
                 (iVar18 = FUN_1006c566(local_20[0],local_8), iVar18 < 0)) ||
                (iVar18 = FUN_1006c566(local_20[1],local_8), iVar18 < 0)))))) ||
             (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10d00000,local_30,local_4c[0],0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
          iVar18 = FUN_1006e308(param_1,local_20[3],local_2c,local_30,0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_5c[2] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20100000);
          iVar18 = FUN_1006e308(param_1,local_5c[2],local_28,local_2c,local_30,4);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10e00000,uStack_24,local_4c[0],0,0),
              iVar18 < 0)) ||
             ((iVar18 = FUN_1006e308(param_1,local_20[3],local_20[0],uStack_24,0,0), iVar18 < 0 ||
              (iVar18 = FUN_1006e308(param_1,local_5c[2],local_20[1],local_20[0],uStack_24,4),
              iVar18 < 0)))) goto LAB_1007933c;
          uVar31 = CONCAT44(4,local_20[1]);
          pIVar24 = local_28;
          goto LAB_10073fd3;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x1c:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        if ((*(byte *)(*(int *)(in_ECX + 8) + 0x6e) & 0x10) == 0) {
          iVar18 = (int)local_8 * 4;
          pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
          if (pIVar24 == (IMAGE_DOS_HEADER *)0x0) goto LAB_100786b6;
          uVar27 = 0;
          do {
            (&local_28)[uVar27] = pIVar24;
            uVar27 = uVar27 + 1;
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + iVar18);
          } while (uVar27 < 4);
          iVar18 = FUN_1006c566(local_28,local_8);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_20[0],local_8), iVar18 < 0 ||
              ((iVar18 = FUN_1006c566(local_20[1],local_8), iVar18 < 0 ||
               (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)))))) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
          iVar18 = FUN_1006e308(param_1,local_20[3],local_28,local_4c[0],0,0x40);
          if ((iVar18 < 0) ||
             ((((iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20400000,uStack_24,local_4c[0],
                                       local_28,0x40), iVar18 < 0 ||
                (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20500000,local_20[0],uStack_24,
                                       uStack_24,0x40), iVar18 < 0)) ||
               (iVar18 = FUN_1006e308(param_1,local_20[3],local_20[1],local_20[0],0,0x40),
               iVar18 < 0)) ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20300000,param_2,local_20[1],
                                     local_20[0],0x57), iVar18 < 0)))) goto LAB_1007933c;
          local_10 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            iVar16 = (int)local_4c[0] - (int)param_2;
            param_1 = param_2;
            do {
              iVar18 = FUN_1006c8ca(*(undefined4 *)(iVar16 + (int)param_1),&local_28);
              if (iVar18 < 0) goto LAB_1007933c;
              if (((double)CONCAT44(uStack_24,local_28) <= *(double *)(in_ECX + 0xa8)) ||
                 (*(double *)(in_ECX + 0xa0) <= (double)CONCAT44(local_20[1],local_20[0]))) {
                if (((double)CONCAT44(uStack_24,local_28) == *(double *)(in_ECX + 0xa0)) ||
                   ((double)CONCAT44(local_20[1],local_20[0]) == *(double *)(in_ECX + 0xa8))) {
                  pIVar24 = *(IMAGE_DOS_HEADER **)(in_ECX + 0x24);
                  goto LAB_10075d51;
                }
              }
              else {
                pIVar24 = *(IMAGE_DOS_HEADER **)(in_ECX + 0x20);
LAB_10075d51:
                *(IMAGE_DOS_HEADER **)param_1 = pIVar24;
              }
              pcVar20 = local_10->e_magic;
              local_10 = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
              param_1 = (IMAGE_DOS_HEADER *)&param_1->e_cp;
            } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < local_8);
          }
        }
        else {
          pIVar24 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            do {
              *(undefined4 *)(param_2->e_magic + (int)pIVar24 * 4) = *(undefined4 *)(in_ECX + 0x20);
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
            } while (pIVar24 < local_8);
          }
        }
      }
      goto LAB_10073952;
    }
    break;
  case 0x1d:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        if ((*(byte *)(*(int *)(in_ECX + 8) + 0x6e) & 0x10) == 0) {
          iVar18 = (int)local_8 * 4;
          pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
          if (pIVar24 == (IMAGE_DOS_HEADER *)0x0) goto LAB_100786b6;
          uVar27 = 0;
          do {
            (&local_28)[uVar27] = pIVar24;
            uVar27 = uVar27 + 1;
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + iVar18);
          } while (uVar27 < 4);
          iVar18 = FUN_1006c566(local_28,local_8);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_20[0],local_8), iVar18 < 0 ||
              ((iVar18 = FUN_1006c566(local_20[1],local_8), iVar18 < 0 ||
               (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)))))) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10300000,local_28,local_4c[0],0,0x40);
          if ((iVar18 < 0) ||
             (((iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20500000,uStack_24,local_28,local_28
                                      ,0x40), iVar18 < 0 ||
               (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_20[0],uStack_24,0,
                                      0x40), iVar18 < 0)) ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20300000,param_2,local_20[0],
                                     uStack_24,0x57), iVar18 < 0)))) goto LAB_1007933c;
          local_10 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            iVar16 = (int)local_4c[0] - (int)param_2;
            param_1 = param_2;
            do {
              iVar18 = FUN_1006c8ca(*(undefined4 *)((int)param_1 + iVar16),&local_28);
              if (iVar18 < 0) goto LAB_1007933c;
              if (((double)CONCAT44(uStack_24,local_28) <= *(double *)(in_ECX + 0xa8)) ||
                 (*(double *)(in_ECX + 0xa0) <= (double)CONCAT44(local_20[1],local_20[0]))) {
                if (((double)CONCAT44(uStack_24,local_28) == *(double *)(in_ECX + 0xa0)) ||
                   ((double)CONCAT44(local_20[1],local_20[0]) == *(double *)(in_ECX + 0xa8))) {
                  pIVar24 = *(IMAGE_DOS_HEADER **)(in_ECX + 0x20);
                  goto LAB_10075f68;
                }
              }
              else {
                pIVar24 = *(IMAGE_DOS_HEADER **)(in_ECX + 0x24);
LAB_10075f68:
                *(IMAGE_DOS_HEADER **)param_1 = pIVar24;
              }
              pcVar20 = local_10->e_magic;
              local_10 = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
              param_1 = (IMAGE_DOS_HEADER *)&param_1->e_cp;
            } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < local_8);
          }
        }
        else {
          pIVar24 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            do {
              *(undefined4 *)(param_2->e_magic + (int)pIVar24 * 4) = *(undefined4 *)(in_ECX + 0x24);
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
            } while (pIVar24 < local_8);
          }
        }
      }
      goto LAB_10073952;
    }
    break;
  case 0x1e:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        if ((*(byte *)(*(int *)(in_ECX + 8) + 0x6e) & 0x10) == 0) {
          iVar18 = (int)local_8 * 4;
          pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
          if (pIVar24 == (IMAGE_DOS_HEADER *)0x0) goto LAB_100786b6;
          uVar27 = 0;
          do {
            (&local_28)[uVar27] = pIVar24;
            uVar27 = uVar27 + 1;
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + iVar18);
          } while (uVar27 < 4);
          iVar18 = FUN_1006c566(local_28,local_8);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_20[0],local_8), iVar18 < 0 ||
              ((iVar18 = FUN_1006c566(local_20[1],local_8), iVar18 < 0 ||
               (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)))))) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20500000,local_28,local_4c[0],local_4c[0],
                                0x40);
          if (iVar18 < 0) goto LAB_1007933c;
          local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
          iVar18 = FUN_1006e308(param_1,local_20[3],uStack_24,local_28,0,0x40);
          if (iVar18 < 0) goto LAB_1007933c;
          local_5c[2] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20300000);
          iVar18 = FUN_1006e308(param_1,local_5c[2],local_20[0],local_28,uStack_24,0x57);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,local_20[3],local_20[1],local_20[0],0,0x5a), iVar18 < 0
              )) || (iVar18 = FUN_1006e308(param_1,local_5c[2],param_2,local_20[1],local_20[0],0x57)
                    , iVar18 < 0)) goto LAB_1007933c;
          local_10 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            iVar16 = (int)local_4c[0] - (int)param_2;
            param_1 = param_2;
            do {
              iVar18 = FUN_1006c8ca(*(undefined4 *)((int)param_1 + iVar16),&local_28);
              if (iVar18 < 0) goto LAB_1007933c;
              if (((*(double *)(in_ECX + 0xa8) < (double)CONCAT44(uStack_24,local_28)) ||
                  ((double)CONCAT44(local_20[1],local_20[0]) < *(double *)(in_ECX + 0xa0))) ||
                 (((double)CONCAT44(uStack_24,local_28) == *(double *)(in_ECX + 0xa0) ||
                  ((double)CONCAT44(local_20[1],local_20[0]) == *(double *)(in_ECX + 0xa8))))) {
                *(IMAGE_DOS_HEADER **)param_1 = *(IMAGE_DOS_HEADER **)(in_ECX + 0x24);
              }
              pcVar20 = local_10->e_magic;
              local_10 = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
              param_1 = (IMAGE_DOS_HEADER *)&param_1->e_cp;
            } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < local_8);
          }
        }
        else {
          pIVar24 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            do {
              *(undefined4 *)(param_2->e_magic + (int)pIVar24 * 4) = *(undefined4 *)(in_ECX + 0x24);
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
            } while (pIVar24 < local_8);
          }
        }
      }
      goto LAB_10073952;
    }
    break;
  case 0x1f:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_20[3] = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (local_20[3] != (IMAGE_DOS_HEADER *)0x0) {
          iVar18 = FUN_1006c566(local_20[3],local_8);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10500000,local_20[3],local_4c[1],0,4);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = ZEXT48(local_20[3]);
          pIVar17 = local_c;
          pIVar24 = local_4c[0];
          goto LAB_1007865f;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x20:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(local_20 + 2,1);
        iVar18 = (int)uVar30;
        if ((int)((ulonglong)uVar30 >> 0x20) != 1) {
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0))
          goto LAB_1007933c;
          uVar30 = FUN_1006c566(param_2,local_8);
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          pIVar17 = local_4c[0];
          pIVar24 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff);
          goto LAB_10074f35;
        }
        if (((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,1), iVar18 < 0)) ||
           (iVar18 = FUN_1006e308(param_1,0x10100001,local_20 + 2,local_4c[0],0,0), iVar18 < 0))
        goto LAB_1007933c;
        uVar31 = CONCAT44(4,local_20 + 2);
        pIVar17 = (IMAGE_DOS_HEADER *)0x20100001;
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x21:
    if (((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
        ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
       (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1007041a(param_1,param_2,local_4c[0],local_4c[1],local_4c[2],local_8);
        goto LAB_10073948;
      }
      goto LAB_10073952;
    }
    break;
  case 0x22:
    if ((((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
         ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
        (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) && (local_8 == (IMAGE_DOS_HEADER *)0x4)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        if ((*(byte *)(*(int *)(in_ECX + 8) + 0x6c) & 0x40) == 0) {
          iVar18 = FUN_1006c449();
          if (iVar18 == 0) goto LAB_100786b6;
          uVar27 = 0;
          do {
            (&local_30)[uVar27] = (uint *)(iVar18 + uVar27 * 4);
            uVar27 = uVar27 + 1;
          } while (uVar27 < 6);
          iVar18 = FUN_1006c566(iVar18,6);
          if (((((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,4), iVar18 < 0)) ||
               ((iVar18 = FUN_1006e308(param_1,0x10100001,local_30,local_4c[0],0,0), iVar18 < 0 ||
                ((iVar18 = FUN_1006e308(param_1,0x20200001,local_2c,local_30,local_4c[0],0x17),
                 iVar18 < 0 ||
                 (iVar18 = FUN_1006e308(param_1,0x20500001,&param_2->e_cp,local_2c,local_4c[0],0),
                 iVar18 < 0)))))) ||
              (iVar18 = FUN_1006e308(param_1,0x10100001,local_28,local_4c[1],0,0), iVar18 < 0)) ||
             ((((iVar18 = FUN_1006e308(param_1,0x20200001,uStack_24,local_28,local_4c[1],0x17),
                iVar18 < 0 ||
                (iVar18 = FUN_1006e308(param_1,0x20500001,local_20[0],local_2c,uStack_24,0x17),
                iVar18 < 0)) ||
               (iVar18 = FUN_100707c3(param_1,local_20[1],local_4c[1],local_4c[2],1), iVar18 < 0))
              || ((iVar18 = FUN_1006e308(param_1,0x20500001,&param_2->e_cparhdr,local_20[0],
                                         local_20[1],4), iVar18 < 0 ||
                  (iVar18 = FUN_1006e308(param_1,0x10000001,param_2,in_ECX + 0x20,0,0x17),
                  iVar18 < 0)))))) goto LAB_1007933c;
          uVar31 = 0x1700000000;
          param_2 = (IMAGE_DOS_HEADER *)&param_2->e_maxalloc;
          pIVar17 = (IMAGE_DOS_HEADER *)(IMAGE_DOS_HEADER_10000000.e_magic + 1);
          pIVar24 = (IMAGE_DOS_HEADER *)(in_ECX + 0x20);
        }
        else {
          local_28 = *(IMAGE_DOS_HEADER **)local_4c[0];
          uStack_24 = *(uint *)local_4c[1];
          local_20[0] = *(IMAGE_DOS_HEADER **)local_4c[2];
          local_20[1] = *(IMAGE_DOS_HEADER **)local_4c[2];
          iVar18 = FUN_1006c566(param_2,4);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = 0;
          pIVar17 = (IMAGE_DOS_HEADER *)0x50100004;
          pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        }
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x23:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        fVar12 = (float10)log2((float10)2.0);
        local_5c[2] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   (double)((float10)0.6931471805599453 * fVar12));
        pIVar24 = local_8;
        pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            local_74[uVar27] = pIVar17;
            uVar27 = uVar27 + 1;
            pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
          } while (uVar27 < 2);
LAB_100765ff:
          pIVar17 = local_8;
          pIVar26 = local_74[0];
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            for (; pIVar17 != (IMAGE_DOS_HEADER *)0x0;
                pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17[-1].e_program + 0x3f)) {
              *(IMAGE_DOS_HEADER **)pIVar26 = local_5c[2];
              pIVar26 = (IMAGE_DOS_HEADER *)&pIVar26->e_cp;
            }
          }
          iVar18 = FUN_1006c566(local_74[1],local_8);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10600000,local_74[1],local_4c[0],0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = ZEXT48(local_74[1]);
          pIVar17 = local_c;
          pIVar24 = local_74[0];
          goto LAB_1007865f;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x24:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        fVar12 = (float10)log2((float10)2.0);
        fVar11 = (float10)log2((float10)10.0);
        local_5c[2] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   (double)(((float10)0.6931471805599453 * fVar12) /
                                           ((float10)0.6931471805599453 * fVar11)));
        pIVar24 = local_8;
        pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            local_74[uVar27] = pIVar17;
            uVar27 = uVar27 + 1;
            pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
          } while (uVar27 < 2);
          goto LAB_100765ff;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x25:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = 0;
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x10600000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x26:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x20100000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x27:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x20000000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x28:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      local_10 = (IMAGE_DOS_HEADER *)((int)local_8 << 2);
      local_4c[1] = operator_new((uint)local_10);
      if ((local_4c[1] == (IMAGE_DOS_HEADER *)0x0) ||
         (puVar19 = (uint *)FUN_1006c449(), puVar19 == (uint *)0x0)) goto LAB_100786b6;
      uVar27 = 0;
      do {
        local_a8[uVar27] = puVar19;
        puVar19 = (uint *)((int)puVar19 + (int)local_10);
        uVar27 = uVar27 + 1;
      } while (uVar27 < 10);
      iVar18 = FUN_1006c566(local_a8[0],local_8);
      if (((((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_a8[1],local_8), iVar18 < 0)) ||
             (iVar18 = FUN_1006c566(local_a0,local_8), iVar18 < 0)) ||
            ((iVar18 = FUN_1006c566(local_9c,local_8), iVar18 < 0 ||
             (iVar18 = FUN_1006c566(local_98,local_8), iVar18 < 0)))) ||
           ((iVar18 = FUN_1006c566(local_94,local_8), iVar18 < 0 ||
            ((iVar18 = FUN_1006c566(local_90,local_8), iVar18 < 0 ||
             (iVar18 = FUN_1006c566(local_8c,local_8), iVar18 < 0)))))) ||
          (iVar18 = FUN_1006c566(local_88,local_8), iVar18 < 0)) ||
         (iVar18 = FUN_1006c566(local_4c[1],local_8), iVar18 < 0)) goto LAB_1007933c;
      local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
      iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10200000,local_a8[0],local_4c[0],0,0);
      if ((iVar18 < 0) ||
         (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10400000,local_a8[1],local_a8[0],0,0x14),
         iVar18 < 0)) goto LAB_1007933c;
      local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
      iVar18 = FUN_1006e308(param_1,local_20[3],local_a0,local_a8[1],0,0x18);
      if (iVar18 < 0) goto LAB_1007933c;
      local_74[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20400000);
      iVar18 = FUN_1006e308(param_1,local_74[3],local_9c,local_a0,local_a8[0],2);
      if ((iVar18 < 0) ||
         (iVar18 = FUN_1006e308(param_1,local_20[3],local_98,local_4c[0],0,0), iVar18 < 0))
      goto LAB_1007933c;
      local_20[2] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20200000);
      iVar18 = FUN_1006e308(param_1,local_20[2],local_94,local_4c[0],local_98,0x17);
      if (((iVar18 < 0) ||
          (((iVar18 = FUN_1006e308(param_1,local_20[3],local_90,local_a8[1],0,0), iVar18 < 0 ||
            (iVar18 = FUN_1006e308(param_1,local_20[2],local_8c,local_90,local_a8[1],0x17),
            iVar18 < 0)) ||
           (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20500000,local_88,local_94,local_8c,0x17
                                 ), iVar18 < 0)))) ||
         (iVar18 = FUN_1006e308(param_1,local_74[3],local_4c[1],local_9c,local_88,2), iVar18 < 0))
      goto LAB_1007933c;
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(local_84,local_8);
        if (((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) ||
           (iVar18 = FUN_1006e308(param_1,local_20[3],local_84,local_4c[1],0,2), iVar18 < 0))
        goto LAB_1007933c;
        uVar31 = CONCAT44(0x10,local_84);
        pIVar17 = local_74[3];
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x29:
  case 0x2a:
  case 0x2b:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c449();
        if (iVar18 == 0) goto LAB_100786b6;
        pIVar24 = (IMAGE_DOS_HEADER *)0x0;
        if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
          do {
            *(IMAGE_DOS_HEADER **)(iVar18 + (int)pIVar24 * 4) = *(IMAGE_DOS_HEADER **)local_4c[0];
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
          } while (pIVar24 < local_8);
        }
        uVar30 = FUN_1006c566(param_2,local_8);
        uVar29 = CONCAT44(local_4c[1],(int)uVar30);
joined_r0x10076b87:
        uVar31 = (ulonglong)uVar29 >> 0x20;
        iVar18 = (int)uVar30;
        if ((int)uVar29 < 0) goto LAB_1007933c;
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
        pIVar24 = (IMAGE_DOS_HEADER *)(int)((ulonglong)uVar30 >> 0x20);
LAB_1007865f:
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)pIVar17 | 0x20500000);
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x2c:
  case 0x2f:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c449();
        if (iVar18 == 0) goto LAB_100786b6;
        pIVar24 = (IMAGE_DOS_HEADER *)0x0;
        if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
          do {
            *(IMAGE_DOS_HEADER **)(iVar18 + (int)pIVar24 * 4) = *(IMAGE_DOS_HEADER **)local_4c[1];
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
          } while (pIVar24 < local_8);
        }
LAB_10077464:
        uVar29 = FUN_1006c566(param_2,local_8);
        uVar30 = CONCAT44(local_4c[0],(int)uVar29);
        goto joined_r0x10076b87;
      }
      goto LAB_10073952;
    }
    break;
  case 0x2d:
  case 0x2e:
  case 0x30:
  case 0x31:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 == (IMAGE_DOS_HEADER *)0x0) goto LAB_10073952;
      pIVar24 = *(IMAGE_DOS_HEADER **)&local_28->e_sp;
      local_10 = pIVar24;
      if ((pIVar24 != (IMAGE_DOS_HEADER *)0x0) &&
         (iVar16._0_2_ = pIVar24->e_cp, iVar16._2_2_ = pIVar24->e_crlc, iVar16 == 9)) {
        iVar10._0_2_ = pIVar24->e_sp;
        iVar10._2_2_ = pIVar24->e_csum;
        if (iVar10 == 1) {
          uVar30 = CONCAT44(local_c0._0_4_,local_4c[0]);
        }
        else {
          uVar22._0_2_ = pIVar24->e_lfarlc;
          uVar22._2_2_ = pIVar24->e_ovno;
          uVar3._0_2_ = pIVar24->e_ip;
          uVar3._2_2_ = pIVar24->e_cs;
          FUN_10082e36(2,uVar3,uVar22,*(undefined4 *)pIVar24->e_res_4_,0x400);
          pIVar24 = (IMAGE_DOS_HEADER *)local_138;
          uVar30 = CONCAT44(local_c0._0_4_,local_4c[0]);
        }
        iVar18 = FUN_1007107a(pIVar24,uVar30);
        if (iVar18 < 0) goto LAB_1007933c;
        local_74[3] = *(IMAGE_DOS_HEADER **)local_10->e_res_4_;
        local_20[3] = *(IMAGE_DOS_HEADER **)(uStack_24 + 0x10);
        local_64 = *(IMAGE_DOS_HEADER **)&local_10->e_lfarlc;
        if ((local_20[3] != (IMAGE_DOS_HEADER *)0x0) &&
           (iVar4._0_2_ = local_20[3]->e_cp, iVar4._2_2_ = local_20[3]->e_crlc, iVar4 == 9)) {
          iVar5._0_2_ = local_20[3]->e_sp;
          iVar5._2_2_ = local_20[3]->e_csum;
          if (iVar5 == 1) {
            iVar18 = FUN_1007107a(local_20[3],local_4c[1],local_c0._4_4_);
            if (iVar18 < 0) goto LAB_1007933c;
            local_60 = *(IMAGE_DOS_HEADER **)local_20[3]->e_res_4_;
            local_c = *(IMAGE_DOS_HEADER **)&local_20[3]->e_lfarlc;
          }
          else {
            uVar6._0_2_ = local_20[3]->e_lfarlc;
            uVar6._2_2_ = local_20[3]->e_ovno;
            uVar7._0_2_ = local_20[3]->e_ip;
            uVar7._2_2_ = local_20[3]->e_cs;
            FUN_10082e36(2,uVar7,uVar6,*(undefined4 *)local_20[3]->e_res_4_,0x800);
            iVar18 = FUN_1007107a(local_a8 + 1,local_4c[1],local_c0._4_4_);
            if (iVar18 < 0) goto LAB_1007933c;
            local_60 = *(IMAGE_DOS_HEADER **)&local_20[3]->e_lfarlc;
            local_c = *(IMAGE_DOS_HEADER **)local_20[3]->e_res_4_;
          }
          pIVar24 = local_64;
          if ((local_74[3] == local_60) &&
             (local_8 == (IMAGE_DOS_HEADER *)((int)local_c * (int)local_64))) {
            uVar8._0_2_ = local_10->e_sp;
            uVar8._2_2_ = local_10->e_csum;
            iVar18 = FUN_1006d5d9(local_4c[0],uVar8,local_64,local_74[3]);
            pIVar17 = local_c;
            if (iVar18 == 0) {
              pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
              if (pIVar17 == (IMAGE_DOS_HEADER *)0x0) goto LAB_100786b6;
              uVar27 = 0;
              do {
                (&local_2c)[uVar27] = pIVar17;
                uVar27 = uVar27 + 1;
                pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
              } while (uVar27 < 5);
              local_10 = (IMAGE_DOS_HEADER *)0x0;
              if (local_c != (IMAGE_DOS_HEADER *)0x0) {
                local_20[3] = param_2;
                do {
                  param_2 = (IMAGE_DOS_HEADER *)0x0;
                  if (local_60 != (IMAGE_DOS_HEADER *)0x0) {
                    do {
                      if (local_64 != (IMAGE_DOS_HEADER *)0x0) {
                        local_20[2] = local_64;
                        local_5c[2] = (IMAGE_DOS_HEADER *)
                                      (local_4c[1]->e_magic +
                                      (int)(local_10->e_magic + (int)param_2 * (int)local_c) * 4);
                        local_74[1] = (IMAGE_DOS_HEADER *)((int)local_74[3] * 4);
                        pcVar20 = local_4c[0]->e_magic + (int)param_2 * 4;
                        pIVar24 = local_28;
                        do {
                          uVar22 = *(undefined4 *)pcVar20;
                          pcVar20 = pcVar20 + (int)local_74[3] * 4;
                          *(undefined4 *)(((int)local_2c - (int)local_28) + (int)pIVar24) = uVar22;
                          cVar14 = local_5c[2]->e_magic[1];
                          wVar15 = local_5c[2]->e_cblp;
                          pIVar24->e_magic[0] = local_5c[2]->e_magic[0];
                          pIVar24->e_magic[1] = cVar14;
                          pIVar24->e_cblp = wVar15;
                          pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
                          local_20[2] = (IMAGE_DOS_HEADER *)(local_20[2][-1].e_program + 0x3f);
                        } while (local_20[2] != (IMAGE_DOS_HEADER *)0x0);
                      }
                      iVar18 = FUN_1006c566(local_20[0],local_64);
                      if (iVar18 < 0) goto LAB_1007933c;
                      local_5c[2] = (IMAGE_DOS_HEADER *)((uint)local_64 & 0xfffff);
                      iVar18 = FUN_1006e308(param_1,(uint)local_5c[2] | 0x20500000,local_20[0],
                                            local_2c,local_28,0);
                      if ((iVar18 < 0) ||
                         ((pIVar24 = local_20[0], param_2 != (IMAGE_DOS_HEADER *)0x0 &&
                          ((iVar18 = FUN_1006c566(local_20[1],local_64), iVar18 < 0 ||
                           (iVar18 = FUN_1006e308(param_1,(uint)local_5c[2] | 0x20400000,local_20[1]
                                                  ,uStack_24,local_20[0],0), pIVar24 = local_20[1],
                           iVar18 < 0)))))) goto LAB_1007933c;
                      pIVar17 = (IMAGE_DOS_HEADER *)uStack_24;
                      for (uVar27 = (uint)local_64 & 0x3fffffff; uVar27 != 0; uVar27 = uVar27 - 1) {
                        cVar14 = pIVar24->e_magic[1];
                        wVar15 = pIVar24->e_cblp;
                        pIVar17->e_magic[0] = pIVar24->e_magic[0];
                        pIVar17->e_magic[1] = cVar14;
                        pIVar17->e_cblp = wVar15;
                        pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
                        pIVar17 = (IMAGE_DOS_HEADER *)&pIVar17->e_cp;
                      }
                      param_2 = (IMAGE_DOS_HEADER *)(param_2->e_magic + 1);
                      for (iVar18 = 0; iVar18 != 0; iVar18 = iVar18 + -1) {
                        pIVar17->e_magic[0] = pIVar24->e_magic[0];
                        pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
                        pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + 1);
                      }
                    } while (param_2 < local_60);
                  }
                  pIVar17 = (IMAGE_DOS_HEADER *)0x0;
                  pIVar24 = local_20[3];
                  if (local_64 != (IMAGE_DOS_HEADER *)0x0) {
                    do {
                      *(IMAGE_DOS_HEADER **)pIVar24 =
                           *(IMAGE_DOS_HEADER **)((char *)uStack_24 + (int)pIVar17 * 4);
                      pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + 1);
                      pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + (int)local_c * 4);
                    } while (pIVar17 < local_64);
                  }
                  pcVar20 = local_10->e_magic;
                  local_10 = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
                  local_20[3] = (IMAGE_DOS_HEADER *)&local_20[3]->e_cp;
                } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < local_c);
              }
            }
            else {
              uVar9._0_2_ = local_20[3]->e_sp;
              uVar9._2_2_ = local_20[3]->e_csum;
              iVar18 = FUN_1006d76d(local_4c[1],uVar9,local_60,local_c);
              if (iVar18 == 0) {
                pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
                if (pIVar24 == (IMAGE_DOS_HEADER *)0x0) goto LAB_100786b6;
                uVar27 = 0;
                do {
                  (&local_2c)[uVar27] = pIVar24;
                  uVar27 = uVar27 + 1;
                  pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + (int)local_c * 4);
                } while (uVar27 < 5);
                local_74[2] = (IMAGE_DOS_HEADER *)0x0;
                if (local_64 != (IMAGE_DOS_HEADER *)0x0) {
                  local_20[2] = (IMAGE_DOS_HEADER *)0x0;
                  local_5c[3] = param_2;
                  do {
                    param_2 = (IMAGE_DOS_HEADER *)0x0;
                    if (local_74[3] != (IMAGE_DOS_HEADER *)0x0) {
                      do {
                        if (local_c != (IMAGE_DOS_HEADER *)0x0) {
                          local_5c[2] = (IMAGE_DOS_HEADER *)
                                        (local_4c[0]->e_magic +
                                        (int)(param_2->e_magic + (int)local_20[2]->e_magic) * 4);
                          pwVar21 = (word *)(local_4c[1]->e_magic + (int)local_c * (int)param_2 * 4)
                          ;
                          local_10 = local_c;
                          pIVar24 = local_28;
                          do {
                            *(IMAGE_DOS_HEADER **)(((int)local_2c - (int)local_28) + (int)pIVar24) =
                                 *(IMAGE_DOS_HEADER **)local_5c[2];
                            *(IMAGE_DOS_HEADER **)pIVar24 = *(IMAGE_DOS_HEADER **)pwVar21;
                            pwVar21 = pwVar21 + 2;
                            pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
                            local_10 = (IMAGE_DOS_HEADER *)(local_10[-1].e_program + 0x3f);
                          } while (local_10 != (IMAGE_DOS_HEADER *)0x0);
                        }
                        iVar18 = FUN_1006c566(local_20[0],local_c);
                        if (iVar18 < 0) goto LAB_1007933c;
                        local_5c[2] = (IMAGE_DOS_HEADER *)((uint)local_c & 0xfffff);
                        iVar18 = FUN_1006e308(param_1,(uint)local_5c[2] | 0x20500000,local_20[0],
                                              local_2c,local_28,0);
                        if ((iVar18 < 0) ||
                           ((pIVar24 = local_20[0], param_2 != (IMAGE_DOS_HEADER *)0x0 &&
                            ((iVar18 = FUN_1006c566(local_20[1],local_c), iVar18 < 0 ||
                             (iVar18 = FUN_1006e308(param_1,(uint)local_5c[2] | 0x20400000,
                                                    local_20[1],uStack_24,local_20[0],0),
                             pIVar24 = local_20[1], iVar18 < 0)))))) goto LAB_1007933c;
                        pIVar17 = (IMAGE_DOS_HEADER *)uStack_24;
                        for (uVar27 = (uint)local_c & 0x3fffffff; uVar27 != 0; uVar27 = uVar27 - 1)
                        {
                          cVar14 = pIVar24->e_magic[1];
                          wVar15 = pIVar24->e_cblp;
                          pIVar17->e_magic[0] = pIVar24->e_magic[0];
                          pIVar17->e_magic[1] = cVar14;
                          pIVar17->e_cblp = wVar15;
                          pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
                          pIVar17 = (IMAGE_DOS_HEADER *)&pIVar17->e_cp;
                        }
                        param_2 = (IMAGE_DOS_HEADER *)(param_2->e_magic + 1);
                        for (iVar18 = 0; iVar18 != 0; iVar18 = iVar18 + -1) {
                          pIVar17->e_magic[0] = pIVar24->e_magic[0];
                          pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
                          pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + 1);
                        }
                      } while (param_2 < local_74[3]);
                    }
                    pIVar17 = (IMAGE_DOS_HEADER *)0x0;
                    pIVar24 = local_5c[3];
                    if (local_c != (IMAGE_DOS_HEADER *)0x0) {
                      do {
                        *(uint *)pIVar24 = *(uint *)((char *)uStack_24 + (int)pIVar17 * 4);
                        pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + 1);
                        pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
                      } while (pIVar17 < local_c);
                    }
                    local_20[2] = (IMAGE_DOS_HEADER *)
                                  (local_74[3]->e_magic + (int)local_20[2]->e_magic);
                    pcVar20 = local_74[2]->e_magic;
                    local_74[2] = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
                    local_5c[3] = (IMAGE_DOS_HEADER *)(local_5c[3]->e_magic + (int)local_c * 4);
                  } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < local_64);
                }
              }
              else {
                local_20[3] = (IMAGE_DOS_HEADER *)FUN_1006c449();
                if (local_20[3] == (IMAGE_DOS_HEADER *)0x0) goto LAB_100786b6;
                if (local_60 != (IMAGE_DOS_HEADER *)0x0) {
                  local_10 = local_4c[1];
                  local_5c[3] = local_60;
                  local_74[2] = local_20[3];
                  do {
                    pIVar24 = local_10;
                    pIVar26 = local_74[2];
                    if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
                      do {
                        local_20[2] = pIVar17;
                        cVar14 = pIVar24->e_magic[1];
                        wVar15 = pIVar24->e_cblp;
                        pIVar26->e_magic[0] = pIVar24->e_magic[0];
                        pIVar26->e_magic[1] = cVar14;
                        pIVar26->e_cblp = wVar15;
                        pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
                        pIVar26 = (IMAGE_DOS_HEADER *)(pIVar26->e_magic + (int)local_60 * 4);
                        pIVar17 = (IMAGE_DOS_HEADER *)(local_20[2][-1].e_program + 0x3f);
                      } while ((IMAGE_DOS_HEADER *)(local_20[2][-1].e_program + 0x3f) !=
                               (IMAGE_DOS_HEADER *)0x0);
                      local_20[2] = (IMAGE_DOS_HEADER *)0x0;
                      pIVar17 = local_c;
                    }
                    local_74[2] = (IMAGE_DOS_HEADER *)&local_74[2]->e_cp;
                    local_10 = (IMAGE_DOS_HEADER *)(local_10->e_magic + (int)pIVar17 * 4);
                    local_5c[3] = (IMAGE_DOS_HEADER *)(local_5c[3][-1].e_program + 0x3f);
                  } while (local_5c[3] != (IMAGE_DOS_HEADER *)0x0);
                }
                iVar18 = FUN_1006c566(param_2,local_8);
                if (iVar18 < 0) goto LAB_1007933c;
                local_20[2] = (IMAGE_DOS_HEADER *)0x0;
                if (local_64 != (IMAGE_DOS_HEADER *)0x0) {
                  local_5c[3] = param_2;
                  local_8 = local_4c[0];
                  do {
                    local_10 = (IMAGE_DOS_HEADER *)0x0;
                    if (local_c != (IMAGE_DOS_HEADER *)0x0) {
                      local_5c[2] = (IMAGE_DOS_HEADER *)((uint)local_74[3] & 0xfffff | 0x50000000);
                      param_2 = local_5c[3];
                      local_74[2] = local_20[3];
                      do {
                        iVar18 = FUN_1006e308(param_1,local_5c[2],param_2,local_8,local_74[2],0);
                        if (iVar18 < 0) goto LAB_1007933c;
                        pcVar20 = local_10->e_magic;
                        local_10 = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
                        param_2 = (IMAGE_DOS_HEADER *)&param_2->e_cp;
                        local_74[2] = (IMAGE_DOS_HEADER *)(local_74[2]->e_magic + (int)local_60 * 4)
                        ;
                      } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < local_c);
                    }
                    pcVar20 = local_20[2]->e_magic;
                    local_20[2] = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
                    local_8 = (IMAGE_DOS_HEADER *)(local_8->e_magic + (int)local_74[3] * 4);
                    local_5c[3] = (IMAGE_DOS_HEADER *)(local_5c[3]->e_magic + (int)local_c * 4);
                  } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < local_64);
                }
              }
            }
            goto LAB_10073952;
          }
        }
      }
    }
    break;
  case 0x32:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,1);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = 0x1000000000;
        pIVar17 = (IMAGE_DOS_HEADER *)(local_c0._0_4_ & 0xfffff | 0x50200000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x33:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        if (local_8 == (IMAGE_DOS_HEADER *)0x1) {
          iVar18 = FUN_1006c449();
          if (iVar18 != 0) {
            uVar27 = 0;
            do {
              (&local_28)[uVar27] = (IMAGE_DOS_HEADER *)(iVar18 + uVar27 * 4);
              uVar27 = uVar27 + 1;
            } while (uVar27 < 4);
            iVar18 = FUN_1006c566(local_28,1);
            if (((((iVar18 < 0) || (iVar18 = FUN_1006c566(uStack_24,1), iVar18 < 0)) ||
                 (iVar18 = FUN_1006c566(local_20[0],1), iVar18 < 0)) ||
                (((iVar18 = FUN_1006c566(local_20[1],1), iVar18 < 0 ||
                  (iVar18 = FUN_1006c566(param_2,1), iVar18 < 0)) ||
                 ((iVar18 = FUN_1006e308(param_1,0x10100001,local_28,local_4c[0],0,0), iVar18 < 0 ||
                  ((iVar18 = FUN_1006e308(param_1,0x20200001,uStack_24,local_28,local_4c[0],0x17),
                   iVar18 < 0 ||
                   (iVar18 = FUN_1006e308(param_1,0x20200001,local_20[0],local_4c[0],local_28,0x17),
                   iVar18 < 0)))))))) ||
               (iVar18 = FUN_1006e308(param_1,0x10100001,local_20[1],local_20[0],0,0x1a), iVar18 < 0
               )) goto LAB_1007933c;
            uVar31 = CONCAT44(0x12,local_20[1]);
            pIVar24 = (IMAGE_DOS_HEADER *)uStack_24;
            goto LAB_100745da;
          }
        }
        else {
          iVar18 = FUN_1006c566(local_20 + 2,1);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x50000000,local_20 + 2,local_4c[0],
                                local_4c[0],4);
          if ((iVar18 < 0) ||
             (iVar18 = FUN_1006e308(param_1,&DAT_10700001,local_5c + 3,local_20 + 2,0,4), iVar18 < 0
             )) goto LAB_1007933c;
          iVar18 = FUN_1006c449();
          if (iVar18 != 0) {
            pIVar24 = (IMAGE_DOS_HEADER *)0x0;
            if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
              do {
                *(IMAGE_DOS_HEADER **)(iVar18 + (int)pIVar24 * 4) = local_5c[3];
                pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
              } while (pIVar24 < local_8);
            }
            uVar28 = FUN_1006c566(param_2,local_8);
            uVar31 = uVar28 >> 0x20;
            iVar18 = (int)uVar28;
            pIVar17 = local_c;
            pIVar24 = local_4c[0];
            if (iVar18 < 0) goto LAB_1007933c;
            goto LAB_1007865f;
          }
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x34:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_100707c3(param_1,param_2,local_4c[0],local_4c[1],local_8);
        goto LAB_10073948;
      }
      goto LAB_10073952;
    }
    break;
  case 0x35:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = 0x3f91df46aaaaaaab;
        goto LAB_1007742c;
      }
      goto LAB_10073952;
    }
    break;
  case 0x36:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(local_20 + 2,1);
        if (((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0)) ||
           (iVar18 = FUN_1006c566(local_74 + 2,1), iVar18 < 0)) goto LAB_1007933c;
        local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
        iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x50000000,local_20 + 2,local_4c[0],
                              local_4c[1],0);
        if (((iVar18 < 0) ||
            (iVar18 = FUN_1006e308(param_1,0x20400001,local_5c + 3,local_20 + 2,local_20 + 2,0),
            iVar18 < 0)) ||
           (iVar18 = FUN_1006e308(param_1,0x10100001,local_74 + 2,local_5c + 3,0,0), iVar18 < 0))
        goto LAB_1007933c;
        iVar18 = FUN_1006c449();
        if (iVar18 != 0) {
          uVar27 = 0;
          do {
            local_5c[uVar27 + 1] = (IMAGE_DOS_HEADER *)iVar18;
            uVar27 = uVar27 + 1;
            iVar18 = iVar18 + (int)local_8 * 4;
          } while (uVar27 < 2);
          pIVar24 = (IMAGE_DOS_HEADER *)0x0;
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            do {
              *(IMAGE_DOS_HEADER **)((int)local_5c[1] + pIVar24 * 4) = local_74[2];
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + 1);
            } while (pIVar24 < local_8);
          }
          iVar18 = FUN_1006c566(local_5c[2],local_8);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(param_2,local_8);
          iVar18 = (int)uVar30;
          if ((iVar18 < 0) ||
             (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20500000,local_5c[2],local_4c[1],
                                    (int)((ulonglong)uVar30 >> 0x20),0), iVar18 < 0))
          goto LAB_1007933c;
          uVar31 = ZEXT48(local_4c[0]);
          pIVar24 = local_5c[2];
          goto LAB_10073fd3;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x37:
    if (((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
        ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
       (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(&local_10,1);
        if (((((iVar18 < 0) || (iVar18 = FUN_1006c566(&local_60,1), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_110,1), iVar18 < 0 ||
              ((((((iVar18 = FUN_1006c566(local_74 + 3,1), iVar18 < 0 ||
                   (iVar18 = FUN_1006c566(local_20 + 3,1), iVar18 < 0)) ||
                  (iVar18 = FUN_1006c566(local_114,1), iVar18 < 0)) ||
                 ((iVar18 = FUN_1006c566(local_10c,1), iVar18 < 0 ||
                  (iVar18 = FUN_1006c566(local_20 + 2,1), iVar18 < 0)))) ||
                (iVar18 = FUN_1006c566(local_5c + 3,1), iVar18 < 0)) ||
               ((iVar18 = FUN_1006c566(&local_d0,1), iVar18 < 0 ||
                (iVar18 = FUN_1006c566(local_74 + 2,1), iVar18 < 0)))))))) ||
            (iVar18 = FUN_1006c566(local_74 + 1,1), iVar18 < 0)) ||
           (((iVar18 = FUN_1006c566(&local_80,1), iVar18 < 0 ||
             (iVar18 = FUN_1006c566(&local_7c,1), iVar18 < 0)) ||
            (iVar18 = FUN_1006c566(local_5c + 2,1), iVar18 < 0)))) goto LAB_1007933c;
        local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
        iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x50000000,&local_10,local_4c[0],local_4c[1],0
                             );
        if (((iVar18 < 0) ||
            (iVar18 = FUN_1006e308(param_1,0x20500001,&local_60,&local_10,&local_10,4), iVar18 < 0))
           || (((iVar18 = FUN_1006e308(param_1,0x20500001,local_110,local_4c[2],local_4c[2],4),
                iVar18 < 0 ||
                ((iVar18 = FUN_1006e308(param_1,0x10100001,local_74 + 3,&local_60,0,8), iVar18 < 0
                 || (iVar18 = FUN_1006e308(param_1,0x20400001,local_20 + 3,in_ECX + 0x20,
                                           local_74 + 3,0), iVar18 < 0)))) ||
               ((iVar18 = FUN_1006e308(param_1,0x20500001,local_114,local_110,local_20 + 3,0),
                iVar18 < 0 ||
                (((((iVar18 = FUN_1006e308(param_1,0x10100001,local_10c,local_114,0,0), iVar18 < 0
                    || (iVar18 = FUN_1006e308(param_1,0x20400001,local_20 + 2,in_ECX + 0x20,
                                              local_10c,0), iVar18 < 0)) ||
                   (iVar18 = FUN_1006e308(param_1,0x20300001,local_5c + 3,local_20 + 2,in_ECX + 0x24
                                          ,0x17), iVar18 < 0)) ||
                  (((iVar18 = FUN_1006e308(param_1,0x20500001,&local_d0,local_20 + 2,local_5c + 3,4)
                    , iVar18 < 0 ||
                    (iVar18 = FUN_1006e308(param_1,0x20500001,local_74 + 2,local_4c[2],local_5c + 3,
                                           0), iVar18 < 0)) ||
                   ((iVar18 = FUN_1006e308(param_1,0x20500001,local_74 + 1,local_74 + 2,&local_10,0)
                    , iVar18 < 0 ||
                    ((iVar18 = FUN_1006e308(param_1,&DAT_10700001,&local_80,&local_d0,0,4),
                     iVar18 < 0 ||
                     (iVar18 = FUN_1006e308(param_1,&DAT_10300001,&local_7c,&local_80,0,4),
                     iVar18 < 0)))))))) ||
                 (iVar18 = FUN_1006e308(param_1,0x20400001,local_5c + 2,local_74 + 1,&local_7c,0),
                 pIVar24 = local_8, iVar18 < 0)))))))) goto LAB_1007933c;
        pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            (&local_2c)[uVar27] = pIVar17;
            uVar27 = uVar27 + 1;
            pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
          } while (uVar27 < 5);
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            pIVar17 = local_20[1];
            do {
              *(IMAGE_DOS_HEADER **)(((int)local_20[0] - (int)local_20[1]) + (int)pIVar17) =
                   local_74[2];
              *(IMAGE_DOS_HEADER **)pIVar17 = local_5c[2];
              pIVar17 = (IMAGE_DOS_HEADER *)&pIVar17->e_cp;
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24[-1].e_program + 0x3f);
            } while (pIVar24 != (IMAGE_DOS_HEADER *)0x0);
          }
          iVar18 = FUN_1006c566(local_2c,local_8);
          if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_28,local_8), iVar18 < 0)) ||
              (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
             (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)) goto LAB_1007933c;
          local_64 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20500000);
          iVar18 = FUN_1006e308(param_1,local_64,local_2c,local_20[0],local_4c[0],0);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,local_64,local_28,local_20[1],local_4c[1],0),
              iVar18 < 0)) ||
             (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,uStack_24,local_28,0,0),
             iVar18 < 0)) goto LAB_1007933c;
          uVar31 = (ulonglong)uStack_24;
          pIVar24 = local_2c;
          goto LAB_10073fd3;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x38:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_5c[2] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   0x3fe0000000000000);
        iVar18 = (int)local_8 * 4;
        pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            (&local_28)[uVar27] = pIVar24;
            uVar27 = uVar27 + 1;
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + iVar18);
          } while (uVar27 < 4);
          pIVar24 = local_8;
          pIVar17 = local_20[1];
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            for (; pIVar24 != (IMAGE_DOS_HEADER *)0x0;
                pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24[-1].e_program + 0x3f)) {
              *(IMAGE_DOS_HEADER **)pIVar17 = local_5c[2];
              pIVar17 = (IMAGE_DOS_HEADER *)&pIVar17->e_cp;
            }
          }
          iVar18 = FUN_1006c566(local_28,local_8);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_20[0],local_8), iVar18 < 0 ||
              (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)))) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          local_74[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20400000);
          iVar18 = FUN_1006e308(param_1,local_74[3],local_28,local_4c[0],local_20[1],0);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10400000,uStack_24,local_28,0,0x14),
              iVar18 < 0)) ||
             (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_20[0],uStack_24,0,0x18)
             , iVar18 < 0)) goto LAB_1007933c;
          uVar31 = CONCAT44(2,local_20[0]);
          pIVar17 = local_74[3];
          pIVar24 = local_28;
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x39:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = 0x400000000;
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x10700000);
        pIVar24 = local_4c[0];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x3a:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            local_5c[uVar27] = pIVar17;
            uVar27 = uVar27 + 1;
            pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
          } while (uVar27 < 3);
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            pIVar17 = local_5c[1];
            do {
              *(undefined4 *)(((int)local_5c[0] - (int)local_5c[1]) + (int)pIVar17) =
                   *(undefined4 *)(in_ECX + 0x24);
              *(undefined4 *)pIVar17 = *(undefined4 *)(in_ECX + 0x20);
              pIVar17 = (IMAGE_DOS_HEADER *)((int)pIVar17 + 4);
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24[-1].e_program + 0x3f);
            } while (pIVar24 != (IMAGE_DOS_HEADER *)0x0);
          }
          iVar18 = FUN_1006c566(local_5c[2],local_8);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20100000,local_5c[2],local_4c[0],
                                local_5c[0],4);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = CONCAT44(0x14,local_5c[1]);
          pIVar24 = local_5c[2];
          goto LAB_10077d4c;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x3b:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = (int)local_8 * 4;
        pIVar24 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            (&local_28)[uVar27] = pIVar24;
            uVar27 = uVar27 + 1;
            pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24->e_magic + iVar18);
          } while (uVar27 < 4);
          iVar18 = FUN_1006c566(local_28,local_8);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
             ((iVar18 = FUN_1006c566(local_20[0],local_8), iVar18 < 0 ||
              ((iVar18 = FUN_1006c566(local_20[1],local_8), iVar18 < 0 ||
               (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)))))) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
          iVar18 = FUN_1006e308(param_1,local_20[3],local_28,local_4c[0],0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_20[2] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20200000);
          iVar18 = FUN_1006e308(param_1,local_20[2],uStack_24,local_28,local_4c[0],0x17);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,local_20[2],local_20[0],local_4c[0],local_28,0x17),
              iVar18 < 0)) ||
             (iVar18 = FUN_1006e308(param_1,local_20[3],local_20[1],local_20[0],0,0x1a), iVar18 < 0)
             ) goto LAB_1007933c;
          uVar31 = CONCAT44(0x12,local_20[1]);
          pIVar24 = (IMAGE_DOS_HEADER *)uStack_24;
          goto LAB_10073fd3;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x3c:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        lVar32 = ZEXT48(local_8) << 0x20;
        goto LAB_10077f58;
      }
      goto LAB_10073952;
    }
    break;
  case 0x3d:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      uVar27 = local_c0._0_4_ << 2;
      local_4c[1] = operator_new(uVar27);
      if (local_4c[1] != (IMAGE_DOS_HEADER *)0x0) {
        local_4c[2] = operator_new(uVar27);
        if (local_4c[2] != (IMAGE_DOS_HEADER *)0x0) {
          uVar30 = FUN_1006c566(local_4c[1],local_c0._0_4_);
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566((int)((ulonglong)uVar30 >> 0x20),local_c0._0_4_);
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          lVar32 = CONCAT44(local_c0._0_4_,(int)((ulonglong)uVar30 >> 0x20));
          param_2 = local_4c[1];
          goto LAB_10077f58;
        }
      }
LAB_100786b6:
      iVar18 = -0x7ff8fff2;
      goto LAB_1007933c;
    }
    break;
  case 0x3e:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        fVar12 = (float10)log2((float10)2.0);
        local_5c[2] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   (double)((float10)1.0 / ((float10)0.6931471805599453 * fVar12)));
        local_74[1] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   0x3fe0000000000000);
        pIVar24 = local_8;
        pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
          uVar27 = 0;
          do {
            (&local_38)[uVar27] = pIVar17;
            uVar27 = uVar27 + 1;
            pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
          } while (uVar27 < 8);
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            pIVar17 = local_20[1];
            do {
              *(IMAGE_DOS_HEADER **)(((int)local_20[0] - (int)local_20[1]) + (int)pIVar17) =
                   local_5c[2];
              *(IMAGE_DOS_HEADER **)pIVar17 = local_74[1];
              pIVar17 = (IMAGE_DOS_HEADER *)&pIVar17->e_cp;
              pIVar24 = (IMAGE_DOS_HEADER *)(pIVar24[-1].e_program + 0x3f);
            } while (pIVar24 != (IMAGE_DOS_HEADER *)0x0);
          }
          iVar18 = FUN_1006c566(local_38,local_8);
          if (((iVar18 < 0) || (iVar18 = FUN_1006c566(local_34,local_8), iVar18 < 0)) ||
             ((((iVar18 = FUN_1006c566(local_30,local_8), iVar18 < 0 ||
                ((iVar18 = FUN_1006c566(local_2c,local_8), iVar18 < 0 ||
                 (iVar18 = FUN_1006c566(local_28,local_8), iVar18 < 0)))) ||
               (iVar18 = FUN_1006c566(uStack_24,local_8), iVar18 < 0)) ||
              (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0)))) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          local_64 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20500000);
          iVar18 = FUN_1006e308(param_1,local_64,local_38,local_4c[0],local_20[0],0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_10 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10500000);
          iVar18 = FUN_1006e308(param_1,local_10,local_34,local_38,0,4);
          if (iVar18 < 0) goto LAB_1007933c;
          local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
          iVar18 = FUN_1006e308(param_1,local_20[3],local_30,local_38,0,0);
          if ((((iVar18 < 0) ||
               (iVar18 = FUN_1006e308(param_1,local_10,local_2c,local_30,0,4), iVar18 < 0)) ||
              (iVar18 = FUN_1006e308(param_1,local_20[3],local_28,local_2c,0,8), iVar18 < 0)) ||
             (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20400000,uStack_24,local_34,local_28,0
                                   ), iVar18 < 0)) goto LAB_1007933c;
          uVar22 = 0;
          goto LAB_100742ce;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x3f:
    if (((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
        ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
       (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_74[1] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   0xc000000000000000);
        local_80 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x4008000000000000)
        ;
        pIVar24 = local_8;
        iVar18 = FUN_1006c449();
        if (iVar18 != 0) {
          uVar27 = 0;
          do {
            (&local_108)[uVar27] = iVar18;
            uVar27 = uVar27 + 1;
            iVar18 = iVar18 + (int)pIVar24 * 4;
          } while (uVar27 < 0xe);
          uVar27 = 0;
          do {
            uVar30 = FUN_1006c566((&local_108)[uVar27],local_8);
            iVar18 = (int)uVar30;
            if (iVar18 < 0) goto LAB_1007933c;
            uVar27 = (int)((ulonglong)uVar30 >> 0x20) + 1;
          } while (uVar27 < 10);
          if (local_8 != (IMAGE_DOS_HEADER *)0x0) {
            local_7c = local_d8 - (int)local_dc;
            local_d0 = local_d4 - (int)local_dc;
            local_5c[2] = local_8;
            puVar23 = local_dc;
            do {
              *(undefined4 *)((local_e0 - (int)local_dc) + (int)puVar23) =
                   *(undefined4 *)(in_ECX + 0x24);
              *puVar23 = *(undefined4 *)(in_ECX + 0x20);
              *(IMAGE_DOS_HEADER **)(local_7c + (int)puVar23) = local_74[1];
              *(int *)(local_d0 + (int)puVar23) = local_80;
              puVar23 = puVar23 + 1;
              local_5c[2] = (IMAGE_DOS_HEADER *)(local_5c[2][-1].e_program + 0x3f);
            } while (local_5c[2] != (IMAGE_DOS_HEADER *)0x0);
          }
          iVar18 = FUN_1006c566(param_2,local_8);
          if (iVar18 < 0) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10100000,local_108,local_4c[0],0,0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_74[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20400000);
          iVar18 = FUN_1006e308(param_1,local_74[3],local_104,local_4c[1],local_108,0);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,local_74[3],local_100._0_4_,local_4c[2],local_108,0),
              iVar18 < 0)) ||
             (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10300000,local_100._4_4_,local_104,0,0
                                   ), iVar18 < 0)) goto LAB_1007933c;
          local_64 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20500000);
          iVar18 = FUN_1006e308(param_1,local_64,local_100._8_4_,local_100._0_4_,local_100._4_4_,0);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20100000,local_100._12_4_,
                                     local_100._8_4_,local_e0,4), iVar18 < 0)) ||
             ((iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x20000000,local_f0,local_100._12_4_,
                                     local_dc,0x14), iVar18 < 0 ||
              (((iVar18 = FUN_1006e308(param_1,local_64,local_ec,local_f0,local_d8,8), iVar18 < 0 ||
                (iVar18 = FUN_1006e308(param_1,local_74[3],local_e8,local_ec,local_d4,0), iVar18 < 0
                )) || (iVar18 = FUN_1006e308(param_1,local_64,local_e4,local_f0,local_f0,0x14),
                      iVar18 < 0)))))) goto LAB_1007933c;
          uVar31 = (ulonglong)local_e4;
          pIVar17 = local_64;
          pIVar24 = local_e8;
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x40:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_20[3] = (IMAGE_DOS_HEADER *)FUN_1006c449();
        if (local_20[3] != (IMAGE_DOS_HEADER *)0x0) {
          iVar18 = FUN_1006c566(local_20[3],local_8);
          if ((iVar18 < 0) || (iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0))
          goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
          iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10700000,local_20[3],local_4c[0],0,4);
          if (iVar18 < 0) goto LAB_1007933c;
          uVar31 = 0x400000000;
          pIVar17 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10300000);
          pIVar24 = local_20[3];
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x41:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar30 = FUN_1006c566(param_2,local_8);
        iVar18 = (int)uVar30;
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = CONCAT44(0x17,local_4c[0]);
        pIVar17 = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff | 0x20300000);
        pIVar24 = local_4c[1];
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x42:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      pIVar17 = (IMAGE_DOS_HEADER *)FUN_1006c449();
      if (pIVar17 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          local_5c[uVar27] = pIVar17;
          uVar27 = uVar27 + 1;
          pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17->e_magic + (int)pIVar24 * 4);
        } while (uVar27 < 3);
        iVar18 = FUN_1006c566(local_5c[0],local_8);
        if ((((iVar18 < 0) || (iVar18 = FUN_1006c566(local_5c[1],local_8), iVar18 < 0)) ||
            (iVar18 = FUN_1006c566(local_5c[2],local_8), iVar18 < 0)) ||
           ((iVar18 = FUN_1006c566(param_2,local_8), iVar18 < 0 ||
            (iVar18 = FUN_1006edd4(param_1,local_4c[0],local_5c[0],local_5c[1],local_8), iVar18 < 0)
            ))) goto LAB_1007933c;
        local_c = (IMAGE_DOS_HEADER *)((uint)local_8 & 0xfffff);
        iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10300000,local_5c[2],local_5c[1],0,0);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_5c[2]);
        pIVar17 = local_c;
        pIVar24 = local_5c[0];
        goto LAB_1007865f;
      }
      goto LAB_100786b6;
    }
    break;
  case 0x43:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        fVar12 = (float10)log2((float10)2.0);
        local_5c[2] = (IMAGE_DOS_HEADER *)
                      FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,
                                   (double)((float10)1.0 / ((float10)0.6931471805599453 * fVar12)));
        pIVar24 = local_8;
        iVar18 = FUN_1006c449();
        if (iVar18 != 0) {
          uVar27 = 0;
          do {
            (&local_3c)[uVar27] = iVar18;
            uVar27 = uVar27 + 1;
            iVar18 = iVar18 + (int)pIVar24 * 4;
          } while (uVar27 < 9);
          pIVar17 = local_8;
          pIVar26 = local_20[1];
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            for (; pIVar17 != (IMAGE_DOS_HEADER *)0x0;
                pIVar17 = (IMAGE_DOS_HEADER *)(pIVar17[-1].e_program + 0x3f)) {
              *(IMAGE_DOS_HEADER **)pIVar26 = local_5c[2];
              pIVar26 = (IMAGE_DOS_HEADER *)&pIVar26->e_cp;
            }
          }
          uVar30 = FUN_1006c566(local_3c,local_8);
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(local_38,(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(local_34,(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(local_30,(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(local_2c,(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(local_28,(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(uStack_24,(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(local_20[0],(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          uVar30 = FUN_1006c566(param_2,(int)((ulonglong)uVar30 >> 0x20));
          iVar18 = (int)uVar30;
          if (iVar18 < 0) goto LAB_1007933c;
          local_c = (IMAGE_DOS_HEADER *)((uint)((ulonglong)uVar30 >> 0x20) & 0xfffff);
          local_64 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20500000);
          iVar18 = FUN_1006e308(param_1,local_64,local_3c,local_4c[0],local_20[1],0);
          if (iVar18 < 0) goto LAB_1007933c;
          local_10 = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10500000);
          iVar18 = FUN_1006e308(param_1,local_10,local_38,local_3c,0,4);
          if (iVar18 < 0) goto LAB_1007933c;
          local_20[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x10100000);
          iVar18 = FUN_1006e308(param_1,local_20[3],local_34,local_3c,0,0);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,local_10,local_30,local_34,0,4), iVar18 < 0)) ||
             (iVar18 = FUN_1006e308(param_1,local_20[3],local_2c,local_30,0,8), iVar18 < 0))
          goto LAB_1007933c;
          local_74[3] = (IMAGE_DOS_HEADER *)((uint)local_c | 0x20400000);
          iVar18 = FUN_1006e308(param_1,local_74[3],local_28,local_38,local_2c,0);
          if (((iVar18 < 0) ||
              (iVar18 = FUN_1006e308(param_1,local_74[3],uStack_24,local_38,local_30,4), iVar18 < 0)
              ) || (iVar18 = FUN_1006e308(param_1,(uint)local_c | 0x10300000,local_20[0],uStack_24,0
                                          ,4), iVar18 < 0)) goto LAB_1007933c;
          uVar31 = ZEXT48(local_20[0]);
          pIVar17 = local_64;
          pIVar24 = local_28;
          goto LAB_1007393e;
        }
        goto LAB_100786b6;
      }
      goto LAB_10073952;
    }
    break;
  case 0x44:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          local_20[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[1];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 2);
        local_5c[2] = *(IMAGE_DOS_HEADER **)local_4c[1];
        FUN_1007107a(0,local_5c + 2,1);
        iVar18 = *(int *)(in_ECX + 8);
        iVar16 = *(int *)(*(int *)(iVar18 + 0x14) + (int)local_20[0] * 4);
        if (((*(byte *)(*(int *)(*(int *)(iVar18 + 0x10) + *(int *)(iVar16 + 4) * 4) + 4) & 0x10) !=
             0) && (*(int *)(iVar16 + 0x10) == 0)) {
          local_10 = (IMAGE_DOS_HEADER *)0x0;
          if (*(int *)(iVar18 + 8) != 0) {
            local_20[2] = *(IMAGE_DOS_HEADER **)(iVar18 + 0x14);
            do {
              iVar10 = *(int *)local_20[2];
              if ((((*(int *)(iVar16 + 4) == *(int *)(iVar10 + 4)) &&
                   (*(int *)(iVar16 + 8) == *(int *)(iVar10 + 8))) &&
                  (*(int *)(iVar16 + 0xc) == *(int *)(iVar10 + 0xc))) &&
                 (*(int *)(iVar10 + 0x10) == 1)) {
                local_20[1] = local_10;
                break;
              }
              local_10 = (IMAGE_DOS_HEADER *)(local_10->e_magic + 1);
              local_20[2] = (IMAGE_DOS_HEADER *)&local_20[2]->e_cp;
            } while (local_10 < *(IMAGE_DOS_HEADER **)(*(int *)(in_ECX + 8) + 8));
          }
          if (local_10 == *(IMAGE_DOS_HEADER **)(iVar18 + 8)) {
            FUN_1006dd03();
          }
        }
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_20);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60000002;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x45:
    if ((((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
         ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
        (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) && (local_20[1] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_38)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          (&local_30)[uVar27] = (uint *)*(IMAGE_DOS_HEADER **)local_4c[1];
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[2];
          uVar25 = uVar27 + 1;
          local_20[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[3];
          uVar27 = uVar25;
        } while (uVar25 < 2);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(&local_30);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60100002;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_38;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x46:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60200004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x47:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60300004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x48:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60400004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x49:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          local_5c[uVar27 + 1] = (IMAGE_DOS_HEADER *)*(uint *)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 2);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60500002;
        pIVar24 = (IMAGE_DOS_HEADER *)(local_5c + 1);
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x4a:
    if ((((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
         ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
        (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) && (local_20[1] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_74[1] = (IMAGE_DOS_HEADER *)((int)&local_30 - (int)local_4c[1]);
        local_10 = (IMAGE_DOS_HEADER *)((int)local_4c[2] - (int)local_4c[1]);
        local_7c = (int)&local_28 - (int)local_4c[1];
        local_60 = (IMAGE_DOS_HEADER *)((int)local_4c[3] - (int)local_4c[1]);
        local_80 = (int)local_20 - (int)local_4c[1];
        local_5c[2] = (IMAGE_DOS_HEADER *)0x2;
        pIVar24 = local_4c[1];
        do {
          *(uint *)(((int)&local_38 - (int)local_4c[1]) + (int)pIVar24) = *(uint *)local_4c[0];
          *(IMAGE_DOS_HEADER **)(pIVar24->e_magic + (int)local_74[1]->e_magic) =
               *(IMAGE_DOS_HEADER **)pIVar24;
          *(undefined4 *)(local_7c + (int)pIVar24) =
               *(undefined4 *)(pIVar24->e_magic + (int)local_10->e_magic);
          *(undefined4 *)(local_80 + (int)pIVar24) =
               *(undefined4 *)(pIVar24->e_magic + (int)local_60->e_magic);
          pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
          local_5c[2] = (IMAGE_DOS_HEADER *)(local_5c[2][-1].e_program + 0x3f);
        } while (local_5c[2] != (IMAGE_DOS_HEADER *)0x0);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(&local_30);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60600002;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_38;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x4b:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60700004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x4c:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60800004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x4d:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60900004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x4e:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&uStack_24)[uVar27] = *(uint *)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 3);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60a00003;
        pIVar24 = (IMAGE_DOS_HEADER *)&uStack_24;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x4f:
    if ((((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
         ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
        (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) && (local_20[1] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_74[1] = (IMAGE_DOS_HEADER *)(local_100 + (0xc - (int)local_4c[1]));
        local_10 = (IMAGE_DOS_HEADER *)((int)local_4c[2] - (int)local_4c[1]);
        local_7c = (int)&local_e8 - (int)local_4c[1];
        local_60 = (IMAGE_DOS_HEADER *)((int)local_4c[3] - (int)local_4c[1]);
        iVar18 = -(int)local_4c[1];
        local_80 = (int)&local_dc - (int)local_4c[1];
        local_5c[2] = (IMAGE_DOS_HEADER *)0x3;
        pIVar24 = local_4c[1];
        do {
          pIVar17 = local_74[1];
          *(IMAGE_DOS_HEADER **)(local_100 + iVar18 + (int)pIVar24) =
               *(IMAGE_DOS_HEADER **)local_4c[0];
          *(IMAGE_DOS_HEADER **)(pIVar24->e_magic + (int)pIVar17->e_magic) =
               *(IMAGE_DOS_HEADER **)pIVar24;
          *(undefined4 *)(pIVar24->e_magic + local_7c) =
               *(undefined4 *)(local_10->e_magic + (int)pIVar24->e_magic);
          *(undefined4 *)(pIVar24->e_magic + local_80) =
               *(undefined4 *)(local_60->e_magic + (int)pIVar24->e_magic);
          pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
          local_5c[2] = (IMAGE_DOS_HEADER *)(local_5c[2][-1].e_program + 0x3f);
        } while (local_5c[2] != (IMAGE_DOS_HEADER *)0x0);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_100 + 0xc);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60b00003;
        pIVar24 = (IMAGE_DOS_HEADER *)local_100;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x50:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60c00004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x51:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60d00004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x52:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60e00004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x53:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&uStack_24)[uVar27] = *(uint *)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 3);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x60f00003;
        pIVar24 = (IMAGE_DOS_HEADER *)&uStack_24;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x54:
    if ((((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
         ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) &&
        (local_20[0] != (IMAGE_DOS_HEADER *)0x0)) && (local_20[1] != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_74[1] = (IMAGE_DOS_HEADER *)(local_100 + (0xc - (int)local_4c[1]));
        local_10 = (IMAGE_DOS_HEADER *)((int)local_4c[2] - (int)local_4c[1]);
        local_7c = (int)&local_e8 - (int)local_4c[1];
        local_60 = (IMAGE_DOS_HEADER *)((int)local_4c[3] - (int)local_4c[1]);
        iVar18 = -(int)local_4c[1];
        local_80 = (int)&local_dc - (int)local_4c[1];
        local_5c[2] = (IMAGE_DOS_HEADER *)0x3;
        pIVar24 = local_4c[1];
        do {
          pIVar17 = local_74[1];
          *(IMAGE_DOS_HEADER **)(local_100 + iVar18 + (int)pIVar24) =
               *(IMAGE_DOS_HEADER **)local_4c[0];
          *(IMAGE_DOS_HEADER **)(pIVar24->e_magic + (int)pIVar17->e_magic) =
               *(IMAGE_DOS_HEADER **)pIVar24;
          *(undefined4 *)(pIVar24->e_magic + local_7c) =
               *(undefined4 *)(local_10->e_magic + (int)pIVar24->e_magic);
          *(undefined4 *)(pIVar24->e_magic + local_80) =
               *(undefined4 *)(local_60->e_magic + (int)pIVar24->e_magic);
          pIVar24 = (IMAGE_DOS_HEADER *)&pIVar24->e_cp;
          local_5c[2] = (IMAGE_DOS_HEADER *)(local_5c[2][-1].e_program + 0x3f);
        } while (local_5c[2] != (IMAGE_DOS_HEADER *)0x0);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_100 + 0xc);
        pIVar17 = (IMAGE_DOS_HEADER *)0x61000003;
        pIVar24 = (IMAGE_DOS_HEADER *)local_100;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x55:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x61100004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x56:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x61200004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x57:
    if ((local_28 != (IMAGE_DOS_HEADER *)0x0) &&
       ((IMAGE_DOS_HEADER *)uStack_24 != (IMAGE_DOS_HEADER *)0x0)) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        uVar27 = 0;
        do {
          (&local_28)[uVar27] = *(IMAGE_DOS_HEADER **)local_4c[0];
          uVar27 = uVar27 + 1;
        } while (uVar27 < 4);
        iVar18 = FUN_1006c566(param_2,local_8);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = ZEXT48(local_4c[1]);
        pIVar17 = (IMAGE_DOS_HEADER *)0x61300004;
        pIVar24 = (IMAGE_DOS_HEADER *)&local_28;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  case 0x58:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if ((param_2 != (IMAGE_DOS_HEADER *)0x0) &&
         (iVar18._0_2_ = local_28->e_lfarlc, iVar18._2_2_ = local_28->e_ovno,
         local_60 = (IMAGE_DOS_HEADER *)0x0, iVar18 != 0)) {
        pIVar24 = *(IMAGE_DOS_HEADER **)&local_28->e_ip;
        do {
          local_10 = (IMAGE_DOS_HEADER *)0x0;
          if (pIVar24 != (IMAGE_DOS_HEADER *)0x0) {
            do {
              iVar18 = *(int *)&local_28->e_lfarlc * (int)local_10;
              pcVar20 = local_10->e_magic;
              pcVar13 = local_10->e_magic;
              local_10 = (IMAGE_DOS_HEADER *)(pcVar13 + 1);
              *(undefined4 *)
               (param_2->e_magic +
               (int)(pcVar20 + *(int *)((int)param_1 + 0x18) * (int)local_60) * 4) =
                   *(undefined4 *)(local_4c[0]->e_magic + (int)(local_60->e_magic + iVar18) * 4);
              pIVar24 = *(IMAGE_DOS_HEADER **)&local_28->e_ip;
            } while ((IMAGE_DOS_HEADER *)(pcVar13 + 1) < pIVar24);
          }
          pcVar20 = local_60->e_magic;
          local_60 = (IMAGE_DOS_HEADER *)(pcVar20 + 1);
        } while ((IMAGE_DOS_HEADER *)(pcVar20 + 1) < *(IMAGE_DOS_HEADER **)&local_28->e_lfarlc);
      }
      goto LAB_10073952;
    }
    break;
  case 0x59:
    if (local_28 != (IMAGE_DOS_HEADER *)0x0) {
      if (param_2 != (IMAGE_DOS_HEADER *)0x0) {
        local_28 = (IMAGE_DOS_HEADER *)
                   FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x406fe01000000000)
        ;
        local_c0._0_2_ = local_4c[0]->e_cparhdr;
        local_c0._2_2_ = local_4c[0]->e_minalloc;
        local_c0._4_2_ = local_4c[0]->e_cp;
        local_c0._6_2_ = local_4c[0]->e_crlc;
        local_b8 = *(IMAGE_DOS_HEADER **)local_4c[0];
        local_b4._0_2_ = local_4c[0]->e_maxalloc;
        local_b4._2_2_ = local_4c[0]->e_ss;
        uStack_24 = (uint)local_28;
        local_20[0] = local_28;
        local_20[1] = local_28;
        iVar18 = FUN_1006c566(param_2,4);
        if (iVar18 < 0) goto LAB_1007933c;
        uVar31 = CONCAT44(6,&local_28);
        pIVar17 = (IMAGE_DOS_HEADER *)0x20500004;
        pIVar24 = (IMAGE_DOS_HEADER *)local_c0;
        goto LAB_1007393e;
      }
      goto LAB_10073952;
    }
    break;
  default:
    FUN_1006dca1();
  }
  iVar18 = -0x7fffbffb;
LAB_1007933c:
  uVar27 = 0;
  *(undefined4 *)(in_ECX + 0x1c) = local_160;
  *(undefined4 *)(in_ECX + 100) = local_164;
  do {
    _free(*(void **)((int)local_4c + uVar27 * 4));
    uVar27 = uVar27 + 1;
  } while (uVar27 < 4);
  return iVar18;
}
