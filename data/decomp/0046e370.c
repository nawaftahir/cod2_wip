
void __fastcall FUN_0046e370(char *param_1)

{
  char *pcVar1;
  char cVar2;
  int iVar3;
  undefined4 *unaff_ESI;
  int unaff_EDI;
  
  iVar3 = 1;
  *unaff_ESI = "CoD2Radiant";
  if (param_1 == (char *)0x0) {
    return;
  }
  if (1 < unaff_EDI) {
    do {
      for (; (cVar2 = *param_1, cVar2 < '!' || ('~' < cVar2)); param_1 = param_1 + 1) {
        if (cVar2 == '\0') {
          return;
        }
      }
      if (*param_1 == '\"') {
        param_1 = param_1 + 1;
        unaff_ESI[iVar3] = param_1;
        cVar2 = *param_1;
        while (cVar2 != '\"') {
          if (cVar2 == '\0') {
            return;
          }
          pcVar1 = param_1 + 1;
          param_1 = param_1 + 1;
          cVar2 = *pcVar1;
        }
      }
      else {
        unaff_ESI[iVar3] = param_1;
        cVar2 = *param_1;
        while ((' ' < cVar2 && (cVar2 != '\x7f'))) {
          pcVar1 = param_1 + 1;
          param_1 = param_1 + 1;
          cVar2 = *pcVar1;
        }
        if (*param_1 == '\0') {
          return;
        }
      }
      iVar3 = iVar3 + 1;
      *param_1 = '\0';
      param_1 = param_1 + 1;
    } while (iVar3 < unaff_EDI);
  }
  return;
}

