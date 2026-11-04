// 10070d24 size=642 FUN_10070d24

int FUN_10070d24(undefined4 param_1,undefined4 *param_2,undefined4 *param_3,int param_4,uint param_5
                )

{
  uint *puVar1;
  void *pvVar2;
  int iVar3;
  uint uVar4;
  int in_ECX;
  void *local_1c [4];
  uint local_c;
  int local_8;
  
  local_8 = in_ECX;
  if ((*(byte *)(*(int *)(in_ECX + 8) + 0x71) & 0x10) == 0) {
    pvVar2 = operator_new(param_5 << 3);
    local_1c[3] = pvVar2;
    if (pvVar2 == (void *)0x0) {
LAB_10070e68:
      iVar3 = -0x7ff8fff2;
      goto LAB_10070f94;
    }
    iVar3 = FUN_1006c566(pvVar2,param_5 * 2);
    if (iVar3 < 0) goto LAB_10070f94;
    uVar4 = 0;
    do {
      local_1c[uVar4] = pvVar2;
      uVar4 = uVar4 + 1;
      pvVar2 = (void *)((int)pvVar2 + param_5 * 4);
    } while (uVar4 < 2);
    uVar4 = 0;
    local_c = 4;
    if (param_5 == 0) {
LAB_10070dc1:
      uVar4 = param_5 & 0xfffff | 0x10000000;
      iVar3 = 0;
    }
    else {
      do {
        local_c = local_c & **(uint **)(*(int *)(*(int *)(local_8 + 8) + 0x14) +
                                       *(int *)(param_4 + uVar4 * 4) * 4) & 4;
        uVar4 = uVar4 + 1;
      } while (uVar4 < param_5);
      if (local_c != 0) goto LAB_10070dc1;
      uVar4 = param_5 & 0xfffff | 0x20500000;
      iVar3 = param_4;
    }
    iVar3 = FUN_1006e308(param_1,uVar4,local_1c[0],param_4,iVar3,4);
    if ((iVar3 < 0) ||
       (iVar3 = FUN_1006e308(param_1,param_5 & 0xfffff | 0x10100000,local_1c[1],local_1c[0],0,8),
       iVar3 < 0)) goto LAB_10070f94;
    local_1c[2] = local_1c[1];
    if (param_2 != (undefined4 *)0x0) {
      for (uVar4 = param_5 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
        *param_2 = *(undefined4 *)local_1c[0];
        local_1c[0] = (undefined4 *)((int)local_1c[0] + 4);
        param_2 = param_2 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(undefined1 *)param_2 = *(undefined1 *)local_1c[0];
        local_1c[0] = (undefined4 *)((int)local_1c[0] + 1);
        param_2 = (undefined4 *)((int)param_2 + 1);
      }
    }
  }
  else {
    local_1c[3] = operator_new(param_5 * 0xc);
    if (local_1c[3] == (void *)0x0) goto LAB_10070e68;
    iVar3 = FUN_1006c566(local_1c[3],param_5 * 3);
    if (iVar3 < 0) goto LAB_10070f94;
    uVar4 = 0;
    pvVar2 = local_1c[3];
    do {
      local_1c[uVar4] = pvVar2;
      uVar4 = uVar4 + 1;
      pvVar2 = (void *)((int)pvVar2 + param_5 * 4);
    } while (uVar4 < 3);
    local_c = param_5 & 0xfffff | 0x10100000;
    iVar3 = FUN_1006e308(param_1,local_c,local_1c[0],param_4,0,0);
    if (((iVar3 < 0) ||
        (iVar3 = FUN_1006e308(param_1,param_5 & 0xfffff | 0x20100000,local_1c[1],param_4,local_1c[0]
                              ,4), iVar3 < 0)) ||
       (iVar3 = FUN_1006e308(param_1,local_c,local_1c[2],local_1c[1],0,8), iVar3 < 0))
    goto LAB_10070f94;
    uVar4 = 0;
    if (param_5 != 0) {
      do {
        if ((**(byte **)(*(int *)(*(int *)(local_8 + 8) + 0x14) + *(int *)(param_4 + uVar4 * 4) * 4)
            & 0x17) == 0) break;
        uVar4 = uVar4 + 1;
      } while (uVar4 < param_5);
    }
    if ((uVar4 == param_5) && (uVar4 = 0, param_5 != 0)) {
      do {
        puVar1 = *(uint **)(*(int *)(*(int *)(local_8 + 8) + 0x14) +
                           *(int *)((int)local_1c[1] + uVar4 * 4) * 4);
        *puVar1 = *puVar1 | 0x17;
        uVar4 = uVar4 + 1;
      } while (uVar4 < param_5);
    }
    if (param_2 != (undefined4 *)0x0) {
      for (uVar4 = param_5 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
        *param_2 = *(undefined4 *)local_1c[1];
        local_1c[1] = (undefined4 *)((int)local_1c[1] + 4);
        param_2 = param_2 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(undefined1 *)param_2 = *(undefined1 *)local_1c[1];
        local_1c[1] = (undefined4 *)((int)local_1c[1] + 1);
        param_2 = (undefined4 *)((int)param_2 + 1);
      }
    }
  }
  if (param_3 != (undefined4 *)0x0) {
    for (param_5 = param_5 & 0x3fffffff; param_5 != 0; param_5 = param_5 - 1) {
      *param_3 = *(undefined4 *)local_1c[2];
      local_1c[2] = (undefined4 *)((int)local_1c[2] + 4);
      param_3 = param_3 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)param_3 = *(undefined1 *)local_1c[2];
      local_1c[2] = (undefined4 *)((int)local_1c[2] + 1);
      param_3 = (undefined4 *)((int)param_3 + 1);
    }
  }
  iVar3 = 0;
LAB_10070f94:
  _free(local_1c[3]);
  return iVar3;
}


