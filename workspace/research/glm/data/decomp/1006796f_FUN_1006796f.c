// 1006796f size=132 FUN_1006796f

uint FUN_1006796f(char *param_1,undefined4 *param_2)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  char *pcVar3;
  uint uVar4;
  char *pcVar5;
  
  if ((param_1 < *(char **)(in_ECX + 4)) &&
     ((iVar1 = _isalpha((int)*param_1), pcVar3 = param_1, iVar1 != 0 || (*param_1 == '_')))) {
    do {
      pcVar3 = pcVar3 + 1;
      if (*(char **)(in_ECX + 4) <= pcVar3) break;
      iVar1 = _isalnum((int)*pcVar3);
    } while ((iVar1 != 0) || (*pcVar3 == '_'));
    uVar4 = (int)pcVar3 - (int)param_1;
    pcVar3 = (char *)FUN_100826bd(uVar4 + 1,1);
    if (pcVar3 != (char *)0x0) {
      pcVar5 = pcVar3;
      for (uVar2 = uVar4 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
        *(undefined4 *)pcVar5 = *(undefined4 *)param_1;
        param_1 = param_1 + 4;
        pcVar5 = pcVar5 + 4;
      }
      for (uVar2 = uVar4 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
        *pcVar5 = *param_1;
        param_1 = param_1 + 1;
        pcVar5 = pcVar5 + 1;
      }
      pcVar3[uVar4] = '\0';
      *param_2 = pcVar3;
      return uVar4;
    }
  }
  return 0;
}


