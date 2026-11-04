extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d4814;
extern unsigned int DAT_101d4828;
extern unsigned int DAT_101d4924;
extern int FUN_100227c0();
extern int FUN_10061cd0();
extern int FUN_100efe3c();


int * FUN_10022830(void)

{
  int iVar1;
  unsigned int uVar2;
  unsigned int local_8;
  unsigned int local_4;
  
  if (g_101d4924 == (int *)0x0) {
 
	int g_101d4924 = DAT_101d4924;   if (DAT_101d4814 == 0) {
      g_101d4924 = g_101d4828;
     
	int g_101d4828 = DAT_101d4828; if (g_101d4828 != (int *)0x0) goto LAB_10022853;
    }
    FUN_100227c0(&local_4,&local_8);
    iVar1 = (**(void **)(*g_101d1bf8 + 0x74))
         
	int g_101d1bf8 = DAT_101d1bf8;             (g_101d1bf8,local_4,local_8,0x4b,0,0,0,&g_101d4924,0);
    if (iVar1 < 0) {
      uVar2 = FUN_100efe3c(iVar1);
      FUN_10061cd0(0,"Couldn\'t create a %i x %i depth-stencil surface: %s\n",local_4,local_8,uVar2)
      ;
    }
    return g_101d4924;
  }
LAB_10022853:
  (**(void **)(*g_101d4924 + 4))(g_101d4924);
  return g_101d4924;
}


