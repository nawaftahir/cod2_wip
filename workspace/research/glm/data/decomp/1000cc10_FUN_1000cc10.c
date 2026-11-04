// 1000cc10 size=109 FUN_1000cc10

int FUN_1000cc10(char *param_1,undefined1 param_2,undefined1 param_3,undefined1 param_4)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  char *pcVar6;
  char *pcVar7;
  
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  iVar3 = (*(code *)RI_Hunk_AllocInternal)(pcVar2 + (0x25 - (int)(param_1 + 1)));
  *(char **)(iVar3 + 0x20) = (char *)(iVar3 + 0x24);
  pcVar6 = param_1;
  pcVar7 = (char *)(iVar3 + 0x24);
  for (uVar5 = (uint)(pcVar2 + (1 - (int)(param_1 + 1))) >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(undefined4 *)pcVar7 = *(undefined4 *)pcVar6;
    pcVar6 = pcVar6 + 4;
    pcVar7 = pcVar7 + 4;
  }
  for (uVar5 = (uint)(pcVar2 + (1 - (int)(param_1 + 1))) & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
    *pcVar7 = *pcVar6;
    pcVar6 = pcVar6 + 1;
    pcVar7 = pcVar7 + 1;
  }
  *(undefined1 *)(iVar3 + 0x1e) = param_2;
  *(undefined1 *)(iVar3 + 10) = param_3;
  *(undefined1 *)(iVar3 + 0xc) = param_4;
  iVar4 = FUN_1000cb40();
  (&DAT_101cea68)[iVar4] = iVar3;
  return iVar3;
}


