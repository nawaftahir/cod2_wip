extern unsigned int DAT_1042e778;


void R_EndDelayedDrawing(int param_1)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 8) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    iRam00000004 = iVar3 + 8 + param_1;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(int *)(g_1042e778 + 0x30000) = iVar2 + 8;
  *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
  *(unsigned short **)(iVar3 + 0x30008) = puVar1;
  *puVar1 = 2;
  puVar1[1] = 8;
  *(int *)(puVar1 + 2) = iVar3 + 8 + param_1;
  return;
}


