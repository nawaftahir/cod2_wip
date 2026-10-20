
void FUN_00409500(char *param_1)

{
  char cVar1;
  char *pcVar2;
  
  if (param_1 == (char *)0x0) {
    FUN_00409540(0,0);
    return;
  }
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_00409540(param_1,(int)pcVar2 - (int)(param_1 + 1));
  return;
}

