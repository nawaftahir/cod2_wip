
int FUN_00402ec0(char *param_1)

{
  char *pcVar1;
  char cVar2;
  
  if (param_1 == (char *)0x0) {
    return 0;
  }
  pcVar1 = param_1 + 1;
  do {
    cVar2 = *param_1;
    param_1 = param_1 + 1;
  } while (cVar2 != '\0');
  return (int)param_1 - (int)pcVar1;
}

