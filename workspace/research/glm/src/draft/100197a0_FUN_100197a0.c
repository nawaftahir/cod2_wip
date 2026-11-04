extern unsigned int DAT_10195540;
extern unsigned int DAT_10195544;
extern unsigned int DAT_1019581c;
extern unsigned int DAT_101a6ab0;
extern unsigned int DAT_101a6ab4;
extern unsigned int DAT_101a6ac4;
extern unsigned int DAT_101a6ac8;
extern unsigned int DAT_101aac70;
extern int FUN_1005f360();
extern int FUN_1005f690();
extern int FUN_1005faf0();


unsigned char FUN_100197a0(unsigned int *param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  unsigned char bVar6;
  double dVar7;
  
  iVar1 = FUN_1005faf0(&DAT_10195544,1);
  if (iVar1 == 0) {
    return false;
  }
  iVar1 = 0;
  do {
    iVar2 = g_101aac70 * 0x45c;
 
	int g_101aac70 = DAT_101aac70;   if ((&g_101a6ab4)[iVar2] != '\0') {
   
	int g_101a6ab4 = DAT_101a6ab4;   (&g_101a6ab4)[iVar2] = 0;
      *param_1 = *(unsigned int *)(&g_101a6ac8 + iVar2);
   
	int g_101a6ac8 = DAT_101a6ac8;   *(unsigned int *)(&g_101a6ab0 + iVar2) = *(unsigned int *)(&g_101a6ac4 + iVar2);
    }
	int g_101a6ac4 = DAT_101a6ac4;
    p
	int g_101a6ab0 = DAT_101a6ab0;cVar3 = (char *)FUN_1005f690(param_1);
    dVar7 = _atof(pcVar3);
    *(float *)(param_3 + iVar1 * 4) = (float)dVar7;
    iVar1 = iVar1 + 1;
    if (iVar1 == param_2) {
      iVar1 = FUN_1005faf0(&DAT_10195540,1);
      return iVar1 != 0;
    }
    iVar2 = g_101aac70 * 0x45c;
    if ((&g_101a6ab4)[iVar2] != '\0') {
      (&g_101a6ab4)[iVar2] = 0;
      *param_1 = *(unsigned int *)(&g_101a6ac8 + iVar2);
      *(unsigned int *)(&g_101a6ab0 + iVar2) = *(unsigned int *)(&g_101a6ac4 + iVar2);
    }
    pcVar4 = (char *)FUN_1005f690(param_1);
    iVar2 = 2;
    bVar6 = true;
    pcVar3 = pcVar4;
    pcVar5 = ",";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar6 = *pcVar3 == *pcVar5;
      pcVar3 = pcVar3 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (!bVar6) {
      FUN_1005f360("MatchToken: %s != %s\n",pcVar4,&DAT_1019581c);
      return false;
    }
  } while( true );
}


