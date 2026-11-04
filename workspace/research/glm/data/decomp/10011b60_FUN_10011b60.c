// 10011b60 size=143 FUN_10011b60

void FUN_10011b60(void)

{
  undefined *puVar1;
  
  FUN_10011a40();
  DAT_101d49a4 = &DAT_101d4998;
  puVar1 = &DAT_101d4980;
  do {
    FUN_10011a40();
    puVar1 = puVar1 + 0xc;
  } while (puVar1 != &DAT_101d4998);
  FUN_10011ad0();
  DAT_101d497c = &DAT_101d4970;
  DAT_101d49c0 = (*(code *)RI_Z_VirtualReserveInternal)(0xa00000);
  return;
}


