extern unsigned int DAT_1042e778;


void FUN_10022110(unsigned int param_1)

{
  unsigned short *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(g_1042e778 + 0x30004) < 8) {
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (unsigned short *)(iVar2 + g_1042e778);
  *(unsigned short **)(g_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 8;
  *puVar1 = 0x1a;
  puVar1[1] = 8;
  *(unsigned int *)(puVar1 + 2) = param_1;
  return;
}


