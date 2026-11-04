// 1006fbf4 size=2086 FUN_1006fbf4

int FUN_1006fbf4(undefined4 param_1,undefined4 param_2,int param_3,undefined4 param_4,uint param_5)

{
  uint uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  uint *puVar7;
  int iVar8;
  int in_ECX;
  void *pvVar9;
  undefined8 uVar10;
  int local_e0 [40];
  uint *local_40;
  int local_3c;
  int local_38;
  int local_34;
  int local_30;
  int local_2c;
  int local_28;
  int local_24;
  void *local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_20 = (void *)0x0;
  if ((*(byte *)(*(int *)(in_ECX + 8) + 0x6d) & 2) == 0) {
    local_10 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3f9555cbe46f80c1);
    local_c = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xbfb5cb46bacf7447);
    local_8 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3fc70edc3bd59924);
    uVar2 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xbfd523a08398a655);
    uVar3 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3feffee6fb4c3c19);
    uVar4 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xc000000000000000);
    uVar5 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0x3ff921fb60000000);
    uVar6 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,0xc00921fb60000000);
    local_20 = operator_new(param_5 * 0xc0);
    if (local_20 == (void *)0x0) {
      iVar8 = -0x7ff8fff2;
      goto LAB_10070408;
    }
    uVar1 = 0;
    pvVar9 = local_20;
    do {
      local_e0[uVar1] = (int)pvVar9;
      uVar1 = uVar1 + 1;
      pvVar9 = (void *)((int)pvVar9 + param_5 * 4);
    } while (uVar1 < 0x30);
    uVar1 = 0;
    do {
      uVar10 = FUN_1006c566(local_e0[uVar1],param_5);
      iVar8 = (int)uVar10;
      if (iVar8 < 0) goto LAB_10070408;
      uVar1 = (int)((ulonglong)uVar10 >> 0x20) + 1;
    } while (uVar1 < 0x27);
    if (param_5 != 0) {
      local_18 = local_3c - (int)local_40;
      local_1c = local_24 - (int)local_40;
      local_14 = param_5;
      puVar7 = local_40;
      do {
        *(uint *)((local_e0[0x27] - (int)local_40) + (int)puVar7) = local_10;
        *puVar7 = local_c;
        *(uint *)(local_18 + (int)puVar7) = local_8;
        *(undefined4 *)((local_38 - (int)local_40) + (int)puVar7) = uVar2;
        *(undefined4 *)((local_34 - (int)local_40) + (int)puVar7) = uVar3;
        *(undefined4 *)((local_30 - (int)local_40) + (int)puVar7) = uVar4;
        *(undefined4 *)((local_2c - (int)local_40) + (int)puVar7) = uVar5;
        *(undefined4 *)((local_28 - (int)local_40) + (int)puVar7) = uVar6;
        *(undefined4 *)(local_1c + (int)puVar7) = *(undefined4 *)(in_ECX + 0x20);
        puVar7 = puVar7 + 1;
        local_14 = local_14 - 1;
      } while (local_14 != 0);
    }
    if (param_3 == 0) {
      param_3 = local_24;
    }
    local_c = param_5 & 0xfffff;
    local_10 = local_c | 0x10100000;
    iVar8 = FUN_1006e308(param_1,local_10,local_e0[0],param_2,0,0);
    if (iVar8 < 0) goto LAB_10070408;
    local_14 = local_c | 0x20100000;
    iVar8 = FUN_1006e308(param_1,local_14,local_e0[1],param_2,local_e0[0],4);
    if (((iVar8 < 0) || (iVar8 = FUN_1006e308(param_1,local_10,local_e0[2],param_3,0,0), iVar8 < 0))
       || (iVar8 = FUN_1006e308(param_1,local_14,local_e0[3],param_3,local_e0[2],4), iVar8 < 0))
    goto LAB_10070408;
    local_1c = local_c | 0x20000000;
    iVar8 = FUN_1006e308(param_1,local_1c,local_e0[4],local_e0[1],local_e0[3],4);
    if (((iVar8 < 0) ||
        (iVar8 = FUN_1006e308(param_1,local_14,local_e0[5],local_e0[1],local_e0[3],4), iVar8 < 0))
       || (iVar8 = FUN_1006e308(param_1,local_c | 0x10300000,local_e0[6],local_e0[5],0,4), iVar8 < 0
          )) goto LAB_10070408;
    uVar1 = local_c | 0x20500000;
    iVar8 = FUN_1006e308(param_1,uVar1,local_e0[7],local_e0[4],local_e0[6],0x14);
    if (((iVar8 < 0) ||
        (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[8],local_e0[7],local_e0[7],0x14), iVar8 < 0))
       || (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[9],local_e0[8],local_e0[0x27],0), iVar8 < 0))
    goto LAB_10070408;
    local_8 = local_c | 0x20400000;
    iVar8 = FUN_1006e308(param_1,local_8,local_e0[10],local_e0[9],local_40,0);
    if ((((((iVar8 < 0) ||
           (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0xb],local_e0[8],local_e0[10],0), iVar8 < 0)
           ) || (iVar8 = FUN_1006e308(param_1,local_8,local_e0[0xc],local_e0[0xb],local_3c,0),
                iVar8 < 0)) ||
         ((iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0xd],local_e0[8],local_e0[0xc],0), iVar8 < 0
          || (iVar8 = FUN_1006e308(param_1,local_8,local_e0[0xe],local_e0[0xd],local_38,0),
             iVar8 < 0)))) ||
        (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0xf],local_e0[8],local_e0[0xe],0), iVar8 < 0))
       || ((iVar8 = FUN_1006e308(param_1,local_8,local_e0[0x10],local_e0[0xf],local_34,0), iVar8 < 0
           || (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0x11],local_e0[7],local_e0[0x10],0),
              iVar8 < 0)))) goto LAB_10070408;
    local_18 = local_c | 0x20200000;
    iVar8 = FUN_1006e308(param_1,local_18,local_e0[0x12],local_e0[3],local_e0[1],0x17);
    if (((((iVar8 < 0) ||
          (((iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0x13],local_e0[0x11],local_30,0), iVar8 < 0
            || (iVar8 = FUN_1006e308(param_1,local_8,local_e0[0x14],local_e0[0x13],local_2c,0),
               iVar8 < 0)) ||
           (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0x15],local_e0[0x14],local_e0[0x12],0),
           iVar8 < 0)))) ||
         ((((iVar8 = FUN_1006e308(param_1,local_8,local_e0[0x16],local_e0[0x15],local_e0[0x11],0),
            iVar8 < 0 ||
            (iVar8 = FUN_1006e308(param_1,local_18,local_e0[0x1a],param_3,local_e0[2],0x17),
            iVar8 < 0)) ||
           (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0x1b],local_e0[0x1a],local_28,0), iVar8 < 0)
           ) || ((iVar8 = FUN_1006e308(param_1,local_8,local_e0[0x1c],local_e0[0x16],local_e0[0x1b],
                                       0), iVar8 < 0 ||
                 (iVar8 = FUN_1006e308(param_1,local_1c,local_e0[0x1d],param_2,param_3,0), iVar8 < 0
                 )))))) ||
        ((iVar8 = FUN_1006e308(param_1,local_14,local_e0[0x1e],param_2,param_3,0), iVar8 < 0 ||
         (((iVar8 = FUN_1006e308(param_1,local_10,local_e0[0x1f],local_e0[0x1d],0,0), iVar8 < 0 ||
           (iVar8 = FUN_1006e308(param_1,local_18,local_e0[0x20],local_e0[0x1d],local_e0[0x1f],0x17)
           , iVar8 < 0)) ||
          (iVar8 = FUN_1006e308(param_1,local_10,local_e0[0x21],local_e0[0x1e],0,0), iVar8 < 0))))))
       || (((iVar8 = FUN_1006e308(param_1,local_c | 0x20300000,local_e0[0x22],local_e0[0x1e],
                                  local_e0[0x21],0x17), iVar8 < 0 ||
            (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0x23],local_e0[0x20],local_e0[0x22],0x17),
            iVar8 < 0)) ||
           ((iVar8 = FUN_1006e308(param_1,local_8,local_e0[0x24],local_e0[0x1c],local_e0[0x1c],0),
            iVar8 < 0 ||
            ((iVar8 = FUN_1006e308(param_1,local_10,local_e0[0x25],local_e0[0x24],0,0), iVar8 < 0 ||
             (iVar8 = FUN_1006e308(param_1,uVar1,local_e0[0x26],local_e0[0x23],local_e0[0x25],0),
             uVar1 = local_8, iVar8 < 0)))))))) goto LAB_10070408;
  }
  else {
    local_e0[0x1c] = param_2;
    if (param_3 == 0) {
      local_e0[0x26] = 0;
      uVar1 = param_5 & 0xfffff | 0x10c00000;
    }
    else {
      uVar1 = param_5 & 0xfffff | 0x20600000;
      local_e0[0x26] = param_3;
    }
  }
  iVar8 = FUN_1006e308(param_1,uVar1,param_4,local_e0[0x1c],local_e0[0x26]);
  if (-1 < iVar8) {
    iVar8 = 0;
  }
LAB_10070408:
  _free(local_20);
  return iVar8;
}


