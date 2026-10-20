
void __thiscall FUN_004be300(int *param_1,int param_2,int param_3)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *local_8;
  int local_4;
  
  iVar3 = 0;
  if (0 < param_2) {
    do {
      local_8 = *(char **)(param_3 + iVar3 * 4);
      pcVar2 = local_8;
      do {
        cVar1 = *pcVar2;
        pcVar2 = pcVar2 + 1;
      } while (cVar1 != '\0');
      local_4 = (int)pcVar2 - (int)(local_8 + 1);
      (**(code **)(*param_1 + 8))(&PTR_DAT_005631ac,&local_8);
      iVar3 = iVar3 + 1;
    } while (iVar3 < param_2);
  }
  return;
}

