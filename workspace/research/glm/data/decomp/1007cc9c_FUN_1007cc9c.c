// 1007cc9c size=513 FUN_1007cc9c

int FUN_1007cc9c(int param_1,uint *param_2,uint param_3)

{
  double dVar1;
  uint uVar2;
  int iVar3;
  uint *puVar4;
  int in_ECX;
  uint uVar5;
  int iVar6;
  
  puVar4 = param_2;
  if (param_1 == 0) {
    if (param_2 == (uint *)0x0) {
      return 0;
    }
    uVar5 = 0;
    if (param_3 == 0) {
      return 0;
    }
    do {
      uVar2 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x88),0,0,0);
      param_2[uVar5] = uVar2;
      if (uVar2 < *(uint *)(*(int *)(in_ECX + 8) + 8)) {
        iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + uVar2 * 4);
      }
      else {
        iVar3 = 0;
      }
      if (iVar3 != 0) {
        *(undefined4 *)(iVar3 + 0x30) = 0xffffffff;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < param_3);
    return 0;
  }
  iVar3 = *(int *)(param_1 + 4);
  if (iVar3 != 0xe) {
    if (iVar3 == 0xd) {
      iVar3 = FUN_1007b5eb(param_1,param_2,0);
      return iVar3;
    }
    if (iVar3 == 1) {
      while (iVar3 = *(int *)(param_1 + 8), iVar3 != 0) {
        if (*(int *)(iVar3 + 4) == 0xe) {
          iVar6 = 1;
          if (*(int *)(iVar3 + 0x10) == 6) {
            iVar6 = *(int *)(iVar3 + 0x1c);
          }
          iVar3 = FUN_1007cc9c(iVar3,param_2,iVar6);
        }
        else {
          if ((iVar3 == 0) || (*(int *)(iVar3 + 4) != 0xd)) break;
          iVar6 = *(int *)(iVar3 + 0x18) * *(int *)(iVar3 + 0x14);
          iVar3 = FUN_1007b5eb(iVar3,param_2,0);
        }
        if (iVar3 < 0) {
          return iVar3;
        }
        if (param_2 != (uint *)0x0) {
          param_2 = param_2 + iVar6;
        }
        param_1 = *(int *)(param_1 + 0xc);
        if (param_1 == 0) {
          return 0;
        }
      }
    }
    FUN_1006dca1();
    return -0x7fffbffb;
  }
  if (param_2 == (uint *)0x0) {
    return 0;
  }
  iVar3 = *(int *)(param_1 + 0x10);
  if (iVar3 == 6) {
    uVar5 = 0;
    if (*(int *)(param_1 + 0x18) != -1) {
      if (param_3 == 0) {
        return 0;
      }
      do {
        param_2[uVar5] = *(uint *)(*(int *)(in_ECX + 0x18) + (*(int *)(param_1 + 0x18) + uVar5) * 4)
        ;
        uVar5 = uVar5 + 1;
      } while (uVar5 < param_3);
      return 0;
    }
    if (param_3 == 0) {
      return 0;
    }
    do {
      param_2[uVar5] = *(uint *)(*(int *)(in_ECX + 0x1c) + uVar5 * 4);
      uVar5 = uVar5 + 1;
    } while (uVar5 < param_3);
    return 0;
  }
  dVar1 = 0.0;
  param_2 = (uint *)0x0;
  if (iVar3 == 0) {
    if (*(int *)(param_1 + 0x18) == 0) {
      dVar1 = 0.0;
    }
    else {
      dVar1 = 1.0;
    }
    param_2 = (uint *)0x17;
  }
  else {
    if (iVar3 == 1) {
      dVar1 = (double)*(int *)(param_1 + 0x18);
    }
    else {
      if (iVar3 != 2) {
        if (iVar3 == 3) {
          dVar1 = *(double *)(param_1 + 0x18);
        }
        goto LAB_1007cdbd;
      }
      dVar1 = (double)*(int *)(param_1 + 0x18);
      if (*(int *)(param_1 + 0x18) < 0) {
        dVar1 = dVar1 + 4294967296.0;
      }
    }
    param_2 = (uint *)0x2;
  }
LAB_1007cdbd:
  uVar5 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,dVar1);
  *puVar4 = uVar5;
  if (uVar5 < *(uint *)(*(int *)(in_ECX + 8) + 8)) {
    puVar4 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + uVar5 * 4);
  }
  else {
    puVar4 = (uint *)0x0;
  }
  if (puVar4 != (uint *)0x0) {
    *puVar4 = *puVar4 | (uint)param_2;
    puVar4[0xc] = 0xffffffff;
  }
  return 0;
}


