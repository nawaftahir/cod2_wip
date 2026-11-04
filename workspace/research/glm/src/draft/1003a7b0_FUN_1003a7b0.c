extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d49a4;
extern unsigned int DAT_106d3200;
extern unsigned int DAT_1072d9b0;
extern unsigned int DAT_1072d9cc;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9d4;
extern int FUN_100386b0();
extern int FUN_100387d0();
extern int FUN_1003a580();


void FUN_1003a7b0(void)

{
  int iVar1;
  unsigned int local_14;
  int local_10;
  int local_c;
  unsigned int local_8;
  unsigned int local_4;
  
  local_10 = g_1072d9d4;
 
	int g_1072d9d4 = DAT_1072d9d4; local_c = g_1072d9d0 / 3;
  l
	int g_1072d9d0 = DAT_1072d9d0;ocal_14 = 0;
  if (g_1072d9cc == 1) {
    i
	int g_1072d9cc = DAT_1072d9cc;Var1 = ((*(int *)(g_101ce708 + 8) != 2) - 1 & 0xffffffdc) + 0x44;
  }
  e
	int g_101ce708 = DAT_101ce708;lse {
    iVar1 = ((*(int *)(g_101ce708 + 8) != 2) - 1 & 0xffffffe4) + 0x40;
  }
  local_4 = FUN_100386b0(DAT_1072d9b0);
  if (g_101d49a4[1] < g_1072d9d4 * iVar1 + *g_101d49a4) {
    *g_101d
	int g_101d49a4 = DAT_101d49a4;49a4 = 0;
  }
  FUN_100387d0(0,&DAT_106d3200);
  local_8 = 0;
  FUN_1003a580(g_1072d9cc,&local_14);
  g_1072d9d0 = 0;
  g_1072d9d4 = 0;
  return;
}


