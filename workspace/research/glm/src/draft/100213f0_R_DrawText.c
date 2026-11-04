extern unsigned int DAT_1042e778;
extern int FUN_1002c0b0();


void R_DrawText(char *param_1,unsigned int param_2,unsigned int *param_3,unsigned int *param_4,
               unsigned int *param_5)

{
  unsigned short *puVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  char *pcVar5;
  unsigned int uVar6;
  unsigned int uVar7;
  
  iVar4 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; if (*param_1 != '\0') {
    pcVar5 = param_1;
    do {
      cVar2 = *pcVar5;
      pcVar5 = pcVar5 + 1;
    } while (cVar2 != '\0');
    uVar6 = (int)pcVar5 - (int)(param_1 + 1);
    iVar3 = *(int *)(g_1042e778 + 0x30000);
    uVar7 = uVar6 + 0x34 & 0xfffffffc;
    if ((0x2e000 - iVar3) + *(int *)(g_1042e778 + 0x30004) < (int)uVar7) {
      *(unsigned int *)(g_1042e778 + 0x30008) = 0;
      return;
    }
    puVar1 = (unsigned short *)(iVar3 + g_1042e778);
    *(unsigned short **)(g_1042e778 + 0x30008) = puVar1;
    *(unsigned int *)(iVar4 + 0x30000) = iVar3 + uVar7;
    puVar1[1] = (short)uVar7;
    *puVar1 = 0x16;
    *(unsigned int *)(puVar1 + 2) = *param_3;
    *(unsigned int *)(puVar1 + 4) = param_3[1];
    *(unsigned int *)(puVar1 + 6) = param_3[2];
    *(unsigned int *)(puVar1 + 8) = param_2;
    *(unsigned int *)(puVar1 + 10) = *param_4;
    *(unsigned int *)(puVar1 + 0xc) = param_4[1];
    *(unsigned int *)(puVar1 + 0xe) = param_4[2];
    *(unsigned int *)(puVar1 + 0x10) = *param_5;
    *(unsigned int *)(puVar1 + 0x12) = param_5[1];
    *(unsigned int *)(puVar1 + 0x14) = param_5[2];
    FUN_1002c0b0();
    pcVar5 = (char *)(puVar1 + 0x18);
    for (uVar7 = uVar6 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
      *(unsigned int *)pcVar5 = *(unsigned int *)param_1;
      param_1 = param_1 + 4;
      pcVar5 = pcVar5 + 4;
    }
    for (uVar7 = uVar6 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
      *pcVar5 = *param_1;
      param_1 = param_1 + 1;
      pcVar5 = pcVar5 + 1;
    }
    *(unsigned char *)(uVar6 + 0x30 + (int)puVar1) = 0;
  }
  return;
}


