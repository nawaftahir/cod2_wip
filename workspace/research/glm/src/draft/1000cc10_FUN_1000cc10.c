extern unsigned int DAT_101cea68;
extern int FUN_1000cb40();


int FUN_1000cc10(char *param_1,unsigned char param_2,unsigned char param_3,unsigned char param_4)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  unsigned int uVar5;
  char *pcVar6;
  char *pcVar7;
  
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  iVar3 = (*(void *)RI_Hunk_AllocInternal)(pcVar2 + (0x25 - (int)(param_1 + 1)));
  *(char **)(iVar3 + 0x20) = (char *)(iVar3 + 0x24);
  pcVar6 = param_1;
  pcVar7 = (char *)(iVar3 + 0x24);
  for (uVar5 = (unsigned int)(pcVar2 + (1 - (int)(param_1 + 1))) >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(unsigned int *)pcVar7 = *(unsigned int *)pcVar6;
    pcVar6 = pcVar6 + 4;
    pcVar7 = pcVar7 + 4;
  }
  for (uVar5 = (unsigned int)(pcVar2 + (1 - (int)(param_1 + 1))) & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
    *pcVar7 = *pcVar6;
    pcVar6 = pcVar6 + 1;
    pcVar7 = pcVar7 + 1;
  }
  *(unsigned char *)(iVar3 + 0x1e) = param_2;
  *(unsigned char *)(iVar3 + 10) = param_3;
  *(unsigned char *)(iVar3 + 0xc) = param_4;
  iVar4 = FUN_1000cb40();
  (&DAT_101cea68)[iVar4] = iVar3;
  return iVar3;
}


