// 100679f3 size=270 FUN_100679f3

undefined4 FUN_100679f3(char *param_1,char *param_2)

{
  char *pcVar1;
  char cVar2;
  char cVar3;
  int in_ECX;
  
  param_2[0] = '\0';
  param_2[1] = '\0';
  param_2[2] = '\0';
  param_2[3] = '\0';
  *param_2 = *param_1;
  pcVar1 = param_1 + 1;
  if (*(char **)(in_ECX + 4) <= pcVar1) {
    return 1;
  }
  cVar2 = *param_1;
  if ((cVar2 == '#') && ((cVar3 = *pcVar1, cVar3 == '#' || (cVar3 == '@')))) {
    param_2[1] = cVar3;
    return 2;
  }
  cVar3 = *pcVar1;
  if (cVar2 != cVar3) {
    if (cVar3 == '=') {
      if (cVar2 < '0') {
        if (((cVar2 != '/') && (cVar2 != '!')) &&
           ((cVar2 < '%' || (('&' < cVar2 && ((cVar2 < '*' || (('+' < cVar2 && (cVar2 != '-'))))))))
           )) {
          return 1;
        }
      }
      else if ((((cVar2 != '<') && (cVar2 != '>')) && (cVar2 != '^')) && (cVar2 != '|')) {
        return 1;
      }
      param_2[1] = '=';
      return 2;
    }
    if (cVar2 != '-') {
      return 1;
    }
    if (cVar3 == '>') {
      param_2[1] = '>';
      return 2;
    }
    return 1;
  }
  if (cVar2 < ';') {
    if ((((cVar2 != ':') && (cVar2 != '&')) && (cVar2 != '+')) && (cVar2 != '-')) {
      if (cVar2 != '.') {
        return 1;
      }
      param_1 = param_1 + 2;
      if (param_1 < *(char **)(in_ECX + 4)) {
        if (*param_1 == '.') {
          param_2[1] = cVar3;
          param_2[2] = *param_1;
          return 3;
        }
        return 1;
      }
      return 1;
    }
  }
  else {
    if (cVar2 == '<') {
LAB_10067a84:
      param_2[1] = cVar3;
      if (*(char **)(in_ECX + 4) <= param_1 + 2) {
        return 2;
      }
      if (param_1[2] != '=') {
        return 2;
      }
      param_2[2] = '=';
      return 3;
    }
    if (cVar2 != '=') {
      if (cVar2 == '>') goto LAB_10067a84;
      if (cVar2 != '|') {
        return 1;
      }
    }
  }
  param_2[1] = cVar3;
  return 2;
}


