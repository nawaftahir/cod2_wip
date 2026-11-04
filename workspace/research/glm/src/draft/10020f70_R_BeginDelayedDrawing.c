extern unsigned int DAT_1042e778;


void R_BeginDelayedDrawing(int param_1)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar3 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar3 < 4) {
    iVar3 = iVar3 + g_1042e778;
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    *(int *)(iVar2 + 4 + param_1) = iVar3;
    return;
  }
  puVar1 = (unsigned short *)(iVar3 + g_1042e778);
  *(int *)(g_1042e778 + 0x30000) = iVar3 + 4;
  *(unsigned short **)(iVar2 + 0x30008) = puVar1;
  *(int *)(iVar2 + 0x30004) = *(int *)(iVar2 + 0x30004) + 4;
  *puVar1 = 3;
  puVar1[1] = 4;
  *(int *)(iVar2 + 4 + param_1) = *(int *)(iVar2 + 0x30000) + iVar2;
  return;
}


