extern unsigned int DAT_1042e778;


void R_SaveScreen(int param_1)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; if (0 < param_1) {
    iVar2 = *(int *)(g_1042e778 + 0x30000);
    if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 0xc) {
      *(unsigned int *)(g_1042e778 + 0x30008) = 0;
      return;
    }
    puVar1 = (unsigned short *)(iVar2 + g_1042e778);
    *(int *)(g_1042e778 + 0x30000) = iVar2 + 0xc;
    *(unsigned short **)(iVar3 + 0x30008) = puVar1;
    *puVar1 = 0x1d;
    puVar1[1] = 0xc;
    *(int *)(puVar1 + 2) = param_1;
  }
  return;
}


