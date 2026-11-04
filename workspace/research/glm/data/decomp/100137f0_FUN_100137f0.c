// 100137f0 size=203 FUN_100137f0

undefined4 FUN_100137f0(void)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = (**(code **)(*DAT_101d1bf8 + 0xc))(DAT_101d1bf8);
  if (iVar1 == -0x7789f798) {
    return 0;
  }
  (*(code *)RI_Printf)(0,"Recovering lost device...\n");
  (*(code *)RI_DObjBad)(1,FUN_10020330,0,1);
  FUN_1000d260();
  FUN_10017470();
  FUN_10016db0();
  if (DAT_101d1b9c != 0) {
    FUN_10001780();
  }
  FUN_10013690();
  if (DAT_101d1b9c != 0) {
    uVar2 = FUN_10001050(*(undefined4 *)(DAT_101d1b9c + 0x2c));
    *(undefined4 *)(DAT_101d1b9c + 0x30) = uVar2;
  }
  FUN_100174c0();
  FUN_10016df0();
  FUN_1000d2e0();
  if (*(int *)(DAT_101ce648 + 8) != 0) {
    (*(code *)RI_DObjBad)(1,FUN_10020380,0,1);
  }
  DAT_101d481c = FUN_1003a9d0();
  (*(code *)RI_Printf)(0,"Finished recovering lost device.\n");
  return 1;
}


