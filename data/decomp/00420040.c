
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00420040(LONG *param_1,LONG param_2,LONG param_3)

{
  DWORD DVar1;
  
  if ((_DAT_0124ae2c & 1) == 0) {
    _DAT_0124ae2c = _DAT_0124ae2c | 1;
    DVar1 = GetVersion();
    DAT_0124ae28 = (byte)(DVar1 >> 0x1f);
  }
  if (DAT_0124ae28 == 0) {
    param_2 = param_3;
  }
  InterlockedExchange(param_1,param_2);
  return;
}

