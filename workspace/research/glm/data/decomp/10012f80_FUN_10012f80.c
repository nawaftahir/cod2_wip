// 10012f80 size=169 FUN_10012f80

void FUN_10012f80(void)

{
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  
  (*(code *)RI_Printf)(0,"----- R_Init -----\n");
  FUN_10060770();
  FUN_1000aaf0();
  FUN_100052c0();
  FUN_10012e70();
  FUN_10020b50();
  FUN_10029430();
  FUN_10012c80();
  DAT_10764558 = R_PickMaterial("fonts/smalldevfont",1);
  FUN_10012ee0();
  FUN_1005edb0();
  uStack_14 = 0;
  uStack_10 = 0;
  uStack_c = 0;
  (*(code *)RI_RI_unk125)(&uStack_14,1,0,&DAT_101d7e14,0);
  DAT_101d7e10 = &DAT_101d7e14;
  DAT_101d481c = FUN_1003a9d0();
  return;
}


