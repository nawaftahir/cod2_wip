extern unsigned int DAT_10193358;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d492d;


void FUN_100138c0(unsigned int param_1,char *param_2)

{
  char acStack_400 [1023];
  unsigned char uStack_1;
  
  (*(void *)RI_GetThreadData)();
  if (g_101d492d != '\0') {
 
	int g_101d492d = DAT_101d492d;   (**(void **)(*g_101d1bf8 + 0xa8))(g_101d1bf8);
    g
	int g_101d1bf8 = DAT_101d1bf8;_101d492d = '\0';
  }
  __vsnprintf(acStack_400,0x3ff,param_2,&stack0x0000000c);
  uStack_1 = 0;
  (*(void *)RI_Error)(param_1,&DAT_10193358,acStack_400);
  return;
}


