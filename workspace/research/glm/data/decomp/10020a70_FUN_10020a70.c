// 10020a70 size=136 FUN_10020a70

void FUN_10020a70(void)

{
  undefined4 uVar1;
  int *in_EAX;
  
  DAT_101da9bc = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(0x40000);
  FUN_10020950();
  uVar1 = DAT_101da9bc;
  FUN_1000ee30(0x200,0x200,1,3,0);
  if (*in_EAX == 4) {
    FUN_1000ec00();
    (*(code *)RI_Hunk_FreeTempMemory)(DAT_101da9bc);
    return;
  }
  FUN_1000ea20(0x32,uVar1);
  (*(code *)RI_Hunk_FreeTempMemory)(DAT_101da9bc);
  return;
}


