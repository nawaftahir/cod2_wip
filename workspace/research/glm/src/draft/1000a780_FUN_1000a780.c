extern unsigned int DAT_101ce5b4;
extern unsigned int DAT_101d1b9c;
extern int FUN_100080d0();


void FUN_1000a780(unsigned int param_1,int param_2)

{
  int iVar1;
  
  if ((DAT_101ce5b4 != 0) && (iVar1 = 0, 0 < *(int *)(g_101d1b9c + 0x18))) {
 
	int g_101d1b9c = DAT_101d1b9c;   do {
      FUN_100080d0(param_1,param_2 + -1);
      iVar1 = iVar1 + 1;
    } while (iVar1 < *(int *)(g_101d1b9c + 0x18));
  }
  return;
}


