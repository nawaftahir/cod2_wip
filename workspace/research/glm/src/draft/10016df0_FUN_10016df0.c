extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101da564;
extern int FUN_100efe3c();


void FUN_10016df0(void)

{
  unsigned int *puVar1;
  int iVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  
  uVar4 = 0;
  do {
    puVar1 = *(unsigned int **)((int)&DAT_101da564 + uVar4);
    if (puVar1 != (unsigned int *)0x0) {
      if (*(char *)((int)puVar1 + 10) == '\0') {
        iVar2 = (**(void **)(*g_101d1bf8 + 0x16c))();
 
	int g_101d1bf8 = DAT_101d1bf8;     }
      else {
        iVar2 = (**(void **)(*g_101d1bf8 + 0x1a8))(g_101d1bf8,puVar1[1],puVar1 + 3);
      }
      if (iVar2 < 0) {
        uVar3 = FUN_100efe3c(iVar2,iVar2);
        (*(void *)RI_Error)(0,
                            "Couldn\'t reload shader \'%s\' when recovering from a lost device: %s (0x%08x)\n"
                            ,*puVar1,uVar3);
      }
    }
    uVar4 = uVar4 + 4;
  } while (uVar4 < 0x400);
  return;
}


