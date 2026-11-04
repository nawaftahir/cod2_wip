
void FUN_00402af0(char *param_1)

{
  char cVar1;
  char *pcVar2;
  
  if (param_1 == (char *)0x0) {
    FUN_00402b30(0,0);
    return;
  }
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_00402b30(param_1,(int)pcVar2 - (int)(param_1 + 1));
  return;
}

