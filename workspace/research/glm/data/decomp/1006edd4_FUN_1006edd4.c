// 1006edd4 size=2210 FUN_1006edd4

int * FUN_1006edd4(undefined4 param_1,int *param_2,undefined4 *param_3,undefined4 *param_4,
                  uint param_5)

{
  uint uVar1;
  undefined4 *puVar2;
  int in_ECX;
  uint uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined8 uVar6;
  int local_120;
  int iStack_11c;
  int iStack_118;
  int iStack_114;
  double local_110;
  double local_108;
  undefined4 local_100;
  undefined4 local_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  undefined4 local_f0;
  undefined4 local_ec;
  undefined4 local_e8;
  undefined4 local_e4;
  undefined4 local_e0;
  undefined4 local_dc;
  undefined4 local_d8;
  uint local_d4;
  int local_d0;
  int local_cc;
  int local_c8;
  int local_c4;
  int local_c0;
  int local_bc;
  int local_b8;
  undefined4 local_b4;
  int local_b0;
  int local_ac;
  int local_a8;
  undefined4 local_a4;
  int local_a0;
  undefined4 *local_9c [16];
  int local_5c;
  int local_58;
  int local_54;
  int local_50;
  int local_4c;
  int local_48;
  int local_44;
  int local_40;
  int local_3c;
  int local_38;
  int local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  int local_20;
  undefined4 *local_1c;
  int local_18;
  int local_14;
  undefined4 local_10;
  uint local_c;
  int *local_8;
  
  uVar1 = 1;
  local_1c = (undefined4 *)0x0;
  local_c = 1;
  if (1 < param_5) {
    do {
      if (param_2[uVar1] != *param_2) {
        local_c = 0;
        break;
      }
      uVar1 = uVar1 + 1;
    } while (uVar1 < param_5);
  }
  uVar1 = *(uint *)(*(int *)(in_ECX + 8) + 0x6c);
  if ((uVar1 & 0x200) == 0) {
    if (((uVar1 & 0x100) == 0) || (local_c == 0)) {
      uVar1 = -(uint)(param_3 != (undefined4 *)0x0) & param_5;
      local_d4 = -(uint)(param_4 != (undefined4 *)0x0) & param_5;
      local_c = local_d4 + uVar1;
      local_10 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fc45f306446f9b4);
      local_f0 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fd0000000000000);
      local_ec = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fe0000000000000);
      local_dc = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x401921fb60000000);
      local_d8 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xc00921fb60000000);
      local_e0 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xbe90f02c6b8de73b);
      local_e8 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3ef9f6b4176d5bad);
      local_e4 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xbf56c13745d11568);
      local_a4 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fa555547fbaf47e);
      local_b4 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xbfdffffffc06f3a6);
      local_1c = operator_new(local_c * 0x6c);
      if (local_1c == (undefined4 *)0x0) {
        local_8 = (int *)0x8007000e;
        goto LAB_1006f663;
      }
      uVar3 = 0;
      puVar2 = local_1c;
      do {
        local_9c[uVar3] = puVar2;
        uVar3 = uVar3 + 1;
        puVar2 = puVar2 + local_c;
      } while (uVar3 < 0x1b);
      uVar3 = 0;
      do {
        uVar6 = FUN_1006c566(local_9c[uVar3],local_c);
        local_8 = (int *)uVar6;
        if ((int)local_8 < 0) goto LAB_1006f663;
        uVar3 = (int)((ulonglong)uVar6 >> 0x20) + 1;
      } while (uVar3 < 0xf);
      param_5 = 0;
      if (local_c != 0) {
        local_8 = param_2 + -uVar1;
        local_18 = (int)param_4 - (int)param_2;
        local_14 = (int)param_3 - (int)local_9c[0xf];
        local_c0 = local_5c - (int)local_9c[0xf];
        local_a8 = local_58 - (int)local_9c[0xf];
        local_b0 = local_54 - (int)local_9c[0xf];
        local_b8 = local_50 - (int)local_9c[0xf];
        local_a0 = local_4c - (int)local_9c[0xf];
        local_c8 = local_48 - (int)local_9c[0xf];
        local_d0 = local_44 - (int)local_9c[0xf];
        local_ac = local_40 - (int)local_9c[0xf];
        local_bc = local_3c - (int)local_9c[0xf];
        local_c4 = local_38 - (int)local_9c[0xf];
        local_cc = local_34 - (int)local_9c[0xf];
        puVar2 = local_9c[0xf];
        do {
          if (param_5 < uVar1) {
            uVar4 = *(undefined4 *)(local_14 + (int)puVar2);
          }
          else {
            uVar4 = *(undefined4 *)(local_18 + (int)local_8);
          }
          *puVar2 = uVar4;
          *(undefined4 *)(local_c0 + (int)puVar2) = local_10;
          uVar4 = local_f0;
          if (uVar1 <= param_5) {
            uVar4 = local_ec;
          }
          *(undefined4 *)(local_a8 + (int)puVar2) = uVar4;
          *(undefined4 *)(local_b0 + (int)puVar2) = local_dc;
          *(undefined4 *)(local_b8 + (int)puVar2) = local_d8;
          *(undefined4 *)(local_a0 + (int)puVar2) = local_e0;
          *(undefined4 *)(local_c8 + (int)puVar2) = local_e8;
          *(undefined4 *)(local_d0 + (int)puVar2) = local_e4;
          *(undefined4 *)(local_ac + (int)puVar2) = local_a4;
          *(undefined4 *)(local_bc + (int)puVar2) = local_b4;
          *(undefined4 *)(local_c4 + (int)puVar2) = *(undefined4 *)(in_ECX + 0x20);
          if (param_5 < uVar1) {
            iVar5 = *(int *)(((int)param_2 - (int)local_9c[0xf]) + (int)puVar2);
          }
          else {
            iVar5 = *local_8;
          }
          param_5 = param_5 + 1;
          local_8 = local_8 + 1;
          *(int *)(local_cc + (int)puVar2) = iVar5;
          puVar2 = puVar2 + 1;
        } while (param_5 < local_c);
      }
      local_c = local_c & 0xfffff;
      param_2 = (int *)(local_c | 0x20500000);
      local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[0],local_34,local_5c,0);
      if ((int)local_8 < 0) goto LAB_1006f663;
      uVar3 = local_c | 0x20400000;
      local_8 = (int *)FUN_1006e308(param_1,uVar3,local_9c[1],local_9c[0],local_58,0);
      if ((((((((int)local_8 < 0) ||
              (local_8 = (int *)FUN_1006e308(param_1,local_c | 0x10400000,local_9c[2],local_9c[1],0,
                                             0x14), (int)local_8 < 0)) ||
             (local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[3],local_9c[2],local_54,4),
             (int)local_8 < 0)) ||
            ((local_8 = (int *)FUN_1006e308(param_1,uVar3,local_9c[4],local_9c[3],local_50,0),
             (int)local_8 < 0 ||
             (local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[5],local_9c[4],local_9c[4],4),
             (int)local_8 < 0)))) ||
           (local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[6],local_9c[5],local_4c,0),
           (int)local_8 < 0)) ||
          (((local_8 = (int *)FUN_1006e308(param_1,uVar3,local_9c[7],local_9c[6],local_48,0),
            (int)local_8 < 0 ||
            (local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[8],local_9c[5],local_9c[7],0),
            (int)local_8 < 0)) ||
           ((local_8 = (int *)FUN_1006e308(param_1,uVar3,local_9c[9],local_9c[8],local_44,0),
            (int)local_8 < 0 ||
            (((local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[10],local_9c[5],local_9c[9],0)
              , (int)local_8 < 0 ||
              (local_8 = (int *)FUN_1006e308(param_1,uVar3,local_9c[0xb],local_9c[10],local_40,0),
              (int)local_8 < 0)) ||
             (local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[0xc],local_9c[5],local_9c[0xb],
                                            0), (int)local_8 < 0)))))))) ||
         (((local_8 = (int *)FUN_1006e308(param_1,uVar3,local_9c[0xd],local_9c[0xc],local_3c,0),
           (int)local_8 < 0 ||
           (local_8 = (int *)FUN_1006e308(param_1,param_2,local_9c[0xe],local_9c[5],local_9c[0xd],0)
           , (int)local_8 < 0)) ||
          (local_8 = (int *)FUN_1006e308(param_1,uVar3,local_9c[0xf],local_9c[0xe],local_38,0x10),
          (int)local_8 < 0)))) goto LAB_1006f663;
      puVar2 = local_9c[0xf];
      for (uVar3 = uVar1 & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
        *param_3 = *puVar2;
        puVar2 = puVar2 + 1;
        param_3 = param_3 + 1;
      }
      for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(undefined1 *)param_3 = *(undefined1 *)puVar2;
        puVar2 = (undefined4 *)((int)puVar2 + 1);
        param_3 = (undefined4 *)((int)param_3 + 1);
      }
      puVar2 = local_9c[0xf] + uVar1;
      for (uVar3 = local_d4; uVar3 != 0; uVar3 = uVar3 - 1) {
        *param_4 = *puVar2;
        puVar2 = puVar2 + 1;
        param_4 = param_4 + 1;
      }
    }
    else {
      local_c = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fc45f306446f9b4);
      local_10 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fe0000000000000);
      local_18 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x401921fb60000000);
      local_14 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xc00921fb60000000);
      local_8 = (int *)FUN_1006c8ca(*param_2,&local_110);
      if ((int)local_8 < 0) goto LAB_1006f663;
      if ((local_110 < -3.1415927410125732) || (3.1415927410125732 < local_108)) {
        local_30 = 0xffffffff;
        local_2c = 0xffffffff;
        local_28 = 0xffffffff;
        local_24 = 0xffffffff;
        local_20 = -1;
        local_8 = (int *)FUN_1006e308(param_1,0x20500001,&local_30,param_2,&local_c,0);
        if ((((int)local_8 < 0) ||
            (((local_8 = (int *)FUN_1006e308(param_1,0x20400001,&local_2c,&local_30,&local_10,0),
              (int)local_8 < 0 ||
              (local_8 = (int *)FUN_1006e308(param_1,&DAT_10400001,&local_28,&local_2c,0,0x14),
              (int)local_8 < 0)) ||
             (local_8 = (int *)FUN_1006e308(param_1,0x20500001,&local_24,&local_28,&local_18,4),
             (int)local_8 < 0)))) ||
           (local_8 = (int *)FUN_1006e308(param_1,0x20400001,&local_20,&local_24,&local_14,0),
           (int)local_8 < 0)) goto LAB_1006f663;
      }
      else {
        local_20 = *param_2;
      }
      local_100 = 0xffffffff;
      local_fc = 0xffffffff;
      uStack_f8 = 0xffffffff;
      uStack_f4 = 0xffffffff;
      local_120 = local_20;
      iStack_11c = local_20;
      iStack_118 = local_20;
      iStack_114 = local_20;
      local_8 = (int *)FUN_1006e308(param_1,0x50300004,&local_100,&local_120,0,0x10);
      if ((int)local_8 < 0) goto LAB_1006f663;
      if ((param_4 != (undefined4 *)0x0) && (uVar1 = param_5, param_5 != 0)) {
        for (; uVar1 != 0; uVar1 = uVar1 - 1) {
          *param_4 = local_100;
          param_4 = param_4 + 1;
        }
      }
      if ((param_3 != (undefined4 *)0x0) && (param_5 != 0)) {
        for (; param_5 != 0; param_5 = param_5 - 1) {
          *param_3 = local_fc;
          param_3 = param_3 + 1;
        }
      }
    }
  }
  else if (((param_3 != (undefined4 *)0x0) &&
           (local_8 = (int *)FUN_1006e308(param_1,param_5 & 0xfffff | 0x10800000,param_3,param_2,0,
                                          0x10), (int)local_8 < 0)) ||
          ((param_4 != (undefined4 *)0x0 &&
           (local_8 = (int *)FUN_1006e308(param_1,param_5 & 0xfffff | 0x10900000,param_4,param_2,0,
                                          0x10), (int)local_8 < 0)))) goto LAB_1006f663;
  local_8 = (int *)0x0;
LAB_1006f663:
  _free(local_1c);
  return local_8;
}


