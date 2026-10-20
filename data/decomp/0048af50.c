
char * FUN_0048af50(char *param_1,code *param_2)

{
  char *pcVar1;
  char cVar2;
  char *in_EAX;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  int iVar6;
  
  pcVar1 = in_EAX + 1;
  pcVar3 = in_EAX;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  pcVar4 = param_1;
  do {
    cVar2 = *pcVar4;
    pcVar4 = pcVar4 + 1;
  } while (cVar2 != '\0');
  iVar6 = 0;
  if (-1 < (int)(pcVar3 + (-((int)pcVar4 - (int)(param_1 + 1)) - (int)pcVar1))) {
    do {
      iVar5 = (*param_2)(in_EAX,param_1);
      if (iVar5 == 0) {
        return in_EAX;
      }
      iVar6 = iVar6 + 1;
      in_EAX = in_EAX + 1;
    } while (iVar6 <= (int)(pcVar3 + (-((int)pcVar4 - (int)(param_1 + 1)) - (int)pcVar1)));
  }
  return (char *)0x0;
}

