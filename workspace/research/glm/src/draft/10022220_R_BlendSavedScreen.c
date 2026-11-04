extern unsigned int DAT_1042e778;


void R_BlendSavedScreen(unsigned char param_1,unsigned int *param_2,unsigned int param_3,unsigned char param_4
                       )

{
  int *piVar1;
  int iVar2;
  int iVar3;
  unsigned short *puVar4;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 0x1c) {
    puVar4 = (unsigned short *)0x0;
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
  }
  else {
    puVar4 = (unsigned short *)(iVar2 + g_1042e778);
    *(int *)(g_1042e778 + 0x30000) = iVar2 + 0x1c;
    piVar1 = (int *)(iVar3 + 0x30004);
    *piVar1 = *piVar1 + 0x1c;
    *(unsigned short **)(iVar3 + 0x30008) = puVar4;
    *puVar4 = 0xb;
    puVar4[1] = 0x1c;
  }
  *(unsigned char *)(puVar4 + 2) = param_1;
  *(unsigned int *)(puVar4 + 4) = param_3;
  *(unsigned char *)((int)puVar4 + 5) = param_4;
  *(unsigned int *)(puVar4 + 6) = *param_2;
  *(unsigned int *)(puVar4 + 8) = param_2[1];
  *(unsigned int *)(puVar4 + 10) = param_2[2];
  *(unsigned int *)(puVar4 + 0xc) = param_2[3];
  return;
}


