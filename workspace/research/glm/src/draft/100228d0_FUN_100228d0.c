extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d4878;
extern int FUN_10061cd0();
extern int FUN_100efe3c();


int * FUN_100228d0(void)

{
  int iVar1;
  unsigned int uVar2;
  int *piVar3;
  unsigned char local_4 [4];
  
  if (g_101d4878 != (int *)0x0) {
 
	int g_101d4878 = DAT_101d4878;   (**(void **)(*g_101d4878 + 4))(g_101d4878);
    return g_101d4878;
  }
  piVar3 = g_101d1bf8;
  iVar1 =
	int g_101d1bf8 = DAT_101d1bf8; (**(void **)(*g_101d1bf8 + 0x74))(g_101d1bf8,0x80,0x80,0x4b,0,0,0,local_4,0);
  if (iVar1 < 0) {
    uVar2 = FUN_100efe3c(iVar1);
    FUN_10061cd0(0,"Couldn\'t create a %i x %i depth-stencil surface: %s\n",0x80,0x80,uVar2);
  }
  return piVar3;
}


