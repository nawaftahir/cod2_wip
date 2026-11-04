// 100351a0 size=543 FUN_100351a0

int FUN_100351a0(float param_1,float param_2,int param_3,int param_4,int param_5,int param_6)

{
  float fVar1;
  int iVar2;
  float local_c;
  int local_8;
  int local_4;
  
  iVar2 = 0;
  local_8 = param_5;
  local_4 = param_6;
  if ((param_3 != param_5) || (param_4 != param_6)) {
    local_c = param_1;
    if (param_2 - param_1 < 0.0) {
      local_c = param_2;
    }
    if (1.3895605 < local_c) {
      local_c = 1.3895605;
    }
    param_1 = (SQRT(param_1 * param_1 - local_c * local_c) * (float)param_5) / (float)param_3;
    param_2 = (SQRT(param_2 * param_2 - local_c * local_c) * (float)param_6) / (float)param_4;
    FUN_10034fe0(local_c,param_4,param_5,param_6);
    iVar2 = 1;
  }
  while( true ) {
    if ((param_1 < 0.32950512) && (param_2 < 0.32950512)) {
      return iVar2;
    }
    if ((ABS(param_1 - param_2) < 0.32950512) &&
       (fVar1 = (param_1 + param_2) * 0.5, fVar1 < 1.3895605 != (fVar1 == 1.3895605))) break;
    if (param_1 <= param_2) {
      if (param_2 < 6.4977503 == (param_2 == 6.4977503)) {
        local_c = 6.4977503;
        param_2 = SQRT(param_2 * param_2 - 42.22076);
      }
      else {
        local_c = param_2;
        param_2 = 0.0;
      }
    }
    else if (6.4977503 <= param_1) {
      local_c = 6.4977503;
      param_1 = SQRT(param_1 * param_1 - 42.22076);
    }
    else {
      local_c = param_1;
      param_1 = 0.0;
    }
    FUN_10034ec0(local_c,&local_8);
    iVar2 = iVar2 + 1;
    if (0xf < iVar2) {
      return iVar2;
    }
  }
  FUN_10034fe0(fVar1,param_6,param_5,param_6);
  return iVar2 + 1;
}


