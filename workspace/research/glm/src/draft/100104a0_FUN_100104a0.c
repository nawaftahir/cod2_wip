extern int FUN_1000f180();
extern int FUN_10058f40();


void FUN_100104a0(float *param_1,int param_2)

{
  float fVar1;
  float fVar2;
  int iVar3;
  float local_1c [4];
  float local_c;
  float local_8;
  float local_4;
  
  fVar1 = param_1[1];
  local_1c[2] = param_1[2] * 0.57735026;
  local_1c[0] = fVar1 * 0.0 + *param_1 * 0.81649655 + local_1c[2];
  fVar2 = *param_1 * -0.40824828;
  local_1c[1] = fVar1 * 0.70710677 + fVar2 + local_1c[2];
  local_1c[2] = (fVar2 - fVar1 * 0.70710677) + local_1c[2];
  iVar3 = FUN_10058f40();
  fVar1 = 1.0 / ABS(local_1c[iVar3]);
  local_c = (local_1c[0] * fVar1 + 1.0) * 0.5;
  local_c = (3.0 - (local_c + local_c)) * local_c * local_c;
  local_8 = (local_1c[1] * fVar1 + 1.0) * 0.5;
  local_8 = (3.0 - (local_8 + local_8)) * local_8 * local_8;
  if (param_2 == 0) {
    local_4 = 0.5 - local_1c[2] * fVar1 * 0.5;
  }
  else {
    local_4 = (local_1c[2] * fVar1 + 1.0) * 0.5;
  }
  local_4 = (3.0 - (local_4 + local_4)) * local_4 * local_4;
  local_1c[0] = (1.0 - local_c) * (1.0 - local_8) * local_4;
  local_1c[1] = (1.0 - local_8) * local_4 * local_c;
  local_1c[2] = (1.0 - local_c) * local_4 * local_8;
  local_1c[3] = local_4 * local_8 * local_c;
  FUN_1000f180();
  return;
}


