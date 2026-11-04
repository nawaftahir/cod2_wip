// 10059f50 size=167 FUN_10059f50

void FUN_10059f50(void)

{
  float fVar1;
  float *in_EAX;
  float *in_ECX;
  uint uVar2;
  float local_c [3];
  
  local_c[0] = *in_ECX * *in_ECX;
  local_c[1] = in_ECX[1] * in_ECX[1];
  local_c[2] = in_ECX[2] * in_ECX[2];
  uVar2 = (uint)(local_c[1] < local_c[0]);
  if (local_c[2] < local_c[uVar2]) {
    uVar2 = 2;
  }
  fVar1 = -in_ECX[uVar2];
  *in_EAX = fVar1 * *in_ECX;
  in_EAX[1] = fVar1 * in_ECX[1];
  in_EAX[2] = fVar1 * in_ECX[2];
  in_EAX[uVar2] = in_EAX[uVar2] + 1.0;
  FUN_100590b0();
  return;
}


