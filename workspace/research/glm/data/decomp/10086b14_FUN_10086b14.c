// 10086b14 size=106 FUN_10086b14

undefined4 FUN_10086b14(char *param_1)

{
  char cVar1;
  char *pcVar2;
  int in_ECX;
  uint uVar3;
  char *pcVar4;
  char *pcVar5;
  
  pcVar4 = (char *)0x0;
  if (param_1 != (char *)0x0) {
    pcVar2 = param_1;
    do {
      cVar1 = *pcVar2;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    pcVar2 = pcVar2 + (1 - (int)(param_1 + 1));
    pcVar4 = operator_new((uint)pcVar2);
    if (pcVar4 == (char *)0x0) {
      return 0x8007000e;
    }
    pcVar5 = pcVar4;
    for (uVar3 = (uint)pcVar2 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *(undefined4 *)pcVar5 = *(undefined4 *)param_1;
      param_1 = param_1 + 4;
      pcVar5 = pcVar5 + 4;
    }
    for (uVar3 = (uint)pcVar2 & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
      *pcVar5 = *param_1;
      param_1 = param_1 + 1;
      pcVar5 = pcVar5 + 1;
    }
  }
  _free(*(void **)(in_ECX + 0xd0));
  *(char **)(in_ECX + 0xd0) = pcVar4;
  return 0;
}


