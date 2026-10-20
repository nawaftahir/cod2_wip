
void __thiscall FUN_00480380(char *param_1,undefined1 *param_2,int *param_3)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar3 = 0;
  *param_2 = 0;
  iVar2 = 0;
  iVar4 = 0;
  cVar1 = *param_1;
  while (cVar1 != '\0') {
    if ((cVar1 == '/') || (cVar1 == '\\')) {
      iVar3 = iVar3 + 1;
      iVar2 = iVar4;
    }
    iVar5 = iVar4 + 1;
    iVar4 = iVar4 + 1;
    cVar1 = param_1[iVar5];
  }
  iVar5 = (int)param_2 - (int)param_1;
  do {
    cVar1 = *param_1;
    param_1[iVar5] = cVar1;
    param_1 = param_1 + 1;
  } while (cVar1 != '\0');
  param_2[iVar2] = 0;
  if (iVar2 + 1 != iVar4) {
    *param_3 = iVar3;
    return;
  }
  *param_3 = iVar3 + -1;
  return;
}

