extern unsigned int DAT_1072d9b4;
extern unsigned int DAT_1072d9b8;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072d9e4;
extern unsigned int DAT_1072d9e8;
extern int FUN_1002df40();
extern int FUN_1005eaf0();


void FUN_100415f0(int param_1)

{
  if ((g_1072d9e0 != 0) &&
 
	int g_1072d9e0 = DAT_1072d9e0;    ((g_1072d9e8 != *(int *)(param_1 + 0x1c) || (g_1072d9e4 != *(unsigned short *)(param_1 + 0x20)))))
 
	int g_1072d9e8 = DAT_1072d9e8; {
	int g_1072d9e4 = DAT_1072d9e4;
    FUN_1002df40();
  }
  if (0x100000 < (int)((unsigned int)*(unsigned short *)(param_1 + 0x22) + g_1072d9e0)) {
    FUN_1002df40();
  }
  DAT_1072d9b8 = 1;
  FUN_1005eaf0(DAT_1072d9b4 + g_1072d9e0 * 2,*(unsigned int *)(param_1 + 0x24),
               (unsigned int)*(unsigned short *)(param_1 + 0x22) << 1);
  g_1072d9e0 = g_1072d9e0 + (unsigned int)*(unsigned short *)(param_1 + 0x22);
  g_1072d9e8 = *(unsigned int *)(param_1 + 0x1c);
  g_1072d9e4 = (unsigned int)*(unsigned short *)(param_1 + 0x20);
  return;
}


