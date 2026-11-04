// 1009c8b6 size=316 FUN_1009c8b6

undefined4 FUN_1009c8b6(int *param_1,int *param_2)

{
  double dVar1;
  int iVar2;
  uint uVar3;
  
  iVar2 = *param_1;
  if (iVar2 == 0) {
    iVar2 = *param_2;
    if (((iVar2 != 0) && (iVar2 != 1)) && (iVar2 != 2)) {
      if (iVar2 != 3) {
        return 0x80004005;
      }
      param_1[2] = (uint)(*(double *)(param_2 + 2) != 0.0);
      return 0;
    }
    param_1[2] = (uint)(param_2[2] != 0);
    return 0;
  }
  if ((iVar2 == 1) || (iVar2 == 2)) {
    iVar2 = *param_2;
    if (iVar2 == 0) {
      uVar3 = (uint)(param_2[2] != 0);
    }
    else if ((iVar2 == 1) || (iVar2 == 2)) {
      uVar3 = param_2[2];
    }
    else {
      if (iVar2 != 3) {
        return 0x80004005;
      }
      uVar3 = __ftol();
    }
    goto LAB_1009c9a8;
  }
  if (iVar2 == 3) {
    iVar2 = *param_2;
    if (iVar2 == 0) {
      dVar1 = (double)(param_2[2] != 0);
    }
    else if (iVar2 == 1) {
      dVar1 = (double)param_2[2];
    }
    else if (iVar2 == 2) {
      dVar1 = (double)param_2[2];
      if (param_2[2] < 0) {
        dVar1 = dVar1 + 4294967296.0;
      }
    }
    else {
      if (iVar2 != 3) {
        return 0x80004005;
      }
      dVar1 = *(double *)(param_2 + 2);
    }
    *(double *)(param_1 + 2) = dVar1;
    return 0;
  }
  if (iVar2 == 4) {
    if (*param_2 != 4) goto LAB_1009c8f1;
  }
  else {
    if (iVar2 != 5) {
      return 0x80004005;
    }
LAB_1009c8f1:
    if (*param_2 != 4) {
      if (*param_2 == 5) {
        param_1[2] = param_2[2];
        param_1[3] = param_2[3];
        return 0;
      }
      return 0x80004005;
    }
    *param_1 = 4;
  }
  uVar3 = param_2[2];
LAB_1009c9a8:
  param_1[2] = uVar3;
  return 0;
}


