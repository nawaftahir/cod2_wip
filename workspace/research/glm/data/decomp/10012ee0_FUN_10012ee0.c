// 10012ee0 size=43 FUN_10012ee0

void FUN_10012ee0(void)

{
  float10 fVar1;
  int local_4;
  
  local_4 = 0;
  do {
    fVar1 = (float10)local_4;
    local_4 = local_4 + 1;
    fVar1 = (float10)fsin(fVar1 * (float10)0.3515625 * (float10)0.017453292);
    (&DAT_101d620c)[local_4] = (float)fVar1;
  } while (local_4 < 0x400);
  return;
}


