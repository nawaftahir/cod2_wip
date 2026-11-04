// 1005df00 size=135 FUN_1005df00

float10 FUN_1005df00(void)

{
  float fVar1;
  float *in_ECX;
  float *in_EDX;
  float local_8;
  
  local_8 = *in_ECX;
  if (local_8 < in_ECX[1]) {
    local_8 = in_ECX[1];
  }
  if (local_8 < in_ECX[2]) {
    local_8 = in_ECX[2];
  }
  if (local_8 == 0.0) {
    in_EDX[2] = 1.0;
    in_EDX[1] = 1.0;
    *in_EDX = 1.0;
    return (float10)0.0;
  }
  fVar1 = 1.0 / local_8;
  *in_EDX = fVar1 * *in_ECX;
  in_EDX[1] = fVar1 * in_ECX[1];
  in_EDX[2] = fVar1 * in_ECX[2];
  return (float10)local_8;
}


