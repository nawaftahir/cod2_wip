// 100305d0 size=212 FUN_100305d0

undefined4 FUN_100305d0(void)

{
  float fVar1;
  float *in_ECX;
  
  *in_ECX = 0.0;
  if ((0.0 < *(float *)(DAT_101ce6e8 + 8)) ||
     ((*(int *)(DAT_101d1b9c + 0x20) != 0 && (0.0 < *(float *)(DAT_101ce740 + 8))))) {
    *in_ECX = *(float *)(DAT_101ce7ac + 8);
  }
  in_ECX[1] = 0.0;
  if ((0.0 < *(float *)(DAT_101ce6ec + 8)) ||
     ((*(int *)(DAT_101d1b9c + 0x20) != 0 && (0.0 < *(float *)(DAT_101ce744 + 8))))) {
    in_ECX[1] = *(float *)(DAT_101ce7b0 + 8);
  }
  if ((in_ECX[1] != 0.0) && ((*in_ECX == 0.0 || (in_ECX[1] < *in_ECX)))) {
    fVar1 = *in_ECX;
    *in_ECX = in_ECX[1];
    in_ECX[1] = fVar1;
    return 1;
  }
  return 0;
}


