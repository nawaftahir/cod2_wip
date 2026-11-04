// 100680d0 size=164 FUN_100680d0

int FUN_100680d0(char *param_1,int *param_2)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  char *pcVar4;
  
  pcVar4 = param_1 + 2;
  if ((((pcVar4 < *(char **)(in_ECX + 4)) && (*param_1 == '0')) && (param_1[1] == 'x')) &&
     (iVar2 = _isxdigit((int)*pcVar4), iVar2 != 0)) {
    iVar2 = 0;
    while ((pcVar4 < *(char **)(in_ECX + 4) && (iVar3 = _isxdigit((int)*pcVar4), iVar3 != 0))) {
      cVar1 = *pcVar4;
      iVar2 = iVar2 * 0x10;
      if (cVar1 < 'a') {
        if (cVar1 < 'A') {
          iVar2 = iVar2 + -0x30 + (int)cVar1;
        }
        else {
          iVar2 = iVar2 + -0x37 + (int)cVar1;
        }
      }
      else {
        iVar2 = iVar2 + -0x57 + (int)cVar1;
      }
      pcVar4 = pcVar4 + 1;
    }
    if (param_2 != (int *)0x0) {
      *param_2 = iVar2;
    }
    iVar2 = (int)pcVar4 - (int)param_1;
    if (10 < iVar2) {
      FUN_10067c3e(*(undefined4 *)(in_ECX + 0x30),in_ECX + 8,0x3ea,"hex value truncated to 32bits");
    }
  }
  else {
    iVar2 = 0;
  }
  return iVar2;
}


