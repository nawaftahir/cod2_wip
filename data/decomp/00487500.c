
float10 __fastcall FUN_00487500(float *param_1)

{
  int in_EAX;
  float fVar1;
  int iVar2;
  int iVar3;
  float10 fVar4;
  double dVar5;
  float local_20 [4];
  int local_10;
  float local_c;
  float local_8;
  
  local_10 = in_EAX - (int)param_1;
  iVar3 = (int)local_20 - (int)param_1;
  iVar2 = 2;
  do {
    local_20[3] = *(float *)(local_10 + (int)param_1);
    dVar5 = _fabs((double)local_20[3]);
    local_c = (float)dVar5;
    local_20[2] = *param_1;
    local_8 = local_c;
    dVar5 = _fabs((double)local_20[2]);
    local_c = (float)dVar5;
    fVar1 = local_8;
    if (local_8 <= local_c) {
      fVar1 = local_c;
    }
    *(float *)(iVar3 + (int)param_1) = fVar1;
    param_1 = param_1 + 1;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  local_20[2] = local_20[0] * local_20[0] + local_20[1] * local_20[1];
  fVar4 = (float10)FUN_004d98d4((double)local_20[2]);
  return (float10)(float)fVar4;
}

