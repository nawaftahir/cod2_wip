extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_107645bc;
extern int FUN_1003c2a0();
extern int FUN_100efe3c();


unsigned int FUN_10012198(void)

{
  int iVar1;
  unsigned int uVar2;
  unsigned char *puVar3;
  int iVar4;
  unsigned char *puVar5;
  
  puVar3 = &DAT_107645bc;
  do {
    iVar4 = 0;
    puVar5 = puVar3 + -8;
    do {
      iVar1 = (**(void **)(*g_101d1bf8 + 0x1d8))(g_101d1bf8,9,puVar5);
   
	int g_101d1bf8 = DAT_101d1bf8;   if (iVar1 < 0) {
        uVar2 = FUN_100efe3c(iVar1,iVar1);
        (*(void *)RI_Printf)(0,"Occlusion query creation failed: %s (0x%08x)\n",uVar2);
      }
      puVar3[iVar4] = 0;
      iVar4 = iVar4 + 1;
      puVar5 = puVar5 + 4;
    } while (iVar4 < 2);
    puVar3 = puVar3 + 0x30;
  } while ((int)puVar3 < 0x1076467c);
  (*(void *)RI_Printf)(0,"Setting initial state...\n");
  FUN_1003c2a0();
  return 1;
}


