extern unsigned int DAT_1042e778;


void R_DrawQuadPic(unsigned int param_1,unsigned int *param_2,unsigned int *param_3,unsigned int param_4,
                  unsigned int param_5,unsigned int param_6)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 0x24) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(unsigned short **)(g_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x24;
  *puVar1 = 0x13;
  puVar1[1] = 0x24;
  *(unsigned int *)(puVar1 + 2) = param_1;
  *(unsigned int *)(puVar1 + 4) = *param_2;
  *(unsigned int *)(puVar1 + 6) = *param_3;
  *(unsigned int *)(puVar1 + 8) = param_3[1];
  *(unsigned int *)(puVar1 + 10) = param_3[2];
  *(unsigned int *)(puVar1 + 0xc) = param_4;
  *(unsigned int *)(puVar1 + 0xe) = param_5;
  *(unsigned int *)(puVar1 + 0x10) = param_6;
  return;
}


