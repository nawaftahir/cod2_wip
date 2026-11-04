// 10068295 size=409 FUN_10068295

int FUN_10068295(char *param_1,int *param_2)

{
  char cVar1;
  int iVar2;
  int in_ECX;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  
  if (*(char **)(in_ECX + 4) <= param_1) {
    return 0;
  }
  cVar1 = *param_1;
  if ((cVar1 == '\\') && ((*(byte *)(in_ECX + 0x28) & 4) == 0)) {
    pcVar4 = param_1 + 1;
    if (*(char **)(in_ECX + 4) <= pcVar4) {
      FUN_10067c3e(*(undefined4 *)(in_ECX + 0x30),in_ECX + 8,0x3ef,
                   "character continues past end of file");
    }
    cVar1 = *pcVar4;
    if (cVar1 == 'a') {
      *param_2 = 7;
    }
    else if (cVar1 == 'b') {
      *param_2 = 8;
    }
    else if (cVar1 == 'f') {
      *param_2 = 0xc;
    }
    else if (cVar1 == 'n') {
      *param_2 = 10;
    }
    else if (cVar1 == 'r') {
      *param_2 = 0xd;
    }
    else if (cVar1 == 't') {
      *param_2 = 9;
    }
    else {
      if (cVar1 != 'v') {
        if (('/' < cVar1) && (cVar1 < '8')) {
          pcVar5 = *(char **)(in_ECX + 4);
          if (param_1 + 4 < *(char **)(in_ECX + 4)) {
            pcVar5 = param_1 + 4;
          }
          iVar3 = 0;
          for (; ((pcVar4 < pcVar5 && (cVar1 = *pcVar4, '/' < cVar1)) && (cVar1 < '8'));
              pcVar4 = pcVar4 + 1) {
            iVar3 = cVar1 + -0x30 + iVar3 * 8;
          }
          *param_2 = iVar3;
          pcVar5 = pcVar4;
          goto LAB_10068423;
        }
        if ((cVar1 == 'x') &&
           ((pcVar5 = param_1 + 2, pcVar5 < *(char **)(in_ECX + 4) &&
            (iVar3 = _isxdigit((int)*pcVar5), iVar3 != 0)))) {
          iVar3 = 0;
          while ((pcVar5 < *(char **)(in_ECX + 4) && (iVar2 = _isxdigit((int)*pcVar5), iVar2 != 0)))
          {
            cVar1 = *pcVar5;
            iVar3 = iVar3 * 0x10;
            if (cVar1 < 'a') {
              if (cVar1 < 'A') {
                iVar3 = iVar3 + -0x30 + (int)cVar1;
              }
              else {
                iVar3 = iVar3 + -0x37 + (int)cVar1;
              }
            }
            else {
              iVar3 = iVar3 + -0x57 + (int)cVar1;
            }
            pcVar5 = pcVar5 + 1;
          }
          *param_2 = iVar3;
          goto LAB_10068423;
        }
        cVar1 = *pcVar4;
        pcVar5 = param_1 + 2;
        goto LAB_1006841e;
      }
      *param_2 = 0xb;
    }
    pcVar5 = param_1 + 2;
  }
  else {
    pcVar5 = param_1 + 1;
LAB_1006841e:
    *param_2 = (int)cVar1;
  }
LAB_10068423:
  return (int)pcVar5 - (int)param_1;
}


