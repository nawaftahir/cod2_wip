// 10068533 size=67 FUN_10068533

char * FUN_10068533(char *param_1,undefined4 param_2)

{
  int iVar1;
  int in_ECX;
  char *pcVar2;
  
  if ((param_1 < *(char **)(in_ECX + 4)) && (*param_1 == '\'')) {
    iVar1 = FUN_10068295(param_1 + 1,param_2);
    if ((iVar1 != 0) &&
       ((pcVar2 = param_1 + 1 + iVar1, pcVar2 < *(char **)(in_ECX + 4) && (*pcVar2 == '\'')))) {
      return pcVar2 + (1 - (int)param_1);
    }
  }
  return (char *)0x0;
}


