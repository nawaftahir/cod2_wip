// 1007153d size=3391 FUN_1007153d

int FUN_1007153d(undefined4 param_1,int param_2,int *param_3,int *param_4)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  int *piVar7;
  undefined4 uVar8;
  int in_ECX;
  byte *pbVar9;
  undefined4 *puVar10;
  uint uVar11;
  int *piVar12;
  void *pvVar13;
  uint uVar14;
  int local_80;
  int *local_7c;
  int local_78;
  int *piStack_74;
  double local_70;
  int local_68;
  undefined4 local_64;
  undefined4 local_60;
  void *local_5c;
  int local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  int local_44;
  int local_40;
  int local_3c;
  undefined4 local_38;
  int local_34;
  int local_30;
  uint local_2c;
  int *local_28;
  int *local_24;
  int *local_20;
  int *local_1c;
  int local_18;
  byte *local_14;
  int *local_10;
  uint local_c;
  int *local_8;
  
  local_48 = *(undefined4 *)(in_ECX + 0x2c);
  local_4c = *(undefined4 *)(in_ECX + 0x30);
  local_50 = *(undefined4 *)(in_ECX + 0x34);
  local_60 = *(undefined4 *)(in_ECX + 0x3c);
  local_64 = *(undefined4 *)(in_ECX + 0x40);
  local_10 = (int *)0x0;
  local_1c = (int *)0x0;
  local_20 = (int *)0x0;
  local_5c = (void *)0x0;
  local_58 = 0;
  local_3c = 0;
  local_44 = 0;
  local_40 = 0;
  iVar5 = FUN_1006c8ca(param_2,&local_78);
  if ((-1 < iVar5) &&
     (((piVar7 = param_3, 0.0 < (double)CONCAT44(piStack_74,local_78) || (local_70 < 0.0)) ||
      (((double)CONCAT44(piStack_74,local_78) == 0.0 && (piVar7 = param_4, local_70 == 0.0)))))) {
    iVar5 = FUN_1007a632(piVar7,0);
    goto LAB_10072232;
  }
  iVar5 = FUN_1007107a(0,&param_2,1);
  if (iVar5 < 0) goto LAB_10072232;
  local_34 = -1;
  iVar5 = *(int *)(in_ECX + 8);
  pbVar9 = *(byte **)(*(int *)(iVar5 + 0x14) + param_2 * 4);
  local_14 = pbVar9;
  if ((*(int *)(pbVar9 + 0x48) == -1) ||
     (puVar1 = *(uint **)(*(int *)(iVar5 + 0x18) + *(int *)(pbVar9 + 0x48) * 4),
     (*puVar1 & 0xfff00000) != 0x20300000)) {
LAB_1007177d:
    if ((*pbVar9 & 1) == 0) {
      local_54 = 0xffffffff;
      local_38 = 0xffffffff;
      local_18 = -1;
      local_30 = -1;
      iVar5 = FUN_10070d24(param_1,&local_54,&local_38,&param_2,1);
      if (((iVar5 < 0) ||
          (iVar5 = FUN_1006e308(param_1,0x20200001,&local_18,&local_38,&local_54,0x17), iVar5 < 0))
         || (iVar5 = FUN_1006e308(param_1,0x20300001,&local_30,&local_38,&local_54,0x17), iVar5 < 0)
         ) goto LAB_10072232;
    }
    else {
      local_38 = 0xffffffff;
      local_18 = -1;
      local_30 = -1;
      iVar5 = FUN_1006e308(param_1,0x10100001,&local_38,&param_2,0,0x10);
      if (((iVar5 < 0) ||
          (iVar5 = FUN_1006e308(param_1,0x10000001,&local_18,&param_2,0,0x17), iVar5 < 0)) ||
         (iVar5 = FUN_1006e308(param_1,0x20300001,&local_30,&local_38,&param_2,0x17), iVar5 < 0))
      goto LAB_10072232;
      uVar11 = *(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(pbVar9 + 4) * 4)
                        + 4);
      local_28 = (int *)0x1;
      if ((((uVar11 & 0x10) != 0) && ((uVar11 & 0x200) != 0)) && (*(int *)(pbVar9 + 8) == -1)) {
LAB_10071837:
        local_24 = (int *)0x1;
        goto LAB_100718c6;
      }
    }
    local_28 = (int *)0x1;
    local_24 = (int *)0x0;
  }
  else {
    local_2c = puVar1[3];
    uVar11 = 0;
    if (local_2c != 0) {
      piVar7 = (int *)puVar1[4];
      do {
        if (*piVar7 == param_2) break;
        uVar11 = uVar11 + 1;
        piVar7 = piVar7 + 1;
        local_28 = piVar7;
      } while (uVar11 < local_2c);
    }
    iVar2 = *(int *)(puVar1[2] + uVar11 * 4);
    local_24 = *(int **)(puVar1[2] + (local_2c + uVar11) * 4);
    iVar3 = *(int *)(*(int *)(*(int *)(iVar5 + 0x14) + iVar2 * 4) + 0x48);
    if (((iVar3 == -1) || ((**(byte **)(*(int *)(iVar5 + 0x14) + (int)local_24 * 4) & 1) == 0)) ||
       (puVar1 = *(uint **)(*(int *)(iVar5 + 0x18) + iVar3 * 4),
       (*puVar1 & 0xfff00000) != 0x10100000)) goto LAB_1007177d;
    local_2c = 0;
    if (puVar1[3] != 0) {
      piVar7 = (int *)puVar1[4];
      do {
        if (*piVar7 == iVar2) break;
        local_2c = local_2c + 1;
        piVar7 = piVar7 + 1;
      } while (local_2c < puVar1[3]);
    }
    if (*(int **)(puVar1[2] + local_2c * 4) != local_24) goto LAB_1007177d;
    iVar5 = FUN_1007107a(0,&local_24,1);
    if (iVar5 < 0) goto LAB_10072232;
    local_18 = -1;
    local_30 = -1;
    iVar5 = FUN_1006e308(param_1,0x10000001,&local_18,&local_24,0,0x17);
    if ((iVar5 < 0) ||
       (iVar5 = FUN_1006e308(param_1,0x10000001,&local_30,&param_2,0,0x17), iVar5 < 0))
    goto LAB_10072232;
    iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)local_24 * 4);
    uVar11 = *(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + *(int *)(iVar5 + 4) * 4) + 4
                      );
    local_28 = (int *)0x0;
    if (((uVar11 & 0x10) != 0) && (((uVar11 & 0x200) != 0 && (*(int *)(iVar5 + 8) == -1))))
    goto LAB_10071837;
    local_24 = (int *)0x0;
  }
LAB_100718c6:
  iVar5 = FUN_1007107a(0,&local_18,1);
  if (iVar5 < 0) goto LAB_10072232;
  puVar10 = *(undefined4 **)
             (*(int *)(*(int *)(in_ECX + 8) + 0x10) +
             *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + local_18 * 4) + 4) * 4);
  local_2c = 0;
  local_14 = (byte *)0x1;
  if ((puVar10[1] & 0x800) == 0) {
LAB_10071984:
    iVar5 = *(int *)(in_ECX + 8);
    if (((*(int *)(iVar5 + 0x58) != 0) ||
        ((*(int *)(iVar5 + 0x54) != 0 && (local_24 != (int *)0x0)))) ||
       ((*(int *)(iVar5 + 0x34) != 0 && (*(int *)(in_ECX + 0x30) == -1)))) {
      pbVar9 = (byte *)0x1;
LAB_100719a9:
      local_2c = 1;
      local_14 = pbVar9;
    }
  }
  else {
    pcVar6 = _strchr((char *)*puVar10,0x62);
    if ((pcVar6 == (char *)0x0) && (pcVar6 = _strchr((char *)*puVar10,0x42), pcVar6 == (char *)0x0))
    {
      if (((puVar10[1] & 0x800) == 0) ||
         ((pcVar6 = _strchr((char *)*puVar10,99), pcVar6 == (char *)0x0 &&
          (pcVar6 = _strchr((char *)*puVar10,0x43), pcVar6 == (char *)0x0)))) goto LAB_10071984;
      iVar5 = *(int *)(in_ECX + 8);
      if ((*(int *)(iVar5 + 0x58) != 0) ||
         ((*(int *)(iVar5 + 0x34) != 0 && (*(int *)(in_ECX + 0x30) == -1)))) {
        local_14 = (byte *)0x1;
        local_2c = 1;
      }
      local_24 = (int *)0x0;
    }
    else {
      iVar5 = *(int *)(in_ECX + 8);
      pbVar9 = (byte *)0x0;
      if ((*(int *)(iVar5 + 0x54) != 0) && (local_24 != (int *)0x0)) goto LAB_100719a9;
    }
  }
  if (*(int *)(iVar5 + 0x34) == 0) {
    if (local_14 != (byte *)0x0) {
      if (local_2c != 0) {
        if (local_24 == (int *)0x0) {
          if (*(uint *)(iVar5 + 0x58) <= *(uint *)(in_ECX + 0x40)) goto LAB_100719d4;
        }
        else if (*(uint *)(iVar5 + 0x54) <= *(uint *)(in_ECX + 0x3c)) {
LAB_100719d4:
          local_2c = 0;
        }
      }
      goto LAB_100719d7;
    }
  }
  else {
LAB_100719d7:
    if ((local_14 != (byte *)0x0) && ((*(byte *)(in_ECX + 0x15) & 2) != 0)) {
      local_2c = 0;
    }
  }
  if ((local_2c != 0) && ((*(byte *)(in_ECX + 0x15) & 4) != 0)) {
    local_14 = (byte *)0x0;
  }
  local_8 = *(int **)(*(int *)(in_ECX + 4) + 0x18);
  local_c = 0;
  local_10 = operator_new((int)local_8 << 2);
  if (((local_10 == (int *)0x0) ||
      (local_1c = operator_new((int)local_8 << 2), local_1c == (int *)0x0)) ||
     (local_20 = operator_new((int)local_8 << 2), local_20 == (int *)0x0)) {
LAB_1007222d:
    iVar5 = -0x7ff8fff2;
    goto LAB_10072232;
  }
  piVar7 = *(int **)(in_ECX + 0x18);
  piVar12 = local_10;
  for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
    *piVar12 = *piVar7;
    piVar7 = piVar7 + 1;
    piVar12 = piVar12 + 1;
  }
  for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
    *(char *)piVar12 = (char)*piVar7;
    piVar7 = (int *)((int)piVar7 + 1);
    piVar12 = (int *)((int)piVar12 + 1);
  }
  if (local_2c == 0) {
LAB_10071d28:
    if (local_14 == (byte *)0x0) goto LAB_10071f59;
    if (param_3 == (int *)0x0) {
      piVar7 = local_10;
      piVar12 = local_1c;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
    }
    else {
      iVar5 = FUN_1006c566(in_ECX + 0x2c,1);
      if (iVar5 < 0) goto LAB_10072232;
      piVar7 = &local_18;
      if (local_28 == (int *)0x0) {
        piVar7 = &local_30;
      }
      iVar5 = FUN_1006e308(param_1,0x20500001,in_ECX + 0x2c,&local_48,piVar7,0x17);
      if ((iVar5 < 0) || (iVar5 = FUN_1007a632(param_3,local_10), iVar5 < 0)) goto LAB_10072232;
      piVar7 = *(int **)(in_ECX + 0x18);
      piVar12 = local_1c;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      piVar7 = local_10;
      piVar12 = *(int **)(in_ECX + 0x18);
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      *(undefined4 *)(in_ECX + 0x2c) = local_48;
      local_58 = *(int *)(in_ECX + 0x50);
      *(undefined4 *)(in_ECX + 0x50) = 0;
      local_44 = *(int *)(in_ECX + 0x54);
      *(undefined4 *)(in_ECX + 0x54) = 0;
    }
    if (param_4 == (int *)0x0) {
      piVar7 = local_10;
      piVar12 = local_20;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
    }
    else {
      iVar5 = FUN_1006c566(in_ECX + 0x2c,1);
      if (iVar5 < 0) goto LAB_10072232;
      piVar7 = &local_30;
      if (local_28 == (int *)0x0) {
        piVar7 = &local_18;
      }
      iVar5 = FUN_1006e308(param_1,0x20500001,in_ECX + 0x2c,&local_48,piVar7,0x17);
      if ((iVar5 < 0) || (iVar5 = FUN_1007a632(param_4,local_10), iVar5 < 0)) goto LAB_10072232;
      piVar7 = *(int **)(in_ECX + 0x18);
      piVar12 = local_20;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      piVar7 = local_10;
      piVar12 = *(int **)(in_ECX + 0x18);
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      local_40 = *(int *)(in_ECX + 0x54);
      *(undefined4 *)(in_ECX + 0x2c) = local_48;
      local_3c = *(int *)(in_ECX + 0x50);
      *(undefined4 *)(in_ECX + 0x50) = 0;
      *(undefined4 *)(in_ECX + 0x54) = 0;
    }
    local_c = 0;
    param_3 = (int *)0x0;
    if (local_8 != (int *)0x0) {
      local_2c = (int)local_20 - (int)local_1c;
      param_4 = local_1c;
      do {
        iVar5 = *param_4;
        local_24 = (int *)((int)param_4 + local_2c);
        iVar2 = *local_24;
        if (iVar5 != iVar2) {
          if (iVar5 != -1) {
            iVar3 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
            iVar4 = *(int *)(*(int *)(in_ECX + 8) + 0x74);
            if (iVar4 != *(int *)(*(int *)(iVar3 + iVar5 * 4) + 4)) {
              if ((iVar2 == -1) || (iVar4 == *(int *)(*(int *)(iVar3 + iVar2 * 4) + 4))) {
                *local_24 = iVar5;
                *(int *)(*(int *)(in_ECX + 0x18) + (int)param_3 * 4) = iVar5;
              }
              else {
                local_c = local_c + 1;
              }
              goto LAB_10071f45;
            }
          }
          *param_4 = iVar2;
          *(int *)(*(int *)(in_ECX + 0x18) + (int)param_3 * 4) = iVar2;
        }
LAB_10071f45:
        param_3 = (int *)((int)param_3 + 1);
        param_4 = param_4 + 1;
      } while (param_3 < local_8);
      goto LAB_10071f59;
    }
  }
  else {
    local_2c = *(uint *)(*(int *)(in_ECX + 8) + 0xc);
    if (*(int *)(*(int *)(in_ECX + 8) + 0x34) == 0) {
      if (local_24 == (int *)0x0) {
        *(int *)(in_ECX + 0x40) = *(int *)(in_ECX + 0x40) + 1;
      }
      else {
        *(int *)(in_ECX + 0x3c) = *(int *)(in_ECX + 0x3c) + 1;
      }
    }
    local_34 = -1;
    iVar5 = FUN_1006e308(param_1,0x10f00001,&local_34,&local_18,0,0);
    if (iVar5 < 0) goto LAB_10072232;
    iVar5 = *(int *)(in_ECX + 8);
    if (*(int *)(iVar5 + 0x34) == 0) {
      uVar8 = *(undefined4 *)(iVar5 + 0xa0);
    }
    else {
      uVar8 = *(undefined4 *)(iVar5 + 0x90);
    }
    *(undefined4 *)(*(int *)(*(int *)(iVar5 + 0x14) + local_34 * 4) + 4) = uVar8;
    if (param_3 == (int *)0x0) {
      piVar7 = local_10;
      piVar12 = local_1c;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
    }
    else {
      *(int *)(in_ECX + 0x30) = local_34;
      *(int **)(in_ECX + 0x34) = local_28;
      iVar5 = FUN_1007a632(param_3,local_10);
      if (iVar5 < 0) goto LAB_10072232;
      piVar7 = *(int **)(in_ECX + 0x18);
      piVar12 = local_1c;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      piVar7 = local_10;
      piVar12 = *(int **)(in_ECX + 0x18);
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      *(undefined4 *)(in_ECX + 0x30) = local_4c;
      *(undefined4 *)(in_ECX + 0x34) = local_50;
      local_58 = *(int *)(in_ECX + 0x50);
      *(undefined4 *)(in_ECX + 0x50) = 0;
      local_44 = *(int *)(in_ECX + 0x54);
      *(undefined4 *)(in_ECX + 0x54) = 0;
    }
    if (param_4 == (int *)0x0) {
      piVar7 = local_10;
      piVar12 = local_20;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
    }
    else {
      *(int *)(in_ECX + 0x30) = local_34;
      *(uint *)(in_ECX + 0x34) = (uint)(local_28 == (int *)0x0);
      iVar5 = FUN_1007a632(param_4,local_10);
      if (iVar5 < 0) goto LAB_10072232;
      piVar7 = *(int **)(in_ECX + 0x18);
      piVar12 = local_20;
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      piVar7 = local_10;
      piVar12 = *(int **)(in_ECX + 0x18);
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      *(undefined4 *)(in_ECX + 0x30) = local_4c;
      *(undefined4 *)(in_ECX + 0x34) = local_50;
      local_3c = *(int *)(in_ECX + 0x50);
      *(undefined4 *)(in_ECX + 0x50) = 0;
      local_40 = *(int *)(in_ECX + 0x54);
      *(undefined4 *)(in_ECX + 0x54) = 0;
    }
    local_c = 0;
    if (local_8 != (int *)0x0) {
      piVar7 = local_1c;
      piVar12 = local_8;
      do {
        if (*piVar7 != *(int *)(((int)local_20 - (int)local_1c) + (int)piVar7)) {
          local_c = local_c + 1;
        }
        piVar7 = piVar7 + 1;
        piVar12 = (int *)((int)piVar12 - 1);
      } while (piVar12 != (int *)0x0);
    }
    *(undefined4 *)(in_ECX + 0x3c) = local_60;
    *(undefined4 *)(in_ECX + 0x40) = local_64;
    if (local_14 != (byte *)0x0) {
      if ((0x10 < local_c) || (0x20 < *(int *)(*(int *)(in_ECX + 8) + 0xc) - local_2c)) {
        local_14 = (byte *)0x0;
      }
      if (local_14 == (byte *)0x0) goto LAB_10071c94;
      if (local_2c < *(uint *)(*(int *)(in_ECX + 8) + 0xc)) {
        puVar10 = (undefined4 *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + local_2c * 4);
        uVar11 = local_2c;
        do {
          if ((*(uint *)*puVar10 & 0xf0000000) == 0x60000000) {
            local_14 = (byte *)0x0;
            break;
          }
          uVar11 = uVar11 + 1;
          puVar10 = puVar10 + 1;
        } while (uVar11 < *(uint *)(*(int *)(in_ECX + 8) + 0xc));
      }
      if (local_14 == (byte *)0x0) goto LAB_10071c94;
LAB_10071cd4:
      uVar11 = local_2c;
      uVar14 = local_2c;
      if (local_2c < *(uint *)(*(int *)(in_ECX + 8) + 0xc)) {
        do {
          if (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + uVar14 * 4) != 0) {
            FUN_1006c418(1);
            uVar11 = local_2c;
          }
          *(undefined4 *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + uVar14 * 4) = 0;
          uVar14 = uVar14 + 1;
        } while (uVar14 < *(uint *)(*(int *)(in_ECX + 8) + 0xc));
      }
      *(uint *)(*(int *)(in_ECX + 8) + 0xc) = uVar11;
      piVar7 = local_10;
      piVar12 = *(int **)(in_ECX + 0x18);
      for (uVar11 = (uint)local_8 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
        *piVar12 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar12 = piVar12 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(char *)piVar12 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar12 = (int *)((int)piVar12 + 1);
      }
      goto LAB_10071d28;
    }
LAB_10071c94:
    if ((local_24 == (int *)0x0) &&
       (uVar11 = local_2c, local_2c < *(uint *)(*(int *)(in_ECX + 8) + 0xc))) {
      do {
        iVar5 = FUN_1008576b();
        if (iVar5 != 0) {
          local_14 = (byte *)0x1;
          break;
        }
        uVar11 = uVar11 + 1;
      } while (uVar11 < *(uint *)(*(int *)(in_ECX + 8) + 0xc));
    }
    if (local_14 != (byte *)0x0) goto LAB_10071cd4;
LAB_10071f59:
    uVar11 = local_c;
    if (local_c != 0) {
      local_5c = operator_new(local_c * 0x18);
      if (local_5c == (void *)0x0) goto LAB_1007222d;
      uVar14 = 0;
      pvVar13 = local_5c;
      do {
        (&local_80)[uVar14] = (int)pvVar13;
        uVar14 = uVar14 + 1;
        pvVar13 = (void *)((int)pvVar13 + uVar11 * 4);
      } while (uVar14 < 6);
      if (local_8 != (int *)0x0) {
        local_2c = local_80 - (int)local_7c;
        local_68 = (int)local_1c - (int)local_20;
        param_3 = (int *)(local_78 - (int)local_7c);
        param_4 = local_8;
        piVar7 = local_7c;
        piVar12 = local_20;
        do {
          local_24 = (int *)(local_68 + (int)piVar12);
          if (*local_24 != *piVar12) {
            iVar5 = local_18;
            if (local_28 == (int *)0x0) {
              iVar5 = local_30;
            }
            *(int *)(local_2c + (int)piVar7) = iVar5;
            iVar5 = *local_24;
            if ((iVar5 == -1) ||
               (*(int *)(*(int *)(in_ECX + 8) + 0x74) ==
                *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar5 * 4) + 4))) {
              iVar5 = *(int *)(in_ECX + 0x24);
            }
            *piVar7 = iVar5;
            iVar5 = *piVar12;
            if ((iVar5 == -1) ||
               (*(int *)(*(int *)(in_ECX + 8) + 0x74) ==
                *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar5 * 4) + 4))) {
              iVar5 = *(int *)(in_ECX + 0x24);
            }
            *(int *)((int)param_3 + (int)piVar7) = iVar5;
            piVar7 = piVar7 + 1;
            uVar11 = local_c;
          }
          piVar12 = piVar12 + 1;
          param_4 = (int *)((int)param_4 - 1);
        } while (param_4 != (int *)0x0);
      }
      if (local_14 == (byte *)0x0) {
        uVar11 = local_c & 0xfffff;
        param_3 = (int *)CONCAT13(0x10,(int3)uVar11);
        *(int *)(in_ECX + 0x30) = local_34;
        *(int **)(in_ECX + 0x34) = local_28;
        iVar5 = FUN_1006e308(param_1,param_3,local_7c,local_7c,0,0);
        if (iVar5 < 0) goto LAB_10072232;
        uVar14 = 0;
        if (local_c != 0) {
          do {
            piVar7 = local_7c + uVar14;
            uVar14 = uVar14 + 1;
            *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar7 * 4) + 4) =
                 *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
          } while (uVar14 < local_c);
        }
        *(int *)(in_ECX + 0x30) = local_34;
        *(uint *)(in_ECX + 0x34) = (uint)(local_28 == (int *)0x0);
        iVar5 = FUN_1006e308(param_1,param_3,local_78,local_78,0,0);
        if (iVar5 < 0) goto LAB_10072232;
        uVar14 = 0;
        if (local_c != 0) {
          do {
            iVar5 = uVar14 * 4;
            uVar14 = uVar14 + 1;
            *(undefined4 *)
             (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *(int *)(local_78 + iVar5) * 4) + 4)
                 = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
          } while (uVar14 < local_c);
        }
        *(undefined4 *)(in_ECX + 0x30) = local_4c;
        *(undefined4 *)(in_ECX + 0x34) = local_50;
        iVar5 = FUN_1006c566(piStack_74,local_c);
        if (iVar5 < 0) goto LAB_10072232;
        iVar5 = FUN_1006e308(param_1,uVar11 | 0x20700000,piStack_74,local_7c,local_78,0);
      }
      else {
        iVar5 = FUN_1007041a(param_1,piStack_74,local_78,local_7c,local_80,uVar11);
      }
      if (iVar5 < 0) goto LAB_10072232;
      param_3 = (int *)0x0;
      if (local_8 != (int *)0x0) {
        uVar11 = (int)local_20 - (int)local_1c;
        piVar7 = piStack_74;
        local_2c = uVar11;
        do {
          if (local_1c[(int)param_3] != *(int *)((int)(local_1c + (int)param_3) + uVar11)) {
            iVar5 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
            iVar2 = *(int *)(iVar5 + *piVar7 * 4);
            iVar3 = *(int *)(*(int *)(in_ECX + 0x18) + (int)param_3 * 4);
            if (iVar3 != -1) {
              FUN_10085d21(*(undefined4 *)(iVar5 + iVar3 * 4));
            }
            *(int *)(*(int *)(in_ECX + 0x18) + (int)param_3 * 4) = *piVar7;
            *(int **)(iVar2 + 0x30) = param_3;
            piVar7 = piVar7 + 1;
            uVar11 = local_2c;
          }
          param_3 = (int *)((int)param_3 + 1);
        } while (param_3 < local_8);
      }
    }
  }
  iVar5 = 0;
  if ((local_44 == 0) || (local_40 == 0)) {
    uVar8 = 0;
  }
  else {
    uVar8 = 1;
  }
  *(undefined4 *)(in_ECX + 0x54) = uVar8;
  if (((local_58 == 0) || ((local_3c == 0 && (local_40 == 0)))) &&
     ((local_3c == 0 || ((local_58 == 0 && (local_44 == 0)))))) {
    uVar8 = 0;
  }
  else {
    uVar8 = 1;
  }
  *(undefined4 *)(in_ECX + 0x50) = uVar8;
  if (local_58 == 0) {
LAB_10072202:
    if (local_3c == 0) goto LAB_10072232;
LAB_10072207:
    if ((local_58 != 0) || (local_44 != 0)) goto LAB_10072232;
  }
  else {
    if (local_3c != 0) goto LAB_10072207;
    if (local_40 != 0) goto LAB_10072202;
  }
  FUN_1006dca1();
  iVar5 = -0x7fffbfff;
LAB_10072232:
  _free(local_10);
  _free(local_1c);
  _free(local_20);
  _free(local_5c);
  *(undefined4 *)(in_ECX + 0x2c) = local_48;
  *(undefined4 *)(in_ECX + 0x30) = local_4c;
  *(undefined4 *)(in_ECX + 0x34) = local_50;
  *(undefined4 *)(in_ECX + 0x3c) = local_60;
  *(undefined4 *)(in_ECX + 0x40) = local_64;
  return iVar5;
}


