extern unsigned int DAT_101d1b2c;
extern unsigned int DAT_101d1b30;
extern int FUN_1000c910();
extern int FUN_1000fc30();


int FUN_100171f0(unsigned int param_1)

{
  char cVar1;
  int iVar2;
  
  if (((*(int *)(g_101d1b30 + 0x3c) != *(int *)(g_101d1b2c + 0x3c)) ||
 
	int g_101d1b30 = DAT_101d1b30;  
	int g_101d1b2c = DAT_101d1b2c;   (*(int *)(g_101d1b30 + 0x40) != *(int *)(g_101d1b2c + 0x40))) ||
     (iVar2 = g_101d1b30, *(int *)(g_101d1b30 + 0x38) != *(int *)(g_101d1b2c + 0x38))) {
    FUN_1000c910();
    cVar1 = FUN_1000fc30(param_1);
    iVar2 = g_101d1b2c;
    if (cVar1 != '\0') {
      iVar2 = g_101d1b30;
    }
  }
  return iVar2;
}


