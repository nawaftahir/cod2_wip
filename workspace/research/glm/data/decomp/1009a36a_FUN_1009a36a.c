// 1009a36a size=94 FUN_1009a36a

undefined4 FUN_1009a36a(double *param_1,int *param_2)

{
  double dVar1;
  int iVar2;
  
  iVar2 = *param_2;
  if (iVar2 == 0) {
    if (param_2[2] == 0) {
      dVar1 = 0.0;
    }
    else {
      dVar1 = 1.0;
    }
    *param_1 = dVar1;
  }
  else {
    if (iVar2 == 1) {
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
    *param_1 = dVar1;
  }
  return 0;
}


