extern unsigned int DAT_101d48ac;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072ddb8;
extern unsigned int DAT_1072debd;
extern unsigned int DAT_1073055c;
extern unsigned int DAT_1076671c;
extern unsigned int DAT_10766720;
extern int FUN_1002e020();
extern int FUN_1002e850();
extern int FUN_1003a8d0();
extern int FUN_100f8f20();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10030cd0(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (DAT_1072debd == '\0') {
    FUN_1002e020();
  }
  if ((-1 < g_1072ddb8 - _DAT_101d1be0) && (g_1072ddb8 - _DAT_101d1be0 < *(int *)(iVar1 + 4))) {
   
	int g_1072ddb8 = DAT_1072ddb8; FUN_100f8f20();
    DAT_1073055c = DAT_101d48ac;
    FUN_1002e850(0,0,(float)DAT_1076671c,(float)DAT_10766720,0,0,0x3f800000,0x3f800000);
  }
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


