// 10067b4b size=137 FUN_10067b4b

int FUN_10067b4b(char *param_1,undefined4 *param_2)

{
  bool bVar1;
  bool bVar2;
  int iVar3;
  int in_ECX;
  char *pcVar4;
  
  bVar2 = false;
  bVar1 = false;
  pcVar4 = param_1;
  if (param_1 < *(char **)(in_ECX + 4)) {
    do {
      if (bVar1) {
LAB_10067b86:
        if (bVar2) break;
        iVar3 = _tolower((int)*pcVar4);
        if (iVar3 != 0x6c) break;
        bVar2 = true;
      }
      else {
        iVar3 = _tolower((int)*pcVar4);
        if (iVar3 != 0x75) goto LAB_10067b86;
        bVar1 = true;
      }
      pcVar4 = pcVar4 + 1;
    } while (pcVar4 < *(char **)(in_ECX + 4));
  }
  if (param_2 != (undefined4 *)0x0) {
    if (bVar1) {
      *param_2 = 4;
    }
    else if (bVar2) {
      *param_2 = 3;
    }
  }
  return (int)pcVar4 - (int)param_1;
}


