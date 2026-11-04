// 10012e70 size=109 FUN_10012e70

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10012e70(void)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  
  iVar1 = DAT_101ce644;
  puVar3 = (undefined4 *)&DAT_101d4d00;
  for (iVar2 = 0xc68; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  puVar3 = &DAT_101d0b00;
  for (iVar2 = 0x43c; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  puVar3 = &DAT_1072da00;
  for (iVar2 = 0xdad8; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  DAT_10730554 = 0xe;
  DAT_10730558 = 0xe;
  DAT_1072ddec = DAT_101d4c70;
  _DAT_1072de48 = 3;
  DAT_1072dde8 = DAT_101d4c6c;
  DAT_1072debe = (&DAT_101906b0)[*(int *)(iVar1 + 8)];
  return;
}


