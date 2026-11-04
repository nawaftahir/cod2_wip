extern unsigned int DAT_10190398;
extern unsigned int DAT_101da980;
extern unsigned int DAT_101da98c;
extern unsigned int DAT_101da998;
extern unsigned int DAT_101da9a4;
extern unsigned int DAT_101da9b0;


void FUN_10020790(void)

{
  float fVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = 0;
  do {
    iVar3 = iVar2 + 4;
    fVar1 = (float)(*(int *)((int)&DAT_10190398 + iVar2) + -1) /
            (*(float *)((int)&DAT_101da98c + iVar2) - *(float *)((int)&g_101da980 + iVar2));
 
	int g_101da980 = DAT_101da980;   *(float *)((int)&g_101da998 + iVar2) = fVar1;
 
	int g_101da998 = DAT_101da998;   *(float *)((int)&DAT_101da9a4 + iVar2) = 1.0 / fVar1;
    *(float *)((int)&DAT_101da9b0 + iVar2) =
         -(*(float *)((int)&g_101da998 + iVar2) * *(float *)((int)&g_101da980 + iVar2));
    iVar2 = iVar3;
  } while (iVar3 != 0xc);
  return;
}


