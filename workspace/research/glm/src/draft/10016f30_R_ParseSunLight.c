extern unsigned int DAT_101d0b00;
extern unsigned int DAT_101d4d28;
extern int FUN_10016ed0();
extern int FUN_10017050();


int * R_ParseSunLight(int *param_1,char *param_2)

{
  char cVar1;
  char *pcVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  unsigned int uVar6;
  char *pcVar7;
  int *piVar8;
  char local_5;
  unsigned short local_4 [2];
  
  FUN_10017050(local_4,&local_5);
  if (local_5 != '\0') {
    piVar8 = (int *)(&DAT_101d4d28)[local_4[0]];
    iVar5 = *piVar8;
    piVar3 = piVar8;
    for (iVar4 = 0x11; iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar3 = *param_1;
      param_1 = param_1 + 1;
      piVar3 = piVar3 + 1;
    }
    *piVar8 = iVar5;
    DAT_101d0b00 = 1;
    return piVar8;
  }
  pcVar2 = param_2;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  piVar3 = (int *)(*(void *)RI_Hunk_AllocInternal)(pcVar2 + (0x45 - (int)(param_2 + 1)));
  piVar8 = piVar3;
  for (iVar5 = 0x11; iVar5 != 0; iVar5 = iVar5 + -1) {
    *piVar8 = *param_1;
    param_1 = param_1 + 1;
    piVar8 = piVar8 + 1;
  }
  *piVar3 = (int)(piVar3 + 0x11);
  pcVar7 = param_2;
  piVar8 = piVar3 + 0x11;
  for (uVar6 = (unsigned int)(pcVar2 + (1 - (int)(param_2 + 1))) >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
    *piVar8 = *(unsigned int *)pcVar7;
    pcVar7 = pcVar7 + 4;
    piVar8 = (int *)((int)piVar8 + 4);
  }
  for (uVar6 = (unsigned int)(pcVar2 + (1 - (int)(param_2 + 1))) & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
    *(char *)piVar8 = *pcVar7;
    pcVar7 = pcVar7 + 1;
    piVar8 = (int *)((int)piVar8 + 1);
  }
  FUN_10016ed0();
  return piVar3;
}


