extern unsigned int DAT_1042e778;


void R_DrawStretchPicRotate
               (unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
               unsigned int param_5,unsigned int param_6,unsigned int param_7,unsigned int param_8,
               unsigned int param_9)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 0x28) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(unsigned short **)(g_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x28;
  *puVar1 = 0x11;
  puVar1[1] = 0x28;
  *(unsigned int *)(puVar1 + 2) = param_1;
  *(unsigned int *)(puVar1 + 4) = param_2;
  *(unsigned int *)(puVar1 + 6) = param_3;
  *(unsigned int *)(puVar1 + 8) = param_4;
  *(unsigned int *)(puVar1 + 10) = param_5;
  *(unsigned int *)(puVar1 + 0xc) = param_6;
  *(unsigned int *)(puVar1 + 0xe) = param_7;
  *(unsigned int *)(puVar1 + 0x10) = param_8;
  *(unsigned int *)(puVar1 + 0x12) = param_9;
  return;
}


