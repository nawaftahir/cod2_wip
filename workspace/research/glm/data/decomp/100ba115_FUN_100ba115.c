// 100ba115 size=167 FUN_100ba115

undefined4 FUN_100ba115(char *param_1,int *param_2,char param_3)

{
  char cVar1;
  int iVar2;
  int in_ECX;
  
  *param_2 = 0;
  while( true ) {
    cVar1 = *param_1;
    if (cVar1 == '\0') {
      return 0x80004005;
    }
    while (iVar2 = _isalnum((int)cVar1), iVar2 == 0) {
      param_1 = param_1 + 1;
      cVar1 = *param_1;
    }
    iVar2 = _tolower((int)*param_1);
    if (iVar2 == param_3) break;
    while (iVar2 = _isalnum((int)*param_1), iVar2 != 0) {
      param_1 = param_1 + 1;
    }
  }
  if (*param_2 != 0) {
    for (iVar2 = *(int *)(in_ECX + 8); iVar2 != 0; iVar2 = iVar2 + -1) {
    }
    FUN_1008b0b5();
    return 0x80004005;
  }
  *param_2 = (int)param_1;
  return 0;
}


