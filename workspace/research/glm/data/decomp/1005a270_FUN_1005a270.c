// 1005a270 size=209 FUN_1005a270

float10 FUN_1005a270(void)

{
  float *in_ECX;
  float *in_EDX;
  float *unaff_ESI;
  float local_8;
  float local_4;
  
  local_4 = 0.0;
  local_8 = *in_EDX - *in_ECX;
  if ((0.0 < local_8) || (local_8 = *in_ECX - *unaff_ESI, 0.0 < local_8)) {
    local_4 = local_8 * local_8 + 0.0;
  }
  local_8 = in_EDX[1] - in_ECX[1];
  if ((0.0 < local_8) || (local_8 = in_ECX[1] - unaff_ESI[1], 0.0 < local_8)) {
    local_4 = local_8 * local_8 + local_4;
  }
  local_8 = in_EDX[2] - in_ECX[2];
  if ((0.0 < local_8) || (local_8 = in_ECX[2] - unaff_ESI[2], 0.0 < local_8)) {
    local_4 = local_8 * local_8 + local_4;
  }
  return (float10)local_4;
}


