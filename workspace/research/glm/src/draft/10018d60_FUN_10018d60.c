extern unsigned int DAT_1019b958;
extern unsigned int DAT_101a6ab5;
extern unsigned int DAT_101aac70;
extern int FUN_10018bf0();
extern int FUN_1005f0e0();
extern int FUN_1005f360();
extern int FUN_10060c10();
extern int FUN_10061cd0();


int * FUN_10018d60(char *param_1)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  int *piVar4;
  unsigned int uVar5;
  char *pcVar6;
  int *piVar7;
  unsigned int local_48;
  unsigned int uStack_44;
  unsigned char local_40 [64];
  
  FUN_10060c10("materials/statemaps/%s.sm",param_1);
  iVar2 = (*(void *)RI_StatMon_Warning)(local_40,&local_48);
  if (iVar2 < 0) {
    FUN_1005f360("Couldn\'t open statemap \'%s\'\n",local_40);
    return (int *)0x0;
  }
  uStack_44 = local_48;
  FUN_1005f0e0(local_40);
  (&PTR_DAT_101a6ac0)[g_101aac70 * 0x117] = "^1ERROR: ";
 
	int g_101aac70 = DAT_101aac70; (&DAT_101a6ab5)[g_101aac70 * 0x45c] = 0;
  pcVar3 = param_1;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  piVar4 = (int *)(*(void *)RI_Hunk_AllocInternal)(pcVar3 + (0x31 - (int)(param_1 + 1)));
  *piVar4 = (int)(piVar4 + 0xc);
  pcVar6 = param_1;
  piVar7 = piVar4 + 0xc;
  for (uVar5 = (unsigned int)(pcVar3 + (1 - (int)(param_1 + 1))) >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *piVar7 = *(unsigned int *)pcVar6;
    pcVar6 = pcVar6 + 4;
    piVar7 = (int *)((int)piVar7 + 4);
  }
  for (uVar5 = (unsigned int)(pcVar3 + (1 - (int)(param_1 + 1))) & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(char *)piVar7 = *pcVar6;
    pcVar6 = pcVar6 + 1;
    piVar7 = (int *)((int)piVar7 + 1);
  }
  cVar1 = FUN_10018bf0(&uStack_44);
  if (cVar1 == '\0') {
    piVar4 = (int *)0x0;
  }
  if (g_101aac70 == 0) {
    FUN_10061cd0(0,&DAT_1019b958);
  }
  g_101aac70 = g_101aac70 + -1;
  (*(void *)RI_FS_ReadFile)(local_48);
  return piVar4;
}


