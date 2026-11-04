
void FUN_0046e4a0(void)

{
  int iVar1;
  bool bVar2;
  
  iVar1 = DAT_011298b0;
  bVar2 = DAT_011298b0 == 0xb;
  DAT_011298b0 = 0;
  if (bVar2) {
    FUN_0041b190();
    DAT_011298b4 = 0;
    return;
  }
  if (iVar1 == 10) {
    FUN_0042beb0();
  }
  DAT_011298b4 = 0;
  return;
}

