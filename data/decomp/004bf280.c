
void __thiscall FUN_004bf280(int *param_1,char *param_2)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  uint uVar4;
  char *pcVar5;
  
  pcVar3 = param_2;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  iVar2 = param_1[1];
  pcVar3 = pcVar3 + (1 - (int)(param_2 + 1));
  param_1[1] = (int)(pcVar3 + iVar2);
  if (param_1[2] < (int)(pcVar3 + iVar2)) {
    FUN_004bf1c0(iVar2);
  }
  pcVar5 = (char *)(*param_1 + iVar2);
  for (uVar4 = (uint)pcVar3 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
    *(undefined4 *)pcVar5 = *(undefined4 *)param_2;
    param_2 = param_2 + 4;
    pcVar5 = pcVar5 + 4;
  }
  for (uVar4 = (uint)pcVar3 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
    *pcVar5 = *param_2;
    param_2 = param_2 + 1;
    pcVar5 = pcVar5 + 1;
  }
  param_1[1] = param_1[1] + -1;
  return;
}

