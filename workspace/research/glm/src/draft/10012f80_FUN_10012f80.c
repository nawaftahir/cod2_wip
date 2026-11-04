extern unsigned int DAT_101d481c;
extern unsigned int DAT_101d7e10;
extern unsigned int DAT_101d7e14;
extern unsigned int DAT_10764558;
extern int FUN_100052c0();
extern int FUN_1000aaf0();
extern int FUN_10012c80();
extern int FUN_10012e70();
extern int FUN_10012ee0();
extern int FUN_10020b50();
extern int FUN_10029430();
extern int FUN_1003a9d0();
extern int FUN_1005edb0();
extern int FUN_10060770();


void FUN_10012f80(void)

{
  unsigned int uStack_14;
  unsigned int uStack_10;
  unsigned int uStack_c;
  
  (*(void *)RI_Printf)(0,"----- R_Init -----\n");
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
  (*(void *)RI_RI_unk125)(&uStack_14,1,0,&g_101d7e14,0);
 
	int g_101d7e14 = DAT_101d7e14; DAT_101d7e10 = &g_101d7e14;
  DAT_101d481c = FUN_1003a9d0();
  return;
}


