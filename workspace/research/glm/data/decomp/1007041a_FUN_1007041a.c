// 1007041a size=937 FUN_1007041a

int FUN_1007041a(undefined4 param_1,undefined4 param_2,uint param_3,int param_4,int *param_5,
                uint param_6)

{
  int in_ECX;
  void *pvVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int local_1c [3];
  undefined4 *local_10;
  undefined4 *local_c;
  void *local_8;
  
  local_8 = *(void **)(*(int *)(in_ECX + 8) + 0x6c);
  if ((char)local_8 < '\0') {
    uVar3 = 0;
    if (param_6 != 0) {
      while ((**(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + param_5[uVar3] * 4) & 1) != 0) {
        if (((((uint)local_8 & 4) != 0) && (param_5[uVar3] != *param_5)) ||
           (uVar3 = uVar3 + 1, param_6 <= uVar3)) break;
      }
    }
    if (uVar3 != param_6) goto LAB_10070544;
    local_8 = operator_new(param_6 * 0xc);
    if (local_8 == (void *)0x0) goto LAB_10070687;
    uVar3 = 0;
    pvVar1 = local_8;
    do {
      local_1c[uVar3 + 2] = (int)pvVar1;
      uVar3 = uVar3 + 1;
      pvVar1 = (void *)((int)pvVar1 + param_6 * 4);
    } while (uVar3 < 3);
    if (param_6 != 0) {
      param_4 = param_4 - (int)local_10;
      iVar2 = param_3 - (int)local_10;
      iVar4 = (int)local_c - (int)local_10;
      param_3 = param_6;
      do {
        *local_10 = *(undefined4 *)(iVar2 + (int)local_10);
        *(undefined4 *)(iVar4 + (int)local_10) = *(undefined4 *)(param_4 + (int)local_10);
        local_10 = local_10 + 1;
        param_3 = param_3 - 1;
      } while (param_3 != 0);
    }
    iVar2 = FUN_1006c566(local_1c[2],param_6);
    if ((iVar2 < 0) || (iVar2 = FUN_1006c566(param_2,param_6), iVar2 < 0)) goto LAB_10070661;
    iVar2 = FUN_1006e308(param_1,param_6 & 0xfffff | 0x10100000,local_1c[2],param_5,0,0x1a);
    if (iVar2 < 0) goto LAB_10070661;
    local_10 = (undefined4 *)(param_6 * 4 + (int)local_8);
    param_6 = param_6 & 0xfffff | 0x30000000;
LAB_1007064f:
    iVar2 = FUN_1006e308(param_1,param_6,param_2,local_1c[2],local_10,0);
    if (-1 < iVar2) {
      iVar2 = 0;
    }
  }
  else {
LAB_10070544:
    if (((uint)local_8 & 0x2000000) == 0) {
      local_8 = operator_new(param_6 * 0xc);
      if (local_8 != (void *)0x0) {
        uVar3 = 0;
        pvVar1 = local_8;
        do {
          local_1c[uVar3 + 2] = (int)pvVar1;
          uVar3 = uVar3 + 1;
          pvVar1 = (void *)((int)pvVar1 + param_6 * 4);
        } while (uVar3 < 3);
        iVar2 = FUN_1006c566(local_1c[2],param_6);
        if ((((iVar2 < 0) || (iVar2 = FUN_1006c566(local_10,param_6), iVar2 < 0)) ||
            (iVar2 = FUN_1006c566(local_c,param_6), iVar2 < 0)) ||
           (iVar2 = FUN_1006c566(param_2,param_6), iVar2 < 0)) goto LAB_10070661;
        uVar3 = param_6 & 0xfffff;
        iVar2 = FUN_1006e308(param_1,uVar3 | 0x10100000,local_1c[2],param_3,0,0);
        if (iVar2 < 0) goto LAB_10070661;
        param_6 = uVar3 | 0x20400000;
        iVar2 = FUN_1006e308(param_1,param_6,local_10,param_4,local_1c[2],0);
        if (iVar2 < 0) goto LAB_10070661;
        iVar2 = FUN_1006e308(param_1,uVar3 | 0x20500000,local_c,param_5,local_10,0);
        local_1c[2] = param_3;
        local_10 = local_c;
joined_r0x100707b0:
        if (iVar2 < 0) goto LAB_10070661;
        goto LAB_1007064f;
      }
    }
    else {
      local_8 = operator_new(param_6 * 0x14);
      if (local_8 != (void *)0x0) {
        uVar3 = 0;
        pvVar1 = local_8;
        do {
          local_1c[uVar3] = (int)pvVar1;
          uVar3 = uVar3 + 1;
          pvVar1 = (void *)((int)pvVar1 + param_6 * 4);
        } while (uVar3 < 5);
        uVar3 = 0;
        if (param_6 != 0) {
          do {
            local_c[uVar3] = *(undefined4 *)(in_ECX + 0x20);
            uVar3 = uVar3 + 1;
          } while (uVar3 < param_6);
        }
        iVar2 = FUN_1006c566(local_1c[0],param_6);
        if (((iVar2 < 0) || (iVar2 = FUN_1006c566(local_1c[1],param_6), iVar2 < 0)) ||
           ((iVar2 = FUN_1006c566(local_1c[2],param_6), iVar2 < 0 ||
            ((iVar2 = FUN_1006c566(local_10,param_6), iVar2 < 0 ||
             (iVar2 = FUN_1006c566(param_2,param_6), iVar2 < 0)))))) goto LAB_10070661;
        uVar3 = param_6 & 0xfffff;
        iVar2 = FUN_1006e308(param_1,uVar3 | 0x10100000,local_1c[0],param_5,0,0);
        if (iVar2 < 0) goto LAB_10070661;
        param_6 = uVar3 | 0x20400000;
        iVar2 = FUN_1006e308(param_1,param_6,local_1c[1],local_1c[0],local_c,0);
        if (iVar2 < 0) goto LAB_10070661;
        iVar2 = FUN_1006e308(param_1,uVar3 | 0x20500000,local_1c[2],local_1c[1],param_3,0);
        if (iVar2 < 0) goto LAB_10070661;
        iVar2 = FUN_1006e308(param_1,uVar3 | 0x20500000,local_10,param_5,param_4,0);
        goto joined_r0x100707b0;
      }
    }
LAB_10070687:
    iVar2 = -0x7ff8fff2;
  }
LAB_10070661:
  _free(local_8);
  return iVar2;
}


