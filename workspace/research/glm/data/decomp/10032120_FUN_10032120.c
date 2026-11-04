// 10032120 size=198 FUN_10032120

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10032120(void)

{
  float fVar1;
  
  fVar1 = 1.0 / DAT_1072ddc8[0x51];
  _DAT_1072dafc = 0;
  _DAT_1072daf0 = fVar1 * DAT_1072ddc8[0x4e] - *DAT_1072ddc8;
  _DAT_1072daf4 = fVar1 * DAT_1072ddc8[0x4f] - DAT_1072ddc8[1];
  _DAT_1072daf8 = fVar1 * DAT_1072ddc8[0x50] - DAT_1072ddc8[2];
  fVar1 = fVar1 + fVar1;
  _DAT_1072db0c = 0;
  _DAT_1072db00 = fVar1 * DAT_1072ddc8[0x42];
  _DAT_1072db04 = fVar1 * DAT_1072ddc8[0x43];
  _DAT_1072db08 = fVar1 * DAT_1072ddc8[0x44];
  _DAT_1072db1c = 0;
  _DAT_1072db10 = -(fVar1 * DAT_1072ddc8[0x46]);
  _DAT_1072db14 = -(fVar1 * DAT_1072ddc8[0x47]);
  _DAT_1072db18 = -(fVar1 * DAT_1072ddc8[0x48]);
  return;
}


