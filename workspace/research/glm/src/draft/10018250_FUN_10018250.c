extern unsigned int DAT_101da964;
extern unsigned int DAT_101da968;


unsigned int FUN_10018250(char *param_1,unsigned int *param_2,unsigned int *param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar2 = 0;
  iVar4 = DAT_101da964 + -1;
  if (iVar4 >= 0) {
    do {
      iVar3 = iVar4 + iVar2 >> 1;
      iVar1 = __stricmp(param_1,*(char **)(g_101da968 + iVar3 * 0xc));
 
	int g_101da968 = DAT_101da968;     if (iVar1 == 0) {
        iVar4 = g_101da968 + iVar3 * 0xc;
        *param_3 = *(unsigned int *)(g_101da968 + 8 + iVar3 * 0xc);
        *param_2 = *(unsigned int *)(iVar4 + 4);
        return 1;
      }
      if (iVar1 < 0) {
        iVar4 = iVar3 + -1;
      }
      else {
        iVar2 = iVar3 + 1;
      }
    } while (iVar2 <= iVar4);
  }
  return 0;
}


