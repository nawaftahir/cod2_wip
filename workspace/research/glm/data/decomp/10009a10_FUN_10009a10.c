// 10009a10 size=92 FUN_10009a10

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

bool FUN_10009a10(void)

{
  char cVar1;
  int in_EAX;
  
  if (*(char *)(in_EAX + 1) == '\0') {
    if (_DAT_101ce5d0 * *(float *)(in_EAX + 8) +
        _DAT_101ce5dc * *(float *)(in_EAX + 0x14) +
        _DAT_101ce5d8 * *(float *)(in_EAX + 0x10) + _DAT_101ce5d4 * *(float *)(in_EAX + 0xc) <= 0.0)
    {
      cVar1 = FUN_10007e10();
      if (cVar1 == '\0') {
        cVar1 = FUN_10009700();
        return cVar1 != '\0';
      }
    }
  }
  return true;
}


