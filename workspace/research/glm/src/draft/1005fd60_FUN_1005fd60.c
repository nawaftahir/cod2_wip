extern unsigned int DAT_1019bc28;
extern unsigned int DAT_101a66b0;
extern unsigned int DAT_101a6ab0;
extern unsigned int DAT_101a6ab4;
extern unsigned int DAT_101a6ab5;
extern unsigned int DAT_101a6ac4;
extern unsigned int DAT_101a6ac8;
extern unsigned int DAT_101aac70;
extern unsigned int DAT_101aac7c;
extern unsigned int DAT_101ab07b;
extern int FUN_1005f690();
extern int FUN_10061cd0();


unsigned char * FUN_1005fd60(unsigned int *param_1)

{
  char *pcVar1;
  int iVar2;
  char *_Source;
  char *pcVar3;
  
  g_101aac7c = '\0';
 
	int g_101aac7c = DAT_101aac7c; do {
    iVar2 = DAT_101aac70 * 0x45c;
    _Source = &DAT_101a66b0 + iVar2;
    if ((&g_101a6ab4)[iVar2] == '\0') {
LAB
	int g_101a6ab4 = DAT_101a6ab4;_1005fdae:
      _Source = (char *)FUN_1005f690(param_1);
    }
    else {
      (&g_101a6ab4)[iVar2] = 0;
      if ((&DAT_101a6ab5)[iVar2] != '\0') {
        *param_1 = *(unsigned int *)(&DAT_101a6ac8 + iVar2);
        *(unsigned int *)(&DAT_101a6ab0 + iVar2) = *(unsigned int *)(&DAT_101a6ac4 + iVar2);
        goto LAB_1005fdae;
      }
    }
    if (*_Source == '\0') {
      return &g_101aac7c;
    }
    if (g_101aac7c != '\0') {
      pcVar1 = &g_101aac7c;
      do {
        pcVar3 = pcVar1;
        pcVar1 = pcVar3 + 1;
      } while (*pcVar3 != '\0');
      if (0x3ff < (int)(pcVar3 + -0x101aac7c)) {
        FUN_10061cd0(0,&g_1019bc28);
      }
     
	int g_1019bc28 = DAT_1019bc28; _strncpy(pcVar3," ",0x3ff - (int)(pcVar3 + -0x101aac7c));
      g_101ab07b = 0;
 
	int g_101ab07b = DAT_101ab07b;   }
    pcVar1 = &g_101aac7c;
    do {
      pcVar3 = pcVar1;
      pcVar1 = pcVar3 + 1;
    } while (*pcVar3 != '\0');
    if (0x3ff < (int)(pcVar3 + -0x101aac7c)) {
      FUN_10061cd0(0,&g_1019bc28);
    }
    _strncpy(pcVar3,_Source,0x3ff - (int)(pcVar3 + -0x101aac7c));
    g_101ab07b = 0;
  } while( true );
}


