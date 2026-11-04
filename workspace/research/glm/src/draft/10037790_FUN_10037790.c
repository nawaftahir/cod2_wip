extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_10764578;
extern unsigned int DAT_1076457c;
extern int FUN_10037670();


void FUN_10037790(void)

{
  unsigned char local_40 [64];
  
  if ((g_10764578 != 0) && (DAT_101d1b9c != 0)) {
 
	int g_10764578 = DAT_10764578;   FUN_10037670();
    (*(void *)RI_FS_FileExists)(local_40,g_10764578,g_1076457c * 6);
 
	int g_1076457c = DAT_1076457c;   (*(void *)RI_Z_FreeInternal)(g_10764578);
    g_10764578 = 0;
    g_1076457c = 0;
  }
  return;
}


