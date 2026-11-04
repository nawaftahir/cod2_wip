// 1009ee58 size=2077 FUN_1009ee58

int FUN_1009ee58(undefined4 *param_1,int param_2)

{
  uint *puVar1;
  int iVar2;
  undefined4 *puVar3;
  uint uVar4;
  undefined4 *puVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  double *pdVar9;
  int iVar10;
  bool bVar11;
  byte bVar12;
  float10 fVar13;
  float10 fVar14;
  undefined8 uVar15;
  uint local_2c;
  uint local_28;
  uint local_24;
  undefined8 local_20;
  undefined8 local_18;
  undefined4 *local_10;
  undefined4 *local_c;
  undefined4 local_8;
  
  iVar10 = (int)param_1;
  if ((param_1 == (undefined4 *)0x0) || (*(int *)((int)param_1 + 4) != 0xd)) {
    return -0x7fffbffb;
  }
  uVar7 = *(int *)((int)param_1 + 0x18) * *(int *)((int)param_1 + 0x14);
  iVar2 = FUN_1009a225(*(undefined4 *)((int)param_1 + 0x10),param_2);
  uVar4 = (uint)local_18;
  if (uVar7 - iVar2 != 0) {
    return -0x7fffbffb;
  }
  iVar2 = *(int *)((int)param_1 + 0x1c);
  if (1 < iVar2) {
    if (iVar2 < 4) {
      return -0x7fffbffb;
    }
    if (0x13 < iVar2) {
      if (iVar2 < 0x16) {
        return -0x7fffbffb;
      }
      if (iVar2 == 0x19) {
        return -0x7fffbffb;
      }
      if (iVar2 == 0x1a) {
        iVar10 = FUN_1009cd0b(param_1,param_2);
        return iVar10;
      }
      if (iVar2 == 0x1b) {
        return -0x7fffbffb;
      }
    }
  }
  uVar8 = *(uint *)((int)param_1 + 0x20);
  local_2c = 0;
  local_20 = (double)(ulonglong)(uint)local_20;
  local_c = (undefined4 *)0x0;
  local_10 = (undefined4 *)0x0;
  local_18 = (double)(ulonglong)(uint)local_18;
  local_24 = 0;
  uVar6 = 0;
  if ((uVar8 != 0) && (*(int *)(uVar8 + 4) == 0xd)) {
    iVar2 = *(int *)(uVar8 + 0x18) * *(int *)(uVar8 + 0x14);
    local_18 = (double)CONCAT44(iVar2,uVar4);
    local_2c = uVar8;
    local_c = operator_new(iVar2 * 0x10);
    uVar6 = uVar8;
    if (local_c != (undefined4 *)0x0) goto LAB_1009ef15;
LAB_1009ef42:
    iVar2 = -0x7ff8fff2;
    goto LAB_1009f64a;
  }
LAB_1009ef15:
  uVar4 = *(uint *)((int)param_1 + 0x24);
  uVar8 = 0;
  if ((uVar4 != 0) && (*(int *)(uVar4 + 4) == 0xd)) {
    local_24 = *(int *)(uVar4 + 0x18) * *(int *)(uVar4 + 0x14);
    local_20 = (double)CONCAT44(uVar4,(uint)local_20);
    local_10 = operator_new(local_24 * 0x10);
    uVar8 = uVar4;
    if (local_10 == (undefined4 *)0x0) goto LAB_1009ef42;
  }
  if (*(int *)((int)param_1 + 0x28) == 0) {
    uVar4 = uVar6;
    if ((uVar8 != 0) && (iVar2 = FUN_1009ee58(), iVar2 < 0)) goto LAB_1009f64a;
  }
  else {
    uVar4 = uVar8;
    if (uVar6 != 0) {
      iVar2 = FUN_1009ee58();
      if (iVar2 < 0) goto LAB_1009f64a;
      uVar4 = local_20._4_4_;
    }
  }
  if ((uVar4 != 0) && (iVar2 = FUN_1009ee58(), iVar2 < 0)) goto LAB_1009f64a;
  puVar5 = local_c;
  iVar2 = *(int *)((int)param_1 + 0x1c);
  if (iVar2 < 0) {
LAB_1009f3ca:
    local_28 = 0;
    if (local_18._4_4_ != 0) {
      do {
        uVar15 = FUN_1009a36a(puVar5 + 2,puVar5,(int)param_1 + 0x30);
        puVar5 = (undefined4 *)((ulonglong)uVar15 >> 0x20);
        iVar2 = (int)uVar15;
        if (iVar2 < 0) goto LAB_1009f64a;
        local_28 = local_28 + 1;
        *puVar5 = 3;
        puVar5 = puVar5 + 4;
      } while (local_28 < local_18._4_4_);
    }
    local_28 = 0;
    if (local_24 != 0) {
      puVar5 = local_10;
      do {
        uVar15 = FUN_1009a36a(puVar5 + 2,puVar5,(int)param_1 + 0x30);
        puVar5 = (undefined4 *)((ulonglong)uVar15 >> 0x20);
        iVar2 = (int)uVar15;
        if (iVar2 < 0) goto LAB_1009f64a;
        local_28 = local_28 + 1;
        *puVar5 = 3;
        puVar5 = puVar5 + 4;
        uVar6 = local_2c;
      } while (local_28 < local_24);
    }
    if (((uVar6 != 0) && (local_18._4_4_ != uVar7)) ||
       ((local_20._4_4_ != 0 && (local_24 != uVar7)))) goto switchD_1009f4bf_default;
    local_24 = 0;
    if (uVar7 != 0) {
      local_2c = (int)local_c - (int)local_10;
      local_28 = param_2 - (int)local_10;
      pdVar9 = (double *)(local_10 + 2);
      do {
        if (local_c == (undefined4 *)0x0) {
          fVar13 = (float10)0;
        }
        else {
          fVar13 = (float10)*(double *)((int)pdVar9 + local_2c);
        }
        local_18 = (double)fVar13;
        if (local_10 == (undefined4 *)0x0) {
          local_20 = 0.0;
        }
        else {
          local_20 = *pdVar9;
        }
        switch(*(undefined4 *)((int)param_1 + 0x1c)) {
        case 4:
          fVar14 = (float10)0.0;
          goto LAB_1009f4cc;
        case 5:
          fVar13 = -fVar13;
          break;
        case 6:
          break;
        case 7:
          fVar13 = fVar13 * (float10)local_20;
          break;
        case 8:
          if (local_20 == 0.0) {
            FUN_100994dd(local_8,(int)param_1 + 0x30,0xbd9,"division by zero");
            fVar13 = (float10)local_18;
          }
          fVar13 = fVar13 / (float10)local_20;
          break;
        case 9:
          if (local_20 == 0.0) {
            FUN_100994dd(local_8,(int)param_1 + 0x30,0xbd9,"division by zero");
          }
          fVar13 = (float10)FUN_100f92fa();
          break;
        case 10:
          fVar13 = fVar13 + (float10)local_20;
          break;
        case 0xb:
          fVar13 = fVar13 - (float10)local_20;
          break;
        case 0xc:
          bVar11 = (float10)local_20 <= fVar13;
          goto LAB_1009f4d7;
        case 0xd:
          bVar11 = (float10)local_20 < fVar13;
          goto LAB_1009f59c;
        case 0xe:
          bVar11 = fVar13 < (float10)local_20 == (fVar13 == (float10)local_20);
          goto LAB_1009f4d7;
        case 0xf:
          bVar11 = (float10)local_20 <= fVar13;
LAB_1009f59c:
          if (!bVar11) goto LAB_1009f4dd;
          goto LAB_1009f5f8;
        case 0x10:
          fVar14 = (float10)local_20;
LAB_1009f4cc:
          bVar11 = fVar13 != fVar14;
LAB_1009f4d7:
          if (bVar11) {
LAB_1009f4dd:
            fVar13 = (float10)0;
          }
          else {
LAB_1009f5f8:
            fVar13 = (float10)1;
          }
          break;
        case 0x11:
          bVar12 = (byte)((ushort)((ushort)(NAN(fVar13) || NAN((float10)local_20)) << 10) >> 8) |
                   (byte)((ushort)((ushort)(fVar13 == (float10)local_20) << 0xe) >> 8);
LAB_1009f5ed:
          if ((POPCOUNT(bVar12) & 1U) == 0) goto LAB_1009f5f8;
          goto LAB_1009f4dd;
        case 0x12:
          if (fVar13 != (float10)0.0) {
LAB_1009f5e2:
            bVar12 = (byte)((ushort)((ushort)NAN(local_20) << 10) >> 8) |
                     (byte)((ushort)((ushort)(local_20 == 0.0) << 0xe) >> 8);
            goto LAB_1009f5ed;
          }
          goto LAB_1009f4dd;
        case 0x13:
          if (fVar13 == (float10)0.0) goto LAB_1009f5e2;
          goto LAB_1009f5f8;
        default:
          goto switchD_1009f4bf_default;
        }
        local_24 = local_24 + 1;
        *(double *)((int)pdVar9 + local_28) = (double)fVar13;
        pdVar9 = pdVar9 + 2;
      } while (local_24 < uVar7);
    }
    local_2c = 0;
    if (uVar7 != 0) {
      do {
        iVar2 = FUN_1009ca51(param_2,*(undefined8 *)(param_2 + 8),(int)param_1 + 0x30);
        if (iVar2 < 0) goto LAB_1009f64a;
        local_2c = local_2c + 1;
        param_2 = param_2 + 0x10;
      } while (local_2c < uVar7);
    }
  }
  else if (iVar2 < 2) {
    if (uVar6 == 0) {
      iVar10 = *(int *)((int)param_1 + 0x20);
      if (iVar10 == 0) {
switchD_1009f4bf_default:
        iVar2 = -0x7fffbffb;
        goto LAB_1009f64a;
      }
      if (*(int *)(iVar10 + 4) == 0xe) {
        if (*(int *)(iVar10 + 0x10) == 6) goto switchD_1009f4bf_default;
        iVar2 = FUN_1009c8b6(param_2,(int *)(iVar10 + 0x10),(int)param_1 + 0x30);
        if (iVar2 < 0) goto LAB_1009f64a;
      }
      else {
        if ((iVar10 == 0) || (*(int *)(iVar10 + 4) != 1)) goto switchD_1009f4bf_default;
        do {
          iVar2 = *(int *)(iVar10 + 8);
          if (iVar2 != 0) {
            if (*(int *)(iVar2 + 4) == 0xe) {
              if (*(int *)(iVar2 + 0x10) == 6) goto switchD_1009f4bf_default;
              iVar2 = FUN_1009c8b6(param_2,(int *)(iVar2 + 0x10),(int)param_1 + 0x30);
              if (iVar2 < 0) goto LAB_1009f64a;
              param_2 = param_2 + 0x10;
            }
            else if ((iVar2 != 0) && (*(int *)(iVar2 + 4) == 0xd)) {
              iVar2 = FUN_1009ee58();
              if (iVar2 < 0) goto LAB_1009f64a;
              param_2 = param_2 + *(int *)(*(int *)(iVar10 + 8) + 0x18) *
                                  *(int *)(*(int *)(iVar10 + 8) + 0x14) * 0x10;
            }
          }
          iVar10 = *(int *)(iVar10 + 0xc);
        } while (iVar10 != 0);
      }
    }
    else if (local_18._4_4_ == 1) {
      local_24 = 0;
      if (uVar7 != 0) {
        do {
          iVar2 = FUN_1009c8b6(param_2,local_c,(int)param_1 + 0x30);
          if (iVar2 < 0) goto LAB_1009f64a;
          local_24 = local_24 + 1;
          param_2 = param_2 + 0x10;
        } while (local_24 < uVar7);
      }
    }
    else if (((uVar7 == local_18._4_4_) ||
             (puVar1 = (uint *)((int)param_1 + 0x14), *(uint *)(uVar6 + 0x14) < *puVar1)) ||
            (uVar4 = *(uint *)((int)param_1 + 0x18), *(uint *)(uVar6 + 0x18) < uVar4)) {
      local_24 = 0;
      if (uVar7 != 0) {
        local_20 = (double)CONCAT44((int)param_1 + 0x30,(uint)local_20);
        iVar10 = param_2;
        do {
          iVar2 = FUN_1009c8b6(iVar10,(int)puVar5 + (iVar10 - param_2),local_20._4_4_);
          if (iVar2 < 0) goto LAB_1009f64a;
          local_24 = local_24 + 1;
          iVar10 = iVar10 + 0x10;
        } while (local_24 < uVar7);
      }
    }
    else {
      param_1 = (undefined4 *)0x0;
      if (*puVar1 != 0) {
        do {
          uVar7 = 0;
          if (uVar4 != 0) {
            do {
              iVar2 = FUN_1009c8b6((uVar4 * (int)param_1 + uVar7) * 0x10 + param_2,
                                   local_c + (*(int *)(local_2c + 0x18) * (int)param_1 + uVar7) * 4,
                                   iVar10 + 0x30);
              if (iVar2 < 0) goto LAB_1009f64a;
              uVar4 = *(uint *)(iVar10 + 0x18);
              uVar7 = uVar7 + 1;
            } while (uVar7 < uVar4);
          }
          param_1 = (undefined4 *)((int)param_1 + 1);
        } while (param_1 < *(uint *)(iVar10 + 0x14));
      }
    }
  }
  else if (iVar2 == 0x16) {
    iVar10 = (int)param_1 + 0x30;
    local_20 = (double)CONCAT44(iVar10,(uint)local_20);
    iVar2 = FUN_1009c9f2(&local_2c,local_10,iVar10);
    if (iVar2 < 0) goto LAB_1009f64a;
    if (local_18._4_4_ <= local_2c * uVar7) {
      FUN_100994dd(local_8,iVar10,0xbd6,"array index out of bounds");
      goto switchD_1009f4bf_default;
    }
    local_24 = 0;
    if (uVar7 != 0) {
      puVar5 = local_c + local_2c * uVar7 * 4;
      do {
        iVar2 = FUN_1009c8b6(param_2,puVar5,local_20._4_4_);
        if (iVar2 < 0) goto LAB_1009f64a;
        local_24 = local_24 + 1;
        puVar5 = puVar5 + 4;
        param_2 = param_2 + 0x10;
      } while (local_24 < uVar7);
    }
  }
  else if (iVar2 == 0x17) {
    iVar10 = *(int *)((int)param_1 + 0x24);
    if (*(int *)(iVar10 + 4) == 0xe) {
      iVar2 = FUN_1009c9f2(&local_2c,iVar10 + 0x10,(int)param_1 + 0x30);
      if (iVar2 < 0) goto LAB_1009f64a;
      local_24 = 0;
      if (uVar7 != 0) {
        puVar5 = local_c + local_2c * 4;
        do {
          iVar2 = FUN_1009c8b6(param_2,puVar5,(int)param_1 + 0x30);
          if (iVar2 < 0) goto LAB_1009f64a;
          local_24 = local_24 + 1;
          param_2 = param_2 + 0x10;
          puVar5 = puVar5 + 4;
        } while (local_24 < uVar7);
      }
    }
    else {
      if (*(int *)(iVar10 + 4) != 1) goto switchD_1009f4bf_default;
      local_24 = 0;
      if (uVar7 != 0) {
        do {
          iVar2 = FUN_1009c9f2(&local_2c,*(int *)(iVar10 + 8) + 0x10,(int)param_1 + 0x30);
          if ((iVar2 < 0) ||
             (iVar2 = FUN_1009c8b6(param_2,local_c + local_2c * 4,(int)param_1 + 0x30), iVar2 < 0))
          goto LAB_1009f64a;
          local_24 = local_24 + 1;
          param_2 = param_2 + 0x10;
          iVar10 = *(int *)(iVar10 + 0xc);
        } while (local_24 < uVar7);
      }
    }
  }
  else {
    if (iVar2 != 0x18) goto LAB_1009f3ca;
    local_24 = 0;
    if (local_18._4_4_ != 0) {
      iVar10 = (int)param_1 + 0x30;
      param_1 = local_10 + uVar7 * 4;
      local_2c = (int)local_c - (int)local_10;
      local_28 = param_2 - (int)local_10;
      puVar5 = local_10;
      do {
        iVar2 = FUN_1009a36a(&local_20,local_2c + (int)puVar5,iVar10);
        if (iVar2 < 0) goto LAB_1009f64a;
        puVar3 = puVar5;
        if (local_20 == 0.0) {
          puVar3 = param_1;
        }
        iVar2 = FUN_1009c8b6(local_28 + (int)puVar5,puVar3,iVar10);
        if (iVar2 < 0) goto LAB_1009f64a;
        local_24 = local_24 + 1;
        param_1 = param_1 + 4;
        puVar5 = puVar5 + 4;
      } while (local_24 < local_18._4_4_);
    }
  }
  iVar2 = 0;
LAB_1009f64a:
  _free(local_10);
  _free(local_c);
  return iVar2;
}


