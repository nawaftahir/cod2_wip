// 10018250 size=109 FUN_10018250

undefined4 FUN_10018250(char *param_1,undefined4 *param_2,undefined4 *param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar2 = 0;
  iVar4 = DAT_101da964 + -1;
  if (-1 < iVar4) {
    do {
      iVar3 = iVar4 + iVar2 >> 1;
      iVar1 = __stricmp(param_1,*(char **)(DAT_101da968 + iVar3 * 0xc));
      if (iVar1 == 0) {
        iVar4 = DAT_101da968 + iVar3 * 0xc;
        *param_3 = *(undefined4 *)(DAT_101da968 + 8 + iVar3 * 0xc);
        *param_2 = *(undefined4 *)(iVar4 + 4);
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


