extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d1ba0;
extern unsigned int DAT_101d49b8;
extern unsigned int DAT_10696bd4;
extern int FUN_100013d0();
extern int FUN_10001490();
extern int FUN_100015b0();
extern int FUN_10004890();
extern int FUN_1000d200();
extern int FUN_10029120();
extern int FUN_100376c0();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_LoadWorld(unsigned int param_1,unsigned int *param_2)

{
  FUN_100376c0(param_1);
  g_101d1b9c = FUN_10004890(param_1);
 
	int g_101d1b9c = DAT_101d1b9c; if (param_2 != (unsigned int *)0x0) {
    *param_2 = *(unsigned int *)(g_101d1b9c + 0x154);
  }
  FUN_10001490();
  FUN_100013d0();
  FUN_10029120();
  _DAT_10696bd0 = 0x41200000;
  DAT_10696bd4 = 0xffffffff;
  DAT_101d49b8 = (*(void *)RI_Hunk_AllocInternal)(0xc0000);
  FUN_100015b0();
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    DAT_101d1ba0 = FUN_1000d200(1);
  }
  return;
}


