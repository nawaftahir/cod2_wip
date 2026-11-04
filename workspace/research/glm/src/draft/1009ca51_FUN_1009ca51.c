


unsigned int FUN_1009ca51(int *param_1,double param_2)

{
  int iVar1;
  
  iVar1 = *param_1;
  if (iVar1 == 0) {
    if (param_2 == 0.0) {
      iVar1 = 0;
    }
    else {
      iVar1 = 1;
    }
  }
  else {
    if ((iVar1 != 1) && (iVar1 != 2)) {
      if (iVar1 == 3) {
        *(double *)(param_1 + 2) = param_2;
        return 0;
      }
      return 0x80004005;
    }
    iVar1 = __ftol();
  }
  param_1[2] = iVar1;
  return 0;
}


