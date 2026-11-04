// 10011900 size=307 FUN_10011900

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10011900(void)

{
  int iVar1;
  undefined4 local_124;
  undefined4 local_110;
  undefined4 local_10c;
  undefined4 local_f4;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined4 local_c4;
  undefined4 local_a8;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_90;
  undefined4 local_8c;
  
  FUN_100116c0();
  FUN_10011760();
  DAT_101d4c84 = local_d8;
  if (local_d4 - local_d8 < 0) {
    DAT_101d4c84 = local_d4;
  }
  DAT_101d4c88 = local_98;
  DAT_101d4c94 = (byte)(local_124 >> 0x11) & 1;
  _DAT_101d4c8c = local_9c;
  _DAT_101d4c90 = local_90;
  _DAT_101d4964 = 6;
  if (local_8c + -6 < 0) {
    _DAT_101d4964 = local_8c;
  }
  DAT_101d4968 = (byte)((uint)local_a8 >> 8) & 1;
  DAT_101d4969 = ((byte)local_a8 & 0xc0) == 0xc0;
  DAT_101d4960 = local_c4;
  DAT_101d496a = (byte)((uint)local_10c >> 0x19) & 1;
  DAT_101d496d = (byte)(local_110 >> 0x11) & 1;
  DAT_101d496b = (byte)((uint)local_f4 >> 0x10) & 1;
  DAT_101d496c = (byte)(local_110 >> 0xb) & 1;
  if (*(int *)(DAT_101ce6dc + 8) == 1) {
    DAT_101d496e = 0;
    return;
  }
  iVar1 = (**(code **)(*DAT_101d1bf4 + 0x28))(DAT_101d1bf4);
  DAT_101d496e = '\x01' - (iVar1 != 0);
  return;
}


