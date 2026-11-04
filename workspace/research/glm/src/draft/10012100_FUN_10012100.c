extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d494c;
extern unsigned int DAT_101d4958;
extern unsigned int DAT_107645bc;
extern int FUN_10011b60();
extern int FUN_10011bf0();
extern int FUN_10022d20();
extern int FUN_1002b920();
extern int FUN_1002b9a0();
extern int FUN_1003c2a0();
extern int FUN_100efe3c();


unsigned int FUN_10012100(void)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned char *puVar4;
  unsigned char *puVar5;
  
  (*(void *)RI_Printf)(0,"Initializing render targets...\n");
  FUN_10022d20();
  (*(void *)RI_Printf)(0,"Initializing static model cache...\n");
  FUN_1002b920();
  FUN_1002b9a0();
  (*(void *)RI_Printf)(0,"Initializing dynamic buffers...\n");
  FUN_10011b60();
  (*(void *)RI_Printf)(0,"Initializing particle cloud buffer...\n");
  FUN_10011bf0();
  (*(void *)RI_Printf)(0,"Creating Direct3D queries...\n");
  DAT_101d4958 = 0;
  iVar1 = (**(void **)(*g_101d1bf8 + 0x1d8))(g_101d1bf8,8,&DAT_101d494c);
  i
	int g_101d1bf8 = DAT_101d1bf8;f (iVar1 < 0) {
    uVar2 = FUN_100efe3c(iVar1,iVar1);
    (*(void *)RI_Printf)(0,"Event query creation failed: %s (0x%08x)\n",uVar2);
    return 0;
  }
  puVar4 = &DAT_107645bc;
  do {
    iVar1 = 0;
    puVar5 = puVar4 + -8;
    do {
      iVar3 = (**(void **)(*g_101d1bf8 + 0x1d8))(g_101d1bf8,9,puVar5);
      if (iVar3 < 0) {
        uVar2 = FUN_100efe3c(iVar3,iVar3);
        (*(void *)RI_Printf)(0,"Occlusion query creation failed: %s (0x%08x)\n",uVar2);
      }
      puVar4[iVar1] = 0;
      iVar1 = iVar1 + 1;
      puVar5 = puVar5 + 4;
    } while (iVar1 < 2);
    puVar4 = puVar4 + 0x30;
  } while ((int)puVar4 < 0x1076467c);
  (*(void *)RI_Printf)(0,"Setting initial state...\n");
  FUN_1003c2a0();
  return 1;
}


