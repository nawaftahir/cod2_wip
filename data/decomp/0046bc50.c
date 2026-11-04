
void FUN_0046bc50(undefined4 param_1,char *param_2)

{
  char cVar1;
  char *pcVar2;
  
  CMapStringToString__operator__(param_1);
  if (param_2 == (char *)0x0) {
    FUN_00402b30(0,0);
    return;
  }
  pcVar2 = param_2;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_00402b30(param_2,(int)pcVar2 - (int)(param_2 + 1));
  return;
}

