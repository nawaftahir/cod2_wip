extern unsigned int DAT_10194f18;
extern unsigned int DAT_10194f1c;
extern unsigned int DAT_101a6ab0;
extern unsigned int DAT_101a6ab4;
extern unsigned int DAT_101a6ac4;
extern unsigned int DAT_101a6ac8;
extern unsigned int DAT_101aac70;
extern unsigned int DAT_101aac74;
extern unsigned int DAT_101aac78;
extern int FUN_1001b270();
extern int FUN_1005f2d0();
extern int FUN_1005f690();


unsigned int FUN_1001b670(unsigned int *param_1,int param_2)

{
  unsigned int *puVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  unsigned int *puVar5;
  unsigned int uVar6;
  unsigned short uVar7;
  
  uVar7 = 0;
  do {
    puVar5 = (unsigned int *)(param_2 + 0x3c + (unsigned int)uVar7 * 4);
    puVar1 = (unsigned int *)(param_2 + 0x1c + (unsigned int)uVar7 * 4);
    *puVar1 = 0;
    cVar2 = FUN_1001b270(&DAT_10194f1c,1,puVar1);
    if (cVar2 == '\0') {
      return 0;
    }
    *puVar5 = 0;
    cVar2 = FUN_1001b270(&DAT_10194f18,2,puVar5);
    if (cVar2 == '\0') {
      return 0;
    }
    uVar7 = uVar7 + 1;
    if (uVar7 == 8) {
      return 1;
    }
    iVar3 = g_101aac70 * 0x45c;
 
	int g_101aac70 = DAT_101aac70;   if ((&g_101a6ab4)[iVar3] != '\0') {
   
	int g_101a6ab4 = DAT_101a6ab4;   (&g_101a6ab4)[iVar3] = 0;
      *param_1 = *(unsigned int *)(&DAT_101a6ac8 + iVar3);
      *(unsigned int *)(&DAT_101a6ab0 + iVar3) = *(unsigned int *)(&DAT_101a6ac4 + iVar3);
    }
    pcVar4 = (char *)FUN_1005f690(param_1);
    cVar2 = *pcVar4;
    iVar3 = g_101aac70 * 0x45c;
    if ((&g_101a6ab4)[iVar3] != '\0') {
      FUN_1005f2d0("UngetToken called twice");
    }
    (&g_101a6ab4)[iVar3] = 1;
    DAT_101aac74 = DAT_101aac78;
  } while (cVar2 != '}');
  if (uVar7 < 8) {
    puVar5 = (unsigned int *)(param_2 + 0x3c + (unsigned int)uVar7 * 4);
    uVar6 = (unsigned int)(unsigned short)(8 - uVar7);
    do {
      puVar5[-8] = 0;
      *puVar5 = 0;
      puVar5 = puVar5 + 1;
      uVar6 = uVar6 - 1;
    } while (uVar6 != 0);
  }
  return 1;
}


