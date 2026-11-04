// 1006842e size=261 FUN_1006842e

char * FUN_1006842e(char *param_1,undefined4 *param_2)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  char local_30 [4];
  char acStack_2c [28];
  undefined1 local_10 [4];
  undefined4 local_c;
  
  pcVar3 = param_1;
  if ((*(byte *)(in_ECX + 0x28) & 2) == 0) {
    return (char *)0x0;
  }
  pcVar4 = param_1 + 1;
  if ((((pcVar4 < *(char **)(in_ECX + 4)) && (iVar1 = _isalpha((int)*param_1), iVar1 != 0)) &&
      (iVar1 = _isalpha((int)*pcVar4), iVar1 != 0)) &&
     ((pcVar3 + 2 < *(char **)(in_ECX + 4) && (pcVar3[2] == '.')))) {
    iVar1 = FUN_100681f2(pcVar3 + 3,&param_1);
    if (((iVar1 != 0) &&
        ((param_1 < (char *)0x100 && (pcVar4 = pcVar3 + 3 + iVar1, pcVar4 < *(char **)(in_ECX + 4)))
        )) && (*pcVar4 == '.')) {
      pcVar4 = pcVar4 + 1;
      iVar1 = FUN_100681f2(pcVar4,&param_1);
      if (iVar1 == 0) {
        iVar1 = FUN_1006796f(pcVar4,&param_1);
        if (iVar1 == 0) {
          return (char *)0x0;
        }
        param_1 = (char *)0x0;
      }
      if ((param_1 < (char *)0x100) &&
         (pcVar4 = pcVar4 + (iVar1 - (int)pcVar3), pcVar4 < (char *)0x20)) {
        pcVar5 = local_30;
        for (uVar2 = (uint)pcVar4 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
          *(undefined4 *)pcVar5 = *(undefined4 *)pcVar3;
          pcVar3 = pcVar3 + 4;
          pcVar5 = pcVar5 + 4;
        }
        for (uVar2 = (uint)pcVar4 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
          *pcVar5 = *pcVar3;
          pcVar3 = pcVar3 + 1;
          pcVar5 = pcVar5 + 1;
        }
        acStack_2c[(int)(pcVar4 + -4)] = '\0';
        iVar1 = FUN_10063776(local_30,1,local_10);
        if (-1 < iVar1) {
          *param_2 = local_c;
          return pcVar4;
        }
      }
    }
  }
  return (char *)0x0;
}


