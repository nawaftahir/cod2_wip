// 1006f676 size=1406 FUN_1006f676

int FUN_1006f676(undefined4 param_1,int param_2,int param_3,int param_4,uint param_5)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  void *pvVar7;
  uint *puVar8;
  int in_ECX;
  uint uVar9;
  undefined8 uVar10;
  int local_84 [21];
  uint *local_30;
  int local_2c;
  int local_28;
  int local_24;
  int local_20;
  int local_1c;
  int local_18;
  void *local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_14 = (void *)0x0;
  if ((*(byte *)(*(int *)(in_ECX + 8) + 0x6d) & 2) == 0) {
    local_10 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xbf932dc60be86b8f);
    local_c = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fb302c4d65e4606);
    uVar2 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xbfcb26908d815d63);
    uVar3 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3ff921b485ae2a4a);
    uVar4 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xc000000000000000);
    uVar5 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x400921fb60000000);
    uVar6 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3ff921fb60000000);
    local_14 = operator_new(param_5 * 0x70);
    if (local_14 == (void *)0x0) {
      iVar1 = -0x7ff8fff2;
      goto LAB_1006f6eb;
    }
    uVar9 = 0;
    pvVar7 = local_14;
    do {
      local_84[uVar9] = (int)pvVar7;
      uVar9 = uVar9 + 1;
      pvVar7 = (void *)((int)pvVar7 + param_5 * 4);
    } while (uVar9 < 0x1c);
    uVar9 = 0;
    do {
      uVar10 = FUN_1006c566(local_84[uVar9],param_5);
      iVar1 = (int)uVar10;
      if (iVar1 < 0) goto LAB_1006f6eb;
      uVar9 = (int)((ulonglong)uVar10 >> 0x20) + 1;
    } while (uVar9 < 0x14);
    if (param_5 != 0) {
      local_8 = param_5;
      puVar8 = local_30;
      do {
        *(undefined4 *)((local_84[0x14] - (int)local_30) + (int)puVar8) =
             *(undefined4 *)(in_ECX + 0x20);
        *puVar8 = local_10;
        *(uint *)((local_2c - (int)local_30) + (int)puVar8) = local_c;
        *(undefined4 *)((local_28 - (int)local_30) + (int)puVar8) = uVar2;
        *(undefined4 *)((local_24 - (int)local_30) + (int)puVar8) = uVar3;
        *(undefined4 *)((local_20 - (int)local_30) + (int)puVar8) = uVar4;
        *(undefined4 *)((local_1c - (int)local_30) + (int)puVar8) = uVar5;
        *(undefined4 *)((local_18 - (int)local_30) + (int)puVar8) = uVar6;
        puVar8 = puVar8 + 1;
        local_8 = local_8 - 1;
      } while (local_8 != 0);
    }
    param_5 = param_5 & 0xfffff;
    local_8 = param_5 | 0x10100000;
    iVar1 = FUN_1006e308(param_1,local_8,local_84[0],param_2,0,0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,param_5 | 0x20100000,local_84[1],param_2,local_84[0],4);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_8,local_84[2],local_84[1],0,8);
    if (iVar1 < 0) goto LAB_1006f6eb;
    local_c = param_5 | 0x20400000;
    iVar1 = FUN_1006e308(param_1,local_c,local_84[3],local_84[2],local_84[0x14],0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,param_5 | 0x10700000,local_84[4],local_84[3],0,4);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,param_5 | 0x10300000,local_84[5],local_84[4],0,4);
    if (iVar1 < 0) goto LAB_1006f6eb;
    local_10 = param_5 | 0x20500000;
    iVar1 = FUN_1006e308(param_1,local_10,local_84[6],local_30,local_84[1],0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_c,local_84[7],local_84[6],local_2c,0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_10,local_84[8],local_84[7],local_84[1],0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_c,local_84[9],local_84[8],local_28,0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_10,local_84[10],local_84[9],local_84[1],0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_c,local_84[0xb],local_84[10],local_24,0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_10,local_84[0xc],local_84[0xb],local_84[5],0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_10,local_84[0xd],local_84[0xc],local_20,0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_c,local_84[0xe],local_84[0xd],local_1c,0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,param_5 | 0x20200000,local_84[0xf],param_2,local_84[0],0x17);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_10,local_84[0x10],local_84[0xe],local_84[0xf],0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_c,local_84[0x11],local_84[0xc],local_84[0x10],4);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_8,local_84[0x12],local_84[0x11],0,8);
    if (iVar1 < 0) goto LAB_1006f6eb;
    iVar1 = FUN_1006e308(param_1,local_c,local_84[0x13],local_84[0x12],local_18,0);
    if (iVar1 < 0) goto LAB_1006f6eb;
    if (param_3 != 0) {
      iVar1 = FUN_1006e308(param_1,param_5 | 0x10000000,param_3,local_84[0x13],0,0);
      if (iVar1 < 0) goto LAB_1006f6eb;
    }
    if (param_4 != 0) {
      param_5 = param_5 | 0x10000000;
      param_2 = local_84[0x11];
      goto LAB_1006f6d5;
    }
  }
  else {
    if (param_3 != 0) {
      iVar1 = FUN_1006e308(param_1,param_5 & 0xfffff | 0x10a00000,param_3,param_2,0,0);
      if (iVar1 < 0) goto LAB_1006f6eb;
    }
    if (param_4 != 0) {
      param_5 = param_5 & 0xfffff | 0x10b00000;
LAB_1006f6d5:
      iVar1 = FUN_1006e308(param_1,param_5,param_4,param_2,0x400000000);
      if (iVar1 < 0) goto LAB_1006f6eb;
    }
  }
  iVar1 = 0;
LAB_1006f6eb:
  _free(local_14);
  return iVar1;
}


