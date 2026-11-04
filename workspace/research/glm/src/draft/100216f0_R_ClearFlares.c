extern unsigned int DAT_1042e778;


void R_ClearFlares(unsigned int *param_1)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  unsigned short *puVar4;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 0x14) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    puVar4 = (unsigned short *)0x0;
  }
  else {
    puVar4 = (unsigned short *)(iVar2 + g_1042e778);
    *(int *)(g_1042e778 + 0x30000) = iVar2 + 0x14;
    piVar1 = (int *)(iVar3 + 0x30004);
    *piVar1 = *piVar1 + 0x14;
    *(unsigned short **)(iVar3 + 0x30008) = puVar4;
    *puVar4 = 4;
    puVar4[1] = 0x14;
  }
  if (param_1 != (unsigned int *)0x0) {
    *(unsigned int *)(puVar4 + 2) = *param_1;
    *(unsigned int *)(puVar4 + 4) = param_1[1];
    *(unsigned int *)(puVar4 + 6) = param_1[2];
    *(unsigned int *)(puVar4 + 8) = param_1[3];
    return;
  }
  *(unsigned int *)(puVar4 + 2) = 0;
  *(unsigned int *)(puVar4 + 4) = 0;
  *(unsigned int *)(puVar4 + 6) = 0;
  *(unsigned int *)(puVar4 + 8) = 0;
  return;
}


