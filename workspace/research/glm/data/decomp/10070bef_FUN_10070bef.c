// 10070bef size=309 FUN_10070bef

int FUN_10070bef(undefined4 param_1,undefined4 param_2,uint param_3)

{
  int *piVar1;
  undefined4 uVar2;
  uint uVar3;
  int iVar4;
  int in_ECX;
  void *pvVar5;
  undefined8 uVar6;
  int local_14 [3];
  void *local_8;
  
  local_8 = operator_new(param_3 * 0xc);
  if (local_8 == (void *)0x0) {
    param_3 = -0x7ff8fff2;
    iVar4 = param_3;
  }
  else {
    uVar3 = 0;
    pvVar5 = local_8;
    do {
      local_14[uVar3] = (int)pvVar5;
      uVar3 = uVar3 + 1;
      pvVar5 = (void *)((int)pvVar5 + param_3 * 4);
    } while (uVar3 < 3);
    uVar3 = 0;
    if (param_3 != 0) {
      do {
        *(undefined4 *)(local_14[0] + uVar3 * 4) = *(undefined4 *)(in_ECX + 0x2c);
        uVar3 = uVar3 + 1;
      } while (uVar3 < param_3);
    }
    iVar4 = FUN_1006c566(local_14[1],param_3);
    if (-1 < iVar4) {
      uVar6 = FUN_1006c566(local_14[2],param_3);
      iVar4 = (int)uVar6;
      if (-1 < (int)uVar6) {
        iVar4 = FUN_1006e308(param_1,param_3 & 0xfffff | 0x20500000,local_14[1],param_2,
                             (int)((ulonglong)uVar6 >> 0x20),0);
        if ((-1 < iVar4) &&
           (iVar4 = FUN_1006e308(param_1,param_3 & 0xfffff | 0x11000000,local_14[2],local_14[1],0,0)
           , -1 < iVar4)) {
          uVar3 = 0;
          if (param_3 != 0) {
            do {
              iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                              *(int *)(local_14[2] + uVar3 * 4) * 4);
              *(undefined4 *)(iVar4 + 4) = *(undefined4 *)(*(int *)(in_ECX + 8) + 0xa8);
              uVar2 = *(undefined4 *)
                       (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) +
                                *(int *)(*(int *)(in_ECX + 8) + 0xa8) * 4) + 8);
              *(uint *)(iVar4 + 0x10) = uVar3;
              uVar3 = uVar3 + 1;
              *(undefined4 *)(iVar4 + 0xc) = uVar2;
            } while (uVar3 < param_3);
          }
          piVar1 = (int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) +
                                   *(int *)(*(int *)(in_ECX + 8) + 0xa8) * 4) + 8);
          *piVar1 = *piVar1 + 1;
          param_3 = 0;
          iVar4 = param_3;
        }
      }
    }
  }
  param_3 = iVar4;
  _free(local_8);
  return param_3;
}


