// Analysis output only; no reconstructed-source credit.
// 1007b5eb body=5701
//

/* WARNING: Type propagation algorithm not settling */

int FUN_1007b5eb(int param_1,uint *param_2,uint *param_3)

{
  int iVar1;
  uint *puVar2;
  uint *puVar3;
  uint *puVar4;
  int in_ECX;
  int iVar5;
  byte *pbVar6;
  uint uVar7;
  uint uVar8;
  byte *pbVar9;
  uint uVar10;
  int iVar11;
  uint *puVar12;
  uint uVar13;
  float10 fVar14;
  undefined8 uVar15;
  ulonglong uVar16;
  undefined4 uVar17;
  int local_68 [7];
  uint *local_4c;
  undefined4 uStack_48;
  undefined4 local_44;
  uint *puStack_40;
  uint *local_3c [4];
  int local_2c;
  uint *local_28;
  uint *local_24;
  uint *local_20;
  uint *local_1c;
  uint *local_18;
  uint *local_14;
  uint *local_10;
  uint *local_c;
  uint *local_8;

  if (param_1 == 0) {
    if (param_2 != (uint *)0x0) {
      return -0x7fffbffb;
    }
    return 0;
  }
  if (*(int *)(param_1 + 4) != 0xd) {
    return -0x7fffbffb;
  }
  puVar2 = *(uint **)(param_1 + 0x20);
  puVar12 = (uint *)(*(int *)(param_1 + 0x14) * *(int *)(param_1 + 0x18));
  local_1c = (uint *)0x0;
  local_24 = (uint *)0x0;
  local_8 = (uint *)0x0;
  local_c = (uint *)0x0;
  local_14 = (uint *)0x0;
  local_18 = (uint *)0x0;
  if ((puVar2 != (uint *)0x0) && (puVar2[1] == 0xd)) {
    local_1c = (uint *)(puVar2[6] * puVar2[5]);
    local_14 = puVar2;
  }
  puVar2 = *(uint **)(param_1 + 0x24);
  if ((puVar2 != (uint *)0x0) && (puVar2[1] == 0xd)) {
    local_24 = (uint *)(puVar2[6] * puVar2[5]);
    local_18 = puVar2;
  }
  local_10 = puVar12;
  if (((local_14 != (uint *)0x0) && (local_8 = (uint *)FUN_1006c4ac(), local_8 == (uint *)0x0)) ||
     ((local_18 != (uint *)0x0 && (local_c = (uint *)FUN_1006c4ac(), local_c == (uint *)0x0)))) {
LAB_1007c836:
    FUN_1006dca1();
    iVar1 = -0x7ff8fff2;
    goto LAB_1007cc0c;
  }
  iVar1 = *(int *)(param_1 + 0x1c);
  local_20 = (uint *)0x0;
  if (-1 < iVar1) {
    if (iVar1 < 4) {
LAB_1007b6c5:
      local_20 = param_3;
    }
    else if (0x13 < iVar1) {
      if (iVar1 < 0x16) {
        local_20 = (uint *)0x1;
      }
      else if (iVar1 < 0x18) goto LAB_1007b6c5;
    }
  }
  if (*(int *)(param_1 + 0x28) == 0) {
    if ((local_18 != (uint *)0x0) && (iVar1 = FUN_1007b5eb(local_18,local_c,0), iVar1 < 0))
    goto LAB_1007cc0c;
    if (local_14 != (uint *)0x0) {
      uVar16 = CONCAT44(local_20,local_8);
      puVar2 = local_14;
      goto LAB_1007b73b;
    }
  }
  else {
    if ((local_14 != (uint *)0x0) && (iVar1 = FUN_1007b5eb(local_14,local_8,local_20), iVar1 < 0))
    goto LAB_1007cc0c;
    if (local_18 != (uint *)0x0) {
      uVar16 = ZEXT48(local_c);
      puVar2 = local_18;
LAB_1007b73b:
      iVar1 = FUN_1007b5eb(puVar2,uVar16);
      if (iVar1 < 0) goto LAB_1007cc0c;
    }
  }
  puVar2 = local_10;
  puVar4 = param_2;
  switch(*(undefined4 *)(param_1 + 0x1c)) {
  case 0:
  case 1:
    if (local_14 == (uint *)0x0) {
      iVar1 = FUN_1007cc9c(*(undefined4 *)(param_1 + 0x20),param_2,puVar12);
      goto LAB_1007ba44;
    }
    if (param_2 != (uint *)0x0) {
      if (local_1c == (uint *)0x1) {
        puVar2 = (uint *)0x0;
        if (puVar12 != (uint *)0x0) {
          do {
            param_2[(int)puVar2] = *local_8;
            puVar2 = (uint *)((int)puVar2 + 1);
          } while (puVar2 < puVar12);
        }
      }
      else {
        puVar3 = local_8;
        if (((int)puVar12 - (int)local_1c == 0) ||
           ((uVar7 = *(uint *)(param_1 + 0x14), uVar7 == 1 && (puVar12 < local_1c))))
        goto code_r0x1007c3a3;
        if ((local_14[5] < uVar7) || (local_14[6] < *(uint *)(param_1 + 0x18))) break;
        uVar8 = 0;
        if (uVar7 != 0) {
          do {
            iVar11 = local_14[6] * uVar8;
            iVar1 = *(int *)(param_1 + 0x18);
            iVar5 = iVar1 * uVar8;
            uVar8 = uVar8 + 1;
            puVar2 = local_8 + iVar11;
            puVar12 = param_2 + iVar5;
            for (; iVar1 != 0; iVar1 = iVar1 + -1) {
              *puVar12 = *puVar2;
              puVar2 = puVar2 + 1;
              puVar12 = puVar12 + 1;
            }
            puVar12 = local_10;
          } while (uVar8 < *(uint *)(param_1 + 0x14));
        }
      }
      goto LAB_1007b796;
    }
    goto LAB_1007cbf1;
  case 2:
    if (local_14 != (uint *)0x0) {
      iVar1 = FUN_1006c449();
      if (iVar1 == 0) goto LAB_1007c836;
      puVar2 = (uint *)0x0;
      if (puVar12 != (uint *)0x0) {
        do {
          *(undefined4 *)(iVar1 + (int)puVar2 * 4) = *(undefined4 *)(in_ECX + 0x20);
          puVar2 = (uint *)((int)puVar2 + 1);
        } while (puVar2 < puVar12);
      }
LAB_1007b951:
      uVar7 = (uint)puVar12 & 0xfffff | 0x20400000;
      puVar2 = local_8;
LAB_1007b963:
      iVar1 = FUN_1006e308(param_1,uVar7,local_8,puVar2,iVar1);
      if (iVar1 < 0) goto LAB_1007cc0c;
LAB_1007b97b:
      puVar2 = local_10;
      puVar3 = local_8;
      if (param_2 != (uint *)0x0) {
code_r0x1007c3a3:
        for (; puVar12 = local_10, puVar2 != (uint *)0x0; puVar2 = (uint *)((int)puVar2 + -1)) {
          *puVar4 = *puVar3;
          puVar3 = puVar3 + 1;
          puVar4 = puVar4 + 1;
        }
        goto LAB_1007b796;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 3:
    if (local_14 != (uint *)0x0) {
      iVar1 = FUN_1006c449();
      if (iVar1 != 0) {
        puVar2 = (uint *)0x0;
        if (puVar12 != (uint *)0x0) {
          do {
            *(undefined4 *)(iVar1 + (int)puVar2 * 4) = *(undefined4 *)(in_ECX + 0x28);
            puVar2 = (uint *)((int)puVar2 + 1);
          } while (puVar2 < puVar12);
        }
        goto LAB_1007b951;
      }
      goto LAB_1007c836;
    }
    break;
  case 4:
    if (local_14 != (uint *)0x0) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c449();
        if (iVar1 != 0) {
          uVar7 = 0;
          do {
            (&local_2c)[uVar7] = iVar1;
            uVar7 = uVar7 + 1;
            iVar1 = iVar1 + (int)puVar12 * 4;
          } while (uVar7 < 2);
          iVar1 = FUN_1006c566(local_2c,puVar12);
          if ((((iVar1 < 0) || (iVar1 = FUN_1006c566(local_28,puVar12), iVar1 < 0)) ||
              (iVar1 = FUN_1006c566(param_2,puVar12), iVar1 < 0)) ||
             (iVar1 = FUN_10070d24(param_1,local_2c,local_28,local_8,puVar12), iVar1 < 0))
          goto LAB_1007cc0c;
          uVar16 = CONCAT44(0x17,local_2c);
          puVar2 = local_28;
          goto LAB_1007ba2a;
        }
        goto LAB_1007c836;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 5:
    if (local_14 != (uint *)0x0) {
      if (param_2 == (uint *)0x0) goto LAB_1007cbf1;
      iVar1 = FUN_1006c566(param_2,puVar12);
      if (iVar1 < 0) goto LAB_1007cc0c;
      uVar16 = 0;
      puVar3 = (uint *)((uint)puVar12 & 0xfffff | 0x10100000);
      puVar2 = local_8;
LAB_1007ba3a:
      iVar1 = FUN_1006e308(param_1,puVar3,param_2,puVar2,uVar16);
      goto LAB_1007ba44;
    }
    break;
  case 6:
    if (local_14 != (uint *)0x0) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        puVar2 = local_8;
joined_r0x1007c4dd:
        if (iVar1 < 0) goto LAB_1007cc0c;
        uVar16 = 0;
        puVar3 = (uint *)((uint)puVar12 & 0xfffff | 0x10000000);
        goto LAB_1007ba3a;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 7:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        if (iVar1 < 0) goto LAB_1007cc0c;
        uVar17 = 0;
LAB_1007c0cf:
        uVar16 = CONCAT44(uVar17,local_c);
        puVar3 = (uint *)((uint)puVar12 & 0xfffff);
LAB_1007c0d9:
        puVar3 = (uint *)((uint)puVar3 | 0x20500000);
        puVar2 = local_8;
        goto LAB_1007ba3a;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 8:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        local_18 = (uint *)FUN_1006c449();
        if (local_18 == (uint *)0x0) goto LAB_1007c836;
        iVar1 = FUN_1006c566(local_18,puVar12);
        if ((iVar1 < 0) || (iVar1 = FUN_1006c566(param_2,puVar12), iVar1 < 0)) goto LAB_1007cc0c;
        param_3 = (uint *)((uint)puVar12 & 0xfffff);
        iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10300000,local_18,local_c,0,0);
        if (iVar1 < 0) goto LAB_1007cc0c;
        uVar16 = ZEXT48(local_18);
        puVar3 = param_3;
        goto LAB_1007c0d9;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 9:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c449();
        if (iVar1 != 0) {
          uVar7 = 0;
          do {
            local_68[uVar7 + 3] = iVar1;
            uVar7 = uVar7 + 1;
            iVar1 = iVar1 + (int)puVar12 * 4;
          } while (uVar7 < 8);
          uVar7 = 0;
          do {
            uVar15 = FUN_1006c566(local_68[uVar7 + 3],puVar12);
            iVar1 = (int)uVar15;
            if (iVar1 < 0) goto LAB_1007cc0c;
            uVar7 = (int)((ulonglong)uVar15 >> 0x20) + 1;
          } while (uVar7 < 8);
          iVar1 = FUN_1006c566(param_2,puVar12);
          if (iVar1 < 0) goto LAB_1007cc0c;
          param_3 = (uint *)((uint)puVar12 & 0xfffff);
          local_18 = (uint *)((uint)param_3 | 0x20500000);
          iVar1 = FUN_1006e308(param_1,local_18,local_68[3],local_8,local_c,0);
          if (iVar1 < 0) goto LAB_1007cc0c;
          local_28 = (uint *)((uint)param_3 | 0x10100000);
          iVar1 = FUN_1006e308(param_1,local_28,local_68[4],local_68[3],0,0);
          if ((((iVar1 < 0) ||
               (iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x20300000,local_68[5],local_68[3],
                                     local_68[4],0x17), iVar1 < 0)) ||
              (iVar1 = FUN_1006e308(param_1,local_28,local_68[6],local_c,0,0), iVar1 < 0)) ||
             (((iVar1 = FUN_1007041a(param_1,local_4c,local_68[6],local_c,local_68[5],puVar12),
               iVar1 < 0 ||
               (iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10300000,uStack_48,local_4c,0,0x40),
               iVar1 < 0)) ||
              ((iVar1 = FUN_1006e308(param_1,local_18,local_44,local_8,uStack_48,0), iVar1 < 0 ||
               (iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10400000,puStack_40,local_44,0,4),
               iVar1 < 0)))))) goto LAB_1007cc0c;
          uVar16 = ZEXT48(puStack_40);
          puVar3 = local_18;
          puVar2 = local_4c;
          goto LAB_1007ba3a;
        }
        goto LAB_1007c836;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 10:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        if (iVar1 < 0) goto LAB_1007cc0c;
        puVar3 = (uint *)((uint)puVar12 & 0xfffff);
        puVar2 = local_c;
LAB_1007bafd:
        uVar16 = ZEXT48(puVar2);
        puVar3 = (uint *)((uint)puVar3 | 0x20400000);
        puVar2 = local_8;
        goto LAB_1007ba3a;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0xb:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        local_18 = (uint *)FUN_1006c449();
        if (local_18 != (uint *)0x0) {
          iVar1 = FUN_1006c566(local_18,puVar12);
          if ((iVar1 < 0) || (iVar1 = FUN_1006c566(param_2,puVar12), iVar1 < 0)) goto LAB_1007cc0c;
          param_3 = (uint *)((uint)puVar12 & 0xfffff);
          iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10100000,local_18,local_c,0,0);
          puVar3 = param_3;
          puVar2 = local_18;
          if (iVar1 < 0) goto LAB_1007cc0c;
          goto LAB_1007bafd;
        }
        goto LAB_1007c836;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0xc:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        puVar2 = local_8;
        puVar4 = local_c;
joined_r0x1007bbfd:
        if (iVar1 < 0) goto LAB_1007cc0c;
        puVar3 = (uint *)((uint)puVar12 & 0xfffff);
LAB_1007bc12:
        uVar16 = CONCAT44(0x17,puVar4);
        puVar3 = (uint *)((uint)puVar3 | 0x20200000);
        goto LAB_1007ba3a;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0xd:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        puVar2 = local_c;
        puVar4 = local_8;
        goto joined_r0x1007bbfd;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0xe:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        if (iVar1 < 0) goto LAB_1007cc0c;
        uVar16 = CONCAT44(0x17,local_8);
        puVar2 = local_c;
LAB_1007ba2a:
        puVar3 = (uint *)((uint)puVar12 & 0xfffff);
LAB_1007ba31:
        puVar3 = (uint *)((uint)puVar3 | 0x20300000);
        goto LAB_1007ba3a;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0xf:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        if (iVar1 < 0) goto LAB_1007cc0c;
        uVar16 = CONCAT44(0x17,local_c);
        puVar2 = local_8;
        goto LAB_1007ba2a;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0x10:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        puVar2 = (uint *)FUN_1006c449();
        if (puVar2 == (uint *)0x0) goto LAB_1007c836;
        uVar7 = 0;
        puVar4 = puVar2;
        do {
          local_3c[uVar7] = puVar4;
          uVar7 = uVar7 + 1;
          puVar4 = puVar4 + (int)puVar12;
        } while (uVar7 < 4);
        iVar1 = FUN_1006c566(puVar2,(int)puVar12 * 4);
        if ((iVar1 < 0) || (iVar1 = FUN_1006c566(param_2,puVar12), iVar1 < 0)) goto LAB_1007cc0c;
        param_3 = (uint *)((uint)puVar12 & 0xfffff);
        iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10100000,local_3c[0],local_c,0,0);
        if ((iVar1 < 0) ||
           ((iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x20400000,local_3c[1],local_8,local_3c[0]
                                  ,0), iVar1 < 0 ||
            (iVar1 = FUN_10070d24(param_1,local_3c[2],local_3c[3],local_3c[1],puVar12), iVar1 < 0)))
           ) goto LAB_1007cc0c;
        uVar16 = CONCAT44(0x17,local_3c[2]);
        puVar3 = param_3;
        puVar2 = local_3c[3];
        goto LAB_1007ba31;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0x11:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        puVar2 = (uint *)FUN_1006c449();
        if (puVar2 == (uint *)0x0) goto LAB_1007c836;
        uVar7 = 0;
        puVar4 = puVar2;
        do {
          local_3c[uVar7] = puVar4;
          uVar7 = uVar7 + 1;
          puVar4 = puVar4 + (int)puVar12;
        } while (uVar7 < 4);
        iVar1 = FUN_1006c566(puVar2,(int)puVar12 * 4);
        if ((iVar1 < 0) || (iVar1 = FUN_1006c566(param_2,puVar12), iVar1 < 0)) goto LAB_1007cc0c;
        param_3 = (uint *)((uint)puVar12 & 0xfffff);
        iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10100000,local_3c[0],local_c,0,0);
        if (iVar1 < 0) goto LAB_1007cc0c;
        uVar7 = (uint)param_3 | 0x20400000;
        puVar2 = local_3c[0];
LAB_1007be23:
        iVar1 = FUN_1006e308(param_1,uVar7,local_3c[1],local_8,puVar2);
        if (iVar1 < 0) goto LAB_1007cc0c;
        iVar1 = FUN_10070d24(param_1,local_3c[2],local_3c[3],local_3c[1],puVar12);
LAB_1007c084:
        puVar3 = param_3;
        puVar2 = local_3c[3];
        puVar4 = local_3c[2];
        if (iVar1 < 0) goto LAB_1007cc0c;
        goto LAB_1007bc12;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0x12:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        param_3 = (uint *)0x0;
        if (puVar12 != (uint *)0x0) {
          iVar1 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
          puVar2 = local_c;
LAB_1007be87:
          if (((**(byte **)(iVar1 + *(int *)(((int)local_8 - (int)local_c) + (int)puVar2) * 4) & 1)
               != 0) && ((**(byte **)(iVar1 + *puVar2 * 4) & 1) != 0)) goto code_r0x1007be9c;
          puVar2 = (uint *)FUN_1006c449();
          if (puVar2 != (uint *)0x0) {
            uVar7 = 0;
            do {
              local_3c[uVar7 + 1] = puVar2;
              uVar7 = uVar7 + 1;
              puVar2 = puVar2 + (int)puVar12;
            } while (uVar7 < 3);
            iVar1 = FUN_1006c566(local_3c[1],puVar12);
            if ((((iVar1 < 0) || (iVar1 = FUN_1006c566(local_3c[2],puVar12), iVar1 < 0)) ||
                (iVar1 = FUN_1006c566(local_3c[3],puVar12), iVar1 < 0)) ||
               (iVar1 = FUN_1006c566(param_2,puVar12), iVar1 < 0)) goto LAB_1007cc0c;
            param_3 = (uint *)((uint)puVar12 & 0xfffff);
            uVar7 = (uint)param_3 | 0x20500000;
            puVar2 = local_c;
            goto LAB_1007be23;
          }
          goto LAB_1007c836;
        }
LAB_1007bea7:
        iVar1 = FUN_1006c566(param_2,puVar12);
        if (iVar1 < 0) goto LAB_1007cc0c;
        uVar17 = 0x17;
        goto LAB_1007c0cf;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0x13:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 != (uint *)0x0) {
        puVar2 = (uint *)FUN_1006c449();
        if (puVar2 != (uint *)0x0) {
          uVar7 = 0;
          do {
            local_3c[uVar7] = puVar2;
            uVar7 = uVar7 + 1;
            puVar2 = puVar2 + (int)puVar12;
          } while (uVar7 < 4);
          iVar1 = FUN_1006c566(local_3c[0],puVar12);
          if ((((iVar1 < 0) || (iVar1 = FUN_1006c566(local_3c[1],puVar12), iVar1 < 0)) ||
              (iVar1 = FUN_1006c566(local_3c[2],puVar12), iVar1 < 0)) ||
             (((iVar1 = FUN_1006c566(local_3c[3],puVar12), iVar1 < 0 ||
               (iVar1 = FUN_1006c566(param_2,puVar12), iVar1 < 0)) ||
              ((iVar1 = FUN_10070d24(param_1,local_3c[0],0,local_8,puVar12), iVar1 < 0 ||
               (iVar1 = FUN_10070d24(param_1,local_3c[1],0,local_c,puVar12), iVar1 < 0))))))
          goto LAB_1007cc0c;
          param_3 = (uint *)((uint)puVar12 & 0xfffff);
          iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x20400000,local_3c[2],local_3c[0],
                               local_3c[1],4);
          if (iVar1 < 0) goto LAB_1007cc0c;
          iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10100000,local_3c[3],local_3c[2],0,8);
          goto LAB_1007c084;
        }
        goto LAB_1007c836;
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0x14:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (puVar12 != (uint *)0x0) {
        iVar1 = *(int *)(in_ECX + 8);
        if (*local_8 < *(uint *)(iVar1 + 8)) {
          iVar5 = *(int *)(*(int *)(iVar1 + 0x14) + *local_8 * 4);
        }
        else {
          iVar5 = 0;
        }
        if ((iVar5 != 0) && (*(int *)(iVar1 + 0x74) == *(int *)(iVar5 + 4))) {
          puVar2 = (uint *)0x0;
          if (puVar12 != (uint *)0x0) {
            do {
              if (*(int *)(*(int *)(*(int *)(iVar1 + 0x14) + local_8[(int)puVar2] * 4) + 0x30) == -1
                 ) goto LAB_1007cbfe;
              puVar2 = (uint *)((int)puVar2 + 1);
            } while (puVar2 < puVar12);
          }
          goto LAB_1007b89c;
        }
        goto LAB_1007b97b;
      }
      goto LAB_1007b796;
    }
    break;
  case 0x15:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (puVar12 != (uint *)0x0) {
        puVar2 = (uint *)0x0;
        if (puVar12 != (uint *)0x0) {
          do {
            if (*(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + local_8[(int)puVar2] * 4)
                        + 0x30) == -1) goto LAB_1007cbfe;
            puVar2 = (uint *)((int)puVar2 + 1);
          } while (puVar2 < puVar12);
        }
LAB_1007b89c:
        iVar1 = 0;
        uVar7 = (uint)puVar12 & 0xfffff | 0x10000000;
        puVar2 = local_c;
        goto LAB_1007b963;
      }
      goto LAB_1007b796;
    }
    break;
  case 0x16:
    if (local_18 != (uint *)0x0) {
      iVar1 = FUN_100794d6(param_1,param_2,puVar12,local_8,local_1c,local_14[4],local_c,param_3);
      goto LAB_1007ba44;
    }
    break;
  case 0x17:
    if ((local_14 != (uint *)0x0) && (iVar1 = *(int *)(param_1 + 0x24), iVar1 != 0)) {
      if (*(int *)(iVar1 + 4) == 0xe) {
        if (*(int *)(iVar1 + 0x10) != 2) break;
        if (param_2 != (uint *)0x0) {
          puVar3 = local_8 + *(int *)(iVar1 + 0x18);
          goto code_r0x1007c3a3;
        }
      }
      else {
        if (*(int *)(iVar1 + 4) != 1) break;
        if (param_2 != (uint *)0x0) {
          puVar2 = (uint *)0x0;
          if (puVar12 != (uint *)0x0) {
            do {
              param_2[(int)puVar2] = local_8[*(int *)(*(int *)(iVar1 + 8) + 0x18)];
              iVar1 = *(int *)(iVar1 + 0xc);
              puVar2 = (uint *)((int)puVar2 + 1);
            } while (puVar2 < puVar12);
          }
          goto LAB_1007b796;
        }
      }
      goto LAB_1007cbf1;
    }
    break;
  case 0x18:
    if ((local_14 != (uint *)0x0) && (local_18 != (uint *)0x0)) {
      if (param_2 == (uint *)0x0) goto LAB_1007cbf1;
      puVar2 = (uint *)FUN_1006c449();
      if (puVar2 == (uint *)0x0) goto LAB_1007c836;
      uVar7 = 0;
      do {
        local_3c[uVar7 + 1] = puVar2;
        uVar7 = uVar7 + 1;
        puVar2 = puVar2 + (int)puVar12;
      } while (uVar7 < 3);
      local_20 = (uint *)0x0;
      if (puVar12 != (uint *)0x0) {
        local_1c = local_c + (int)puVar12;
        local_28 = (uint *)((int)local_8 - (int)local_c);
        param_3 = (uint *)((int)local_c - (int)local_3c[1]);
        puVar2 = local_3c[1];
        while (iVar1 = FUN_1006c8ca(*(undefined4 *)((int)param_3 + (int)puVar2 + (int)local_28),
                                    &local_4c), -1 < iVar1) {
          if ((0.0 < (double)CONCAT44(uStack_48,local_4c)) ||
             ((double)CONCAT44(puStack_40,local_44) < 0.0)) {
            puVar4 = (uint *)((int)param_3 + (int)puVar2);
          }
          else if (((double)CONCAT44(uStack_48,local_4c) != 0.0) ||
                  (puVar4 = local_1c, (double)CONCAT44(puStack_40,local_44) != 0.0)) break;
          local_20 = (uint *)((int)local_20 + 1);
          local_1c = local_1c + 1;
          *puVar2 = *puVar4;
          puVar2 = puVar2 + 1;
          if (puVar12 <= local_20) break;
        }
      }
      if (local_20 == puVar12) {
        iVar1 = FUN_1006c566(param_2,puVar12);
        puVar2 = local_3c[1];
        goto joined_r0x1007c4dd;
      }
      iVar1 = FUN_1006c566(local_3c[1],puVar12);
      if ((((iVar1 < 0) || (iVar1 = FUN_1006c566(local_3c[2],puVar12), iVar1 < 0)) ||
          (iVar1 = FUN_1006c566(local_3c[3],puVar12), iVar1 < 0)) ||
         ((iVar1 = FUN_10070d24(param_1,local_3c[1],local_3c[2],local_8,puVar12), iVar1 < 0 ||
          (iVar1 = FUN_1006e308(param_1,(uint)puVar12 & 0xfffff | 0x20200000,local_3c[3],local_3c[2]
                                ,local_3c[1],0x17), iVar1 < 0)))) goto LAB_1007cc0c;
      iVar1 = FUN_1007041a(param_1,param_2,local_c + (int)puVar12,local_c,local_3c[3],puVar12);
      goto LAB_1007ba44;
    }
    break;
  case 0x19:
    iVar1 = FUN_1006da19(*(undefined4 *)(param_1 + 0x20),&param_3);
    if (iVar1 != 0) {
      *(int *)(in_ECX + 0x38) = *(int *)(in_ECX + 0x38) + 1;
      iVar1 = FUN_1007aa30(param_3,iVar1,*(undefined4 *)(param_1 + 0x24),param_2,0,0);
      *(int *)(in_ECX + 0x38) = *(int *)(in_ECX + 0x38) + -1;
      goto LAB_1007ba44;
    }
    FUN_1006dca1();
    break;
  case 0x1a:
    iVar1 = FUN_10073752();
LAB_1007ba44:
    if (iVar1 < 0) goto LAB_1007cc0c;
LAB_1007b796:
    if (param_2 != (uint *)0x0) {
      puVar2 = *(uint **)(in_ECX + 0x9c);
      if (puVar2 < puVar12) {
        if (puVar2 == (uint *)0x0) {
          puVar2 = (uint *)0x10;
        }
        else {
          puVar2 = (uint *)((int)puVar2 * 2);
        }
        for (; puVar2 < puVar12; puVar2 = (uint *)((int)puVar2 * 2)) {
        }
        param_3 = operator_new((int)puVar2 << 3);
        if (param_3 == (uint *)0x0) goto LAB_1007c836;
        _free(*(void **)(in_ECX + 0x98));
        *(uint **)(in_ECX + 0x98) = param_3;
        *(uint **)(in_ECX + 0x9c) = puVar2;
      }
      local_10 = *(uint **)(in_ECX + 0x98);
      local_28 = local_10 + (int)puVar12;
      FUN_1006ddf3(*(undefined4 *)(param_1 + 0x10),local_28);
      param_3 = (uint *)0x0;
      local_14 = (uint *)0x0;
      local_1c = (uint *)0x0;
      if (puVar12 != (uint *)0x0) {
        local_24 = (uint *)((int)param_2 - (int)local_28);
        local_20 = (uint *)((int)local_28 - (int)local_10);
        local_18 = local_10;
        do {
          pbVar9 = (byte *)((int)local_18 + (int)local_20);
          iVar1 = *(int *)(in_ECX + 8);
          if (*(uint *)(pbVar9 + (int)local_24) < *(uint *)(iVar1 + 8)) {
            pbVar6 = *(byte **)(*(int *)(iVar1 + 0x14) + *(uint *)(pbVar9 + (int)local_24) * 4);
          }
          else {
            pbVar6 = (byte *)0x0;
          }
          if (pbVar6 == (byte *)0x0) goto LAB_1007cbfe;
          if (*(int *)(iVar1 + 0x74) == *(int *)(pbVar6 + 4)) {
LAB_1007c6ee:
            *local_18 = 0;
          }
          else if (((*pbVar9 & 1) == 0) || ((*pbVar6 & 1) != 0)) {
            if ((*(int *)(iVar1 + 0x74) == *(int *)(pbVar6 + 4)) ||
               (((*pbVar9 & 2) == 0 || ((*pbVar6 & 2) != 0)))) goto LAB_1007c6ee;
            local_14 = (uint *)((int)local_14 + 1);
            *local_18 = 2;
          }
          else {
            param_3 = (uint *)((int)param_3 + 1);
            *local_18 = 1;
          }
          puVar2 = param_3;
          local_1c = (uint *)((int)local_1c + 1);
          local_18 = local_18 + 1;
        } while (local_1c < puVar12);
        if (param_3 != (uint *)0x0) {
          puVar4 = (uint *)FUN_1006c449();
          if (puVar4 == (uint *)0x0) goto LAB_1007c836;
          uVar7 = 0;
          do {
            local_3c[uVar7] = puVar4;
            uVar7 = uVar7 + 1;
            puVar4 = puVar4 + (int)puVar2;
          } while (uVar7 < 4);
          iVar1 = FUN_1006c566(local_3c[1],param_3);
          if ((iVar1 < 0) || (iVar1 = FUN_1006c566(local_3c[2],param_3), iVar1 < 0))
          goto LAB_1007cc0c;
          local_1c = (uint *)((int)local_10 - (int)param_2);
          local_20 = (uint *)((int)local_3c[0] - (int)local_3c[3]);
          puVar2 = param_2;
          puVar4 = local_3c[3];
          local_24 = puVar12;
          do {
            if (*(int *)((int)local_1c + (int)puVar2) == 1) {
              *(uint *)((int)local_20 + (int)puVar4) = *puVar2;
              if (*(int *)(param_1 + 0x1c) == 0) {
                uVar7 = 0xffffffff;
              }
              else {
                uVar7 = *puVar2;
              }
              *puVar4 = uVar7;
              puVar4 = puVar4 + 1;
            }
            puVar2 = puVar2 + 1;
            local_24 = (uint *)((int)local_24 + -1);
          } while (local_24 != (uint *)0x0);
          iVar1 = FUN_10070d24(param_1,local_3c[1],local_3c[2],local_3c[0],param_3);
          if ((iVar1 < 0) ||
             (iVar1 = FUN_1006e308(param_1,(uint)param_3 & 0xfffff | 0x20200000,local_3c[3],
                                   local_3c[2],local_3c[1],0x17), puVar2 = param_2, puVar4 = puVar12
             , iVar1 < 0)) goto LAB_1007cc0c;
          do {
            if (*(int *)((int)puVar2 + (int)local_1c) == 1) {
              *puVar2 = *local_3c[3];
              local_3c[3] = local_3c[3] + 1;
            }
            puVar4 = (uint *)((int)puVar4 + -1);
            puVar2 = puVar2 + 1;
          } while (puVar4 != (uint *)0x0);
        }
        puVar2 = local_14;
        if (local_14 != (uint *)0x0) {
          iVar1 = FUN_1006c449();
          if (iVar1 == 0) goto LAB_1007c836;
          uVar7 = 0;
          do {
            local_68[uVar7] = iVar1;
            uVar7 = uVar7 + 1;
            iVar1 = iVar1 + (int)puVar2 * 4;
          } while (uVar7 < 0xb);
          local_1c = (uint *)((int)local_10 - (int)param_2);
          local_18 = (uint *)(local_68[0] - (int)puStack_40);
          puVar2 = param_2;
          puVar4 = puStack_40;
          param_3 = puVar12;
          do {
            if (*(int *)((int)local_1c + (int)puVar2) == 2) {
              *(uint *)((int)local_18 + (int)puVar4) = *puVar2;
              if (*(int *)(param_1 + 0x1c) == 0) {
                uVar7 = 0xffffffff;
              }
              else {
                uVar7 = *puVar2;
              }
              *puVar4 = uVar7;
              puVar4 = puVar4 + 1;
            }
            puVar2 = puVar2 + 1;
            param_3 = (uint *)((int)param_3 + -1);
          } while (param_3 != (uint *)0x0);
          uVar7 = 1;
          param_3 = (uint *)0x0;
          do {
            uVar15 = FUN_1006c566(local_68[uVar7],local_14);
            iVar1 = (int)uVar15;
            if (iVar1 < 0) goto LAB_1007cc0c;
            uVar7 = (int)((ulonglong)uVar15 >> 0x20) + 1;
          } while (uVar7 < 10);
          param_3 = (uint *)((uint)local_14 & 0xfffff);
          iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10200000,local_68[1],local_68[0],0,0);
          if ((iVar1 < 0) ||
             (iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x10400000,local_68[2],local_68[1],0,0x14
                                  ), iVar1 < 0)) goto LAB_1007cc0c;
          local_24 = (uint *)((uint)param_3 | 0x10100000);
          iVar1 = FUN_1006e308(param_1,local_24,local_68[3],local_68[2],0,0x18);
          if (iVar1 < 0) goto LAB_1007cc0c;
          local_14 = (uint *)((uint)param_3 | 0x20400000);
          iVar1 = FUN_1006e308(param_1,local_14,local_68[4],local_68[3],local_68[1],2);
          if ((iVar1 < 0) ||
             (iVar1 = FUN_1006e308(param_1,local_24,local_68[5],local_68[0],0,0), iVar1 < 0))
          goto LAB_1007cc0c;
          local_20 = (uint *)((uint)param_3 | 0x20200000);
          iVar1 = FUN_1006e308(param_1,local_20,local_68[6],local_68[0],local_68[5],0x17);
          if ((iVar1 < 0) ||
             ((((iVar1 = FUN_1006e308(param_1,local_24,local_4c,local_68[2],0,0), iVar1 < 0 ||
                (iVar1 = FUN_1006e308(param_1,local_20,uStack_48,local_4c,local_68[2],0x17),
                iVar1 < 0)) ||
               (iVar1 = FUN_1006e308(param_1,(uint)param_3 | 0x20500000,local_44,local_68[6],
                                     uStack_48,0x17), iVar1 < 0)) ||
              (iVar1 = FUN_1006e308(param_1,local_14,puStack_40,local_68[4],local_44,2), iVar1 < 0))
             )) goto LAB_1007cc0c;
          local_20 = param_2;
          param_3 = puStack_40;
          local_24 = puVar12;
          do {
            if (*(int *)((int)local_1c + (int)local_20) == 2) {
              iVar1 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
              puVar2 = *(uint **)(iVar1 + *(int *)((int)puStack_40 + (int)local_18) * 4);
              puVar4 = *(uint **)(iVar1 + *puStack_40 * 4);
              if ((char)*puVar2 < '\0') {
                *(undefined8 *)(puVar2 + 10) = *(undefined8 *)(puVar2 + 8);
                *puVar2 = *puVar2 | 0x100;
              }
              if ((*puVar2 & 0x100) != 0) {
                iVar1 = FUN_100f8c58(*(undefined8 *)(puVar2 + 8));
                fVar14 = (float10)*(double *)(puVar2 + 8);
                if (iVar1 != 0) {
                  if (fVar14 < (float10)0.0) {
                    fVar14 = (float10)FUN_100f6670(*(double *)(in_ECX + 0xb0) -
                                                   *(double *)(puVar2 + 8));
                    fVar14 = -fVar14;
                  }
                  else {
                    fVar14 = (float10)FUN_100f6670(*(double *)(in_ECX + 0xb0) +
                                                   *(double *)(puVar2 + 8));
                  }
                }
                *(double *)(puVar4 + 8) = (double)fVar14;
                iVar1 = FUN_100f8c58(*(undefined8 *)(puVar2 + 10));
                if (iVar1 == 0) {
                  *(double *)(puVar4 + 10) = *(double *)(puVar2 + 10);
                }
                else {
                  if (*(double *)(puVar2 + 10) < 0.0) {
                    fVar14 = (float10)FUN_100f6670(*(double *)(in_ECX + 0xb0) -
                                                   *(double *)(puVar2 + 10));
                    fVar14 = -fVar14;
                  }
                  else {
                    fVar14 = (float10)FUN_100f6670(*(double *)(in_ECX + 0xb0) +
                                                   *(double *)(puVar2 + 10));
                  }
                  *(double *)(puVar4 + 10) = (double)fVar14;
                }
                *(byte *)((int)puVar4 + 1) = *(byte *)((int)puVar4 + 1) | 1;
                if (*(double *)(puVar4 + 8) == *(double *)(puVar4 + 10)) {
                  uVar7 = *puVar4 | 0x80;
                }
                else {
                  uVar7 = *puVar4 & 0xffffff7f;
                }
                *puVar4 = uVar7;
              }
              puStack_40 = param_3 + 1;
              *local_20 = *param_3;
              param_3 = puStack_40;
            }
            local_20 = local_20 + 1;
            local_24 = (uint *)((int)local_24 + -1);
          } while (local_24 != (uint *)0x0);
        }
      }
      if (puVar12 != (uint *)0x0) {
        local_24 = (uint *)((int)param_2 - (int)local_28);
        puVar2 = local_28;
        param_2 = puVar12;
        do {
          puVar12 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                              *(int *)((int)local_24 + (int)puVar2) * 4);
          uVar7 = *puVar2;
          uVar8 = *puVar12;
          *puVar12 = uVar7 & 0xf1ffffff | uVar8;
          uVar10 = *puVar2 & 0xe000000;
          uVar13 = uVar8 & 0xe000000;
          if ((uVar8 & 0xe000000) == 0) {
            uVar13 = uVar10;
          }
          if (puVar12[0x17] == 0) {
            if (uVar13 < uVar10) {
LAB_1007cbde:
              uVar10 = uVar13;
            }
          }
          else if (uVar10 < uVar13) goto LAB_1007cbde;
          puVar2 = puVar2 + 1;
          param_2 = (uint *)((int)param_2 + -1);
          *puVar12 = uVar7 & 0xf1ffffff | uVar8 & 0xf1ffffff | uVar10;
        } while (param_2 != (uint *)0x0);
      }
    }
LAB_1007cbf1:
    iVar1 = 0;
    goto LAB_1007cc0c;
  default:
LAB_1007cbfe:
    FUN_1006dca1();
  }
  iVar1 = -0x7fffbffb;
LAB_1007cc0c:
  FUN_1006c52d();
  FUN_1006c52d();
  return iVar1;
code_r0x1007be9c:
  param_3 = (uint *)((int)param_3 + 1);
  puVar2 = puVar2 + 1;
  if (puVar12 <= param_3) goto LAB_1007bea7;
  goto LAB_1007be87;
}
