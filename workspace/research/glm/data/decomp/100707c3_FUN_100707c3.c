// 100707c3 size=1068 FUN_100707c3

int FUN_100707c3(undefined4 param_1,uint param_2,int param_3,int *param_4,uint param_5)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int in_ECX;
  int iVar5;
  void *pvVar6;
  uint uVar7;
  bool bVar8;
  undefined8 uVar9;
  undefined4 uVar10;
  double local_1c;
  uint local_14 [3];
  void *local_8;
  
  uVar7 = 0;
  bVar8 = param_5 == 0;
  local_8 = (void *)0x0;
  local_14[2] = 1;
  local_14[1] = 1;
  if (param_5 != 0) {
    do {
      iVar2 = FUN_1006e16c(*(undefined4 *)(param_3 + uVar7 * 4),&local_1c);
      if (iVar2 < 0) break;
      if (local_1c != 0.0) {
        local_14[2] = 0;
      }
      if (local_1c != 1.0) {
        local_14[1] = 0;
      }
      uVar7 = uVar7 + 1;
    } while (uVar7 < param_5);
    bVar8 = uVar7 == param_5;
  }
  uVar7 = 1;
  if ((bVar8) && ((local_14[2] != 0 || (local_14[1] != 0)))) {
    local_8 = operator_new(param_5 << 2);
    if (local_8 == (void *)0x0) {
LAB_10070b18:
      iVar2 = -0x7ff8fff2;
      goto LAB_10070bdd;
    }
    uVar7 = 0;
    if (param_5 != 0) {
      do {
        if (local_14[2] == 0) {
          uVar10 = *(undefined4 *)(in_ECX + 0x20);
        }
        else {
          uVar10 = *(undefined4 *)(in_ECX + 0x24);
        }
        *(undefined4 *)((int)local_8 + uVar7 * 4) = uVar10;
        uVar7 = uVar7 + 1;
      } while (uVar7 < param_5);
    }
    uVar9 = FUN_1006c566(param_2,param_5);
    iVar2 = (int)uVar9;
    if (iVar2 < 0) goto LAB_10070bdd;
    uVar10 = 0;
    param_5 = param_5 & 0xfffff | 0x10000000;
    uVar7 = (uint)((ulonglong)uVar9 >> 0x20);
LAB_10070bcb:
    iVar2 = FUN_1006e308(param_1,param_5,param_2,uVar7,0,uVar10);
    if (iVar2 < 0) goto LAB_10070bdd;
  }
  else {
    bVar8 = param_5 == 1;
    if (1 < param_5) {
      do {
        if (*param_4 != param_4[uVar7]) break;
        uVar7 = uVar7 + 1;
      } while (uVar7 < param_5);
      bVar8 = uVar7 == param_5;
    }
    if ((!bVar8) || (iVar2 = FUN_1006e16c(*param_4,local_14), iVar2 < 0)) {
LAB_10070b05:
      local_8 = operator_new(param_5 << 3);
      if (local_8 == (void *)0x0) goto LAB_10070b18;
      uVar7 = 0;
      pvVar6 = local_8;
      do {
        local_14[uVar7] = (uint)pvVar6;
        uVar7 = uVar7 + 1;
        pvVar6 = (void *)((int)pvVar6 + param_5 * 4);
      } while (uVar7 < 2);
      iVar2 = FUN_1006c566(local_14[0],param_5);
      if (((iVar2 < 0) || (iVar2 = FUN_1006c566(local_14[1],param_5), iVar2 < 0)) ||
         (iVar2 = FUN_1006c566(param_2,param_5), iVar2 < 0)) goto LAB_10070bdd;
      param_5 = param_5 & 0xfffff;
      iVar2 = FUN_1006e308(param_1,param_5 | 0x10600000,local_14[0],param_3,0,0);
      if ((iVar2 < 0) ||
         (iVar2 = FUN_1006e308(param_1,param_5 | 0x20500000,local_14[1],param_4,local_14[0],0),
         iVar2 < 0)) goto LAB_10070bdd;
      uVar10 = 4;
      param_5 = param_5 | 0x10500000;
      uVar7 = local_14[1];
      goto LAB_10070bcb;
    }
    local_14[2] = __ftol();
    uVar7 = param_2;
    if (ABS((double)CONCAT44(local_14[1],local_14[0]) - (double)(int)local_14[2]) < 1e-06) {
      iVar2 = 0;
      iVar5 = 0;
      uVar3 = (local_14[2] ^ (int)local_14[2] >> 0x1f) - ((int)local_14[2] >> 0x1f);
      for (uVar4 = uVar3; uVar4 != 0; uVar4 = uVar4 >> 1) {
        iVar2 = iVar2 + 1;
        iVar5 = iVar5 + (uVar4 & 1);
      }
      uVar4 = (-(uint)(iVar5 != 0) & iVar5 - 1U) + (-(uint)(iVar2 != 0) & iVar2 - 1U);
      if ((int)local_14[2] < 0) {
        uVar4 = uVar4 + param_5;
      }
      if (((*(byte *)(*(int *)(in_ECX + 8) + 0x6c) & 0x40) == 0) ||
         (uVar1 = param_5, (*(byte *)(in_ECX + 0x14) & 0x20) == 0)) {
        iVar2 = *(int *)(*(int *)(in_ECX + 8) + 100);
        if (iVar2 == 0) {
          iVar2 = 1;
        }
        uVar1 = iVar2 * param_5 * 2;
      }
      if (uVar4 <= uVar1 + 1) {
        local_8 = operator_new(param_5 << 2);
        if (local_8 == (void *)0x0) goto LAB_10070b18;
        uVar4 = 0;
        if (param_5 != 0) {
          do {
            *(undefined4 *)((int)local_8 + uVar4 * 4) = *(undefined4 *)(in_ECX + 0x20);
            uVar4 = uVar4 + 1;
          } while (uVar4 < param_5);
        }
        iVar2 = FUN_1006c566(param_2,param_5);
        if (iVar2 < 0) goto LAB_10070bdd;
        local_14[1] = param_5 & 0xfffff;
        param_4 = (int *)CONCAT13(0x10,(int3)local_14[1]);
        iVar2 = FUN_1006e308(param_1,param_4,param_2,local_8,0,0);
        if (iVar2 < 0) goto LAB_10070bdd;
        if (uVar3 != 0) {
          uVar9 = FUN_1006c566(local_8,param_5);
          iVar5 = (int)((ulonglong)uVar9 >> 0x20);
          iVar2 = (int)uVar9;
          if (iVar5 <= iVar2) {
            iVar2 = FUN_1006e308(param_1,param_4,local_8,param_3,iVar5,iVar5);
            while ((-1 < iVar2 &&
                   (((uVar3 & 1) == 0 ||
                    (iVar2 = FUN_1006e308(param_1,local_14[1] | 0x20500000,param_2,param_2,local_8,0
                                         ), -1 < iVar2))))) {
              uVar3 = uVar3 >> 1;
              if (uVar3 == 0) goto LAB_10070a63;
              iVar2 = FUN_1006e308(param_1,local_14[1] | 0x20500000,local_8,local_8,local_8,4);
            }
          }
          goto LAB_10070bdd;
        }
LAB_10070a63:
        if (-1 < (int)local_14[2]) goto LAB_10070bdb;
        uVar10 = 0;
        param_5 = local_14[1] | 0x10300000;
        goto LAB_10070bcb;
      }
      goto LAB_10070b05;
    }
    if (1e-06 <= ABS(ABS((double)CONCAT44(local_14[1],local_14[0])) - 0.5)) goto LAB_10070b05;
    iVar2 = FUN_1006c566(param_2,param_5);
    if (iVar2 < 0) goto LAB_10070bdd;
    iVar2 = FUN_1006e308(param_1,param_5 & 0xfffff | 0x10700000,param_2,param_3,0,4);
    if (iVar2 < 0) goto LAB_10070bdd;
    if (0.0 <= (double)CONCAT44(local_14[1],local_14[0])) {
      uVar10 = 4;
      param_5 = param_5 & 0xfffff | 0x10300000;
      goto LAB_10070bcb;
    }
  }
LAB_10070bdb:
  iVar2 = 0;
LAB_10070bdd:
  _free(local_8);
  return iVar2;
}


