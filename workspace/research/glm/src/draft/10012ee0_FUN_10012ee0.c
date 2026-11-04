extern unsigned int DAT_101d620c;


void FUN_10012ee0(void)

{
  float fVar1;
  int local_4;
  
  local_4 = 0;
  do {
    fVar1 = (float)local_4;
    local_4 = local_4 + 1;
    fVar1 = (float)fsin(fVar1 * (float)0.3515625 * (float)0.017453292);
    (&DAT_101d620c)[local_4] = (float)fVar1;
  } while (local_4 < 0x400);
  return;
}


