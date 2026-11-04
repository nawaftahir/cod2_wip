extern unsigned int DAT_101d1bf4;
extern unsigned int DAT_101d1bfc;


int FUN_100126d0(unsigned int param_1,unsigned int param_2)

{
  int iVar1;
  int iVar2;
  
  while( true ) {
    (*(void *)RI_Printf)(0,"Creating Direct3D device...\n");
    iVar2 = 0;
    do {
      iVar1 = (**(void **)(*g_101d1bf4 + 0x40))(g_101d1bf4,g_101d1bfc,1,param_1,param_2);
 
	int g_101d1bfc = DAT_101d1bfc;    
	int g_101d1bf4 = DAT_101d1bf4; if (iVar1 >= 0) {
        return iVar1;
      }
      Sleep(100);
      iVar2 = iVar2 + 1;
    } while (iVar2 != 0x14);
    if (g_101d1bfc == 0) break;
    g_101d1bfc = 0;
  }
  return iVar1;
}


