
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_0047fa40(char *param_1,int *param_2)

{
  char *pcVar1;
  int iVar2;
  int iVar3;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  pcVar1 = param_1;
  if ((param_1 == (char *)0x0) || (*param_1 == '\0')) {
    FUN_0047ae50(0,"FS_ReadFile with empty name\n");
  }
  _DAT_01143494 = 1;
  iVar2 = FUN_0047ed20(pcVar1,&param_1,0,0);
  pcVar1 = param_1;
  if (param_1 == (char *)0x0) {
    if (param_2 != (int *)0x0) {
      *param_2 = 0;
    }
    return -1;
  }
  if (param_2 == (int *)0x0) {
    FUN_0047e300(param_1);
    return iVar2;
  }
  DAT_011435a4 = DAT_011435a4 + 1;
  iVar3 = FUN_0048aae0(iVar2 + 1);
  *param_2 = iVar3;
  FUN_0047f570(iVar3,iVar2,pcVar1);
  *(undefined1 *)(iVar2 + iVar3) = 0;
  FUN_0047e300(pcVar1);
  return iVar2;
}

