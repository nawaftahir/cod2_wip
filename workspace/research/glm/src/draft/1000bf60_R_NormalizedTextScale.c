extern int FUN_1000bc70();


int R_NormalizedTextScale(char *param_1,int param_2,unsigned int param_3)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  int local_4;
  
  iVar4 = 0;
  iVar5 = 0;
  if (param_2 < 1) {
    param_2 = 0x7fffffff;
  }
  cVar1 = *param_1;
  local_4 = 0;
  while ((cVar1 != '\0' && (local_4 < param_2))) {
    iVar2 = (*(void *)RI_Com_GetBsp)(&param_1,0);
    pcVar3 = param_1;
    if (iVar2 == 10) {
      iVar5 = 0;
    }
    else if ((((iVar2 == 0x5e) && (param_1 != (char *)0x0)) && (cVar1 = *param_1, cVar1 != '^')) &&
            (('/' < cVar1 && (cVar1 < ':')))) {
      pcVar3 = param_1 + 1;
      param_1 = pcVar3;
    }
    else {
      iVar2 = FUN_1000bc70(param_3);
      iVar5 = iVar5 + (unsigned int)*(byte *)(iVar2 + 4);
      if (iVar4 < iVar5) {
        iVar4 = iVar5;
      }
      local_4 = local_4 + 1;
    }
    cVar1 = *pcVar3;
  }
  return iVar4;
}


