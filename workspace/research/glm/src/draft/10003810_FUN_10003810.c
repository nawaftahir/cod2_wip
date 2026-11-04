extern unsigned int DAT_101ae288;
extern unsigned int DAT_101ae384;
extern unsigned int DAT_101ae388;
extern int FUN_100298a0();
extern int FUN_10029bf0();


void FUN_10003810(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = 0;
  if (0 < g_101ae384) {
 
	int g_101ae384 = DAT_101ae384;   iVar2 = 0;
    do {
      FUN_100298a0(*(unsigned int *)(iVar2 + 0x1c + g_101ae388));
 
	int g_101ae388 = DAT_101ae388;     iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0x3c;
    } while (iVar1 < g_101ae384);
  }
  iVar1 = 0;
  if (0 < g_101ae384) {
    iVar2 = 0;
    do {
      FUN_10029bf0(&DAT_101ae288,*(unsigned int *)(iVar2 + 0x1c + g_101ae388));
      iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0x3c;
    } while (iVar1 < g_101ae384);
  }
  return;
}


