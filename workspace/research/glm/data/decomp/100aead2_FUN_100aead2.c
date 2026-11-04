// 100aead2 size=1236 FUN_100aead2

int FUN_100aead2(int *param_1,uint param_2,int param_3)

{
  uint uVar1;
  uint *puVar2;
  int iVar3;
  bool bVar4;
  int *piVar5;
  int iVar6;
  int in_ECX;
  uint uVar7;
  uint uVar8;
  int local_50 [5];
  int local_3c;
  int local_38;
  undefined4 local_34;
  int local_30;
  int local_2c;
  uint local_28;
  uint local_24;
  int local_20;
  uint local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  int *local_c;
  int local_8;
  
  local_8 = 0;
  local_10 = 0;
  if (param_2 != 0) {
    local_c = param_1;
    do {
      puVar2 = (uint *)*local_c;
      if (puVar2 != (uint *)0x0) {
        local_24 = *puVar2;
        uVar8 = local_24 & 0xfffff;
        local_1c = uVar8;
        FUN_100ae971(param_3,4,puVar2,&local_18,&local_28,&local_14,1,1);
        if (local_14 == 0) {
          if (uVar8 == 2) {
            uVar8 = puVar2[2];
            local_20 = FUN_100ae879(*(undefined4 *)(in_ECX + 0x22c),*(undefined4 *)(in_ECX + 0x220),
                                    uVar8 + 8,1,0);
            local_30 = FUN_100ae879(*(undefined4 *)(in_ECX + 0x22c),*(undefined4 *)(in_ECX + 0x220),
                                    uVar8 + 0xc,1,0);
            if ((((local_20 != 0) && (local_30 != 0)) &&
                (FUN_100ae971(param_3,4,local_20,&local_18,&local_28,&local_2c,1,1), local_2c != 0))
               && (FUN_100ae971(param_3,4,local_30,&local_18,&local_28,&local_14,1,1),
                  uVar8 = local_1c, local_2c == local_14)) goto LAB_100aebf5;
          }
        }
        else if (uVar8 != 2) {
LAB_100aebf5:
          if (local_14 != 0) {
            uVar7 = 0;
            local_8 = 0;
            if (uVar8 == 3) {
              if (((local_24 & 0xfff00000) == 0x60f00000) || ((local_24 & 0xfff00000) == 0x60a00000)
                 ) {
                local_28 = 1;
                piVar5 = (int *)(puVar2[2] + 0xc);
                do {
                  iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4);
                  if (*(uint *)(iVar6 + 0x10) != uVar7) {
                    local_28 = 0;
                  }
                  iVar6 = *(int *)(iVar6 + 0x3c);
                  if ((iVar6 != 0) && (iVar6 != 0x60000)) goto LAB_100aef7e;
                  uVar7 = uVar7 + 1;
                  piVar5 = piVar5 + 1;
                } while (uVar7 < 3);
                if (local_28 != 0) {
                  if ((*(uint *)(in_ECX + 200) & 0xffff) < 0x102) {
                    FUN_1008b0b5();
                    return -0x7fffbffb;
                  }
                  iVar6 = FUN_10085814();
                  if (iVar6 == 0) {
                    local_8 = 0;
                  }
                  else {
                    local_8 = FUN_10085379();
                  }
                  if (local_8 == 0) {
LAB_100aef9f:
                    iVar6 = -0x7ff8fff2;
                  }
                  else {
                    iVar6 = FUN_1008585f(0x72600003,6,4,0);
                    if (-1 < iVar6) goto LAB_100aed94;
                  }
                  goto LAB_100aef2e;
                }
              }
            }
            else if ((uVar8 == 2) && ((local_24 & 0xfff00000) == 0x60500000)) {
              uVar8 = 0;
              bVar4 = true;
              local_50[2] = 3;
              local_50[3] = 0;
              local_50[0] = 1;
              local_50[1] = 2;
              local_28 = 1;
              do {
                iVar6 = local_20;
                if (uVar8 != 0) {
                  iVar6 = local_30;
                }
                iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar6 + 8) * 4);
                iVar3 = *(int *)(iVar6 + 0x10);
                if (iVar3 != local_50[uVar8 + 2]) {
                  local_28 = 0;
                }
                if (iVar3 != local_50[uVar8]) {
                  bVar4 = false;
                }
                if (*(int *)(iVar6 + 0x3c) != 0) {
LAB_100aef7e:
                  FUN_1008b0b5();
                  return -0x7fffbffb;
                }
                uVar8 = uVar8 + 1;
              } while (uVar8 < 2);
              if ((local_28 != 0) || (bVar4)) {
                iVar6 = FUN_10085814();
                if (iVar6 == 0) {
                  local_8 = 0;
                }
                else {
                  local_8 = FUN_10085379();
                }
                if (local_8 == 0) goto LAB_100aef9f;
                iVar6 = FUN_1008585f((-(uint)bVar4 & 0x100000) + 0x72700002,4,4,0);
                if (iVar6 < 0) goto LAB_100aef2e;
LAB_100aed94:
                uVar8 = 0;
                do {
                  *(undefined4 *)(uVar8 + *(int *)(local_8 + 0x10)) =
                       *(undefined4 *)(uVar8 + *(int *)(*local_c + 0x10));
                  uVar8 = uVar8 + 4;
                } while (uVar8 < 0x10);
                iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(*local_c + 8) * 4);
                local_34 = *(undefined4 *)
                            (*(int *)(in_ECX + 0x14) + *(int *)(*(int *)(local_14 + 8) + 0xc) * 4);
                uVar8 = local_18;
                if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5) & 8)
                    == 0) {
                  for (; (uVar8 < 4 && (*(int *)(param_3 + uVar8 * 4) != 0)); uVar8 = uVar8 + 1) {
                  }
                  if (uVar8 == 4) goto LAB_100aedf3;
                  *(uint *)(iVar6 + 0xc) = uVar8;
                }
                else {
                  uVar8 = *(uint *)(iVar6 + 0xc);
                  local_28 = uVar8;
                  if ((3 < uVar8) || (*(int *)(param_3 + uVar8 * 4) != 0)) {
LAB_100aedf3:
                    iVar6 = -0x7fffbffb;
                    goto LAB_100aef2e;
                  }
                }
                local_28 = uVar8;
                local_3c = FUN_10086139(*(undefined4 *)(in_ECX + 0x80),uVar8,0,0);
                if (local_3c == -1) goto LAB_100aef9f;
                iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_3c * 4);
                FUN_10085c65();
                *(uint *)(iVar6 + 0x6c) = uVar8 << 8 | 3;
                *(uint *)(iVar6 + 0xc) = uVar8;
                uVar7 = 0;
                if (local_1c != 0) {
                  local_24 = local_1c << 2;
                  do {
                    local_50[4] = FUN_10086139(*(undefined4 *)(in_ECX + 0x80),local_18,uVar7,0);
                    if (local_50[4] == -1) goto LAB_100aef9f;
                    iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_50[4] * 4);
                    local_38 = *(int *)(*(int *)(in_ECX + 0x14) +
                                       *(int *)(local_1c * 4 + *(int *)(*local_c + 8)) * 4);
                    FUN_10085c65();
                    *(uint *)(iVar6 + 0xc) = local_18;
                    *(uint *)(iVar6 + 0x10) = uVar7;
                    *(undefined4 *)(iVar6 + 0x3c) = *(undefined4 *)(local_38 + 0x3c);
                    *(int *)(*(int *)(local_8 + 8) + uVar7 * 4) = local_3c;
                    uVar1 = local_24 + 4;
                    uVar7 = uVar7 + 1;
                    *(int *)(local_24 + *(int *)(local_8 + 8)) = local_50[4];
                    uVar8 = local_28;
                    local_24 = uVar1;
                  } while (uVar7 < local_1c);
                }
                *(int *)(param_3 + uVar8 * 4) = local_8;
                iVar6 = FUN_10086026();
                if (iVar6 < 0) goto LAB_100aef2e;
                *local_c = 0;
                local_8 = 0;
              }
            }
          }
        }
      }
      local_10 = local_10 + 1;
      local_c = local_c + 1;
    } while (local_10 < param_2);
  }
  iVar6 = 0;
LAB_100aef2e:
  if (local_8 != 0) {
    FUN_1006c418();
  }
  return iVar6;
}


