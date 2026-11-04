
void FUN_004084a0(char *param_1)

{
  char cVar1;
  char *in_EAX;
  char *pcVar2;
  char *pcVar3;
  uint uVar4;
  uint uVar5;
  
  pcVar2 = in_EAX;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  cVar1 = in_EAX[(int)(pcVar2 + (-1 - (int)(in_EAX + 1)))];
  for (pcVar2 = in_EAX + (int)(pcVar2 + (-1 - (int)(in_EAX + 1)));
      (pcVar3 = param_1, cVar1 != '/' && (pcVar2 != in_EAX)); pcVar2 = pcVar2 + -1) {
    if (cVar1 == '.') {
      return;
    }
    cVar1 = pcVar2[-1];
  }
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  uVar4 = (int)pcVar3 - (int)param_1;
  pcVar2 = in_EAX + -1;
  do {
    pcVar3 = pcVar2 + 1;
    pcVar2 = pcVar2 + 1;
  } while (*pcVar3 != '\0');
  for (uVar5 = uVar4 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(undefined4 *)pcVar2 = *(undefined4 *)param_1;
    param_1 = param_1 + 4;
    pcVar2 = pcVar2 + 4;
  }
  for (uVar4 = uVar4 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
    *pcVar2 = *param_1;
    param_1 = param_1 + 1;
    pcVar2 = pcVar2 + 1;
  }
  return;
}

