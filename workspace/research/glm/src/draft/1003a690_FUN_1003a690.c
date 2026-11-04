extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d49b4;
extern unsigned int DAT_1072d9b4;
extern unsigned int DAT_1072d9b8;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072d9e4;
extern unsigned int DAT_1072d9e8;
extern unsigned int DAT_10766750;
extern unsigned int DAT_10766754;
extern unsigned int DAT_10766758;
extern int FUN_100386b0();
extern int FUN_1003a580();
extern int FUN_1003ed20();


void FUN_1003a690(void)

{
  unsigned int uVar1;
  unsigned int local_14;
  unsigned int local_10;
  int local_c;
  unsigned int local_8;
  unsigned int local_4;
  
  local_8 = DAT_1072d9e8;
  local_10 = DAT_1072d9e4;
  local_c = g_1072d9e0 / 3;
 
	int g_1072d9e0 = DAT_1072d9e0; local_14 = 0;
  local_4 = FUN_100386b0(DAT_1072d9b4);
  if (g_1072d9b8 == 1) {
   
	int g_1072d9b8 = DAT_1072d9b8; if (((g_10766750 != *(int *)(g_101d1b9c + 0x30)) || (g_10766754 != 0)) ||
 
	int g_10766754 = DAT_10766754;  
	int g_10766750 = DAT_10766750;    (g
	int g_101d1b9c = DAT_101d1b9c;_10766758 != ((*(int *)(g_101ce708 + 8) != 2) - 1 & 0xffffffdc) + 0x44)) {
 
	int g_10766758 = DAT_10766758;     FUN_100
	int g_101ce708 = DAT_101ce708;3ed20(*(int *)(g_101d1b9c + 0x30));
    }
    uVar1 = 1;
  }
  else {
    if (((g_10766750 != g_101d49b4) || (g_10766754 != 0)) ||
       (g_10766
	int g_101d49b4 = DAT_101d49b4;758 != ((*(int *)(g_101ce708 + 8) != 2) - 1 & 0xffffffd8) + 0x40)) {
      FUN_1003ed20(g_101d49b4);
    }
    uVar1 = 3;
  }
  FUN_1003a580(uVar1,&local_14);
  g_1072d9e0 = 0;
  g_1072d9b8 = 0;
  return;
}


