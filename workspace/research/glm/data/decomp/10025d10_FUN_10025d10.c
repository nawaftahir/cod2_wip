// 10025d10 size=360 FUN_10025d10

void FUN_10025d10(int param_1,int param_2,int param_3)

{
  int unaff_EDI;
  int local_4;
  
  if (unaff_EDI < param_1) {
    if (0 < param_2) {
      local_4 = param_2;
      do {
        FUN_100259a0(param_1,1);
        local_4 = local_4 + -1;
      } while (local_4 != 0);
    }
  }
  else if ((param_1 < unaff_EDI) && (-1 < param_2 + -1)) {
    local_4 = param_2;
    do {
      FUN_10025b10();
      local_4 = local_4 + -1;
    } while (local_4 != 0);
  }
  if (param_3 < param_2) {
    if (0 < unaff_EDI) {
      do {
        FUN_100259a0(param_2);
        unaff_EDI = unaff_EDI + -1;
      } while (unaff_EDI != 0);
      return;
    }
  }
  else if ((param_2 < param_3) && (param_1 = unaff_EDI, -1 < unaff_EDI + -1)) {
    do {
      FUN_10025b10(param_3);
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  return;
}


