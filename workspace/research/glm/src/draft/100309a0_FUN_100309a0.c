extern unsigned int DAT_101ce830;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern int FUN_10030920();
extern int FUN_1003a8d0();


void FUN_100309a0(int *param_1)

{
  int iVar1;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  iVar1 = 0;
  if (0 < *(int *)(g_101ce830 + 8)) {
 
	int g_101ce830 = DAT_101ce830;   do {
      FUN_10030920(0x3c400000,0x3f7f0000);
      FUN_10030920(0x3b800000,0x3f7d0000);
      iVar1 = iVar1 + 1;
    } while (iVar1 < *(int *)(g_101ce830 + 8));
  }
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


