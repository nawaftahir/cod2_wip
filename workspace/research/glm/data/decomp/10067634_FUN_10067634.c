// 10067634 size=90 FUN_10067634

undefined4 FUN_10067634(char *param_1)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  char *pcVar4;
  undefined4 uVar5;
  undefined4 *in_ECX;
  uint uVar6;
  
  pcVar1 = param_1 + 1;
  pcVar3 = param_1;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  pcVar4 = operator_new((uint)(pcVar3 + (5 - (int)pcVar1)));
  if (pcVar4 == (char *)0x0) {
    uVar5 = 0x8007000e;
  }
  else {
    *(undefined4 *)pcVar4 = *in_ECX;
    in_ECX[1] = pcVar3 + (in_ECX[1] - (int)pcVar1);
    *in_ECX = pcVar4;
    for (uVar6 = (uint)(pcVar3 + (1 - (int)pcVar1)) >> 2; pcVar4 = pcVar4 + 4, uVar6 != 0;
        uVar6 = uVar6 - 1) {
      *(undefined4 *)pcVar4 = *(undefined4 *)param_1;
      param_1 = param_1 + 4;
    }
    for (uVar6 = (uint)(pcVar3 + (1 - (int)pcVar1)) & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
      *pcVar4 = *param_1;
      param_1 = param_1 + 1;
      pcVar4 = pcVar4 + 1;
    }
    uVar5 = 0;
  }
  return uVar5;
}


