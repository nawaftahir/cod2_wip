extern unsigned int DAT_1042e778;


void R_RenderScene(void)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 8) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    uRam00000004 = 0;
    return;
  }
  *(int *)(g_1042e778 + 0x30000) = iVar2 + 8;
  puVar1 = (unsigned short *)(iVar2 + iVar3);
  *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
  *(unsigned short **)(iVar3 + 0x30008) = puVar1;
  *puVar1 = 1;
  puVar1[1] = 8;
  *(unsigned int *)(puVar1 + 2) = 0;
  return;
}


